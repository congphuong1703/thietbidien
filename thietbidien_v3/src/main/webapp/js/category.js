function updateCategory(id) {
    $('#id').val($('#' + id).attr('data-id'));
    $('#name').val($('#' + id).attr('data-name'));
    var status = $('#' + id).attr('data-status');
    if (status === "false") {
        $('#status input#status1').prop('checked', true);
    } else {
        $('#status input#status2').prop('checked', true);
    }
}

function deleteCategory(id) {
    $('#methodDelete').attr("href", "/category/deleteById?id=" + id);
}

$('#add').click(function () {
    $('#id').val(0);
    $('#name').val("");
    $('#status input#status1').prop('checked', true);
})

function simpleValidation() {
    var nameEle = $('#name');

    if (nameEle.val() === '') {
        nameEle.val("Bạn phải nhập tên danh mục");
        nameEle.focus(function () {
            nameEle.val('');
        })
        nameEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }
    return  true;

}
