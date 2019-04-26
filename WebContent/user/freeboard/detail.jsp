<%@page import="com.aroundog.model.domain.FreeComment"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	FreeBoard freeboard=(FreeBoard)request.getAttribute("freeboard");
	List fcList=(List)request.getAttribute("fcList");
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/user/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Animal Shelter</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
	<!--
	CSS
	============================================= -->
<link rel="stylesheet" href="/user/css/linearicons.css">
<link rel="stylesheet" href="/user/css/font-awesome.min.css">
<link rel="stylesheet" href="/user/css/free_bootstrap.css">
<link rel="stylesheet" href="/user/css/magnific-popup.css">
<link rel="stylesheet" href="/user/css/nice-select.css">							
<link rel="stylesheet" href="/user/css/animate.min.css">
<link rel="stylesheet" href="/user/css/owl.carousel.css">
<link rel="stylesheet" href="/user/css/freeboard.css">
<style>
#listbt{
	margin-left:992px;
}
.comment-form2{
	display:none;
}

</style>
</head>
<script>
function createArea(){
	var com=document.getElementById("free-com");
	alert(com);

	var str="";

	str+="<div class='comment-form'>";
	str+="<h4>Leave a Comment</h4>";
		str+="<form>";
			str+="<input type='hidden' name='member_id' value='1'/>";
				str+="<input type='hidden' name='freeboard_id' value='<%=freeboard.getFreeboard_id()%>'/>";
					str+="<div class='form-group'>";
						str+="<textarea class='form-control mb-10' rows='5' name='content' placeholder='Messege' onfocus='this.placeholder = ' onblur='this.placeholder = 'Messege' required=''></textarea>";
					str+="</div>";
			str+="<a href='#' class='primary-btn text-uppercase'>Post Comment</a>";
		str+="</form>";
	str+="</div>";

	com.innerHTML(str);
	
}
function insertComment(){
	$("form[name='form1']").attr({
		action:"/user/freecomment/regist",
		method:"POST"
	});
	$("form[name='form1']").submit();
}
function addComment(){
	$("form[name='form2']").attr({
		action:"/user/freecomment/add",
		method:"POST"
	});
	$("form[name='form2']").submit();
}
function viewArea(id){
	var str="hiddenComment"+id;
	var commentArea=document.getElementById(str);
	if(commentArea.style.display=="none"){
		commentArea.style.display="block";
	}else{
		commentArea.style.display="none";
	}
}
</script>
<body class="blog-page">	
	  <header id="header" id="home">
	    <div class="container main-menu">
	    	<div class="row align-items-center justify-content-between d-flex">
		      <div id="logo">
		        <a href="index.html"><img src="/user/img/logo.png" alt="" title="" /></a>
		      </div>
		      <nav id="nav-menu-container">
		        <ul class="nav-menu">
		          <li class="menu-active"><a href="index.html">Home</a></li>
		          <li><a href="about.html">About Us</a></li>
		          <li><a href="cats.html">Cats</a></li>
		          <li><a href="dogs.html">Dogs</a></li>
		          <li><a href="volunteer.html">Volunteer</a></li>
		          <li class="menu-has-children"><a href="">Blog</a>
		            <ul>
		              <li><a href="blog-home.html">Blog Home</a></li>
		              <li><a href="blog-single.html">Blog Single</a></li>
		            </ul>
		          </li>						          
		          <li><a href="contact.html">Contact</a></li>
		          <li class="menu-has-children"><a href="">Dropdown</a>
		            <ul>
		              <li><a href="elements.html">Elements</a></li>	
		              <li><a href="#">Item</a></li>
		              <li class="menu-has-children"><a href="">Level 2</a>
			            <ul>
			              <li><a href="#">Item 1</a></li>
			              <li><a href="#">Item 2</a></li>
			            </ul>
			          </li>	
		            </ul>
		          </li>				              
		        </ul>
		      </nav><!-- #nav-menu-container -->		    		
	    	</div>
	    </div>
	  </header><!-- #header -->

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">	
		<div class="overlay overlay-bg"></div>
		<div class="container">				
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						Blog Details Page				
					</h1>	
					
				</div>	
			</div>
		</div>
	</section>
	<!-- End banner Area -->					  
	
	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img" style="text-align:center">
								<img class="detail-top" src="/user/img/aroundog/topmain.jpg" alt="">
							</div>									
						</div>
						<div class="col-lg-3  col-md-3 meta-details">
							
							<div class="user-details row">
								<p class="user-name col-lg-12 col-md-12 col-6"><a href="#"><%=freeboard.getFreeboard_id() %></a> <span class="lnr lnr-user"></span></p>
								<p class="date col-lg-12 col-md-12 col-6"><a href="#"><%=freeboard.getRegdate() %></a> <span class="lnr lnr-calendar-full"></span></p>
								<p class="view col-lg-12 col-md-12 col-6"><a href="#"><%=freeboard.getHit() %> Views</a> <span class="lnr lnr-eye"></span></p>
								<p class="comments col-lg-12 col-md-12 col-6"><a href="#"><%=freeboard.getFreeboard_id() %> Comments</a> <span class="lnr lnr-bubble"></span></p>
								<ul class="social-links col-lg-12 col-md-12 col-6">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-github"></i></a></li>
									<li><a href="#"><i class="fa fa-behance"></i></a></li>
								</ul>																				
							</div>
						</div>
						<div class="col-lg-9 col-md-9">
							<a class="posts-title" href="#"><h3><%=freeboard.getTitle() %></h3></a>
							<p class="excert">
								<%=freeboard.getContent() %>
							</p>							
						</div>
						
					</div>
					<div class="navigation-area">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
								<div class="thumb">
									<a href="#"><img class="img-fluid" src="/user/img/aroundog/dogleft.jpg" alt=""></a>
								</div>
								<div class="arrow">
									<a href="#"><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
								</div>
								<div class="detials">									
									<a href=""><h4>Prev Post</h4></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials">									
									<a href=""><h4>Next Post</h4></a>
								</div>
								<div class="arrow">
									<a href="#"><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
								</div>
								<div class="thumb">
									<a href="#"><img class="img-fluid" src="/user/img/aroundog/dogright.jpg" alt=""></a>
								</div>										
							</div>									
						</div>
					</div>
					
					<!--  댓글 관련 반복문 필요!!~!~!~!~!~!~!~minho -->
					<div class="comments-area">
					<!-- 여긴 프리커맨트 사이즈 넣어야함 -->
						<h4>05 Comments</h4>
						
						<!--  for문 써서 댓글 여러개 쓰게끔 -->
						
							
	                    <!-- for문 끝 -->
	                    <%if(fcList!=null){ %>
	                    <%for(int i=0;i<fcList.size();i++){ %>
	                    <%FreeComment freeComment=(FreeComment)fcList.get(i); %>
	                    <%if(freeComment.getDepth()==1){ %>
						<div class="comment-list">
	                        <div class="single-comment justify-content-between d-flex" id="free-com">
	                            <div class="user justify-content-between d-flex">
	                                <div class="thumb">
	                                    <img src="/user/img/blog/c1.jpg" alt="">
	                                </div>
	                                <div class="desc">
	                                    <h5><a href="#">이름 : <%=freeComment.getMember_id() %></a></h5>
	                                    <p class="date">시간 : <%=freeComment.getRegdate() %> </p>
	                                    <p class="comment">
	                                        	내용 : <%=freeComment.getContent() %>
	                                    </p>
	                                </div>
	                            </div>
	                            <div class="reply-btn">
                                       <a class="btn-reply text-uppercase" onClick="viewArea(<%=i%>)">reply</a> 
                                </div>
                                
	                        </div>
	                        
	                        <div class="comment-form2" id="hiddenComment<%=i%>">
								<h4>Leave a Comment</h4>
								<form name="form2" style="align-items: center">
									<input type="hidden" name="member_id" value="2"/>
									<input type="hidden" name="freeboard_id" value="<%=freeboard.getFreeboard_id()%>"/>
									<input type="hidden" name="depth" value="2"/>
									<input type="hidden" name="team" value="<%=freeComment.getTeam()%>"/>
									<div class="form-group">
										<textarea class="form-control mb-10" rows="5" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
									</div>
									<a class="primary-btn text-uppercase" onClick="addComment()">Post Comment</a>	
								</form>
							</div>
	                        
	                    </div>	
	                    <%} %>
	                    
	                    <%if(freeComment.getDepth()==2){ %>
						<div class="comment-list left-padding">
	                           <div class="single-comment justify-content-between d-flex">
	                               <div class="user justify-content-between d-flex">
	                                   <div class="thumb">
	                                       <img src="/user/img/blog/c2.jpg" alt="">
	                                   </div>
	                                   <div class="desc">
	                                       <h5><a href="#">이름 : <%=freeComment.getMember_id() %></a></h5>
	                                       <p class="date">시간 : <%=freeComment.getRegdate() %> </p>
	                                       <p class="comment">
	                                           		내용 : <%=freeComment.getContent() %>
	                                       </p>
	                                   </div>
	                               </div>
	                               
	                           </div>
	                       </div>                              
                        <%} %>   	
							
							
						<%}%>
	                    <%}%>                                             				
					</div>
					<!-- 댓글 달기 폼 -->
						<div class="comment-form">
							<h4>Leave a Comment</h4>
							<form name="form1">
								<input type="hidden" name="member_id" value="1"/>
								<input type="hidden" name="freeboard_id" value="<%=freeboard.getFreeboard_id()%>"/>
								<input type="hidden" name="depth" value="1"/>
								<div class="form-group">
									<textarea class="form-control mb-10" rows="5" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
								</div>
								<a class="primary-btn text-uppercase" onClick="insertComment()">Post Comment</a>	
							</form>
						</div>
					
								<a href="/user/freeboards" class="primary-btn text-uppercase" id="listbt">목록으로</a>	
				</div>
				
				
				
				
			</div>
		</div>	
	</section>
	<!-- End post-content Area -->
	

	<!-- start footer Area -->		
	<footer class="footer-area">
		<div class="container">
			<div class="row pt-120 pb-80">
				<div class="col-lg-4 col-md-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>
							Few would argue that, despite the advanc ements off eminism over the past three decades, women still face a double standard when it comes to their behavior. While menâs borderline-inappropriate behavior. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-footer-widget">
						<h6>Useful Links</h6>
						<div class="row">
							<ul class="col footer-nav">
								<li><a href="#">Home</a></li>
								<li><a href="#">Service</a></li>
								<li><a href="#">About</a></li>
								<li><a href="#">Case Study</a></li>
							</ul>
							<ul class="col footer-nav">
								<li><a href="#">Pricing</a></li>
								<li><a href="#">Team</a></li>
								<li><a href="#">Blog</a></li>
							</ul>									
						</div>
					</div>
				</div>						
				<div class="col-lg-4  col-md-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">Contact Us</h6>
						<ul class="list-contact">
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-home"></span>
								</div>
								<div class="detail">
									<h4>Binghamton, New York</h4>
									<p>
										4343 Hinkle Deegan Lake Road
									</p>
								</div>	
							</li>
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-phone-handset"></span>
								</div>
								<div class="detail">
									<h4>00 (953) 9865 562</h4>
									<p>
										Mon to Fri 9am to 6 pm
									</p>
								</div>	
							</li>
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-envelope"></span>
								</div>
								<div class="detail">
									<h4>support@colorlib.com</h4>
									<p>
										Send us your query anytime!
									</p>
								</div>	
							</li>																		
						</ul>
					</div>
				</div>						
			</div>
		</div>
		<div class="copyright-text">
			<div class="container">
				<div class="row footer-bottom d-flex justify-content-between">
					<p class="col-lg-8 col-sm-6 footer-text m-0 text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
					<div class="col-lg-4 col-sm-6 footer-social">
						<a href="#"><i class="fa fa-facebook"></i></a>
						<a href="#"><i class="fa fa-twitter"></i></a>
						<a href="#"><i class="fa fa-dribbble"></i></a>
						<a href="#"><i class="fa fa-behance"></i></a>
					</div>
				</div>						
			</div>
		</div>
	</footer>
	<!-- End footer Area -->	

<script src="/user/js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/user/js/vendor/bootstrap.min.js"></script>			
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
<script src="/user/js/easing.min.js"></script>			
<script src="/user/js/hoverIntent.js"></script>
<script src="/user/js/superfish.min.js"></script>	
<script src="/user/js/jquery.ajaxchimp.min.js"></script>
<script src="/user/js/jquery.magnific-popup.min.js"></script>	
<script src="/user/js/owl.carousel.min.js"></script>						
<script src="/user/js/jquery.nice-select.min.js"></script>							
<script src="/user/js/mail-script.js"></script>	
<script src="/user/js/main.js"></script>	
</body>
</html>



