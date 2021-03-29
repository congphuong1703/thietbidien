var URLAPI = "http://localhost:8080/api/v1";

function updateStatusReceipt(id) {
    var status = $('.select-status[name=' + id + ']').val();
    var receipt = new Object;
    receipt.id = id;
    receipt.statusEnter = status == 0 ? false : true;

    $.ajax({
        url: URLAPI + "/receipt/update",
        type: 'PUT',
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(receipt),
        success: function (res) {
            $('#notification').modal('show');
        }
    })
}

$('#closeNotify').click(function () {
    window.location.reload();
})



