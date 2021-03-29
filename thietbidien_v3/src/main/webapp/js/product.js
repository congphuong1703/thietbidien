function updateProduct(id) {
    $('#id').val($('#' + id).attr('data-id'));
    $('#increaseId').val($('#' + id).attr('data-increaseId'));
    $('#name').val($('#' + id).attr('data-name'));
    $('#price').val($('#' + id).attr('data-price'));
    $('#image').val($('#' + id).attr('data-image'));
    $('#description').val($('#' + id).attr('data-description'));
    $('#amount').val($('#' + id).attr('data-amount'));
    $('#specification').val($('#' + id).attr('data-specification'));
    $('#guarantee').val($('#' + id).attr('data-guarantee'));
    $('#unit').val($('#' + id).attr('data-unit'));
    $('#categoryId option[data-id=' + $('#' + id).attr('data-categoryId') + ']').attr('selected','selected');;
    if ($('#status').val() === "true") {
        $('#status input#status1').prop('checked', true);
    } else {
        $('#status input#status2').prop('checked', true);
    }
}

function deleteProduct(id) {
    $('#methodDelete').attr("href", "/product/deleteById?id=" + id);
}

$('#add').click(function () {
    $('#id').val(0);
    $('#name').val("");
    $('#price').val(0);
    $('#image').val("");
    $('#description').val("");
    $('#categoryId').val("");
    $('#unit').val("");
    $('#specification').val("");
    $('#guarantee').val(0);
    $('#amount').val(0);
    $('#status input#status1').prop('checked', true);
    $('#categoryId option#-1').prop('selected', true);
})

function simpleValidation() {
    var idEle = $('#id')
    var nameEle = $('#name');
    var priceEle = $('#price')
    var imageEle = $('#image')
    var desEle = $('#description')
    var amountEle = $('#amount')
    var specificEle = $('#specification')
    var guaranteeEle = $('#guarantee')
    var unitEle = $('#unit')

    if (idEle.val() === '') {
        idEle.val("Bạn phải nhập id sản phẩm");
        idEle.focus(function () {
            idEle.val('');
        })
        idEle.css({'border-color': 'red','color': 'red'});
        return false;
    }

    if (nameEle.val() === '') {
        nameEle.val("Bạn phải nhập tên sản phẩm");
        nameEle.focus(function () {
            nameEle.val('');
        })
        nameEle.css({'border-color': 'red','color': 'red'});
        return false;
    }
    if (imageEle.val() === '') {
        imageEle.val("Bạn phải nhập đường dẫn ảnh");
        imageEle.focus(function () {
            imageEle.val('');
        })
        imageEle.css({'border-color': 'red','color': 'red'});
        return false;
    }

    if (unitEle.val() === '') {
        unitEle.val("Bạn phải nhập đơn vị");
        unitEle.focus(function () {
            unitEle.val('');
        })
        unitEle.css({'border-color': 'red','color': 'red'});
        return false;
    }
}