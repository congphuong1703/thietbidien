var URLAPI = "http://localhost:8080/api/v1";

function updateStatusOrder(id) {
    var status = $('.select-trang-thai[id=' + id + ']').val();
    var order = new Object;
    order.id = id;
    order.idOrderstatus = status;
    $.ajax({
        url: URLAPI + "/order/update-by-status-order",
        type: 'PUT',
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(order),
        success: function (res) {
            $('#notification').modal('show');
        }
    })
}


function updateStatusPayment(id) {
    var status = $('.select-thanh-toan[id=' + id + ']').val();
    var order = new Object;
    order.id = id;
    order.statusPaments = status == 0 ? false : true;
    $.ajax({
        url: URLAPI + "/order/update-by-status-payments",
        type: 'PUT',
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(order),
        success: function (res) {
            $('#notification').modal('show');
        }
    })
}

function reloadPage() {
    window.location.reload();
}
