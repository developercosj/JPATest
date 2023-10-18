<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지원 공고 관리 페이지</title>
</head>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }

</style>
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
</html>

<script>
    $(document).ready(function(){
    });
    //채용공고 목록 확인
    function postingList() {

        $.ajax({
            type : "GET",
            url : "/postingList",
            contentType: "application/json",
            dataType: "json",
            success : function (data, status) {
                var html = "";
                for (var i = 0; i < data.length; i++){
                    html +=  '<br><br>'
                    html += '<table onclick="detailPosting(' + data[i].postingIdx + ',' + data[i].companyId + ')">'
                    html += '<tr>'
                    html += '<td>' + '포스팅 번호'
                    html += '</td>'
                    html += '<td>' + '회사 아이디'
                    html += '</td>'
                    html += '<td>' + '회사 이름'
                    html += '</td>'
                    html += '<td>' + '국가'
                    html += '</td>'
                    html += '<td>' + '근무위치'
                    html += '</td>'
                    html += '<td>' + '포지션'
                    html += '</td>'
                    html += '<td>' + '지원보상금'
                    html += '</td>'
                    html += '<td>' + '기술'
                    html += '</td>'
                    html += '</tr>'

                    html += '<tr>'
                    html += '<td>' + data[i].postingIdx
                    html += '</td>'
                    html += '<td>' + data[i].companyId
                    html += '</td>'
                    html += '<td>' + data[i].companyName
                    html += '</td>'
                    html += '<td>' + data[i].country
                    html += '</td>'
                    html += '<td>' + data[i].city
                    html += '</td>'
                    html += '<td>' + data[i].position
                    html += '</td>'
                    html += '<td>' + data[i].prizeMoney
                    html += '</td>'
                    html += '<td>' + data[i].skill
                    html += '</td>'
                    html += '</tr>'
                    html +=  '<br><br>'

                    html += '</table>'
                    html += '<button id="editPosting" onclick="editPostingButton(' + data[i].postingIdx + ')">채용공고 수정</button>'
                    html += '<button id="deletePosting" onclick="deletePosting(' + data[i].postingIdx + ')">채용공고 삭제</button>'
                    html +=  '<button id="applyPosting" onclick="applyPosting(' + data[i].postingIdx + ')">채용공고 지원</button>'


                    /*                    html += '<tr>'
                                        html += '<td>' + '상세내용'
                                        html += '</td>'
                                        html += '<td>' + data[i].contents
                                        html += '</td>'
                                        html += '</tr>'
                                        html += '</br>'*/



                }
                $("#postingList").html(html)

            },
            error : function (status) {
                alert(status + "error!");
            }
        });
    }

    // 회사가 지원공고 등록
    function insertPosting() {
        var data = {};
        data["companyId"] = $('#companyIdText').val();
        data["companyName"] = $('#companyNameText').val();
        data["country"] = $('#countryText').val();
        data["city"] = $('#cityText').val();
        data["position"] = $('#positionText').val();
        data["money"] = $('#moneyText').val();
        data["contents"] = $('#contentsText').val();
        data["skill"] = $('#skillText').val();

        $.ajax({
            type : "POST",
            url : "/insertPosting",
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            data : JSON.stringify(data),
            success : function (data, status) {
                alert("성공적으로 등록되었습니다.");
                postingList();
            },
            error : function (status) {
                alert(status + "error!");
            }
        });
    }

                }
                $("#postingList").html(html)

            },
            error : function (status) {
                alert(status + "error!");
            }
        });
    }


