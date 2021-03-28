var URLAPI = "http://localhost:8080/api/v1";

function addReceipt() {
    var idUser = $('#select-ma-nguoi-lap').val();
    var idSupplier = $('#select-ma-nha-cung-cap').val();
    var note = $('#textarea-note').val();
    var statusEnter = false;

    var listProduct = $('#product tr');
    var listElementProductDetail;
    var receipt = new Object();
    var receiptDetailsList = [];

    for (var i = 0; i < listProduct.length; i++) {
        listElementProductDetail = listProduct.eq(i).children('td');
        var idProduct = listElementProductDetail.eq(1).text();
        var amount = listElementProductDetail.eq(2).text();
        var price = listElementProductDetail.eq(3).text();
        var receiptDetail = new Object();
        receiptDetail.idProduct = idProduct;
        receiptDetail.amount = amount;
        receiptDetail.price = price;

        receiptDetailsList.push(receiptDetail);
    }

    receipt.note = note;
    receipt.idUser = idUser;
    receipt.idSupplier = idSupplier;
    receipt.statusEnter = statusEnter;

    var receiptDTO = new Object();
    receiptDTO.receipt = receipt;
    receiptDTO.receiptDetailsList = receiptDetailsList;
    $.ajax({
        url: URLAPI + "/receipt/add",
        type: 'POST',
        contentType: "application/json;charset=utf-8",
        data:
            JSON.stringify(receiptDTO)
        ,
        success: function (res) {
            alert(res['data'])
            console.log(res);
            window.location.reload();
        }
    })
}

$('#btn-add-product').click(function () {
    var selectChecked = $('#select-product option:checked');
    var idProduct = selectChecked.val();
    var nameProduct = selectChecked.attr("name");
    var number = $('#input-number').val();
    var price = $('#input-price').val();


})

