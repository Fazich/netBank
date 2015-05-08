package com.bank.domain;

import javax.persistence.*;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Entity
public class Daikuanlilv {
    private int id;
    private String data;
    private String d6Month;
    private String d6To12;
    private String d12To36;
    private String d36To60;
    private String d60Up;
    private String zf0To60;
    private String zf60Up;

    public Daikuanlilv() {
        super();
    }

    @Id
    @TableGenerator(name = "tg_bank_daikuanlilv", pkColumnValue = "daikuanlilv", table = "t_id_table", pkColumnName = "f_table", valueColumnName = "f_id_value", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "tg_bank_daikuanlilv")
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "data", nullable = true, insertable = true, updatable = true, length = 255)
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    @Basic
    @Column(name = "d6month", nullable = true, insertable = true, updatable = true, length = 255)
    public String getD6Month() {
        return d6Month;
    }

    public void setD6Month(String d6Month) {
        this.d6Month = d6Month;
    }

    @Basic
    @Column(name = "d6to12", nullable = true, insertable = true, updatable = true, length = 255)
    public String getD6To12() {
        return d6To12;
    }

    public void setD6To12(String d6To12) {
        this.d6To12 = d6To12;
    }

    @Basic
    @Column(name = "d12to36", nullable = true, insertable = true, updatable = true, length = 255)
    public String getD12To36() {
        return d12To36;
    }

    public void setD12To36(String d12To36) {
        this.d12To36 = d12To36;
    }

    @Basic
    @Column(name = "d36to60", nullable = true, insertable = true, updatable = true, length = 255)
    public String getD36To60() {
        return d36To60;
    }

    public void setD36To60(String d36To60) {
        this.d36To60 = d36To60;
    }

    @Basic
    @Column(name = "d60up", nullable = true, insertable = true, updatable = true, length = 255)
    public String getD60Up() {
        return d60Up;
    }

    public void setD60Up(String d60Up) {
        this.d60Up = d60Up;
    }

    @Basic
    @Column(name = "zf0to60", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZf0To60() {
        return zf0To60;
    }

    public void setZf0To60(String zf0To60) {
        this.zf0To60 = zf0To60;
    }

    @Basic
    @Column(name = "zf60up", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZf60Up() {
        return zf60Up;
    }

    public void setZf60Up(String zf60Up) {
        this.zf60Up = zf60Up;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Daikuanlilv that = (Daikuanlilv) o;

        if (id != that.id) return false;
        if (d12To36 != null ? !d12To36.equals(that.d12To36) : that.d12To36 != null) return false;
        if (d36To60 != null ? !d36To60.equals(that.d36To60) : that.d36To60 != null) return false;
        if (d60Up != null ? !d60Up.equals(that.d60Up) : that.d60Up != null) return false;
        if (d6Month != null ? !d6Month.equals(that.d6Month) : that.d6Month != null) return false;
        if (d6To12 != null ? !d6To12.equals(that.d6To12) : that.d6To12 != null) return false;
        if (data != null ? !data.equals(that.data) : that.data != null) return false;
        if (zf0To60 != null ? !zf0To60.equals(that.zf0To60) : that.zf0To60 != null) return false;
        if (zf60Up != null ? !zf60Up.equals(that.zf60Up) : that.zf60Up != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (data != null ? data.hashCode() : 0);
        result = 31 * result + (d6Month != null ? d6Month.hashCode() : 0);
        result = 31 * result + (d6To12 != null ? d6To12.hashCode() : 0);
        result = 31 * result + (d12To36 != null ? d12To36.hashCode() : 0);
        result = 31 * result + (d36To60 != null ? d36To60.hashCode() : 0);
        result = 31 * result + (d60Up != null ? d60Up.hashCode() : 0);
        result = 31 * result + (zf0To60 != null ? zf0To60.hashCode() : 0);
        result = 31 * result + (zf60Up != null ? zf60Up.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Daikuanlilv{" +
                "d12To36='" + d12To36 + '\'' +
                ", id=" + id +
                ", data='" + data + '\'' +
                ", d6Month='" + d6Month + '\'' +
                ", d6To12='" + d6To12 + '\'' +
                ", d36To60='" + d36To60 + '\'' +
                ", d60Up='" + d60Up + '\'' +
                ", zf0To60='" + zf0To60 + '\'' +
                ", zf60Up='" + zf60Up + '\'' +
                '}';
    }
}
