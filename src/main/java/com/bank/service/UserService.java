package com.bank.service;


import com.bank.domain.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/8.
 */
public interface UserService {

    /**
     * 添加账户
     *
     * @param accuser * @return
     */
    public boolean addUser(User user);

    /**
     * 删除账户
     */
    public boolean delUser(int id);

    /**
     * 修改账户
     *
     * @param user
     * @return
     */
    public abstract boolean modifyUser(User user);


    /**
     * 查询账户
     */
    public User searchUsers(final User user);

    /**
     * 根据账户id获取账户对象
     *
     * @param userid
     * @return
     */
    @Transactional(readOnly = true)
    public abstract User getUser(int userid);

    //根据账户名称获取账户
    public abstract User getUser(String username);

    public List getAllUsers();

    /**
     * 启用账户
     */
    public void enabled(int id);

    /**
     * 冻结账户
     */
    public void locking(int id);

    //根据名称获取账户状态对象
    public Status getStatus(String name);

    public Status getStatus(int id);


    public abstract void reflush(User user);
    public List getLogs(User user, int page);
    //开户
    public boolean logForAddUser(TransactionLog log,String username);

    //转账
    public boolean transfer(TransactionLog log);

    //存款
    public boolean deposit(TransactionLog log);

    //取款
    public boolean withdrawal(TransactionLog log);

    //获得账户的交易记录总数,用来初始化分页类Pager对象,并设置其perPageRows和rowCount属性
    public Pager getPagerOfLogs(User user);

    public boolean modifyPersoninfo(Personinfo personinfo);

    //添加个人信息
    public boolean add(Personinfo personinfo);

    //获取全部个人信息
    public List getAllPersoninfo();

    //根据条件查询个人信息
    public List searchPersoninfo(Personinfo personinfo);

    //根据账户状态获取个人信息
    public List searchPersoninfo(Status status);

    public List getAllDaikuanlilv();

    public List getAllCunkuanlilv();

}
