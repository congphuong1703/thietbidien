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


function simpleValidation() {
    var nameEle = $('#name');
    var emailELe = $('#email');


    if (nameEle.val() === '') {
        nameEle.val("Bạn phải nhập tên nhà cung cấp");
        nameEle.focus(function () {
            nameEle.val('');
        })
        nameEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (emailELe.val() === '') {
        emailELe.val("Bạn phải nhập email nhà cung cấp");
        emailELe.focus(function () {
            emailELe.val('');
        })
        emailELe.css({'border-color': 'red', 'color': 'red'});
        return false;
    }
    return  true;

}
