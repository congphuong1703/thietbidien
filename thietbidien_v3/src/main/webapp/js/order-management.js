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
/*
$('#status-payment').change(function updateStatusPayment() {
    var status = $('#status-payment option:checked').val();
    $.ajax({
        url: URLAPI + "/order/find-by-trang-thai-thanh-toan?statusPayments=" + status,
        type: 'GET',
        dataType: 'json',
        success: function (res) {
            $('#tbody-san-pham').empty();
            let item = res["data"];
            console.log(res.data);
            for (var i = 0; i < item.length; i++) {
                var orderStatus = "";
                var statusPayment = "";
                var payment = "";
                if (item[i]["idOrderstatus"] == 1) {
                    orderStatus = `<span class="badge badge-success">Chưa xác nhận</span>`;
                } else if (item[i]["idOrderstatus"] == 2) {
                    orderStatus = `<span class="badge badge-success">Xác nhận</span>`;

                } else if (item[i]["idOrderstatus"] == 3) {
                    orderStatus = `<span class="badge badge-success">Đang giao</span>`;

                } else if (item[i]["idOrderstatus"] == 4) {
                    orderStatus = `<span class="badge badge-success">Hoàn thành</span>`;

                } else if (item[i]["idOrderstatus"] == 5) {
                    orderStatus = `<span class="badge badge-success">Đã hủy</span>`;
                }
                if (item[i]["statusPaments"] == false)
                    statusPayment = `<span class="badge badge-success">Chưa thanh toán</span>`;
                else
                    statusPayment = `<span class="badge badge-success">Đã thanh toán</span>`;
                if (item[i]["payments"])
                    payment = `<span class="badge badge-success">Sau khi nhận hàng</span>`;
                else
                    payment = `<span class="badge badge-success">Chuyển khoản</span>`;

                $('#tbody-san-pham').append("<tr>" +
                    "<td>" + item[i]["id"] + "</td>" +
                    "<td>" + item[i]["timecreate"] + "</td>" +
                    "<td>" + orderStatus + "</td>" +
                    "<td>" + payment + "</td>" +
                    "<td>" + statusPayment + "</td>" +
                    "<td><button onclick=\"chiTietDonHang(" + item[i]["iMadonhang"] + ")\"id=\"chi-tiet-don-hang\" type=\"button\" className=\"btn btn-info\">" + "Xem chi tiết" + "</button></td>" +
                    "<td><select className=\"form-control select-thanh-toan\" id=\"" + item[i]["id"] + "\" onchange=\"updateStatusPayment(" + item[i]["id"] + ")\">" +
                    "<option value selected disabled>Chọn</option>" +
                    "<option value=\"0\">Chưa thanh toán</option>" +
                    "<option value=\"1\">Đã thanh toán</option></select></td>" +
                    "<td><select className=\"form-control select-trang-thai\" id=\"" + item[i]["id"] + "\" onchange=\"updateStatusOrder(" + item[i]["id"] + ")\">" +
                    "<option value selected disabled>Chọn</option>" +
                    "<option value=\"1\">Chưa xác nhận</option>" +
                    "<option value=\"2\">Xác nhận</option>" +
                    "<option value=\"3\">Đang giao</option>" +
                    "<option value=\"4\">Hoàn thành</option>" +
                    "<option value=\"5\">Đã hủy</option></select></td>" +
                    "</tr>")
            }
        }
    })
})*/
