package com.example.wantedonboarding.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Data
@ToString
@Builder
@AllArgsConstructor
@Table(name = "user")
public class User {

    @Id
    String userId;
    String userName;

    public User() {

    }
}
