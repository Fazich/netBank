package com.bank.domain;

import javax.persistence.*;
import java.math.BigDecimal;


/**
 * Created by XiaHaijiao on 2015/4/8.
 */
@Entity
@Table(name = "transaction_log", schema = "", catalog = "bank")
public class TransactionLog implements java.io.Serializable {
    private User user;
    private TransactionType transactionType;
    private int id;
    private int otherid;
    private Double trMoney;
    private String datetime;
    private String otherName;

    @Id
    @TableGenerator(name = "tg_bank_transactionlog", pkColumnValue = "transactionlog", table = "t_id_table", pkColumnName = "f_table", valueColumnName = "f_id_value", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "tg_bank_transactionlog")
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "otherid", nullable = false, insertable = true, updatable = true)
    public int getOtherid() {
        return otherid;
    }

    public void setOtherid(int otherid) {
        this.otherid = otherid;
    }

    @Basic
    @Column(name = "tr_money", nullable = false, insertable = true, updatable = true, precision = 4)
    public Double getTrMoney() {
        return trMoney;
    }

    public void setTrMoney(Double trMoney) {
        this.trMoney = trMoney;
    }

    @Basic
    @Column(name = "datetime", nullable = false, insertable = true, updatable = true, length = 50)
    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TransactionLog that = (TransactionLog) o;

        if (id != that.id) return false;
        if (otherid != that.otherid) return false;
        if (datetime != null ? !datetime.equals(that.datetime) : that.datetime != null) return false;
        if (trMoney != null ? !trMoney.equals(that.trMoney) : that.trMoney != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + otherid;
        result = 31 * result + (trMoney != null ? trMoney.hashCode() : 0);
        result = 31 * result + (datetime != null ? datetime.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "TransactionLog{" +
                "user=" + user +
                ", transactionType=" + transactionType +
                ", id=" + id +
                ", otherid=" + otherid +
                ", trMoney=" + trMoney +
                ", datetime='" + datetime + '\'' +
                ", otherName='" + otherName + '\'' +
                '}';
    }

    @ManyToOne(fetch = FetchType.LAZY)
//   @JoinColumn(name = "ta_type", nullable = false)
    @JoinColumn(name = "ta_type")
    public TransactionType getTransactionType() {
        return this.transactionType;
    }

    public void setTransactionType(TransactionType transactionType) {
        this.transactionType = transactionType;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userid", nullable = false)
    public User getUser() {//1,存。2，取。3，转出。4，转入
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public String getOtherName() {
        return otherName;
    }

    public void setOtherName(String otherName) {
        this.otherName = otherName;
    }
}
