document.addEventListener('DOMContentLoaded', function () {
    const searchForm = document.getElementById('searchForm');
    const filterBloodGroup = document.getElementById('filterBloodGroup');
    const editDonorForm = document.getElementById('editDonorForm');
    const emailForm = $('#emailForm');
    const addDonorForm = document.getElementById('addDonorForm');
    
    // Fetch donors on load
    fetchDonors();

    // Attach event listeners
    searchForm.addEventListener('submit', handleSearch);
    filterBloodGroup.addEventListener('change', handleFilterBloodGroup);
    editDonorForm.addEventListener('submit', updateDonor);
    emailForm.on('submit', sendEmails);
    addDonorForm.addEventListener('submit', addDonor);
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

function fetchDonors(searchTerm = '', selectedBloodGroup = '') {
    let url = `/Blood/donorAPI?${new URLSearchParams({ search: searchTerm })}`;

    fetch(url)
        .then(response => response.json())
        .then(donors => {
            if (selectedBloodGroup) {
                const compatibleBloodGroups = getCompatibleBloodGroups(selectedBloodGroup);
                donors = donors.filter(donor => compatibleBloodGroups.includes(donor.bloodgrp));
            }
            renderDonors(donors);
        })
        .catch(error => console.error('Error fetching donors:', error));
}

function renderDonors(donors) {
    const tableBody = document.getElementById('donorsTableBody');
    tableBody.innerHTML = '';

    const donorRows = donors.map(donor => `
        <tr>
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
        </tr>
    `).join('');

    tableBody.innerHTML = donorRows;
}

function handleSearch(event) {
    event.preventDefault();
    const searchTerm = document.getElementById('searchInput').value;
    fetchDonors(searchTerm, filterBloodGroup.value);
}

function handleFilterBloodGroup() {
    const selectedBloodGroup = this.value;
    fetchDonors('', selectedBloodGroup);
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

function updateDonor(event) {
    event.preventDefault();
    const sno = this.dataset.sno;
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

function sendEmails(event) {
    event.preventDefault();

    const selectedDonors = $('.donorCheckbox:checked').map(function () {
        return this.value;
    }).get();

    if (selectedDonors.length === 0) {
        alert("Please select at least one donor to send an email.");
        return;
    }

    const emailSubject = $('#emailSubject').val();
    const emailMessage = $('#emailMessage').val();

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
}

function addDonor(event) {
    event.preventDefault();

    const donorData = {
        donorName: document.getElementById('donorName').value,
        address: document.getElementById('donorAddress').value,
        bloodgrp: document.getElementById('donorBloodGroup').value,
        email: document.getElementById('donorEmail').value,
        phoneNumber: document.getElementById('donorPhoneNumber').value
    };

    fetch('/Blood/donorAPI', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(donorData)
    }).then(response => {
        if (response.ok) {
            $('#addDonorModal').modal('hide');
            fetchDonors();
        } else {
            console.error('Error adding donor');
        }
    });
}

document.addEventListener('DOMContentLoaded', function() {
    // Fetch data from the backend
    function fetchChartData() {
        fetch('./Counts')
            .then(response => response.json())
            .then(data => {
                console.log(data); // Debugging to ensure correct data format

                // Initialize line chart
                new Chart(document.getElementById('lineChart').getContext('2d'), {
                    type: 'line',
                    data: {
                        labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'], // Example weeks
                        datasets: [{
                            label: 'Counts',
                            data: [data.bloodDonationCount, data.plasmaDonationCount, data.plateletDonationCount, data.organDonationCount],
                            borderColor: 'rgba(75, 192, 192, 1)',
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderWidth: 2,
                            pointBackgroundColor: 'rgba(75, 192, 192, 1)',
                            pointBorderColor: '#fff',
                            pointBorderWidth: 2,
                            pointRadius: 5
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                                labels: {
                                    color: '#333',
                                    font: {
                                        size: 14
                                    }
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function(context) {
                                        let label = context.label || '';
                                        if (context.parsed !== null) {
                                            label += ': ' + context.parsed + ' appointments';
                                        }
                                        return label;
                                    }
                                }
                            }
                        },
                        scales: {
                            x: {
                                ticks: {
                                    color: '#333',
                                    font: {
                                        size: 12
                                    }
                                },
                                grid: {
                                    color: '#eee'
                                }
                            },
                            y: {
                                ticks: {
                                    color: '#333',
                                    font: {
                                        size: 12
                                    }
                                },
                                grid: {
                                    color: '#eee'
                                }
                            }
                        }
                    }
                });

                // Initialize pie chart
                new Chart(document.getElementById('pieChart').getContext('2d'), {
                    type: 'pie',
                    data: {
                        labels: ['Blood Donation', 'Plasma Donation', 'Platelet Donation', 'Organ Donation'],
                        datasets: [{
                            label: 'Donation Types',
                            data: [
                                data.bloodDonationCount,
                                data.plasmaDonationCount,
                                data.plateletDonationCount,
                                data.organDonationCount
                            ],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.8)',
                                'rgba(54, 162, 235, 0.8)',
                                'rgba(255, 206, 86, 0.8)',
                                'rgba(75, 192, 192, 0.8)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)'
                            ],
                            borderWidth: 2
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                                labels: {
                                    color: '#333',
                                    font: {
                                        size: 14
                                    }
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function(context) {
                                        let label = context.label || '';
                                        if (context.parsed !== null) {
                                            label += ': ' + context.parsed + ' appointments';
                                        }
                                        return label;
                                    }
                                }
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Error fetching data:', error));
    }

    // Call function to fetch and initialize charts
    fetchChartData();
});
