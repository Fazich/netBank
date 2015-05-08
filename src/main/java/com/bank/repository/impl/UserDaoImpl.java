package com.bank.repository.impl;

import com.bank.domain.*;
import com.bank.repository.UserDao;
import org.hibernate.*;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/8.
 */

@Repository("userDao")
public class UserDaoImpl implements UserDao {
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


    public boolean addUser(User user) {
        hibernateTemplate.save(user);
        return true;
    }

    public User getUser(int userid) {
        return hibernateTemplate.load(User.class, userid);
    }

    public User getUser(String username) {
        String hql = "from User as a where a.username=:username";
//        Session session = this.getSessionFactory().getCurrentSession();
//        Query query = session.createQuery(hql);
        Query query = this.getSession().createQuery(hql);
        query.setString("username", username);
        return (User) query.uniqueResult();
        //return  hibernateTemplate.getByNamedQuery("from User a where a.username=?",username);
    }

    public List getAllAcconts() {
        String hql = "from User ";
        Session session = this.getSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

    public User searchUsers(final User user) {
        Session session = this.getSession();
        Criteria c = session.createCriteria(User.class);
        if (user.getUsername() != null && !"".equals(user.getUsername())) {
            c.add(Restrictions.like("username", user.getUsername(), MatchMode.ANYWHERE));
        }
        c.addOrder(Order.asc("userid"));
        return (User) c.list();
    }

    public boolean updateUser(User user) {

        hibernateTemplate.merge(user);
        return true;
    }

    public boolean delUser(User user) {
        hibernateTemplate.delete(user);
        return true;
    }

    public void reflush(User user) {
        hibernateTemplate.refresh(user);
    }

    public Status getStatus(String name) {
        String hql = "from Status as s where s.name=:name";
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        query.setString("name", name);
        return (Status) query.uniqueResult();
    }

    public Status getStatus(int id) {
        return hibernateTemplate.get(Status.class, id);
    }

    //    public List<User> findAll(List<User> list) {
//        return hibernateTemplate.loadAll(User.class);
//    }
//
//    public void save(Object... entities) {
//        for (Object entity : entities) {
//            hibernateTemplate.save(entity);
//        }
//    }
//
//    public void saveOrUpdate(Object entity) {
//        hibernateTemplate.saveOrUpdate(entity);
//    }
//
//    public void update(Object... entities) {
//        for (Object entity : entities) {
//            hibernateTemplate.update(entity);
//        }
//    }
//
//    public void delete(Object... entities) {
//        for (Object entity : entities) {
//            if (entity != null) {
//                hibernateTemplate.delete(entity);
//            }
//        }
//    }
//
//    public void deleteById(Integer id) {
//        if (id == null) {
//            return;
//        }
//        Object entity = findById(id);
//        if (entity == null) {
//            return;
//        }
//        delete(entity);
//    }
//
//    public void refresh(Object... entities) {
//        for (Object entity : entities) {
//            hibernateTemplate.refresh(entity);
//        }
//    }
//
//    public void flush() {
//        hibernateTemplate.flush();
//    }
    public boolean add(Personinfo personinfo) {
        hibernateTemplate.save(personinfo);
        return true;
    }

    public void modifyPersoninfo(Personinfo personinfo) {
        hibernateTemplate.update(personinfo);

    }

    public List getAllPersoninfo() {
        String hql = "from Personinfo ";
        //Session session=getSession();
        Query query = getSession().createQuery(hql);
        return query.list();
    }

    public List searchPersoninfo(final Personinfo personinfo) {
        Criteria criteria = getSession().createCriteria(Personinfo.class);
        if (personinfo.getRealname() != null && !personinfo.getRealname().equals("")) {
            if (personinfo.getCardid() == null) {
                criteria.add(Restrictions.eq("realname", personinfo.getRealname()));
            } else {
                criteria.add(Restrictions.or(Restrictions.eq("realname", personinfo.getRealname()), Restrictions.eq("cardid", personinfo.getCardid())));
            }
        }
//        System.out.println("dao:"+personinfo);
//        System.out.println("dao:,size:"+criteria.list().size());
        criteria.addOrder(Order.asc("id"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//        System.out.println("dao:,size2:"+criteria.list().size());
        return criteria.list();
    }

    //    public List searchPersoninfo(final Personinfo personinfo) {
//        DetachedCriteria criteria = DetachedCriteria.forClass(Clazz, "c");
//
//    }
    public List searchPersoninfo(Status status) {
        String hql = "from Personinfo p where p.user.status.id=" + status.getId();
        Query query = this.getSession().createQuery(hql);
        return query.list();
    }

    /**
     * 向数据表transaction_log中添加记录
     */
    public boolean addLog(TransactionLog log) {
        hibernateTemplate.save(log);
        return true;
    }

    /**
     * 获取交易记录
     */
    public List getLogs(final User user, final int page) {
        Session session = this.getSession();
        Criteria c = session.createCriteria(TransactionLog.class);
        c.add(Restrictions.or(Restrictions.eq("user", user), Restrictions.eq("otherid", user.getUserid())));
//        c.add(Restrictions.or(Restrictions.eq("user", user)));
        c.addOrder(Order.desc("id"));
        c.setFirstResult(10 * (page - 1));
        c.setMaxResults(10);
        return c.list();
//        return hibernateTemplate.executeFind(new HibernateCallback() {
//            public Object doInHibernate(Session session) throws HibernateException,
//                    SQLException {
//                Criteria c = session.createCriteria(TransactionLog.class);
//                c.add(Restrictions.or(Restrictions.eq("user", user), Restrictions.eq("otherid", user.getUserid())));
//                c.addOrder(Order.desc("id"));
//                c.setFirstResult(10 * (page - 1));
//                c.setMaxResults(10);
//                return c.list();
//            }
//        });
    }

    /**
     * 根据交易类型名称获取交易类型对象
     */
    public TransactionType getTransactionType(String name) {
        String hql = "from TransactionType t where t.name=:name";
        Query query = this.getSession().createQuery(hql);
        query.setString("name", name);
        return (TransactionType) query.uniqueResult();
    }

    /**
     * 从数据表Transaction_Log中获取与账户相关的交易记录数
     */
    public Integer getCountOfLogs(User user) {
        String sql = "select count(*) from Transaction_Log where (userid="
                + user.getUserid() + " or otherid=" + user.getUserid() + ")";
        Query query = this.getSession().createSQLQuery(sql);
        Integer count = Integer.parseInt(query.uniqueResult().toString());
        return count;
    }

    public List getAllCunkuanlilv() {
        String hql = "from Cunkuanlilv order by id desc";
        Query query = this.getSession().createQuery(hql);
        return query.list();
    }

    public List getAllDaikuanlilv() {
        String hql = "from Daikuanlilv order by id desc";
        Query query = this.getSession().createQuery(hql);
        return query.list();
    }
}