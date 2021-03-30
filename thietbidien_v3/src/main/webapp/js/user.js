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


function simpleValidation() {
    var name = $('#name');
    var sdt = $('#sdt');
    var email = $('#email');
    var pass = $('#pass');


    if (name.val().trim() === '') {
        name.focus(function () {
            name.val('');
        })
        name.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (sdt.val() === '') {
        sdt.focus(function () {
            sdt.val('');
        })
        sdt.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (email.val() === '') {
        email.focus(function () {
            email.val('');
        })
        email.css({'border-color': 'red', 'color': 'red'});
        return false;
    }
    if (pass.val() === '') {
        pass.focus(function () {
            pass.val('');
        })
        pass.css({'border-color': 'red', 'color': 'red'});
        return false;
    }
    return  true;

}