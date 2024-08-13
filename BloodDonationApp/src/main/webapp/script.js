document.addEventListener('DOMContentLoaded', function () {
    fetchDonors();

    document.getElementById('searchForm').addEventListener('submit', function (event) {
        event.preventDefault();
        const searchTerm = document.getElementById('searchInput').value;
        fetchDonors(searchTerm);
    });

    document.getElementById('filterBloodGroup').addEventListener('change', function () {
        const selectedBloodGroup = this.value;
        fetchDonors('', selectedBloodGroup);
    });

    document.getElementById('editDonorForm').addEventListener('submit', function (event) {
        event.preventDefault();
        updateDonor();
    });
});

function getCompatibleBloodGroups(bloodGroup) {
    const compatibility = {
        'O+': ['O+', 'O-'],
        'O-': ['O-'],
        'A+': ['A+', 'A-', 'O+', 'O-'],
        'A-': ['A-', 'O-'],
        'B+': ['B+', 'B-', 'O+', 'O-'],
        'B-': ['B-', 'O-'],
        'AB+': ['AB+', 'AB-', 'A+', 'A-', 'B+', 'B-', 'O+', 'O-'],
        'AB-': ['AB-', 'A-', 'B-', 'O-']
    };

    return compatibility[bloodGroup] || [];
}

function fetchDonors(searchTerm = '', bloodGroup = '') {
    let url = '/Blood/donorAPI';
    if (searchTerm || bloodGroup) {
        url += `?search=${searchTerm}`;
    }

    fetch(url)
        .then(response => response.json())
        .then(donors => {
            const compatibleBloodGroups = getCompatibleBloodGroups(bloodGroup);
            const tableBody = document.getElementById('donorsTableBody');
            tableBody.innerHTML = '';

            donors = bloodGroup ? donors.filter(donor => compatibleBloodGroups.includes(donor.bloodgrp)) : donors;

            donors.forEach(donor => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td><input type="checkbox" name="selectedDonors" class="donorCheckbox" value="${donor.email}"></td>
                    <td>${donor.sno}</td>
                    <td>${donor.donorName}</td>
                    <td>${donor.address}</td>
                    <td>${donor.bloodgrp}</td>
                    <td>${donor.email}</td>
                    <td>${donor.phoneNumber}</td>
                    <td>
                        <button class="btn btn-sm btn-primary" onclick="openEditModal(${donor.sno})">Edit</button>
                        <button class="btn btn-sm btn-danger" onclick="deleteDonor(${donor.sno})">Delete</button>
                    </td>
                `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => console.error('Error fetching donors:', error));
}

function openEditModal(sno) {
    fetch(`/Blood/donorAPI/${sno}`)
        .then(response => response.json())
        .then(donor => {
            document.getElementById('editDonorName').value = donor.donorName;
            document.getElementById('editDonorAddress').value = donor.address;
            document.getElementById('editDonorBloodGroup').value = donor.bloodgrp;
            document.getElementById('editDonorEmail').value = donor.email;
            document.getElementById('editDonorPhoneNumber').value = donor.phoneNumber;
            document.getElementById('editDonorForm').dataset.sno = donor.sno;

            $('#editDonorModal').modal('show');
        })
        .catch(error => console.error('Error fetching donor details:', error));
}

function updateDonor() {
    const sno = document.getElementById('editDonorForm').dataset.sno;
    const donorData = {
        donorName: document.getElementById('editDonorName').value,
        address: document.getElementById('editDonorAddress').value,
        bloodgrp: document.getElementById('editDonorBloodGroup').value,
        email: document.getElementById('editDonorEmail').value,
        phoneNumber: document.getElementById('editDonorPhoneNumber').value
    };

    fetch(`/Blood/donorAPI/${sno}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(donorData)
    }).then(response => {
        if (response.ok) {
            $('#editDonorModal').modal('hide');
            fetchDonors();
        } else {
            console.error('Error updating donor');
        }
    });
}

function deleteDonor(sno) {
    if (confirm('Are you sure you want to delete this donor?')) {
        fetch(`/Blood/donorAPI/${sno}`, { method: 'DELETE' })
            .then(response => {
                if (response.ok) {
                    fetchDonors();
                } else {
                    console.error('Error deleting donor');
                }
            });
    }
}

// Send Email form submission
$('#emailForm').on('submit', function (e) {
    e.preventDefault();

    var selectedDonors = [];
    $('.donorCheckbox:checked').each(function () {
        selectedDonors.push($(this).val());
    });

    if (selectedDonors.length === 0) {
        alert("Please select at least one donor to send an email.");
        return;
    }

    var emailSubject = $('#emailSubject').val();
    var emailMessage = $('#emailMessage').val();

    $.ajax({
        type: 'POST',
        url: 'SendEmail',
        data: {
            selectedDonors: selectedDonors.join(','),
            emailSubject: emailSubject,
            emailMessage: emailMessage
        },
        success: function (response) {
            alert(response);
            $('#emailModal').modal('hide');
        },
        error: function (xhr, status, error) {
            alert("An error occurred: " + error);
        }
    });
});
