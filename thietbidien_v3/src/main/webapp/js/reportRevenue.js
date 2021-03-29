$(document).ready(function () {

    var table = $('#dtHorizontalVerticalExample').DataTable();

    $('<button class="btn btn-outline-primary">Báo cáo</button>')
        .prependTo('#demo')
        .on('click', function () {
            var totalRevenue = table.column(4, {page: 'current'}).data().sum();
            var totalProduct = table.column(2, {page: 'current'}).data().sum();

            $('#totalProduct').text(totalProduct.toString().replace(/\d(?=(\d{3})+\.)/g, '$&,'));
            $('#totalRevenue').text(totalRevenue.toString().replace(/\d(?=(\d{3})+\.)/g, '$&,'));

            $('#exampleModal').modal('show');
        });
});

$.fn.dataTable.Api.register('column().data().sum()', function () {
    return this.reduce(function (a, b) {
        var x = parseFloat(a) || 0;
        var y = parseFloat(b) || 0;
        return x + y;
    });
});