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

    // 채용 공고 상세보기
    @ResponseBody
    @RequestMapping(value="/detailPosting", method = RequestMethod.POST)
    public Map<String, Object>  detailPosting(@RequestBody Map<String, Object> map) {
        System.out.println("detailPosting controller");
        Long postingNum = Long.valueOf(map.get("postingNumber").toString());
        String companyId = map.get("companyId").toString();
        // 상세포스팅 리스트
        Optional<Posting> postingList = repoPosting.findById(postingNum);

        // 회사가 낸 다른 추가 공고문
        List<Posting> postingLists = repoPosting.findByCompanyId(companyId);
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("postingList", postingList);
        responseMap.put("postingLists", postingLists);



        System.out.println("postingList" + postingList);
        return responseMap;
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

    // 수정할 채용공고 리스트 가져가기
    @ResponseBody
    @RequestMapping(value = "/editPostingButton", method = RequestMethod.POST)
    public Optional<Posting> editPostingButton(@RequestBody Map<String, Object> map) {
        Long postingNum = Long.valueOf(map.get("postingNumber").toString());
        Optional<Posting> userList = repoPosting.findById(postingNum);
        System.out.println("userList" + userList);
        return userList;
    }

    // 회사가 채용공고 수정
    @ResponseBody
    @RequestMapping(value = "/editPosting", method = RequestMethod.POST)
    public String editPosting(@RequestBody Map<String, Object> map) {
        System.out.println("editPosting");
        System.out.println(map);

        // 데이터 변수에 정렬
        String companyId = map.get("companyId") != null ? String.valueOf(map.get("companyId"))  : "";
        int postingIdx = 0;
        if (map.get("postingIdx").toString() != null && map.get("postingIdx").toString() != "") {
            postingIdx = Integer.parseInt(map.get("postingIdx").toString());
        }
        String companyName = map.get("companyName") != null ? String.valueOf(map.get("companyName"))  : "";
        String country = map.get("country") != null ? String.valueOf(map.get("country")) : "";
        String city = map.get("city") != null ? String.valueOf(map.get("city")) : "";
        String position = map.get("position") != null ? String.valueOf(map.get("position")) : "";
        int prizeMoney = 0;
        if (map.get("prizeMoney").toString() != null && map.get("prizeMoney").toString() != "") {
            prizeMoney = Integer.parseInt(map.get("prizeMoney").toString());
        }
        String contents = map.get("contents") != null ? String.valueOf(map.get("contents")) : "";
        String skill = map.get("skill") != null ? String.valueOf(map.get("skill")) : "";


        // 데이터 검증 후 update
        if (repoPosting.findById(Long.valueOf(map.get("postingIdx").toString())).isEmpty()) {
            // 데이터가 없을때

        } else {
            // DB에 데이터가 있을때 업데이트 하기
            repoPosting.save(Posting.builder().postingIdx(postingIdx).companyId(String.valueOf(companyId)).companyName(companyName).country(country).city(city).position(position).prizeMoney(prizeMoney).contents(contents).skill(skill).build());
        }
        return "";
    }

    //회사가 채용공고 삭제
    @ResponseBody
    @RequestMapping(value = "/deletePosting", method = RequestMethod.POST)
    public Map<String, Object> deletePosting(@RequestBody Map<String, Object> map) {
        System.out.println("deletePosting");
        System.out.println(map);
        Long postingNumber = Long.valueOf(map.get("postingNumber").toString());

        repoPosting.deleteById(postingNumber);
       return map;
    }

    //사용자가 채용 공고에 지원 (1회만 지원 가능)
    @ResponseBody
    @RequestMapping(value = "/applyPosting", method = RequestMethod.POST)
    public Map<String, Object> applyJobPosting(@RequestBody Map<String, Object> map) {

        // 1회 지원한지 확인
        int postingNumber = Integer.parseInt(map.get("postingNumber").toString());
        String userId = String.valueOf(map.get("userId"));
        Long postingNumberL = Long.valueOf(map.get("postingNumber").toString());
        System.out.println(repoHistory.findByUserIdAndPostingIdx(userId, postingNumber));
        if (repoHistory.findByUserIdAndPostingIdx(userId, postingNumber).size() > 0){
            map.put("response", "이미 지원하셨습니다.");
            return map;
        } else {
        // 처음 지원시 지원사항 history 테이블에 기록
            if (repoPosting.findById(postingNumberL) != null) {
                List<Posting> posting = repoPosting.findById(postingNumberL).stream().toList();
                String companyId = posting.get(0).getCompanyId();
                String companyName = posting.get(0).getCompanyName();
                String country = posting.get(0).getCountry();
                String city = posting.get(0).getCity();
                String position = posting.get(0).getPosition();
                int prizeMoney = posting.get(0).getPrizeMoney();
                String contents = posting.get(0).getContents();
                String skill = posting.get(0).getSkill();
                repoHistory.save(History.builder().userId(userId).postingIdx(postingNumber).companyId(companyId).companyName(companyName).country(country).city(city).position(position).prizeMoney(prizeMoney).
                        contents(contents).skill(skill).build());
            }
            map.put("response", "정상적으로 지원되셨습니다.");
        }

        return map;
    }





}
