package com.bank.service.impl;

import com.bank.domain.*;

import com.bank.repository.UserDao;
import com.bank.service.UserService;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/8.
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;


//    //    //根据账户ID获取账户
//    @Transactional(readOnly = true)
//    public User getUserbyid(int userid) {
//        return userDao.findById(userid);
//
//    }
//
//    //根据username获取账户
//    public User getUser(String username) {
//        return userDao.getUser(username);
//    }
//
//
//    UserDao userDao;


    public boolean addUser(User user) {

        Status status = userDao.getStatus("启用");
        user.setStatus(status);
        return userDao.addUser(user);
    }

    public boolean delUser(int id) {
        User user = userDao.getUser(id);
        return userDao.delUser(user);
    }

    public boolean modifyUser(User user) {
        return userDao.updateUser(user);
    }

    public User searchUsers(User user) {
        return userDao.searchUsers(user);
    }

    public User getUser(int userid) {
        return userDao.getUser(userid);

    }

    public User getUser(String username) {
        return userDao.getUser(username);
    }

    public List getAllUsers() {
        return userDao.getAllAcconts();
    }

    public void enabled(int id) {
        User user = userDao.getUser(id);
        Status status = userDao.getStatus("启用");
        user.setStatus(status);
        userDao.updateUser(user);

    }

    public void locking(int id) {
        User user = userDao.getUser(id);
        Status status = userDao.getStatus("冻结");
        user.setStatus(status);
        userDao.updateUser(user);

    }

    public Status getStatus(String name) {
        return userDao.getStatus(name);
    }

    public Status getStatus(int id) {
        return userDao.getStatus(id);
    }


//    public Teller getTeller(String username) {
//        return userDao.getTeller(username);
//    }
//
//    public Manager getManager(String username) {
//        return userDao.getManager(username);
//    }
//
//    public boolean delManager(Manager manager) {
//        return userDao.delManager(manager);
//    }
//
//    public Admin getAdmin(String username) {
//        return userDao.getAdmin(username);
//    }
//
//    public boolean delAdmin(Admin admin) {
//        return userDao.delAdmin(admin);
//    }

    public void reflush(User user) {
        userDao.reflush(user);

    }

    public boolean deposit(TransactionLog log) {
        //  从交易信息对象log中取出账户对象
        User self = log.getUser();
        //将账户余额与存款金额相加
        self.setBalance(log.getUser().getBalance() + log.getTrMoney());
        //更新账户表User，修改账户余额
        userDao.updateUser(self);
        //根据交易类型获取交易类型对象
        TransactionType type = userDao.getTransactionType("存款");
        log.setTransactionType(type);
        log.setOtherid(self.getUserid());
        //向数据表transaction_log中添加交易记录
        return userDao.addLog(log);
    }

    public List getLogs(User user, int page) {
        return userDao.getLogs(user, page);
    }

    public boolean logForAddUser(TransactionLog log, String username) {
        User self = this.getUser(username);
        log.setUser(self);
//        User self = log.getUser();
        TransactionType type = userDao.getTransactionType("开户");
        return userDao.addLog(log);
    }

    public boolean transfer(TransactionLog log) {
        //获取入账方账户对象
        User other = userDao.getUser(log.getOtherid());
        //获取转账方账户对象
        User self = log.getUser();
        if (other != null && !other.getStatus().getName().equals("冻结")) {
            if ((log.getUser().getBalance() - log.getTrMoney()) >= 0) {
                //修改转账方账户余额
                self.setBalance(log.getUser().getBalance() - log.getTrMoney());
                //修改入账方账户余额
                other.setBalance(other.getBalance() + log.getTrMoney());
                //将转账方账户余额更新到数据表User
                userDao.updateUser(self);
                //将入账方账户余额更新到数据表User
                userDao.updateUser(other);
                //根据交易类型获取交易类型对象
                TransactionType type = userDao.getTransactionType("转出");
                log.setTransactionType(type);
                //向数据表transaction_log中添加交易记录
//               return  userDao.addLog(log);
                if (userDao.addLog(log)) {
                    return transfer_back(log);
                } else return false;


            }
        }

        return false;
    }

    public boolean transfer_back(TransactionLog log) {
        User other = userDao.getUser(log.getOtherid());
        //获取转账方账户对象
        User self = log.getUser();
        TransactionLog log2 = new TransactionLog();
        log2.setOtherName(self.getUsername());
        log2.setOtherid(self.getUserid());
        log2.setUser(other);
        log2.setTrMoney(log.getTrMoney());
        log2.setDatetime(log.getDatetime());
        log2.setTransactionType(userDao.getTransactionType("转入"));
        return userDao.addLog(log2);

    }

    public boolean withdrawal(TransactionLog log) {
        //从交易信息对象log中取出账户对象
        User self = log.getUser();
        if ((log.getUser().getBalance() - log.getTrMoney() >= 0)) {
            //将账户余额与取款金额相减
            self.setBalance(log.getUser().getBalance() - log.getTrMoney());
            //更新账户表User，修改账户余额
            userDao.updateUser(self);
            //根据交易类型获取交易类型对象
            TransactionType type = userDao.getTransactionType("取款");
            log.setTransactionType(type);
            log.setOtherid(self.getUserid());
            //向数据表transaction_log中添加交易记录
            return userDao.addLog(log);
        }
        return false;
    }

    public void transfer_other_log(TransactionLog log) {


    }

    public Pager getPagerOfLogs(User user) {
        //从数据表Transaction_Log中获取与账户相关的交易记录数
        int count = userDao.getCountOfLogs(user);
        //使用分页类Pager定义对象
        Pager pager = new Pager();
        //设置pager对象中的perPageRows属性，表示每页显示的记录数
        pager.setPerPageRows(10);
        //设置pager对象中的rowCount属性，表示记录总数
        pager.setRowCount(count);
        //返回pager对象
        return pager;
    }

    public boolean add(Personinfo personinfo) {
        userDao.add(personinfo);
        return true;
    }

    public boolean modifyPersoninfo(Personinfo personinfo) {
        userDao.modifyPersoninfo(personinfo);
        return true;
    }

    public List getAllPersoninfo() {
        return userDao.getAllPersoninfo();
    }

    public List searchPersoninfo(Personinfo personinfo) {
        return userDao.searchPersoninfo(personinfo);
    }

    public List searchPersoninfo(Status status) {
        if (status.getId() != 0) {
            return userDao.searchPersoninfo(userDao.getStatus(status.getId()));

        } else return userDao.getAllPersoninfo();
    }

    public List getAllCunkuanlilv() {
        return userDao.getAllCunkuanlilv();
    }

    public List getAllDaikuanlilv() {
        return userDao.getAllDaikuanlilv();
    }
}
