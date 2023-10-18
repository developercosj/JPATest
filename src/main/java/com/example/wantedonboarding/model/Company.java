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
@Table(name = "company")
public class Company {

    @Id
    String companyId;
    String companyName;

    public Company() {

    }

}
