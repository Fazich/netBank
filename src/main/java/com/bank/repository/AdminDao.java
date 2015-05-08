package com.bank.repository;

import com.bank.domain.Admin;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
public interface AdminDao {


    public boolean addAdmin(Admin admin);

    public boolean delAdmin(Admin admin);

    public Admin getAdmin(String username);

    public List getAllAdmin();

    public boolean modifyAdmin(Admin admin);
}
