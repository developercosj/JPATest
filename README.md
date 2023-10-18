# wanted-pre-onboarding-backend
원티드 프리온보딩 10월 백엔드 인턴십 - 사전과제 

# 사용 기술
Java & Spring

ORM (jpa)

DBMS (mysql)

# 요구사항
1. 채용공고 등록 v
2. 채용공고 수정 v
3. 채용공고 삭제 v
4. 채용공고 목록 조회 v
5. 채용 상세 페이지 v
   
   채용공고 목록 조회와 다른 점은 채용내용필드가 있음
7. 채용공고 지원 v
   
   채용 공고 지원은 1번만 지원 가능

# 필요한 모델
  회사, 사용자, 채용공고, 지원내역 

# 기본 SQL 설정 

            1. company 테이블
            create table company (company_id VARCHAR(20) primary key, company_name VARCHAR(20));
            insert into company (company_id, company_name) values ("wanted", "원티드" );
            insert into company (company_id, company_name) values ('su', '수정컴' );

            2. posting 테이블
            create table posting (posting_idx integer primary key,company_id VARCHAR(20) , company_name VARCHAR(20), country VARCHAR(20), city VARCHAR(20), position VARCHAR(20), prizeMpney                   integer, contents VARCHAR(20), skill VARCHAR(20)); 
            ALTER TABLE Posting MODIFY posting_idx INT NOT NULL AUTO_INCREMENT;

            3. user 테이블
            create table user (user_id VARCHAR(20) primary key, user_name VARCHAR(20)); 

            4. history 테이블
            create table history (history_idx integer primary key ,  user_id VARCHAR(20), posting_idx integer reg_date Varchar(20),company_id VARCHAR(20), company_name VARCHAR(20), country                   VARCHAR(20), city VARCHAR(20), position VARCHAR(20), prizeMpney integer, contents VARCHAR(20), skill VARCHAR(20)); 
            ALTER TABLE history MODIFY history_idx INT NOT NULL AUTO_INCREMENT;
            ALTER TABLE history MODIFY reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
            
   
        
# 기타
  로그인등 사용자 인증절차 생략

  frontend 요소 제외

  회사, 사용자 등록 절차 생략
  
  공고문 : <https://bow-hair-db3.notion.site/1850bca26fda4e0ca1410df270c03409>
