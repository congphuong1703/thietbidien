function updateProduct(id) {
    $('#id').val($('#' + id).attr('data-id'));
    console.log($('#' + id).attr('data-id'))
    $('#increaseId').val($('#' + id).attr('data-increaseId'));
    $('#name').val($('#' + id).attr('data-name'));
    $('#price').val($('#' + id).attr('data-price'));
    $('#image').val($('#' + id).attr('data-image'));
    $('#description').val($('#' + id).attr('data-description'));
    $('#amount').val($('#' + id).attr('data-amount'));
    $('#specification').val($('#' + id).attr('data-specification'));
    $('#guarantee').val($('#' + id).attr('data-guarantee'));
    $('#unit').val($('#' + id).attr('data-unit'));
    $('#categoryId option[data-id=' + $('#' + id).attr('data-categoryId') + ']').attr('selected', 'selected');
    $('#price').attr("readonly", true);
}

function deleteProduct(id) {
    $('#methodDelete').attr("href", "/product/deleteById?id=" + id);
}

$('#add').click(function () {
    $('#id').val("");
    $('#name').val("");
    $('#price').val(0);
    $('#image').val("");
    $('#description').val("");
    $('#categoryId').val("");
    $('#unit').val("");
    $('#specification').val("");
    $('#guarantee').val(0);
    $('#amount').val(0);
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
    var category = $('#categoryId');

    if (idEle.val() === '') {
        idEle.focus(function () {
            idEle.val('');
        })
        idEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (nameEle.val() === '') {
        nameEle.focus(function () {
            nameEle.val('');
        })
        nameEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (category.val() == null) {
        category.focus(function () {
            category.val('');
        })
        category.css({'border-color': 'red', 'color': 'red'});
        return false;
    }


    if (imageEle.val() === '') {
        imageEle.focus(function () {
            imageEle.val('');
        })
        imageEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }

    if (unitEle.val() === '') {
        unitEle.focus(function () {
            unitEle.val('');
        })
        unitEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }
    if (amountEle.val() < 0) {
        amountEle.focus(function () {
            amountEle.val(0);
        })
        amountEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }
    if (priceEle.val() < 1) {
        priceEle.focus(function () {
            priceEle.val(0);
        })
        priceEle.css({'border-color': 'red', 'color': 'red'});
        return false;
    }
}