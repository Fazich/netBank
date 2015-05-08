package com.bank.repository;

import com.bank.domain.Cunkuanlilv;
import com.bank.domain.Daikuanlilv;
import com.bank.domain.Manager;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
public interface ManagerDao {
    public boolean addManager(Manager manager);

    public boolean delManager(Manager manager);

    public Manager getManager(String username);

    public Manager getManager(int id);

    public List getAllManager();


    public boolean modifyManager(Manager manager);
    public Cunkuanlilv getCun(int id);

    public boolean addCun(Cunkuanlilv cunkuanlilv);

    public boolean delCun(Cunkuanlilv cunkuanlilv);

    public boolean modifyCun(Cunkuanlilv cunkuanlilv);

    public boolean addDai(Daikuanlilv daikuanlilv);

    public boolean delDai(Daikuanlilv daikuanlilv);
    public Daikuanlilv getDai(int id);

    public boolean modifyDai(Daikuanlilv daikuanlilv);

//    public List getAllDai();

}
