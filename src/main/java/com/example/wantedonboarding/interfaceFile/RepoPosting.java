package com.example.wantedonboarding.interfaceFile;

import com.example.wantedonboarding.model.Posting;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RepoPosting extends JpaRepository<Posting, Long> {


}
