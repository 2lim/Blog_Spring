<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
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
    .content{
        position : relative;
        width: 860px;
        margin: 0 auto;
        top : 50px;
    }
    .title{
        height: 42px;
        padding: 0 10px 26px 10px;
        border-bottom: 1px solid rgb(230, 230, 230);
    }

    .title input{
        width: 860px;
        height: 42px;
        border: none;
        font-size: 30px;
        color: #202020;
        letter-spacing : -0.4px;
    }
    .category_title{
    	width : 150px;
    	height: 35px;
    }
    .category td:nth-child(2){
    	width : 500px;
    }
    .writearea{
        height: 370px;
        padding : 0 10px 26px 10px; 
        border-bottom: 1px solid rgb(230, 230, 230);
    }
    .writearea textarea{
        width: 860px;
        height: 370px;
        border: none;
        color: #202020;
        letter-spacing : -0.4px;
    }
     .category{
        width: 860px;
        height: 90px;
        
    }
    .category td:nth-child(1){
        width: 90px;
        padding-top: 20px;
        padding-bottom: 20px;
        padding-left: 10px;
        line-height: 50px;
       	
    }
    .category td:nth-child(2){
    	 width: 560px;
         height: 50px;
         line-height: 50px;
    }
    .fileupload{
        width: 860px;
        height: 90px;
    }
    .fileupload td:nth-child(1){
        width: 90px;
        height: 50px;
        line-height: 50px;
        padding-top: 20px;
        padding-bottom: 20px;
        padding-left: 10px;
    }
    .fileupload input{
        width: 560px;
        height: 50px;
        line-height: 50px;
        padding-top: 20px;
        padding-bottom: 20px;
    }
    .btn {
        height: 40px;
        text-align: right;
    }
    .btn input, button{
        width: 90px;
        height: 40px;
        border: 1px solid black;
        border-radius: 20px;
        background-color: black;
        color: white;
    }

</style>
</head>
<body>
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
            <img src ="${pageContext.request.contextPath}/resources/images/blog_logo.png" style="height: 40px;">
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
	<form action="bInsert.do" method="post" enctype="multipart/form-data" class="content">
		<table>
			<tr>
				<td colspan="2" class="title"><input type="text" name="board_title" placeholder="제목을 입력하세요"></td>
			</tr>
			<tr class="category">
				<td >카테고리</td>
				<td>
            	<select>
            		<option>JAVA</option>
            		<option>SQL</option>
            		<option>Spring</option>
            	</select>
            	</td>
            </tr>
			<tr>
				<td colspan="2" class="writearea"><textarea cols="50" rows="7" name="board_content" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr class="fileupload">
            	<td>첨부파일</td>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<td colspan="2" class="btn">
                <input type="submit" value="완료"> &nbsp;
                <c:url var="blist" value="blist.do">
				    <c:param name="page" value="1" />
                </c:url>
                <button><a href="bList.do" style="color: white;">목록으로</a></button>
                </td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
function openNav() {
    document.getElementById("mySidenav").style.width = "360px";
}
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
</html>