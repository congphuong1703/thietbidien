function updateProduct(id) {
    $('#id').val($('#' + id).attr('data-id'));
    $('#increaseId').val($('#' + id).attr('data-increaseId'));
    $('#name').val($('#' + id).attr('data-name'));
    $('#price').val($('#' + id).attr('data-price'));
    $('#image').val($('#' + id).attr('data-image'));
    $('#description').val($('#' + id).attr('data-description'));
    $('#amount').val($('#' + id).attr('data-amount'));
    $('#specification').val($('#' + id).attr('data-specification'));
    $('#guarantee').val($('#' + id).attr('data-guarantee'));
    $('#unit').val($('#' + id).attr('data-unit'));
    $('#categoryId option[data-id=' + $('#' + id).attr('data-categoryId') + ']').attr('selected','selected');;
    if ($('#status').val() === "true") {
        $('#status input#status1').prop('checked', true);
    } else {
        $('#status input#status2').prop('checked', true);
    }
}

function deleteProduct(id) {
    $('#methodDelete').attr("href", "/product/deleteById?id=" + id);
}

$('#add').click(function () {
    $('#id').val(0);
    $('#name').val("");
    $('#price').val(0);
    $('#image').val("");
    $('#description').val("");
    $('#categoryId').val("");
    $('#unit').val("");
    $('#specification').val("");
    $('#guarantee').val(0);
    $('#amount').val(0);
    $('#status input#status1').prop('checked', true);
    $('#categoryId option#-1').prop('selected', true);
})