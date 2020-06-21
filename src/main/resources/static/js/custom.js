$(function () {
    var forms = $('.needs-validation');
    forms.find('[name]').on('focusout', function () {
        var input = $(this);
        input.removeClass('is-valid is-invalid').addClass(this.checkValidity() ? 'is-valid' : 'is-invalid');
        input.parent().find('.invalid-feedback').remove();
    });
});


$(function () {
    $("select.selectpicker.game").change(function () {
        var selectedGame = $(this).children("option:selected").val();
        $("#inputGameId").val(selectedGame)

    });

    $("select.selectpicker.typeOfRun").change(function () {
        var selectedTypeOfRun = $(this).children("option:selected").val();
        $("#inputTypeOfRunId").val(selectedTypeOfRun)

    });

    $("select.selectpicker.platform").change(function () {
        var selectedPlatform = $(this).children("option:selected").val();
        $("#inputPlatformId").val(selectedPlatform)

    });

});


$(function () {
    $("#adisplayUserSearch").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#adisplayUserSpeedruns tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});


$(function () {
    $('#exportNewestRunsTable').on('click', function (e) {
        $("#newestRunsTable").table2excel({
            exclude: ".noExport",
            name: "Newest Speedruns",
            filename: "newestSpeedruns",
            fileext: ".xls"
        });
    });

    $('#exportRankSpeedRuns').on('click', function (e) {
        $("#rankSpeedRunsTable").table2excel({
            exclude: ".noExport",
            name: $("#textGameName").val() + $("#textTypeOfRunName").val() + $("#textPlatformName").val(),
            filename: $("#textGameName").val() + $("#textTypeOfRunName").val() + $("#textPlatformName").val(),
            fileext: ".xls"
        });
    });

    $('#exportRunnerRuns').on('click', function (e) {
        $("#runnerRunsTable").table2excel({
            exclude: ".noExport",
            name: $("#runnerNameLegend").text(),
            filename: $("#runnerNameLegend").text(),
            fileext: ".xls"
        });
    });
})