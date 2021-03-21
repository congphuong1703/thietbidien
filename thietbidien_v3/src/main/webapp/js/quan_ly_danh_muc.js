var inputTen, checkboxTinhTrang, buttonLuu, buttonXacNhanXoa, buttonThem, spanHienThi, tableDuLieu, buttonSua,
    buttonXoa;
var list, indexdanhmuc, elementdanhmuc;
var URLAPI = "http://localhost:8080/Thietbidien_v3_war/api/v1";

$(function () {
    inputTen = $("#input-ten");
    checkboxTinhTrang = $("#checkbox-tinh-trang-ban");
    buttonThem = $("#btn-them");
    spanHienThi = $("#hien-thi");
    tableDuLieu = $("tbody");
    buttonLuu = $("#btn-luu-lai");
    btnSua = $("#btn-sua");
    btnXoa = $("#btn-xoa");
    buttonXacNhanXoa = $("#btn-xac-nhan-xoa");
    viewDanhSachDanhMuc();
    xacnhanxoa();
    luuDanhMuc();
    themDanhMuc();
    hienthibanghi();
});

function viewDanhSachDanhMuc() {
    $.ajax({
        url: URLAPI + "/category/find-all",
        method: "get",
        success: function (res1) {
            list = res1.data;
            console.log(list);
            let view;
            view = list.map((data, index) => {
                console.log("da vao data");
                console.log(data)
                //cú pháp template string trong đấy cho phép thực hiện các phép toán
                return `<tr data-index="${index}">
                        <th scope="row">${index + 1}</th>
                        <td>${data.name}</td>
                        <td>${data.status}</td>
                        <td>
                            <button type="button" class="btn btn-warning sua-danh-muc"><i class="fas fa-pen"></i>
                                Sửa</button>
                            <button type="button" class="btn btn-danger xoa-danh-muc"><i class="fas fa-trash-alt"></i>
                                Xóa</button>
                        </td>
                    </tr>`
            }).join("");
            tableDuLieu.html(view);
            suadanhmucsp();
            xoadanhmucsp();
        }
    })
}

function xoadanhmucsp() {
    $(".xoa-danh-muc").click(function () {
        indexdanhmuc = $(this).parents("tr").attr("data-index");
        console.log(indexdanhmuc);
        $("#exampleModal1").modal("show");
    })
}

function suadanhmucsp() {
    $(".sua-danh-muc").click(function () {
        elementdanhmuc = list[$(this).parents("tr").attr("data-index") - 0];
        $('#idCategory').val(elementdanhmuc.id);
        inputTen.val(elementdanhmuc.name);
        checkboxTinhTrang.prop("checked", elementdanhmuc.status);
        $("#exampleModal").modal("show");
    })
}

function xacnhanxoa() {
    buttonXacNhanXoa.click(function () {
        let idCategory = list[indexdanhmuc - 0].id;
        $.ajax({
            url: URLAPI + "/category?id=" + idCategory,
            method: "delete",
            success: function () {
                list = list.filter((data, index) => {
                    return index != indexdanhmuc;
                })
                viewDanhSachDanhMuc();
            }
        })
        viewDanhSachDanhMuc();
        hienthibanghi();
        $("#exampleModal1").modal("hide");
    })
}

function checkData(selector, textError) {
    let val = $(selector).val();
    let check = false;
    if (val.length > 0) {
        check = true;
        hiddenError(selector);
    } else {
        viewError(selector, textError);
    }
    return {val, check};
}

function luuDanhMuc() {
    buttonLuu.click(function () {
        // let {val:valTen, check:checkTen} = checkData(textTen, "Định dạng tên chưa đúng");
        // let valTinhTrang = checkboxTinhTrang.is(":checked");
        let checkAction = false;
        if (elementdanhmuc) {
            checkAction = true;
        } else {
            elementdanhmuc = {};
        }
        if (checkAction) {
            list[indexdanhmuc] = elementdanhmuc;
            console.log(elementdanhmuc.id);
            var dataPush = {
                "id": $('#idCategory').val(),
                "name": $('#input-ten').val(),
                "status": false
            }
            $.ajax({
                url: URLAPI + "/category/*",
                method: "Put",
                data: JSON.stringify(dataPush),
                success: function () {
                    viewDanhSachDanhMuc();
                }

            })
            console.log("save");
        } else {
            var dataPush = {
                "name": $('#input-ten').val(),
                "status": false
            }
            $.ajax({
                url: URLAPI + "/category/*",
                method: "Post",
                data: JSON.stringify(dataPush),
                success: function () {
                    viewDanhSachDanhMuc();
                }
            })

            list.push(elementdanhmuc);
        }
        list[indexdanhmuc] = elementdanhmuc;
        viewDanhSachDanhMuc();
        hienthibanghi();
        console.log("save");
        $("#exampleModal").modal("hide");
    })
}

function themDanhMuc() {
    buttonThem.click(function () {
        elementCategory = null;
        $("#exampleModal").modal("show");
    })
}

function hienthibanghi() {
    $.ajax({
        url: URLAPI + "/category/so-ban-ghi",
        method: "get",
        success: function (res) {
            let hienthi = res.data;
            console.log(hienthi);
            spanHienThi.html(hienthi);
        }
    })
}
