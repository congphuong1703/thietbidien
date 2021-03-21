function searchProduct() {
    var id = $('#input-search-ma').val();
    var name = $('#input-search-ten').val();
    var status = $('#select-search-het-hang option:checked').val();
    var price = $('#input-search-gia').val();
    $.ajax({
        url: URLAPI + "/product/search-san-pham?id=" + id + "&name=" + name + "&price=" + price + "&status=" + status,
        method: "get",
        success: function (res) {
            $('#tbody-san-pham').empty();
            var item = res.data;
            for (var i = 0; i < item.length; i++) {
                $('#tbody-san-pham').append("<tr>" +
                    "<td>" + item[i].image + "</td>" +
                    "<td>" + item[i].id + "</td>" +
                    "<td>" + item[i].name + "</td>" +
                    "<td>" + item[i].price + "</td>" +
                    "<td>" + item[i].amount + "</td>" +
                    "<td>" + item[i].specification + "</td>" +
                    "<td>" + item[i].guarantee + "</td>" +
                    "<td>" + item[i].unit + "</td>" +
                    "<td>" + item[i].categoryId + "</td>" +
                    "<td>" + item[i].status + "</td>" +
                    "<td> <button type=\"button\" className=\"btn btn-warning\" data-toggle=\"modal\" data-target=\"#exampleModal\">" +
                    "<i className=\"fas fa-pen\"></i>Sửa" +
                    "</button> <button type=\"button\" className=\"btn btn-danger\" data-toggle=\"modal\" data-target=\"#exampleModal1\"><i className=\"fas fa-trash-alt\"></i>" +
                    "Xóa </button></td>" +
                    "</tr>")
            }
        }
    })
}

