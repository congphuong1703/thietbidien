var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};
var URLAPI = "http://localhost:8080/Thietbidien_v3_war/api/v1";

$(document).ready(function () {
    var parameter = getUrlParameter("id");
    $.ajax({
        url: URLAPI + "/order/find-by-id?id=" + parameter,
        method: "get",
        success: function (res) {
            var item = res.data;
            $('#tbody-san-pham').empty();
            console.log(item);
            $('#tbody-san-pham').append("<tr>" +
                "<td>" + item.sMasanpham + "</td>" +
                "<td>" + item.sTensanpham + "</td>" +
                "<td>" + item.iSoluong + "</td>" +
                "<td>" + item.sDonvitinh + "</td>" +
                "<td>" + item.iSoluong * item.sDonvitinh + "</td>" +
                "</tr>")
        }
    })
});