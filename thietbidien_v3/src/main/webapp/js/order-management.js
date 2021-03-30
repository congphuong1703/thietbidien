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

$('#add').click(function () {
    $('#id').val(0);
    $('#note').val("");
    $('#payments input#payments1').prop('checked', true);
    $('#statusPaments input#status1').prop('checked', true);
    $('#idUser option#-1').prop('selected', true);
    $('#idCustomer option#-1').prop('selected', true);
    $('#idOrderstatus option#-1').prop('selected', true);
})


function simpleValidation() {
    //var selected_option = $('#mySelectBox option:selected');
    // $('#idUser option#-1').prop('selected', true);
    var conditionCustomer = $('#idCustomer option#-1').prop('selected');
    var conditionUser = $('#idUser option#-1').prop('selected');
    var conditionOrderstatus = $('#idOrderstatus option#-1').prop('selected');

    if (conditionCustomer) {

        $('#idCustomer').next().text('Bạn phải chọn khách hàng')
        $('#idCustomer').css({'border-color': 'red'})
        return false;
    }
    if (conditionUser) {

        $('#idUser').next().text('Bạn phải chọn người lập đơn')
        $('#idUser').css({'border-color': 'red'})
        return false;
    }

    if (conditionOrderstatus) {

        $('#idOrderstatus').next().text('Bạn phải chọn trạng thái')
        $('#idOrderstatus').css({'border-color': 'red'})
        return false;
    }

    return true;
}
