var URLAPI = "http://localhost:8080/api/v1";
var index = 0;

function addReceipt() {

    // Validate combo box
    var validReciept = validateReceipt();

    if (!validReciept) {
        return;
    }

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
        },
        error: function (res) {
            alert("Lỗi đặt hàng");
        }
    })

    index = 0;

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

    var validData = simpleValidation();

    if (!validData) {
        return;
    }
    if (selectChecked.attr("data-check") != null || selectChecked.attr("data-check") != undefined) {
        var indexElement = selectChecked.attr("data-check");
        var listProduct = $('#receiptTable tr');
        var elementProductDetail;

        elementProductDetail = listProduct.eq(indexElement).children('td');
        console.log(elementProductDetail);
        console.log(elementProductDetail.eq(0).val());
        elementProductDetail.eq(3).text(number);
        elementProductDetail.eq(4).text(price);
        elementProductDetail.eq(5).text(total);
    } else {
        $('#receiptTable').append(
            "<tr data-index=\"" + index + "\"><td name=\"increaseId\" data-id=\"" + increaseId + "\" value=\"" + increaseId + "\">" + increaseId +
            "</td><td name=\"idProduct\" data-idProduct=\"" + idProduct + "\" value=\"" + idProduct + "\">" + idProduct +
            "</td><td name=\"nameProduct\" data-nameProduct=\"" + nameProduct + "\" value=\"" + nameProduct + "\">" + nameProduct +
            "</td><td name=\"number\" data-number=\"" + number + "\" value=\"" + number + "\">" + number +
            "</td><td name=\"price\" data-price=\"" + price + "\" value=\"" + price + "\">" + price + "</td>" +
            "<td name=\"total\" data-total=\"" + total + "\" value=\"" + total + "\">" + total + "</td>" +
            "<td><button class=\"btn btn-warning\" data-id=\"" + increaseId + "\"" +
            "data-number=\"" + number + "\" data-price=\"" + price + "\" type=\"button\"  data-toggle=\"modal\"\n" +
            "data-target=\"#exampleModal\" data-index=\"" + index + "\" onclick=\"updateProduct(" + increaseId + ")\">Sửa</button></td>" +
            "</tr>"
        )
        index++;
        console.log(index);
    }
    $('#select-product option:checked').attr("hidden", true);
    $("#select-product").removeAttr("readonly");

    $('#input-number').val(0);
    $('#input-price').val(0);
    $('#select-product option#-1').prop("selected", true);

})

function updateProduct(id) {
    $("#select-product option[data-increaseId=" + id + "]").attr("data-check", $('button[data-id=' + id + ']').attr("data-index"));
    console.log($('button[data-id=' + id + ']').attr("data-index"));
    $("#select-product option[data-increaseId=" + id + "]").attr("hidden", "hidden");
    $("#select-product").attr("readonly", true);
    $("#select-product option[data-increaseId=" + id + "]").prop("selected", true);
    $('#input-number').val($('button[data-id=' + id + ']').attr("data-number"));
    $('#input-price').val($('button[data-id=' + id + ']').attr("data-price"));
}

$('#btn-remove-product').click(function () {
    window.location.reload();
})


$('#closeNotify').click(function () {
    window.location.reload();
})
$('#closeAdd').click(function () {
    $("#select-product").removeAttr("readonly");
})
$('#closeModa').click(function () {
    $("#select-product").removeAttr("readonly");
})


function simpleValidation() {
    var conditionProduct = $('#select-product option#-1').prop('selected');
    var amount = $('#input-number').val();
    var price = $('#input-price').val();

    if (amount)

        if (conditionProduct) {
            $('#select-product').css({'border-color': 'red'})
            return false;
        }

    if (amount < 1) {
        $('#input-number').css({'border-color': 'red'})
        return false;
    }

    if (price < 1) {
        $('#input-price').css({'border-color': 'red'})
        return false;
    }

    return true;
}

function validateReceipt() {

    var conditionUser = $('#select-ma-nguoi-lap option#-1').prop('selected');
    var conditionSupplier = $('#select-ma-nha-cung-cap option#-1').prop('selected');

    if (conditionUser) {
        $('#select-ma-nguoi-lap').css({'border-color': 'red'})
        return false;
    }

    if (conditionSupplier) {
        $('#select-ma-nha-cung-cap').css({'border-color': 'red'})
        return false;
    }

    return true;
}