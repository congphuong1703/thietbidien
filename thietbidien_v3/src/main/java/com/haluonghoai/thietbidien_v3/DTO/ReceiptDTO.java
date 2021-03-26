package com.haluonghoai.thietbidien_v3.DTO;

import com.haluonghoai.thietbidien_v3.Models.Receipt;
import com.haluonghoai.thietbidien_v3.Models.ReceiptDetails;

import java.util.List;

public class ReceiptDTO {

    private Receipt receipt;
    private List<ReceiptDetails> receiptDetailsList;

    public ReceiptDTO(Receipt receipt, List<ReceiptDetails> receiptDetailsList) {
        this.receipt = receipt;
        this.receiptDetailsList = receiptDetailsList;
    }

    public ReceiptDTO() {
    }

    public Receipt getReceipt() {
        return receipt;
    }

    public void setReceipt(Receipt receipt) {
        this.receipt = receipt;
    }

    public List<ReceiptDetails> getReceiptDetailsList() {
        return receiptDetailsList;
    }

    public void setReceiptDetailsList(List<ReceiptDetails> receiptDetailsList) {
        this.receiptDetailsList = receiptDetailsList;
    }
}
