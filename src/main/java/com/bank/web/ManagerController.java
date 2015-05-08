package com.bank.web;

import com.bank.domain.Cunkuanlilv;
import com.bank.domain.Daikuanlilv;
import com.bank.domain.Manager;
import com.bank.domain.Teller;
import com.bank.service.ManagerService;
import com.bank.service.TellerService;
import com.bank.service.UserService;
import com.sun.org.apache.xpath.internal.SourceTree;
import jdk.nashorn.internal.ir.ReturnNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.lang.model.element.NestingKind;
import java.security.MessageDigest;
import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Controller("managerController")
public class ManagerController {
    @RequestMapping("list_Tellers.do")
    public String list_Tellers(Model modelMap) {
        List<Teller> tellers = tellerService.getAllTeller();
        //System.out.println(tellers.size());
        modelMap.addAttribute("tellers", tellers);
        modelMap.addAttribute("message", "list_tellers_show");
        return "ManagerIndex";
    }
    //delteller.do?tellerid=${teller.id}">

    @RequestMapping("delteller.do")
    public String delteller(Integer tellerid, ModelMap modelMap) {
        Teller teller = tellerService.getTeller(tellerid);
        tellerService.delTeller(teller);
        modelMap.addAttribute("message", "删除成功！");
        return "ManagerIndex";
    }

    @RequestMapping("addTeller.do")
    public String addTeller(Teller teller, ModelMap modelMap) {
        tellerService.addTeller(teller);
        modelMap.addAttribute("message", "增加成功！");
        return "ManagerIndex";
    }

    @RequestMapping("addDaikuanlilv.do")
    public String addDaikuanlilv(Daikuanlilv daikuanlilv, ModelMap modelMap) {
        managerService.addDai(daikuanlilv);
        modelMap.addAttribute("message", "增加成功！");
        return "ManagerIndex";
    }

    @RequestMapping("delDai.do")
    public String delDai(Integer daiid, ModelMap modelMap) {
        managerService.delDai(managerService.getDai(daiid));
        modelMap.addAttribute("message", "删除成功！");
        return "ManagerIndex";

    }

    @RequestMapping("toModifyDai.do")
    public String modifyDai(Integer daiid, ModelMap modelMap) {
        System.out.println("daiid" + daiid);
        if (daiid != null) {
            Daikuanlilv daikuanlilv = managerService.getDai(daiid);
            modelMap.addAttribute("modifingDaikuanlilv", daikuanlilv);
            System.out.println("daiid不为0，此时daikuanlilv" + daikuanlilv);
        } else {
            Daikuanlilv daikuanlilv = new Daikuanlilv();
            modelMap.addAttribute("modifingDaikuanlilv", daikuanlilv);
            System.out.println("daiid为0，此时daikuanlilv" + daikuanlilv.toString());
        }

        modelMap.addAttribute("message", "modifing_daikuanlilv_show");

        return "ManagerIndex";

    }

    @RequestMapping("toModifyCun.do")
    public String modifyCun(Integer cunid, ModelMap modelMap) {
        if (cunid != null) {
            Cunkuanlilv cunkuanlilv = managerService.getCun(cunid);
            modelMap.addAttribute("modifingCunkuanlilv", cunkuanlilv);
        } else {
            Cunkuanlilv cunkuanlilv = new Cunkuanlilv();
            modelMap.addAttribute("modifingCunkuanlilv", cunkuanlilv);
        }

        modelMap.addAttribute("message", "modifing_cunkuanlilv_show");

        return "ManagerIndex";

    }

    @RequestMapping("addCunkuanlilv.do")
    public String addCunkuanlilv(Cunkuanlilv cunkuanlilv, ModelMap modelMap) {
        managerService.addCun(cunkuanlilv);

        modelMap.addAttribute("message", "增加成功！");
        return "ManagerIndex";
    }

    @RequestMapping("list_daikuanlilv_ByManager.do")
    public String list_dailuanlilv_ByManager(ModelMap modelMap) {
        List<Daikuanlilv> daikuanlilvs = userService.getAllDaikuanlilv();
        modelMap.addAttribute("daikuanlilvs", daikuanlilvs);
        modelMap.addAttribute("message", "list_daikuanlilv_show");
        return "ManagerIndex";
    }

    @RequestMapping("list_cunkuanlilv_ByManager.do")
    public String list_cunluanlilv_ByManager(ModelMap modelMap) {
        List<Cunkuanlilv> cunkuanlilvs = userService.getAllCunkuanlilv();
        modelMap.addAttribute("cunkuanlilvs", cunkuanlilvs);
        modelMap.addAttribute("message", "list_cunkuanlilv_show");
        return "ManagerIndex";
    }

    @Autowired
    UserService userService;
    @Autowired
    TellerService tellerService;
    @Autowired
    ManagerService managerService;
}
