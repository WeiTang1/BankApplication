package com.bank.model;
// Generated Jun 28, 2017 12:51:24 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private Integer id;
     private Address address;
     private String firstName;
     private String lastName;
     private String email;
     private String phoneNumber;
     private Date dateOfBirth;
     private byte isAdmin;
     private Set accounts = new HashSet(0);
     private Set credentials = new HashSet(0);

    public User() {
    }

	
    public User(Address address, String firstName, String lastName, String email, String phoneNumber, Date dateOfBirth, byte isAdmin) {
        this.address = address;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dateOfBirth = dateOfBirth;
        this.isAdmin = isAdmin;
    }
    public User(Address address, String firstName, String lastName, String email, String phoneNumber, Date dateOfBirth, byte isAdmin, Set accounts, Set credentials) {
       this.address = address;
       this.firstName = firstName;
       this.lastName = lastName;
       this.email = email;
       this.phoneNumber = phoneNumber;
       this.dateOfBirth = dateOfBirth;
       this.isAdmin = isAdmin;
       this.accounts = accounts;
       this.credentials = credentials;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Address getAddress() {
        return this.address;
    }
    
    public void setAddress(Address address) {
        this.address = address;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhoneNumber() {
        return this.phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public Date getDateOfBirth() {
        return this.dateOfBirth;
    }
    
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    public byte getIsAdmin() {
        return this.isAdmin;
    }
    
    public void setIsAdmin(byte isAdmin) {
        this.isAdmin = isAdmin;
    }
    public Set getAccounts() {
        return this.accounts;
    }
    
    public void setAccounts(Set accounts) {
        this.accounts = accounts;
    }
    public Set getCredentials() {
        return this.credentials;
    }
    
    public void setCredentials(Set credentials) {
        this.credentials = credentials;
    }




}


