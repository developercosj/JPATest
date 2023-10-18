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
@Table(name = "history")
public class History {

    @Id
    int historyIdx;
    int postingIdx;
    String userId;
    String regDate;
    String companyId;
    String companyName;
    String country;
    String city;
    String position;
    int prizeMoney;
    String contents;
    String skill;


    public History() {

    }
}
