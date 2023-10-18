package com.example.wantedonboarding.interfaceFile;

import com.example.wantedonboarding.model.Company;
import com.example.wantedonboarding.model.Posting;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RepoCompany  extends JpaRepository<Company, Long> {
}
