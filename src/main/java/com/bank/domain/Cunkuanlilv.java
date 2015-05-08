package com.bank.domain;

import javax.persistence.*;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Entity
public class Cunkuanlilv {
    private int id;
    public Cunkuanlilv(){
        super();
    }

    @Id
    @TableGenerator(name = "tg_bank_cunkuanlilv", pkColumnValue = "cunkuanlilv", table = "t_id_table", pkColumnName = "f_table", valueColumnName = "f_id_value", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "tg_bank_cunkuanlilv")
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String data;
    private String huoqi;
    private String zz3M;
    private String zz6M;
    private String zz12M;
    private String zz24M;
    private String zz36M;

    private String zz60M;
    private String zl12M;
    private String zl36M;
    private String zl60M;
    private String xd;
    private String tz1D;
    private String tz7D;


    @Basic
    @Column(name = "data", nullable = true, insertable = true, updatable = true, length = 255)
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }


    @Basic
    @Column(name = "huoqi", nullable = true, insertable = true, updatable = true, length = 255)
    public String getHuoqi() {
        return huoqi;
    }

    public void setHuoqi(String huoqi) {
        this.huoqi = huoqi;
    }


    @Basic
    @Column(name = "zz3m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZz3M() {
        return zz3M;
    }

    public void setZz3M(String zz3M) {
        this.zz3M = zz3M;
    }


    @Basic
    @Column(name = "zz6m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZz6M() {
        return zz6M;
    }

    public void setZz6M(String zz6M) {
        this.zz6M = zz6M;
    }


    @Basic
    @Column(name = "zz12m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZz12M() {
        return zz12M;
    }

    public void setZz12M(String zz12M) {
        this.zz12M = zz12M;
    }


    @Basic
    @Column(name = "zz24m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZz24M() {
        return zz24M;
    }

    public void setZz24M(String zz24M) {
        this.zz24M = zz24M;
    }


    @Basic
    @Column(name = "zz36m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZz36M() {
        return zz36M;
    }

    public void setZz36M(String zz36M) {
        this.zz36M = zz36M;
    }


    @Basic
    @Column(name = "zz60m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZz60M() {
        return zz60M;
    }

    public void setZz60M(String zz60M) {
        this.zz60M = zz60M;
    }


    @Basic
    @Column(name = "zl12m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZl12M() {
        return zl12M;
    }

    public void setZl12M(String zl12M) {
        this.zl12M = zl12M;
    }


    @Basic
    @Column(name = "zl36m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZl36M() {
        return zl36M;
    }

    public void setZl36M(String zl36M) {
        this.zl36M = zl36M;
    }


    @Basic
    @Column(name = "zl60m", nullable = true, insertable = true, updatable = true, length = 255)
    public String getZl60M() {
        return zl60M;
    }

    public void setZl60M(String zl60M) {
        this.zl60M = zl60M;
    }


    @Basic
    @Column(name = "xd", nullable = true, insertable = true, updatable = true, length = 255)
    public String getXd() {
        return xd;
    }

    public void setXd(String xd) {
        this.xd = xd;
    }


    @Basic
    @Column(name = "tz1d", nullable = true, insertable = true, updatable = true, length = 255)
    public String getTz1D() {
        return tz1D;
    }

    public void setTz1D(String tz1D) {
        this.tz1D = tz1D;
    }


    @Basic
    @Column(name = "tz7d", nullable = true, insertable = true, updatable = true, length = 255)
    public String getTz7D() {
        return tz7D;
    }

    public void setTz7D(String tz7D) {
        this.tz7D = tz7D;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cunkuanlilv that = (Cunkuanlilv) o;

        if (id != that.id) return false;
        if (data != null ? !data.equals(that.data) : that.data != null) return false;
        if (huoqi != null ? !huoqi.equals(that.huoqi) : that.huoqi != null) return false;
        if (tz1D != null ? !tz1D.equals(that.tz1D) : that.tz1D != null) return false;
        if (tz7D != null ? !tz7D.equals(that.tz7D) : that.tz7D != null) return false;
        if (xd != null ? !xd.equals(that.xd) : that.xd != null) return false;
        if (zl12M != null ? !zl12M.equals(that.zl12M) : that.zl12M != null) return false;
        if (zl36M != null ? !zl36M.equals(that.zl36M) : that.zl36M != null) return false;
        if (zl60M != null ? !zl60M.equals(that.zl60M) : that.zl60M != null) return false;
        if (zz12M != null ? !zz12M.equals(that.zz12M) : that.zz12M != null) return false;
        if (zz24M != null ? !zz24M.equals(that.zz24M) : that.zz24M != null) return false;
        if (zz36M != null ? !zz36M.equals(that.zz36M) : that.zz36M != null) return false;
        if (zz3M != null ? !zz3M.equals(that.zz3M) : that.zz3M != null) return false;
        if (zz60M != null ? !zz60M.equals(that.zz60M) : that.zz60M != null) return false;
        if (zz6M != null ? !zz6M.equals(that.zz6M) : that.zz6M != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (data != null ? data.hashCode() : 0);
        result = 31 * result + (huoqi != null ? huoqi.hashCode() : 0);
        result = 31 * result + (zz3M != null ? zz3M.hashCode() : 0);
        result = 31 * result + (zz6M != null ? zz6M.hashCode() : 0);
        result = 31 * result + (zz12M != null ? zz12M.hashCode() : 0);
        result = 31 * result + (zz24M != null ? zz24M.hashCode() : 0);
        result = 31 * result + (zz36M != null ? zz36M.hashCode() : 0);
        result = 31 * result + (zz60M != null ? zz60M.hashCode() : 0);
        result = 31 * result + (zl12M != null ? zl12M.hashCode() : 0);
        result = 31 * result + (zl36M != null ? zl36M.hashCode() : 0);
        result = 31 * result + (zl60M != null ? zl60M.hashCode() : 0);
        result = 31 * result + (xd != null ? xd.hashCode() : 0);
        result = 31 * result + (tz1D != null ? tz1D.hashCode() : 0);
        result = 31 * result + (tz7D != null ? tz7D.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Cunkuanlilv{" +
                "data='" + data + '\'' +
                ", id=" + id +
                ", huoqi='" + huoqi + '\'' +
                ", zz3M='" + zz3M + '\'' +
                ", zz6M='" + zz6M + '\'' +
                ", zz12M='" + zz12M + '\'' +
                ", zz24M='" + zz24M + '\'' +
                ", zz36M='" + zz36M + '\'' +
                ", zz60M='" + zz60M + '\'' +
                ", zl12M='" + zl12M + '\'' +
                ", zl36M='" + zl36M + '\'' +
                ", zl60M='" + zl60M + '\'' +
                ", xd='" + xd + '\'' +
                ", tz1D='" + tz1D + '\'' +
                ", tz7D='" + tz7D + '\'' +
                '}';
    }
}
