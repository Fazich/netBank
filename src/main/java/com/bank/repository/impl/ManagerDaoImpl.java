package com.bank.repository.impl;

import com.bank.domain.Cunkuanlilv;
import com.bank.domain.Daikuanlilv;
import com.bank.domain.Manager;
import com.bank.repository.ManagerDao;
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
@Repository("managerDao")
public class ManagerDaoImpl implements ManagerDao {
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

    public boolean addManager(Manager manager) {
        hibernateTemplate.save(manager);
        return true;
    }

    public Manager getManager(int id) {
        return hibernateTemplate.load(Manager.class, id);
    }

    public boolean delManager(Manager manager) {
        hibernateTemplate.delete(manager);
        return true;
    }

    public Manager getManager(String username) {
        String hql = "from Manager as m where m.username=:username";
        Query query = this.getSession().createQuery(hql);
        query.setString("username", username);
        return (Manager) query.uniqueResult();
    }

    public List getAllManager() {
        String hql = "from Manager";
        Query query = this.getSession().createQuery(hql);
        return query.list();
    }


    public boolean modifyManager(Manager manager) {
        hibernateTemplate.merge(manager);
        return true;
    }

    public Cunkuanlilv getCun(int id) {
       return hibernateTemplate.load(Cunkuanlilv.class, id);

    }

    public boolean addDai(Daikuanlilv daikuanlilv) {
        hibernateTemplate.saveOrUpdate(daikuanlilv);
        return true;
    }

    public boolean delDai(Daikuanlilv daikuanlilv) {
        hibernateTemplate.delete(daikuanlilv);
        return true;
    }

    public Daikuanlilv getDai(int id) {
        return  hibernateTemplate.load(Daikuanlilv.class, id);

    }

    public boolean addCun(Cunkuanlilv cunkuanlilv) {
        hibernateTemplate.saveOrUpdate(cunkuanlilv);
        return true;
    }

    public boolean delCun(Cunkuanlilv cunkuanlilv) {
        hibernateTemplate.delete(cunkuanlilv);
        return true;
    }

    public boolean modifyCun(Cunkuanlilv cunkuanlilv) {
        hibernateTemplate.update(cunkuanlilv);
        return true;
    }

    public boolean modifyDai(Daikuanlilv daikuanlilv) {
        hibernateTemplate.update(daikuanlilv);
        return true;
    }

//    public List getAllDai() {
//        String hql = "from Daikuanlilv order by id desc ";
//        Query query = getSession().createQuery(hql);
//        return query.list();
//    }
}
