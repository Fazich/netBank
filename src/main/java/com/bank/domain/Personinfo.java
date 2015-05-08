package com.bank.domain;

import javax.persistence.*;

/**
 * Created by XiaHaijiao on 2015/4/8.
 */
@Entity
public class Personinfo implements java.io.Serializable {
    private int id;
    private User user;
    private String realname;
    private int age;
    private String sex;
    private Long cardid;
    private String address;
    private String telephone;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    @TableGenerator(name = "tg_bank_personinfo", pkColumnValue = "personinfo", table = "t_id_table", pkColumnName = "f_table", valueColumnName = "f_id_value", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "tg_bank_personinfo")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "realname", nullable = false, insertable = true, updatable = true, length = 50)
    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    @Basic
    @Column(name = "age", nullable = false, insertable = true, updatable = true)
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Basic
    @Column(name = "sex", nullable = false, insertable = true, updatable = true, length = 2)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "cardid", nullable = false, insertable = true, updatable = true, precision = 0)
    public Long getCardid() {
        return cardid;
    }

    public void setCardid(Long cardid) {
        this.cardid = cardid;
    }

    @Basic
    @Column(name = "address", nullable = false, insertable = true, updatable = true, length = 50)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "telephone", nullable = true, insertable = true, updatable = true, length = 50)
    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Personinfo that = (Personinfo) o;

        if (age != that.age) return false;
        if (cardid != that.cardid) return false;
        if (id != that.id) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;
        if (realname != null ? !realname.equals(that.realname) : that.realname != null) return false;
        if (sex != null ? !sex.equals(that.sex) : that.sex != null) return false;
        if (telephone != null ? !telephone.equals(that.telephone) : that.telephone != null) return false;

        return true;
    }

    @ManyToOne(cascade = CascadeType.ALL ,fetch = FetchType.EAGER)
    @JoinColumn(name = "userid", nullable = false)
//    @JoinColumn(name = "userid", referencedColumnName = "userid", unique = true)
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "userid", referencedColumnName = "userid", nullable = false)
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }
//    @OneToOne(mappedBy = "userid")
//    public User getUser() {
//        return this.user;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }

    @Override
    public String toString() {
        return "Personinfo{" +
                "user=" + user +
                ", id=" + id +
                ", realname='" + realname + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                ", cardid=" + cardid +
                ", address='" + address + '\'' +
                ", telephone='" + telephone + '\'' +
                '}';
    }
}
