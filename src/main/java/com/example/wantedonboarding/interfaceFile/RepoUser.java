package com.example.wantedonboarding.interfaceFile;

import com.example.wantedonboarding.model.History;
import com.example.wantedonboarding.model.Posting;
import com.example.wantedonboarding.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RepoUser  extends JpaRepository<User, Long> {


}
