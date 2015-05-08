package com.bank.service.impl;

import com.bank.domain.Teller;
import com.bank.repository.TellerDao;
import com.bank.service.TellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Service("tellerService")
@Transactional
public class TellerServiceImpl implements TellerService {
    public boolean addTeller(Teller teller) {
        return tellerDao.addTeller(teller);
    }

    public boolean delTeller(Teller teller) {
        return tellerDao.delTeller(teller);
    }

    public Teller getTeller(String username) {
        return tellerDao.getTeller(username);
    }

    public Teller getTeller(int id) {
        return tellerDao.getTeller(id);
    }

    public List getAllTeller() {
        return tellerDao.getAllTeller();
    }

    public boolean modifyTeller(Teller teller) {
        return tellerDao.modifyTeller(teller);
    }

    @Autowired
    TellerDao tellerDao;

}
