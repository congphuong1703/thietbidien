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


function simpleValidation() {
    var nameEle = $('#name');
    var emailELe = $('#email');
    var usernameEle = $('#username');
    var passwordEle = $('#password');


    if (nameEle.val() === '') {
        nameEle.val("Bạn phải nhập tên khách hàng");
        nameEle.focus(function () {
            nameEle.val('');
        })
        nameEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (emailELe.val() === '') {
        emailELe.val("Bạn phải nhập email khách hàng");
        emailELe.focus(function () {
            emailELe.val('');
        })
        emailELe.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (usernameEle.val() === '') {
        usernameEle.val("Bạn phải nhập username");
        usernameEle.focus(function () {
            usernameEle.val('');
        })
        usernameEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (passwordEle.val() === '') {
        passwordEle.val("Bạn phải nhập password ");
        passwordEle.focus(function () {
            passwordEle.val('');
        })
        passwordEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }
    return  true;

}
