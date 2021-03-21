var URLAPI = "http://localhost:8080/Thietbidien_v3_war/api/v1";

function chiTietDonHang(id) {
    location.href = "chi-tiet-don-hang.tiles?id=" + id;
};


function updateStatusPayment(id) {
    var status = document.getElementById(id).value;
    $.ajax({
        url: URLAPI + "/order/update-by-status-payments",
        method: "put",
        data: {
            "id": id,
            "statusPayment": status == 0 ? false : true
        },
        success: function (res) {
            alert("Cap nhat trang thai thanh cong")
        }
    })
}


function updateStatusOrder(id) {
    var status = $(id).attr('value');
    $.ajax({
        url: URLAPI + "/order/update-by-status-order",
        method: "put",
        data: {
            "id": id,
            "idOrderstatus": status
        },
        success: function (res) {
            alert("Cap nhat trang thai thanh cong")
        }
    })
}


$('#status-payment').change(function () {
    var status = $('#status-payment option:checked').val();

    $.ajax({
        url: URLAPI + "/order/find-by-trang-thai-thanh-toan?statusPayments=" + status,
        method: "get",
        success: function (res) {
            $('#tbody-san-pham').empty();
            item = res.data;
            console.log(item);
            for (var i = 0; i < item.length; i++) {
                $('#tbody-san-pham').append("<tr>" +
                    "<td>" + item.id + "</td>" +
                    "<td>" + item.timecreate + "</td>" +
                    "<td>" + item.idOrderstatus + "</td>" +
                    "<td>" + item.payments+ "</td>" +
                    "<td>" + item.statusPaments + "</td>" +
                    "<td><button onclick=\"chiTietDonHang("+ item[i].iMadonhang +")\"id=\"chi-tiet-don-hang\" type=\"button\" className=\"btn btn-info\">" + "Xem chi tiết" +"</button></td>" +
                    "<td><select className=\"form-control select-thanh-toan\" onchange=\"updateStatusPayment(" + item[i].id + ")\">" +
                    "<option value=\"0\">Chưa thanh toán</option>" +
                    "<option value=\"1\">Đã thanh toán</option></select></td>" +
                    "<td><select className=\"form-control select-trang-thai\" onchange=\"updateStatusOrder(" + item[i].id + ")\">" +
                    "<option value=\"1\">Chưa xác nhận</option>" +
                    "<option value=\"2\">Xác nhận</option>" +
                    "<option value=\"3\">Đang giao</option>" +
                    "<option value=\"4\">Hoàn thành</option>" +
                    "<option value=\"5\">Đã hủy</option></select></td>" +
                    "</tr>")
            }
        }
    })
})

function searchById() {
    var id = $('#search-by-id').val();
    $.ajax({
        url: URLAPI + "/order/find-by-id?id=" + id,
        method: "get",
        timeout: 0,
        success: function (res) {
            $('#tbody-san-pham').empty();
            var item = res.data;
            console.log(item);
                $('#tbody-san-pham').append("<tr>" +
                    "<td>" + item.id + "</td>" +
                    "<td>" + item.timecreate + "</td>" +
                    "<td>" + item.idOrderstatus + "</td>" +
                    "<td>" + item.payments+ "</td>" +
                    "<td>" + item.statusPaments + "</td>" +
                    "<td><button value=\"" + item.iMadonhang + "\" id=\"chi-tiet-don-hang\" type=\"button\" className=\"btn btn-info\">Xem chi tiết</button></td>" +
                    "<td><select className=\"form-control select-thanh-toan\" onchange=\"updateStatusPayment(" + item.id + ")\">" +
                    "<option value=\"0\">Chưa thanh toán</option>" +
                    "<option value=\"1\">Đã thanh toán</option></select></td>" +
                    "<td><select className=\"form-control select-trang-thai\" onchange=\"updateStatusOrder(" + item.id + ")\">" +
                    "<option value=\"1\">Chưa xác nhận</option>" +
                    "<option value=\"2\">Xác nhận</option>" +
                    "<option value=\"3\">Đang giao</option>" +
                    "<option value=\"4\">Hoàn thành</option>" +
                    "<option value=\"5\">Đã hủy</option></select></td>" +
                    "</tr>")
        }
    })
}
