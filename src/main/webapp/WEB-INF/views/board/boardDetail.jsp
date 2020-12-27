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
    table, tr, td{
        border-collapse: collapse;
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
    /* 콘텐츠 */
    .article{
        position: relative;
        width: 800px;
        margin: 100px auto 0 auto;
        color : #111111;
    }
    .content{
        width: 100%;
    }
    .ctitle{
        width: 100%;
        height: 50px;
        line-height: 50px;
        font-size: 36px;
    }
    .cwriteInfo{
        width: 100%;
        height: 30px;
        line-height: 30px;
        font-size: 14px;
    }
    .cwriteInfo div{
        float: left;
        margin: 10px 10px 20px 0;
    }
    .ctitle_sub{
        clear: both;
        width: 100%;
        height: 35px;
        margin : 24px 0;
        font-size: 24px;
    }
    .ccontent{
        width: 100%;
        height: auto;
    }
    .otherList{
        width: 760px;
        height: 230px;
        margin: 50px 0 30px 0;
        border: 1px solid rgb(230, 230, 230);
        padding: 20px;
    }
    .otherList tr{
        height: 35px;
        font-size: 12px;
    }
    .otherList tr td{
        box-sizing: border-box;
        border-collapse: collapse;
        border: 1px solid rgb(230, 230, 230);
        padding-top: 13px;
        padding-left: 20px;
    }
    .otherList tr td:nth-child(1){
        width: 580px;
    }
    .otherList tr td:nth-child(2){
        width: 140px;
    }
    .otherList tr td:nth-child(3){
        width: 40px;   
    }
    .btn{
        width: 100%;
        height: 30px;
        margin-bottom: 50px;
    }
    .btn button{
        float: right;
        width: 60px;
        height: 26px;
        border: none;
        border-radius: 5px;
        background-color: rgb(230, 230, 230);
        color: #111111;
        font-size: 12px;
        line-height: 12px;
        margin-left: 10px;
    }
    .reply{
        width: 100%;
    }
    .reply_title{
        font-size: 16px;
        padding-bottom: 16px;
        border-bottom: 2px solid rgb(230, 230, 230);
    }
    #comment{
        width: 100%;
        font-size: 16px;
        padding: 30px 0 55px 0;
        border-bottom: 1px solid rgb(230, 230, 230);
    }
    .comment-head {
        width: 600px;
        height: 25px;
        line-height: 25px;
    }
    .comment-body{
        width: 600px;
        margin-bottom : 20px;
    }
    .comment-confirm{
        width: 450px;
        height: 25px;
        line-height: 25px;
        float: left;
    }
    .comment-confirm input{
        border: 1px solid rgb(230, 230, 230);
        box-sizing: border-box;
    }
    #btn{
        width: 350px;
        float: right;
    }
    #btn button{
        width: 90px;
        height: 26px;
        border: none;
        border-radius: 5px;
        background-color: rgb(230, 230, 230);
        color: #111111;
        float: right;
        font-size: 12px;
        line-height: 12px;
        margin-right : 10px;
    }
    .comment-box{
        clear: both;
        padding: 60px 0 30px 0;
        font-size: 16px;
    }
    .comment-box input, textarea{
        border: 1px solid rgb(230, 230, 230);
        box-sizing: border-box;
    }
    .comment-box p{
        width: 100%;
    }
    #replyBtn{
        width: 105px;
        height: 36px;
        background-color: black;
        border-radius: 10px;
        color: white;
        float: right;
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
	<div class="article">
		<div class="content">
        <ul>
            <li class="ctitle">
                ${board.board_title}
            </li>
            <li class="cwriteInfo">
                <div>${board.board_writer}</div>
                <div>${board.regDate}</div>
                <div>(${board.read_count})</div>
            </li>
         
            <%-- <li class="ctitle_sub">
                ${board.board_subtitle}
            </li> --%>
            
            <li class="ccontent">
                <img src="${pageContext.request.contextPath}/resources/images/blog_logo.png" style="width: 800px;">
                <div>${board.board_content}</div>
            </li>
        </ul>
        </div>
        <div class="otherList">
        </div>
        
	<div class="btn">
		<ul>
			<li >
				<!-- 수정페이지를 클릭했을때 이동하는 페이지 설정 --> 
				<c:url var="bupview" value="/bRenew.do">
					<!-- 수정페이지로 이동할때 들고 들어가는 값들 -->
					<c:param name="board_num" value="${board.board_num}" />
				</c:url> 
				<!-- c:url에 적었던 value값 --> 
				<button><a href="${bupview}"> 글 수정 </a></button> &nbsp;&nbsp; 
				<!-- 글 삭제 클릭했을때 이동하는 페이지 --> 
				<c:url var="bdelete" value="bDelete.do">
					<!-- 글 삭제로 이동할때 들고 들어가는 값들 -->
					<c:param name="board_num" value="${board.board_num}" />
					<c:param name="page" value="${currentPage}" />
				</c:url> 
				<button><a href="${bdelete}"> 글 삭제 </a></button> &nbsp;&nbsp;  
				<c:url var="blist" value="bList.do">
					<c:param name="page" value="${currentPage}" />
				</c:url> 
				<button><a href="${blist}">목록</a></button>
			</li>
		</ul>
	</div>
	<br>
	
	<div class="reply">
			<div class="reply_title">댓글 (${commentList.size()})</div>
			<c:if test="${!empty commentList}">
				<c:forEach var="rep" items="${commentList}">
					<div id="comment">
						<!-- 입력된 값을 받아오는 부분 -->
						<input type="hidden" id="rep_id" name="rep_id" value="${rep.comment_id}"> 
						<input type="hidden" id="rep_pwd" name="rep_pwd" value="${rep.comment_pwd}">
						<div class="comment-head">작성자 : ${rep.comment_name} &nbsp;
							&nbsp;작성일 : ${rep.regdate}</div>
						<div class="comment-body">
							<p>${rep.comments}</p>
						</div>
						<div class="comment-confirm" style="display: none;">
							비밀번호 확인 : <input type="password" name="pwd_chk">
						</div>
						<p id="btn">
							<button type="button" class="updateConfirm" name="updateConfirm"
								id="updateConfirm" style="display: none;">수정완료</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="delete" name="delete" id="delete"
								style="display: none;">삭제하기</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="update" name="update" id="update">수정 및 삭제</button>
						</p>
					</div>
				</c:forEach>
			</c:if>
		
			<div class="comment-box">
				<form action="brInsert.do" id="replyForm" method="get" name="replyForm">
					<input type="hidden" id="board_num" name="board_num" value="${board.board_num}"> 
					<input type="hidden" id="page" name="page" value="${currentPage}"> 
					<input type="hidden" id="comments" name="comments" value="">
		
					<p>
						작성자 : <input type="text" name="comment_name">&nbsp;&nbsp;
						비밀번호 : <input type="password" name="comment_pwd"><br>
						<br>
						<textarea id="reply_contents" class="form-control" rows="6" cols="98%"
							onfocus="if(this.value == '댓글을 입력해주세요') { this.value = ''; }"
							onblur="if(this.value == '')"
							placeholder="댓글을 입력해주세요"></textarea>
						<br> <br> 
						<input type="submit" value="댓글쓰기" id="replyBtn">
					</p>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function() {
		// 댓글 Insert Script 
		$('#replyForm').on('submit', function(e) {
			if ($('#reply_contents').val() == null || $('#reply_contents').val() == "") {
						alert("내용을 입력해주세요.");
						e.preventDefault();
					} else {
						$('#comments').val($('#reply_contents').val());
						return true;
					}
				});

		//기존 댓글 수정 & 삭제 
		$(".update").on('click',function() {
			var parentP = $(this).parent();
			var parentDiv = parentP.parent();
			var commBody = parentDiv.children('.comment-body');
			var content = commBody.children('p').text().trim();

			if ($(this).text() == "수정 및 삭제") {
				commBody.append('<textarea style="margin-top:7px;" rows="4" cols="70%" class="updateContent" name="updateContent" id="updateContent">'
									+ content + '</textarea>');
				parentDiv.children('.comment-confirm').show();
				parentP.children(".delete").toggle("fast");
				parentP.children(".updateConfirm").toggle("fast");
				$(this).text("수정취소");
			} else {
				commBody.children(".updateContent").remove();
				parentDiv.children('.comment-confirm').hide();
				$(this).text("수정 및 삭제");
				parentP.children(".delete").toggle("fast");
				parentP.children(".updateConfirm").toggle("fast");
			}
		});

		$(".updateConfirm").on('click', function() {
			var parentP = $(this).parent();
			var parentDiv = parentP.parent();
			if (parentDiv.find('input[name=pwd_chk]').val() != parentDiv.children('input[name=rep_pwd]').val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else {
				$.ajax({
						url : "${pageContext.request.contextPath}/brUpdate.do",
						method : "POST",
						async : false,
						data : {
							comment_id : parentDiv.find("input[name=rep_id]").val(),
							comment_pwd : parentDiv.find('input[name=pwd_chk]').val(),
							comments : parentDiv.find('.updateContent').val()
						},
						success : function(data) {
							console.log(data);
							alert("수정 완료 : " + data);
							parentDiv.find(".comment-body p").text(parentDiv.find('.updateContent').val());
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:" 
									+ request.responseText + "\n" + "error:" + error);
						}
				});
			}
			parentDiv.find(".updateContent").remove();
			parentDiv.find(".comment-confirm").val("");
			parentDiv.find(".comment-confirm").hide();
			parentP.children(".updateConfirm").toggle("fast");
			parentP.children(".delete").toggle("fast");
			parentP.children('.update').text("수정 및 삭제");

		});

		$(".delete").on('click', function() {
			var parentP = $(this).parent();
			var parentDiv = parentP.parent();
			if (parentDiv.find('input[name=pwd_chk]').val() != parentDiv.children('input[name=rep_pwd]').val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else {
				$.ajax({
					url : "${pageContext.request.contextPath}/brDelete.do",
					method : "POST",
					data : {
						comment_id : parentDiv.find("input[name=rep_id]").val(),
						comment_pwd : parentDiv.find('input[name=pwd_chk]').val()
					},
					success : function(data) {
						alert("삭제 완료 : " + data);
						parentDiv.remove();
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
					}
				});
			}
		});
	});
	function openNav() {
        document.getElementById("mySidenav").style.width = "300px";
    }
    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
</script>
</html>