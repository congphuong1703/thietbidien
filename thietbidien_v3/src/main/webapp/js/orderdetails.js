function updateOrderDetails(id) {
    var product = $('#' + id).attr('data-idProduct');
    $('#idOrder').attr('value', $('#' + id).attr('data-idOrder'));
    $('#idProduct option[data-id=' + product + ']').prop("selected", true);
    $('#amount').attr('value', $('#' + id).attr('data-amount'));
}

function deleteOrderDetails(id) {
    var idProduct = $('#delete' + id).attr("data-productId");
    $('#methodDelete').attr("href", "/order/deleteByOrderDetailsId?idOrder=" + id + "&idProduct=" + idProduct);
}

$('#add').click(function () {
    $('#idOrder').val($('#ma-don-hang').attr("value"));
    $('#amount').val(0);
    $('#idProduct option#-1').prop("selected", true);
})


function simpleValidation() {
    var idProduct = $('#idProduct');
    var amount = $('#amount');

    if (amount.val() === '' || amount.val() < 1) {
        amount.focus(function () {
            amount.val('');
        })
        amount.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (idProduct.val() == null) {
        idProduct.focus(function () {
            idProduct.val('');
        })
        idProduct.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    var amountProduct = $('#idProduct option:checked').attr("data-amount");
    if (amount.attr('value') > amountProduct || amount.attr('value') > 200000) {
        amount.focus(function () {
            amount.attr('value',0);
        })
        amount.css({'border-color': 'red', 'color': 'red'});
        alert('Sản phẩm không đủ!')
        return false;
    }
    return true;
}