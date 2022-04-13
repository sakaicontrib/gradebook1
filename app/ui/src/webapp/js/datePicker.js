//*********************************************************************
// initLocalDatePicker
//
// Initializes a datepicker
//*********************************************************************
function initLocalDatePicker(pos) {
        var prefix="gbForm_bulkNewAssignmentsTable_";
        localDatePicker({
            input: '#gbForm\\:bulkNewAssignmentsTable\\:' + pos + '\\:dueDate',
            useTime: 0,
            allowEmptyDate: true,
            val: $('#gbForm\\:bulkNewAssignmentsTable\\:' + pos + '\\:dueDate').val(),
            ashidden: {
                    iso8601: pos + 'dueDateISO8601',
                    month: prefix + pos + "_dueDate_month",
                    day: prefix + pos + "_dueDate_day",
                    year: prefix + pos + "_dueDate_year"}
        });
}