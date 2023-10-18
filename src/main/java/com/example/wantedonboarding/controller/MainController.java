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


}
