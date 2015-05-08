package com.bank.repository.impl;

import com.bank.domain.Admin;
import com.bank.repository.AdminDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;
    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        //需要开启事物，才能得到CurrentSession
        return sessionFactory.getCurrentSession();
    }

    public boolean addAdmin(Admin admin) {
        hibernateTemplate.save(admin);
        return true;
    }

    public boolean delAdmin(Admin admin) {
        hibernateTemplate.delete(admin);
        return true;
    }

    public Admin getAdmin(String username) {
        String hql = "from Admin as a where a.username=:username";
        Query query = this.getSession().createQuery(hql);
        query.setString("username", username);
        return (Admin) query.uniqueResult();
    }

    public List getAllAdmin() {
        String hql = "from Admin";
        Query query = this.getSession().createQuery(hql);
        return query.list();
    }


    public boolean modifyAdmin(Admin admin) {
        hibernateTemplate.merge(admin);
        return true;
    }
}
