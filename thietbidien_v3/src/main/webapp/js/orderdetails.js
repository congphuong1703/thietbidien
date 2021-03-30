function updateOrderDetails(id) {
    var product = $('#' + id).attr('data-idProduct');
    $('#idOrder').val($('#' + id).attr('data-idOrder'));
    $('#idProduct option[data-id=' + product + ']').prop("selected", true);
    $('#amount').val($('#' + id).attr('data-amount'));
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
