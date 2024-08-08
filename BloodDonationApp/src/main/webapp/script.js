$(document).ready(function() {
    console.log("Document is ready");

    // Event listener for search input
    $('#searchInput').on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $('#filmsTable tbody tr').filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    // Prevent form submission on search
    $('#searchForm').on('submit', function(e) {
        e.preventDefault();
    });

    // Blood group filter
    const bloodGroupCompatibility = {
        'O+': ['O+', 'O-'],
        'O-': ['O-'],
        'A+': ['A+', 'A-', 'O+', 'O-'],
        'A-': ['A-', 'O-'],
        'B+': ['B+', 'B-', 'O+', 'O-'],
        'B-': ['B-', 'O-'],
        'AB+': ['AB+', 'AB-', 'A+', 'A-', 'B+', 'B-', 'O+', 'O-'],
        'AB-': ['AB-', 'A-', 'B-', 'O-']
    };

    $('#filterBloodGroup').change(function() {
        const selectedBloodGroup = $(this).val();
        if (selectedBloodGroup) {
            const compatibleBloodGroups = bloodGroupCompatibility[selectedBloodGroup];
            $('tbody tr').each(function() {
                const donorBloodGroup = $(this).find('td:nth-child(5)').text();
                if (compatibleBloodGroups.includes(donorBloodGroup)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        } else {
            $('tbody tr').show();
        }
    });

    // "Select All" checkbox functionality
    $('#selectAll').change(function() {
        var isChecked = $(this).prop('checked');
        $('input.donorCheckbox').prop('checked', isChecked).trigger('change');
    });

    // Individual checkbox change functionality
    $(document).on('change', 'input.donorCheckbox', function() {
        if (!this.checked) {
            $('#selectAll').prop('checked', false);
        }
        if ($('input.donorCheckbox:checked').length === $('input.donorCheckbox').length) {
            $('#selectAll').prop('checked', true);
        }
    });

    // Email form submission
    $("#emailForm").submit(function(event) {
        event.preventDefault();

        var selectedDonors = [];
        $("input[name='selectedDonors']:checked").each(function() {
            selectedDonors.push($(this).val());
        });

        if (selectedDonors.length === 0) {
            alert("No donors selected.");
            return;
        }

        var emailSubject = $("#emailSubject").val();
        var emailMessage = $("#emailMessage").val();

        $.ajax({
            type: "POST",
            url: "SendEmail",
            data: {
                selectedDonors: selectedDonors.join(','),
                emailSubject: emailSubject,
                emailMessage: emailMessage
            },
            success: function(response) {
                alert('Emails sent successfully!');
                $("#emailModal").modal('hide');
            },
            error: function(xhr, status, error) {
                alert("Error sending emails: " + xhr.responseText);
            }
        });
    });

    // Show/Hide register button based on user type selection
    $('#userType').change(function() {
        var userType = $(this).val();
        console.log("User type changed to: " + userType);
        if (userType === 'user') {
            $('#registerButton').show();
        } else {
            $('#registerButton').hide();
        }
    });

    // Trigger change event on page load to set the initial state of the register button
    $('#userType').trigger('change');
});
