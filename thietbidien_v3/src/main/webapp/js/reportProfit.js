$(document).ready(function () {

    var table = $('#dtHorizontalVerticalExample').DataTable();

    $('<button class="btn btn-outline-primary">Báo cáo</button>')
        .prependTo('#demo')
        .on('click', function () {
            var totalProfit = table.column(2, {page: 'current'}).data().sum();

            $('#totalProfit').text(totalProfit.toString().toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,'));

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