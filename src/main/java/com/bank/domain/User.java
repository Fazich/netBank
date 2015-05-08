package com.bank.domain;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by XiaHaijiao on 2015/4/8.
 */
@Entity
public class User implements java.io.Serializable {
    private Integer userid;
    private Status status;
    private String username;
    private String password;
    private Double balance;
    private Set<Personinfo> personinfos;

    private Set<TransactionLog> transactionLogs;

    public User() {
        super();
    }

    @Id
    @TableGenerator(name = "tg_bank_user", pkColumnValue = "user", table = "t_id_table", pkColumnName = "f_table", valueColumnName = "f_id_value", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "tg_bank_user")
    @Column(name = "userid", nullable = false, insertable = true, updatable = true)
    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "username", nullable = false, insertable = true, updatable = true, length = 50)

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = false, insertable = true, updatable = true, length = 50)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "balance", nullable = false, insertable = true, updatable = true, precision = 4)
    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (userid != user.userid) return false;
        if (balance != null ? !balance.equals(user.balance) : user.balance != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userid;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (balance != null ? balance.hashCode() : 0);
        return result;
    }




    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                //  "," + status +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", balance=" + balance +
                //  ", personinfos=" + personinfos +
                // ", transactionLogs=" + transactionLogs +
                '}';
    }

    @ManyToOne(fetch = FetchType.EAGER )
    @JoinColumn(name = "status", nullable = false)
    public Status getStatus() {//1,启用。2，冻结
        return this.status;
    }
    public void setStatus(Status status) {
        this.status = status;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
//    @JoinColumn(name = "userid", referencedColumnName = "userid")
    public Set<Personinfo> getPersoninfo() {
        return this.personinfos;
    }

    public void setPersoninfo(Set<Personinfo> personinfos) {
        this.personinfos = personinfos;

    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.REMOVE)
//    @OneToMany(fetch = FetchType.EAGER, mappedBy = "userid")
    public Set<TransactionLog> getTransactionLog() {
        return this.transactionLogs;
    }

    public void setTransactionLog(Set<TransactionLog> transactionlog) {
        this.transactionLogs = transactionlog;
    }
}
