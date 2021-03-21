package com.haluonghoai.thietbidien_v3.API;

import com.google.gson.Gson;
import com.haluonghoai.thietbidien_v3.DAO.ReceiptDao;
import com.haluonghoai.thietbidien_v3.DAO.imp.ReceiptDao_impl;
import com.haluonghoai.thietbidien_v3.Models.JsonResult;
import com.haluonghoai.thietbidien_v3.Models.Receipt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReceiptDao", urlPatterns = "/api/v1/receipt/*")
public class ReceiptController extends HttpServlet {

    private ReceiptDao receiptDao = new ReceiptDao_impl();

    private JsonResult jsonResult = new JsonResult();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rs = "";
        try{
            Receipt receipt = new Gson().fromJson(request.getReader(),Receipt.class);
            Receipt newReceipt = receiptDao.insert(receipt);
            rs = newReceipt != null ? jsonResult.jsonSuccess(newReceipt) : jsonResult.jsonSuccess("Thêm phiếu nhập thất bại");
        }catch (Exception ex){
            ex.printStackTrace();
            rs = jsonResult.jsonFail("upload fail");
        }
        response.getWriter().write(rs);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String partInfo = request.getPathInfo();
        String rs = "";
        if(partInfo.indexOf("/find-all") == 0) {
            try {
                List<Receipt> receiptList = receiptDao.findAll();
                rs = jsonResult.jsonSuccess(receiptList);
            } catch (Exception e) {
                e.printStackTrace();
                rs = jsonResult.jsonFail("find-all-error");
            }
            response.getWriter().write(rs);
        }else if(partInfo.indexOf("/so-ban-ghi") == 0){//Hiển thị số bản ghi
            try{
                int count = receiptDao.count();
                rs = jsonResult.jsonSuccess(count);
            }catch (Exception ex){
                ex.printStackTrace();
                rs = jsonResult.jsonFail("so-ban-ghi-error");
            }
            response.getWriter().write(rs);
        }else if(partInfo.indexOf("/find-by-id")==0){//Tìm kiếm phiếu nhập theo mã phiếu nhập
            try{
               int id = Integer.parseInt(request.getParameter("id"));
               rs = jsonResult.jsonSuccess(id);
            }catch (Exception ex){
                ex.printStackTrace();
                rs = jsonResult.jsonFail("find-by-id-fail");
            }
            response.getWriter().write(rs);
        }
        else {
            response.sendError(404, "URL is not supported");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rs = "";
        try {
            Receipt receipt = new Gson().fromJson(req.getReader(), Receipt.class);
            rs = jsonResult.jsonSuccess(receiptDao.updateTinhTrang(receipt.getStatusEnter(),receipt.getId()));
        } catch (Exception e) {
            e.printStackTrace();
            rs = jsonResult.jsonFail("update receipt fail");
        }
        resp.getWriter().write(rs);
    }
}
