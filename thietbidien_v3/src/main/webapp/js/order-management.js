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


$('#closeNotify').click(function(){
    window.location.reload();
})

$('#add').click(function () {
    $('#id').val(0);
    $('#note').val("");
    $('#payments input#payments1').prop('checked', true);
    $('#statusPaments input#status1').prop('checked', true);
    $('#idUser option#-1').prop('selected', true);
    $('#idCustomer option#-1').prop('selected', true);
    $('#idOrderstatus option#-1').prop('selected', true);
})
