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
    $('#filterBloodGroup').change(function() {
        var selectedGroup = $(this).val();
        if (selectedGroup) {
            $('#filmsTable tbody tr').filter(function() {
                $(this).toggle($(this).find('td:eq(4)').text() === selectedGroup);
            });
        } else {
            $('#filmsTable tbody tr').show();
        }
    });

    // "Select All" checkbox functionality
    $('#selectAll').on('change', function() {
        var isChecked = $(this).is(':checked');
        $('.donorCheckbox').prop('checked', isChecked);
    });

    // Individual checkbox change event
    $('.donorCheckbox').on('change', function() {
        if ($('.donorCheckbox:checked').length === $('.donorCheckbox').length) {
            $('#selectAll').prop('checked', true);
        } else {
            $('#selectAll').prop('checked', false);
        }
    });

    // Send Email form submission
    $('#emailForm').on('submit', function(e) {
        e.preventDefault();

        var selectedDonors = [];
        $('.donorCheckbox:checked').each(function() {
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
            success: function(response) {
                alert(response);
                $('#emailModal').modal('hide');
            },
            error: function(xhr, status, error) {
                alert("An error occurred: " + error);
            }
        });
    });
});
