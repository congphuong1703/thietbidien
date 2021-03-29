function updateSupplier(id) {
    $('#id').val($('#' + id).attr('data-id'));
    $('#name').val($('#' + id).attr('data-name'));
    $('#sdt').val($('#' + id).attr('data-sdt'));
    $('#email').val($('#' + id).attr('data-email'));
    $('#adress').val($('#' + id).attr('data-adress'));
}

function deleteSupplier(id) {
    $('#methodDelete').attr("href", "/supplier/deleteById?id=" + id);
}

$('#add').click(function () {
    $('#id').val(0);
    $('#name').val("");
    $('#sdt').val("");
    $('#email').val("");
    $('#adress').val("");
})