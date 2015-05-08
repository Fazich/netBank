package com.bank.repository.impl;

import com.bank.domain.Teller;
import com.bank.repository.TellerDao;
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
@Repository("tellerDao")
public class TellerDaoImpl implements TellerDao {
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

    public boolean addTeller(Teller teller) {

        hibernateTemplate.save(teller);
        return true;
    }

    public boolean delTeller(Teller teller) {

        hibernateTemplate.delete(teller);
        return true;
    }

    public Teller getTeller(String username) {
        String hql = "from Teller as a where a.username=:username";
        Query query = this.getSession().createQuery(hql);
        query.setString("username", username);
        return (Teller) query.uniqueResult();
    }

    public Teller getTeller(int id) {
        return hibernateTemplate.load(Teller.class, id);
    }

    public List getAllTeller() {
        String hql = "from Teller ";
        Query query = getSession().createQuery(hql);
        return query.list();
    }

    public boolean modifyTeller(Teller teller) {
        hibernateTemplate.update(teller);
        return true;
    }
}
