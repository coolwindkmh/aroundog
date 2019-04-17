<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	List<FreeBoard> freeBoardList=(List)request.getAttribute("freeBoardList");
	out.print(freeBoardList);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 20%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
}

#Home {background-color: red;}
#News {background-color: green;}
#Contact {background-color: blue;}
#About {background-color: orange;}
</style>
</head>
<script>
$(function(){//시작하자마자 디폴트페이지 열어놓기위해 사용
	document.getElementById("defaultOpen").click();
});

function openPage(pageName,elmnt,color) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
	  tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablink");
	for (i = 0; i < tablinks.length; i++) {
	  tablinks[i].style.backgroundColor = "";
	}
	document.getElementById(pageName).style.display = "block";
	elmnt.style.backgroundColor = color;
}


</script>
<body>

<div class="loginName" style="text-align:right"><%=admin.getName() %>님 로그인중</div>
<button class="tablink" onclick="openPage('Home', this, 'red')" id="defaultOpen"><i class="fas fa-user-friends" style="font-size:20px"></i>  회원관리</button> 
<button class="tablink" onclick="openPage('News', this, 'green')"><i class="fas fa-bullhorn" style="font-size:20px"></i>  제보관리</button>
<button class="tablink" onclick="openPage('Contact', this, 'blue')"><i class="far fa-edit" style="font-size:20px"></i>  입양신청관리</button>
<button class="tablink" onclick="openPage('About', this, 'orange')"><i class="far fa-comment-alt" 	style="font-size:20px"></i>  게시판관리</button>
<button class="tablink" onclick="openPage('About', this, 'orange')"><i class="fas fa-dog" style="font-size:20px"></i>  입양게시물관리</button>

<div id="Home" class="tabcontent">
<%-- <%FreeBoard freeBoard=freeBoardList.get(0);%> --%>
  <h3>Home</h3>
  <p>Home is where the heart is..</p>
<%-- <div><%=freeBoard.getContent() %></div> --%>
  
</div>

<div id="News" class="tabcontent">
  <h3>News</h3>
  <p>Some news this fine day!</p> 
</div>

<div id="Contact" class="tabcontent">
  <h3>Contact</h3>
  <p>Get in touch, or swing by for a cup of coffee.</p>
</div>

<div id="About" class="tabcontent">
  <h3>About</h3>
  <p>Who we are and what we do.</p>
</div>


   
</body>
</html> 
