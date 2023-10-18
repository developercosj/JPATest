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
                    var k = "'" + data[i].companyId + "'"
                    html +=  '<br><br>'
                    html += '<table onclick="detailPosting(' + data[i].postingIdx + ',' + k + ')">'
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

    // 채용공고문 상세보기
    function detailPosting(postingNumber, companyId) {

        var data = {};
        data["postingNumber"] = postingNumber;
        data["companyId"] = companyId;

        $.ajax({
            type : "POST",
            url : "/detailPosting",
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            data : JSON.stringify(data),
            success : function (data, status) {
                var html = ''
                html +=  '<br><br><h2>채용 공고문 상세</h2>'
                html += '<table id="postingNumber' + data.postingList.postingIdx + '">'
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
                html += '<td>' + '상세내용'
                html += '</td>'
                html += '<td>' + '기술'
                html += '</td>'
                html += '</tr>'

                html += '<tr>'
                html += '<td>' + data.postingList.postingIdx
                html += '</td>'
                html += '<td>' + data.postingList.companyId
                html += '</td>'
                html += '<td>' + data.postingList.companyName
                html += '</td>'
                html += '<td>' + data.postingList.country
                html += '</td>'
                html += '<td>' + data.postingList.city
                html += '</td>'
                html += '<td>' + data.postingList.position
                html += '</td>'
                html += '<td>' + data.postingList.prizeMoney
                html += '</td>'
                html += '<td>' + data.postingList.contents
                html += '</td>'
                html += '<td>' + data.postingList.skill
                html += '</td>'
                html += '</tr>'
                html +=  '<br><br>'
                html += '</table>'
                $("#postingList").html(html)



                var html = "";
                var html = '<h2>회사의 다른 채용공고</h2>';
                for (var i = 0; i < data.postingLists.length; i++){
                    if (data.postingList.postingIdx != data.postingLists[i].postingIdx) {
                        var k = "'" + data.postingLists[i].companyId + "'"
                        html += '<table onclick="detailPosting(' + data.postingLists[i].postingIdx + ',' + k + ')">'
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
                        html += '<td>' + data.postingLists[i].postingIdx
                        html += '</td>'
                        html += '<td>' + data.postingLists[i].companyId
                        html += '</td>'
                        html += '<td>' + data.postingLists[i].companyName
                        html += '</td>'
                        html += '<td>' + data.postingLists[i].country
                        html += '</td>'
                        html += '<td>' + data.postingLists[i].city
                        html += '</td>'
                        html += '<td>' + data.postingLists[i].position
                        html += '</td>'
                        html += '<td>' + data.postingLists[i].prizeMoney
                        html += '</td>'
                        html += '<td>' + data.postingLists[i].skill
                        html += '</td>'
                        html += '</tr>'
                        html +=  '<br><br>'

                        html += '</table>'


                    }
                }
                $("#postingCompanyList").html(html)



            },
            error : function (status) {
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

    // 지원공고 수정단계로 들어가기 위한 버튼
    function editPostingButton(num) {
        var html = "";
        var data = {};
        data["postingNumber"] = num;
        $.ajax({
            type : "POST",
            url : "/editPostingButton",
            contentType: "application/json",
            dataType: "json",
            data : JSON.stringify(data),
            success : function (data, status) {
                var html = "";
                html +=  '<br><br>'
                html += '<table id="postingNumber' + data.postingIdx + '">'
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
                html += '<td>' + '상세내용'
                html += '</td>'
                html += '<td>' + '기술'
                html += '</td>'
                html += '</tr>'

                html += '<tr>'
                html += '<td> <input type="text" id="postingIdx" value="' + data.postingIdx +'">'
                html += '</td>'
                html += '<td>' + data.companyId
                html += '</td>'
                html += '<td> <input type="text" id="companyName" value="' + data.companyName + '">'
                html += '</td>'
                html += '<td> <input type="text" id="country" value="' + data.country +'">'
                html += '</td>'
                html += '<td> <input type="text" id="city" value="' + data.city + '">'
                html += '</td>'
                html += '<td> <input type="text" id="position" value="' + data.position + '">'
                html += '</td>'
                html += '<td> <input type="text" id="prizeMoney" value="' + data.prizeMoney + '">'
                html += '</td>'
                html += '<td> <input type="text" id="contents" value="' + data.contents + '">'
                html += '</td>'
                html += '<td> <input type="text" id="skill" value="' + data.skill + '">'
                html += '</td>'
                html += '</tr>'
                html +=  '<br><br>'
                html += '</table>'
                html += '<button id="editPosting" onclick="editPosting()">채용공고 수정완료</button>'
                $("#postingList").html(html)

            },
            error : function (status) {
                alert(status + "error!");
            }
        });


    }

    // 지원공고 수정 완료
    function editPosting() {
        var data = {};
        data["postingIdx"] = $('#postingIdx').val();
        data["companyId"] = $('#companyId').val();
        data["companyName"] = $('#companyName').val();
        data["country"] = $('#country').val();
        data["city"] = $('#city').val();
        data["position"] = $('#position').val();
        data["prizeMoney"] = $('#prizeMoney').val();
        data["contents"] = $('#contents').val();
        data["skill"] = $('#skill').val();
        $.ajax({
            type : "POST",
            url : "/editPosting",
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            data : JSON.stringify(data),
            success : function (data, status) {
                postingList();
            },
            error : function (status) {
                alert(status + "error!");
            }
        });
    }

    // 회사가 지원공고 삭제
    function deletePosting(num) {
        var data = {"postingNumber" : num};

        $.ajax({
            type : "POST",
            url : "/deletePosting",
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            data : JSON.stringify(data),
            success : function (data, status) {
                alert("성공적으로 삭제되었습니다.");
                postingList();
            },
            error : function (status) {
                alert(status + "error!");
            }
        });
    }

    // 채용공고 검색
    function searchPosting() {
        var data = {"searchText" : $('#searchText').val()};

        $.ajax({
            type : "POST",
            url : "/searchPosting",
            contentType: "application/json",
            dataType: "json",
            data : JSON.stringify(data),
            success : function (data, status) {
                if (data.length < 1) {
                    alert("검색결과가 없습니다.");

                }
                var html = "";
                html += '<h2>검색 결과</h2>'
                for (var i = 0; i < data.length; i++){
                    var k = "'" + data[i].companyId + "'"
                    html +=  '<br><br>'
                    html += '<table onclick="detailPosting(' + data[i].postingIdx + ',' + k + ')">'
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

    // 지원공고
    function applyPosting(num) {
        // 지원하는 사용자의 사용자 번호는 현재 로그인하지 않아서 일괄적으로 1로 정함
        var data = {"postingNumber" : num,
            "userId" : 1
        };
        $.ajax({
            type : "POST",
            url : "/applyPosting",
            contentType: "application/json",
            data : JSON.stringify(data),
            dataType: "json",
            success : function (data, status) {
                alert(data.response);
            },
            error : function (status) {
                alert(status + "error!");
            }
        });
    }
</script>

