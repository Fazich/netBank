package com.bank.service;

import com.bank.domain.Teller;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
public interface TellerService {
    public boolean addTeller(Teller teller);

    public boolean delTeller(Teller teller);

    public Teller getTeller(String username);

    public Teller getTeller(int id);
    public List getAllTeller();

    public boolean modifyTeller(Teller teller);

}
