package com.bank.service.impl;

import com.bank.domain.Admin;
import com.bank.repository.AdminDao;
import com.bank.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
    public boolean addAdmin(Admin admin) {
        return adminDao.addAdmin(admin);
    }

    public boolean delAdmin(Admin admin) {
        return adminDao.delAdmin(admin);
    }

    public Admin getAdmin(String username) {
        return adminDao.getAdmin(username);
    }

    public List getAllAdmin() {
        return adminDao.getAllAdmin();
    }

    public boolean modifyAdmin(Admin admin) {
        return adminDao.modifyAdmin(admin);
    }

    @Autowired
    AdminDao adminDao;
}
