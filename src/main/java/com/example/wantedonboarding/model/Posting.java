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
@Table(name = "posting")
public class Posting {

    @Id
    int postingIdx;
    String companyId;
    String companyName;
    String country;
    String city;
    String position;
    int prizeMoney;
    String contents;
    String skill;


    public Posting() {

    }
}
