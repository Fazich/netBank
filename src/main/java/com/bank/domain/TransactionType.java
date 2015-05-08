package com.bank.domain;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by XiaHaijiao on 2015/4/8.
 */
@Entity
@Table(name = "transaction_type", schema = "", catalog = "bank")
public class TransactionType implements java.io.Serializable {
    private int id;
    private String name;
    private Set<TransactionLog> transactionLogs = new HashSet(0);

    @Id
    @TableGenerator(name = "tg_bank_transactiontype", pkColumnValue = "transactiontype", table = "t_id_table", pkColumnName = "f_table", valueColumnName = "f_id_value", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "tg_bank_transactiontype")
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, insertable = true, updatable = true, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TransactionType that = (TransactionType) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "transactionType")
    public Set<TransactionLog> getTransactionLogs() {
        return this.transactionLogs;
    }

    public void setTransactionLogs(Set<TransactionLog> transactionLogs) {
        this.transactionLogs = transactionLogs;
    }
}
