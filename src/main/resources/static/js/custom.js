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
        //alert("selected Game:  selectedGame);
    });

    $("select.selectpicker.typeOfRun").change(function () {
        var selectedTypeOfRun = $(this).children("option:selected").val();
        $("#inputTypeOfRunId").val(selectedTypeOfRun)
        //alert("selected Game:  selectedGame);
    });

    $("select.selectpicker.platform").change(function () {
        var selectedPlatform = $(this).children("option:selected").val();
        $("#inputPlatformId").val(selectedPlatform)
        //alert("selected Game:  selectedGame);
    });

});


$(function(){
    $("#adisplayUserSearch").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#adisplayUserSpeedruns tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});
