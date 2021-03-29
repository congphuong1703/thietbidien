function updateCustomer(id) {
    $('#id').val($('#' + id).attr('data-id'));
    $('#name').val($('#' + id).attr('data-name'));
    $('#email').val($('#' + id).attr('data-email'));
    $('#adress').val($('#' + id).attr('data-adress'));
    $('#phoneNumber').val($('#' + id).attr('data-phoneNumber'));
    $('#username').val($('#' + id).attr('data-username'));
    $('#password').val($('#' + id).attr('data-password'));

}

function deleteCustomer(id) {
    $('#methodDelete').attr("href", "/customer/deleteById?id=" + id);
}

$('#add').click(function () {
    $('#id').val(0);
    $('#name').val("");
    $('#email').val("");
    $('#adress').val("");
    $('#phoneNumber').val("");
    $('#username').val("");
    $('#password').val("");
})