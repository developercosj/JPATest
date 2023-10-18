<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지원 공고 관리 페이지</title>
</head>
<body>
<button id="selectPostingList" onclick="postingList()">채용공고 리스트 확인</button>
<input type="text" id="searchText" placeholder="검색어를 입력하세요" >
<button id="searchPosting" onclick="searchPosting()">채용공고 검색</button>
<p id="postingList">


</p>
<p id="postingCompanyList">

</p>

<h2>회사 전용</h2>
<table>
    <tr>
        <td>회사아이디</td>
        <td>회사이름</td>
        <td>국가</td>
        <td>도시</td>
        <td>포지션</td>
        <td>지원보상금</td>
        <td>상세내용</td>
        <td>스킬</td>
    </tr>
    <tr>
        <td><input type="text" id="companyIdText" value="테스트컴퍼니1"></td>
        <td><input type="text" id="companyNameText" ></td>
        <td><input type="text" id="countryText"></td>
        <td><input type="text" id="cityText"></td>
        <td><input type="text" id="positionText"></td>
        <td><input type="text" id="moneyText"></td>
        <td><input type="text" id="contentsText"></td>
        <td><input type="text" id="skillText"></td>

    </tr>
</table>
<button id="insertPosting"  onclick="insertPosting()">채용공고 등록</button>
</body>

