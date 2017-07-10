package com.bank.model;

/**
 * Created by danieltang on 7/6/17.
 */
public class TransactionForm {
    private int transfer;
    private int recipient;
    private double amount;

    public int getTransfer() {
        return transfer;
    }

    public void setTransfer(int transfer) {
        this.transfer = transfer;
    }

    public int getRecipient() {
        return recipient;
    }

    public void setRecipient(int recipient) {
        this.recipient = recipient;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "TransactionForm{" +
                "transfer=" + transfer +
                ", recipient=" + recipient +
                ", amount=" + amount +
                '}';
    }
}
