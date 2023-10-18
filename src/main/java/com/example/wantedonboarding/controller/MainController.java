package com.example.wantedonboarding.controller;

import com.example.wantedonboarding.interfaceFile.RepoCompany;
import com.example.wantedonboarding.interfaceFile.RepoHistory;
import com.example.wantedonboarding.interfaceFile.RepoPosting;
import com.example.wantedonboarding.interfaceFile.RepoUser;
import com.example.wantedonboarding.model.History;
import com.example.wantedonboarding.model.Posting;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class MainController {

    @Autowired
    RepoPosting repoPosting;
    @Autowired
    RepoCompany repoCompany;
    @Autowired
    RepoHistory repoHistory;
    @Autowired
    RepoUser repoUser;

    // 메인 화면 이동
    @GetMapping("main")
    public static String  main () {
        System.out.println("main controller");
        return "main";
    }

    //채용공고 목록 확인
    @ResponseBody
    @RequestMapping(value = "/postingList")
    public List postingList() {
        List<Posting> userList = repoPosting.findAll();
        System.out.println("userList" + userList);
        return userList;
    }

    //회사가 채용공고 등록
    @ResponseBody
    @RequestMapping(value = "/insertPosting", method = RequestMethod.POST)
    public String insertJobPosting(@RequestBody Map<String, Object> map) {
    System.out.println("insertJobPosting");

    Posting posting = new Posting();
        posting.setCompanyId(map.get("companyId").toString());
        posting.setCompanyName(map.get("companyName").toString());
        posting.setCountry(map.get("country").toString());
        posting.setCity(map.get("city").toString());
        posting.setPosition(map.get("position").toString());
        if (map.get("money") != null) {
            posting.setPrizeMoney(Integer.parseInt(map.get("money").toString()));
        } else {
            posting.setPrizeMoney(0);
        }

        posting.setContents(map.get("contents").toString());
        posting.setSkill(map.get("skill").toString());
        repoPosting.save(posting);

        return "";
    }

}
