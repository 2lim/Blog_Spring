<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lee.HL의 블로그</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

<style>
    *{
        margin : 0;
    }
    body{
        width : 100%;
        height: 100%;
        position: relative;
    }
    a{
        text-decoration: none;
        color: #202020;
    }
/* 사이드 네비 */
    .sidenav{
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
        background-color: white;
        border-right: 1px solid rgb(230, 230, 230);
    }

    .sidenav a {
        padding: 15px 8px 14px 61px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
        transition: 0.3s;
    }

    .sidenav a:hover {
        color: #f1f1f1;
    }

    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        margin-left: 50px;
    }

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
    /* 헤더 */
    .header{
        position: relative;
        border-bottom: 1px solid rgb(230, 230, 230);
        width: 100%;
        height: 170px;
    }
    .header_cont{
        position: relative;
        width: 1080px;
        margin: 0 auto;
    }
    .header span{
        position: absolute;
        line-height: 170px;
        font-size:30px;
        cursor:pointer;
        float: left;
    }
    .logo_wrap{
        position: absolute;
        float: left;
        margin: 65px 0 65px 450px;
    }
    .search_wrap{
        position: absolute;
        clear: both;
        right: 0;
        line-height: 170px;
        
        letter-spacing: -0.4px;
    }
    .search_wrap input:nth-child(2){
        width: 200px;
        height: 30px;
        border: 1px solid rgb(230, 230, 230);
        border-radius: 10px;
        box-sizing: border-box;
        vertical-align : middle;
    }
    .search_wrap button{
        border: none;
        background-color: white;
        vertical-align : middle;
        padding-left: 10px;
    }

    
    /* 메인 컨텐츠 */
    .contents_first{
        position: relative;
        width: 1080px;
        margin: 0 auto;
    }
    .contents_first ul{
        position: absolute;
        width: 800px;
        height: 740px;
        margin : 80px 140px 0 140px;
    }
    .ftitle{
        height: 40px;
        font-size: 33px;
        font-weight: 700;
    }
    .fimage{
        width: 800px;
        height: 480px;
    }
    .fwriteInfo{
        height: 60px;
    }
    .fwriteInfo div{
        height: 30px;
        float: left;
        margin: 10px 10px 20px 0;
    }
    .fcontent{
        height: 80px;
        padding: 20px 0;
    }
    .freadmore{
        width: 90px;
        height: 40px;
        border: 1px solid #333333;
        border-radius: 10px;
        background-color: #333333;
    }
    .freadmore a{
        color: white;
    }
    /* 서브컨텐츠 */
    .contents_second{
        position: relative;
        width: 1080px;
        top : 820px;
        height: 557px;
        margin: 0 auto;
    }
    .content{
        position: absolute;
        width: 820px;
        height: 477px;
        margin : 80px 140px 30px 140px;
    }
    .content ul{
        width: 380px;
        height: 477px;
        padding-right: 30px;
        float: left;
    }
    .stitle{
        padding-top: 20px;
        font-size: 20px;
        font-weight: 700;
        height: 20px;
    }
    .swriteInfo{
        height: 60px;
    }
    .swriteInfo div{
        height: 30px;
        float: left;
        margin: 10px 10px 20px 0;
    }
    .scontent{
        height: 80px;
        padding: 20px 0;
    }
    .sreadmore{
        width: 90px;
        height: 40px;
        border: 1px solid #333333;
        border-radius: 10px;
        background-color: #333333;
    }
    .sreadmore a{
        color: white;
    }
    </style>
    
</head>
<body >
	<div id="mySidenav" class="sidenav">
        <ul>
            <li> <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a></li>
            <li><a href="bList.do">HOME</a></li>
            <li><a href="bJavaList.do">JAVA</a></li>
            <li><a href="bOracleList.do">SQL</a></li>
            <li><a href="bSpringList.do">Spring</a></li>
        </ul>
    </div>
	<div class="header">
        <div class="header_cont">
        <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776</span>  
        <div class="logo_wrap">
        	<a href="bList.do"> 
            <img src ="${pageContext.request.contextPath}/resources/images/blog_logo.png" style="height: 40px;">
            </a>
        </div> 
        <div class="search_wrap">	
		<!-- 검색 form -->
		<form name="listForm">
			<input type="hidden" name="page" value="${currentPage}"> 
			<input type="text" name="keyword">
			<button value="검색" onclick="goList()"><img src="${pageContext.request.contextPath}/resources/images/search.png" style="width: 20px; height: 20px;"></button>
		</form>
		</div>
        </div>
    </div>
	<div class="contents_first">
		 <!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="6" align="center"><br>
				<br> 게시판에 저장된 글이 없습니다.<br>
				<br></td>
			</tr>
		</c:if>
		<c:if test="${listCount ne 0}">
			<c:forEach var="vo" items="${list}" varStatus="status" begin="0" end="0">
				<ul>
					<%-- <td align="center">${status.count}</td> --%>
					<li class="ftitle">
					<a href="bDetail.do?board_num=${vo.board_num}&page=${currentPage}">${vo.board_title} </a>
					</li>
					<li class="fwriteInfo">
						<div>${vo.board_writer}</div>
						<div>${vo.regDate}</div>
						<div>${vo.read_count}</div>
					</li>
					<li class ="fimage">
                		<img src="${pageContext.request.contextPath}/resources/images/dog.jpg" style="width: 800px; height: 480px;">
            		</li>
            		<li>
                		<div class="fcontent">${vo.board_content}</div>
            		</li>
            		<li>
                		<button class="freadmore">
                		<a href="bDetail.do?board_num=${vo.board_num}&page=${currentPage}">더보기</a>
                		</button>
            		</li>
				</ul>
			</c:forEach>
		</c:if>
	</div>
	<div class="contents_second">
		<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="6" align="center"><br>
				<br> 게시판에 저장된 글이 없습니다.<br>
				<br></td>
			</tr>
		</c:if>
		
		<div class="content">
			<c:if test="${listCount ne 0}">
			<c:forEach var="vo" items="${list}" varStatus="status" begin="1" end="4">
 				<ul>
					<%-- <td align="center">${status.count}</td> --%>
					<li class ="simage">
                		<img src="${pageContext.request.contextPath}/resources/images/dog.jpg" style="width: 380px; height: 210px;">
            		</li>
					<li class="stitle">
					<a href="bDetail.do?board_num=${vo.board_num}&page=${currentPage}">${vo.board_title} </a>
					</li>
					<li class="swriteInfo">
						<div>${vo.board_writer}</div>
						<div>${vo.regDate}</div>
						<div>${vo.read_count}</div>
					</li>
					
            		<li>
                		<div class="scontent">${vo.board_content}</div>
            		</li>
            		<%-- <li>
                		<button class="sreadmore">
                		<a href="bDetail.do?board_num=${vo.board_num}&page=${currentPage}">더보기</a>
                		</button>
            		</li> --%>
				</ul>
			</c:forEach>
			</c:if>
		 </div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$('form[name=listForm]').on('submit',function(e) {
					if ($('input[name=keyword]').val() == null
							|| $('input[name=keyword]').val() == "") {
						alert("검색어를 입력해 주세요");
						e.preventDefault();
					} else {
						return true;
					}
				});
	});
	function showInsertForm() {
		location.href = "writeForm.do";
	}
	function openNav() {
        document.getElementById("mySidenav").style.width = "300px";
    }
    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
	function goList(){
		var frm = document.listForm;
		frm.action = "${pageContext.request.contextPath}/bList.do";
		frm.method = "get";
		frm.submit(); 
	}
</script>

</html>