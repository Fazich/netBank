package com.bank.service.impl;

import com.bank.domain.Cunkuanlilv;
import com.bank.domain.Daikuanlilv;
import com.bank.domain.Manager;
import com.bank.repository.ManagerDao;
import com.bank.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Service("managerService")
@Transactional

public class ManagerServiceImpl implements ManagerService {
    public boolean addManager(Manager manager) {
        return managerDao.addManager(manager);
    }

    public boolean delManager(Manager manager) {
        return managerDao.delManager(manager);
    }

    public Manager getManager(String username) {
        return managerDao.getManager(username);
    }

    public Manager getManager(int id) {
        return managerDao.getManager(id);
    }

    public Cunkuanlilv getCun(int id) {
        return managerDao.getCun(id);
    }

    public List getAllManager() {
        return managerDao.getAllManager();
    }

    public boolean addCun(Cunkuanlilv cunkuanlilv) {
        return managerDao.addCun(cunkuanlilv);
    }

    public boolean delCun(Cunkuanlilv cunkuanlilv) {
        return managerDao.delCun(cunkuanlilv);
    }

    public boolean modifyCun(Cunkuanlilv cunkuanlilv) {
        return managerDao.modifyCun(cunkuanlilv);
    }

    public boolean modifyManager(Manager manager) {
        return managerDao.modifyManager(manager);
    }

    public boolean addDai(Daikuanlilv daikuanlilv) {
        return managerDao.addDai(daikuanlilv);
    }

    public Daikuanlilv getDai(int id) {
        return managerDao.getDai(id);
    }

    public boolean delDai(Daikuanlilv daikuanlilv) {
        return managerDao.delDai(daikuanlilv);
    }

    public boolean modifyDai(Daikuanlilv daikuanlilv) {
        return managerDao.modifyDai(daikuanlilv);
    }

//    public List getAllDai() {
//        return managerDao.getAllDai();
//    }

    @Autowired
    ManagerDao managerDao;
}
