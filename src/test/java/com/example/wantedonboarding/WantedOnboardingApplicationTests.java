package com.example.wantedonboarding;

import com.example.wantedonboarding.interfaceFile.RepoCompany;
import com.example.wantedonboarding.interfaceFile.RepoHistory;
import com.example.wantedonboarding.interfaceFile.RepoPosting;
import com.example.wantedonboarding.interfaceFile.RepoUser;
import com.example.wantedonboarding.model.Company;
import com.example.wantedonboarding.model.History;
import com.example.wantedonboarding.model.Posting;
import com.example.wantedonboarding.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
class WantedOnboardingApplicationTests {

    @Autowired
    RepoPosting repoPosting;
    @Autowired
    RepoCompany repoCompany;
    @Autowired
    RepoHistory repoHistory;
    @Autowired
    RepoUser repoUser;


    // 데이터 등록 테스트
    //@BeforeEach
    @Test
    void insertTestData() {
        Posting posting = new Posting();
        //posting.setPostingIdx(1);
        posting.setCompanyName("테스트회사이름1");
        posting.setCity("테스트시트1");
        repoPosting.save(posting);

        posting = new Posting();
        posting.setCompanyName("테스트회사이름2");
        repoPosting.save(posting);

        posting = new Posting();
        posting.setCompanyName("테스트회사이름3");
        repoPosting.save(posting);

        posting = new Posting();
        posting.setCompanyName("테스트회사이름4");
        repoPosting.save(posting);

        posting = new Posting();
        posting.setCompanyName("테스트회사이름5");
        repoPosting.save(posting);

    }


    // 회사 생성 테스트
    @Test
    void insertCompanyDate() {
        Company company = new Company();
        company.setCompanyId("wanted1");
        company.setCompanyName("원티드1");
        repoCompany.save(company);
    }

    // 유저 생성 테스트
    @Test
    void insertUserDate() {
        User user = new User();
        user.setUserId("intern1");
        user.setUserName("인턴1");
        repoUser.save(user);
    }


    // jpa or + like 테스트
    @Test
    void contextLoads() {

        System.out.println(repoPosting.findByCompanyNameContainsOrCountryContainsOrCityContainsOrPositionContainsOrContentsContainsOrSkillContains(
                "국", "국", "국", "국", "국", "국"
        ));

    }





}
