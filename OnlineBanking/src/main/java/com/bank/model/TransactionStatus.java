package com.bank.model;
// Generated Jun 28, 2017 12:51:24 PM by Hibernate Tools 4.3.1



/**
 * TransactionStatus generated by hbm2java
 */
public class TransactionStatus  implements java.io.Serializable {


     private Integer id;
     private String transactionStatus;

    public TransactionStatus() {
    }

    public TransactionStatus(String transactionStatus) {
       this.transactionStatus = transactionStatus;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTransactionStatus() {
        return this.transactionStatus;
    }
    
    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }




}


