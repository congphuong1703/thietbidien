function updateUser(id) {
    $('#id').val($('#' + id).attr('data-id'));
    $('#name').val($('#' + id).attr('data-name'));
    $('#sdt').val($('#' + id).attr('data-sdt'));
    $('#email').val($('#' + id).attr('data-email'));
    $('#adress').val($('#' + id).attr('data-adress'));
    $('#phonenumber').val($('#' + id).attr('data-phonenumber'));
    $('#dateOfBirth').val($('#' + id).attr('data-dateOfBirth'));
    $('#pass').val($('#' + id).attr('data-pass'));
    if ($('#' + id).attr('data-idQuyen') == 1)
        $('#idQuyen input#idQuyen1').prop('checked', true);
    else
        $('#idQuyen input#idQuyen2').prop('checked', true);
}

function deleteUser(id) {
    $('#methodDelete').attr("href", "/user/deleteById?id=" + id);
}

$('#add').click(function () {
    $('#id').val(0);
    $('#name').val("");
    $('#sdt').val("");
    $('#email').val("");
    $('#adress').val("");
    $('#phonenumber').val("");
    $('#dateOfBirth').val("");
    $('#idQuyen').val(0);
    $('#pass').val("");
})
