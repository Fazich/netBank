package com.bank.repository;

import com.bank.domain.*;


import java.io.Serializable;
import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/8.
 */
public interface UserDao {

    //根据账户id获取账户对象
    public User getUser(int userid); //根据客户名获取客户对象

    public User getUser(String username);

    public List getAllAcconts();

    public User searchUsers(final User user);

    //修改账户
    public boolean updateUser(User user);

    //添加账户
    public boolean addUser(User user);

    //删除账户
    public boolean delUser(User user);


    public void reflush(User user);

    //根据账户状态名称获取账户状态对象
    public Status getStatus(String name);

    public Status getStatus(int id);


    //修改个人信息
    public void modifyPersoninfo(Personinfo personinfo);

    //获取全部用户信息
    public List getAllPersoninfo();

    //添加个人信息
    public boolean add(Personinfo personinfo);

    //根据条件查询个人信息
    public List searchPersoninfo(Personinfo personinfo);

    //根据账户状态获取用户信息
    public List searchPersoninfo(Status status);


    //向数据表transaction_log中添加记录
    public boolean addLog(TransactionLog log);

    //获取交易记录
    public List getLogs(final User user, int page);

    //根据交易类型名称获取交易类型对象
    public TransactionType getTransactionType(String name);

    //获取交易记录数
    public Integer getCountOfLogs(User user);

    public List getAllDaikuanlilv();

    public List getAllCunkuanlilv();


}
