var URLAPI = "http://localhost:8080/api/v1";

function addReceipt() {
    var idUser = $('#select-ma-nguoi-lap').val();
    var idSupplier = $('#select-ma-nha-cung-cap').val();
    var note = $('#textarea-note').val();
    var statusEnter = false;

    var listProduct = $('#receiptTable tr');
    var listElementProductDetail;
    var receipt = new Object();
    var receiptDetailsList = [];

    for (var i = 0; i < listProduct.length; i++) {
        listElementProductDetail = listProduct.eq(i).children('td');
        var idProduct = listElementProductDetail.eq(0).text();
        var amount = listElementProductDetail.eq(3).text();
        var price = listElementProductDetail.eq(4).text();
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
            $('#notification').modal('show');
        }
    })
}

$('#btn-add-product').click(function () {
    $('#input-number').val(0);
    $('#input-price').val(0);
    $('#select-product option#-1').prop("selected", true);
})

$('#btn-luu-lai').click(function () {
    var selectChecked = $('#select-product option:checked');
    var idProduct = selectChecked.attr("data-id");
    var increaseId = selectChecked.attr("data-increaseId");
    var nameProduct = selectChecked.attr("data-name");
    var number = $('#input-number').val();
    var price = $('#input-price').val();
    var total = number * price;

    $('#receiptTable').append(
        "<tr><td name=\"increaseId\" data-id=\"" + increaseId + "\" value=\"" + increaseId + "\">" + increaseId +
        "</td><td name=\"idProduct\" data-id=\"" + idProduct + "\" value=\"" + idProduct + "\">" + idProduct +
        "</td><td name=\"nameProduct\" data-nameProduct=\"" + nameProduct + "\" value=\"" + nameProduct + "\">" + nameProduct +
        "</td><td name=\"number\" data-number=\"" + number + "\" value=\"" + number + "\">" + number +
        "</td><td name=\"price\" data-price=\"" + price + "\" value=\"" + price + "\">" + price + "</td>" +
        "<td name=\"total\" data-total=\"" + total + "\" value=\"" + total + "\">" + total + "</td><td>" +
        "</tr>"
    )
})

$('#closeNotify').click(function () {
    window.location.reload();
})


