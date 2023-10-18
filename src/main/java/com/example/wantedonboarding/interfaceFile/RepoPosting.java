package com.example.wantedonboarding.interfaceFile;

import com.example.wantedonboarding.model.Posting;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RepoPosting extends JpaRepository<Posting, Long> {

    public List<Posting> findByCompanyNameOrCountryOrCityOrPositionOrPrizeMoneyOrContentsOrSkill(String companyName, String country, String city, String position, int prizeMoney, String contents, String skill);

    public List<Posting> findByCompanyNameOrCountryOrCityOrPositionOrContentsOrSkill(String companyName, String country, String city, String position, String contents, String skill);

    public List<Posting> findByCompanyId(String companyId);

}
