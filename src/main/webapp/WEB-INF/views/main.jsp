<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>CodeName404</title>
<meta charset="utf-8">

<!-- 반응형 웹 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="./css/main.css">

<!-- <style>
#header {
	margin-top: -20px;
	width: 100%;
	height: 500px;
	background: url('./images/head.jpg') no-repeat;
	background-position: center center;
	background-size: cover;
	border-bottom: 1px solid #A9A9A9;
}
</style> -->
</head>
<body>

	<!------------------------------ 전체 프레임 ------------------------------>
	<div>
		<!-- navigator -->
		<jsp:include page="./navigator.jsp"></jsp:include>

	<!--------- 슬라이드------- -->
	<div class="slideshow-container">

		<div class="mySlides fade">
			<div class="numbertext">1 / 3</div>
			<img src="./images/error.jpg" style="width: 100%">
			<div class="text"></div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">2 / 3</div>
			<img src="./images/404.jpg" style="width: 100%">
			<div class="text"></div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">3 / 3</div>
			<img src="./images/404.webp" style="width: 100%">
			<div class="text"></div>
		</div>

		<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
			onclick="plusSlides(1)">❯</a>

	</div>
	<br>

	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>

	<script>
  let slideIndex = 1;
  showSlides(slideIndex);

  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  function currentSlide(n) {
    showSlides(slideIndex = n);
  }

  function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("mySlides");
    let dots = document.getElementsByClassName("dot");
    if (n > slides.length) {
      slideIndex = 1;
    }
    if (n < 1) {
      slideIndex = slides.length;
    }
    for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
  }


  
  setInterval(function() {
    plusSlides(1);
  }, 3000); 
</script>

	<!--------- 기술 소개 --------->
	<!-- 1 -->
	<div class="row">
		<div class="column">
			<div class="content">
				<img src="./images/java.jpeg" alt="Mountains" style="width: 80%">
				<h3>JAVA</h3>
				<p>객체 지향 프로그래밍 언어로서 보안성이 뛰어나며 컴파일한 코드는 다른 운영 체제에서 사용할 수 있도록
					클래스(class)로 제공된다. 객체 지향 언어인 C++ 언어의 객체 지향적인 장점을 살리면서 분산 환경을 지원하며 더욱
					효율적이다.</p>
			</div>
		</div>
		<!-- 2 -->
		<div class="column">
			<div class="content">
				<img src="./images/spring.png" alt="Lights" style="width: 80%">
				<h3>Spring Framework</h3>
				<p>자바 플랫폼을 위한 오픈 소스 애플리케이션 프레임워크로서 간단히 스프링(Spring)이라고도 한다. 동적인 웹
					사이트를 개발하기 위한 여러 가지 서비스를 제공하고 있다. 대한민국 공공기관의 웹 서비스 개발 시 사용을 권장하고 있는
					전자정부 표준프레임워크의 기반 기술로서 쓰이고 있다.</p>
			</div>
		</div>
		<!-- 3 -->
		<div class="column">
			<div class="content">
				<img src="./images/css.jpeg" alt="Nature" style="width: 80%">
				<h3>CSS</h3>
				<p>HTML 등의 마크업 언어로 작성된 문서가 실제로 웹사이트에 표현되는 방법을 정해주는 스타일 시트 언어.</p>
			</div>
		</div>
		<!-- 4 -->
		<div class="column">
			<div class="content">
				<img src="./images/javascript.png" alt="Mountains" style="width: 80%">
				<h3>JavaScript</h3>
				<p>Ecma International의 프로토타입 기반의 프로그래밍 언어로, 스크립트 언어에 해당된다. 특수한
					목적이 아닌 이상 모든 웹 브라우저에 인터프리터가 내장되어 있다.JavaScript는 클라이언트 단에서 웹 페이지가
					동작하는 것을 담당한다.<br><br><br></p>
			</div>
		</div>

		<!-- 5 -->
		<div class="row">
			<div class="column">
				<div class="content">
					<img src="./images/html.png" alt="Mountains" style="width: 80%">
					<h3><br>HTML</h3>
					<p>인터넷 서비스의 하나인 월드 와이드 웹을 통해 볼 수 있는 문서를 만들 때 사용하는 웹 언어의 한 종류이다.
						웹 문서를 만들기 위하여 사용하는 기본적인 웹 언어의 한 종류이다. 하이퍼텍스트를 작성하기 위해 개발되었다</p>
				</div>
			</div>
			<!-- 6 -->
			<div class="column">
				<div class="content">
					<img src="./images/oracle.jpg" alt="Lights" style="width: 80%">
					<h3>Oracle Database</h3>
					<p>오라클 데이터베이스(Oracle Database 또는 Oracle RDBMS)는 미국
						오라클(Oracle)사에서 판매하는 관계형 데이터베이스 관리 시스템이다. 은행 등 대다수의 대기업체에서 많이 사용된다.</p>
				</div>
			</div>
			<!-- 7 -->
			<div class="column">
				<div class="content">
					<img src="./images/c.png" alt="Nature" style="width: 80%">
					<h3>C</h3>
					<p>벨 연구소에서 1971년에 리치(D.M.Ritchie)등에 의해 개발된 시스템 프로그래밍 언어이다.
						프로그램을 간결하게 쓸 수 있고, 프로그래밍하기 쉬운 편리한 언어이다.</p>
				</div>
			</div>
			<!-- 8 -->
			<div class="column">
				<div class="content">
					<img src="./images/python.jpg" alt="Mountains" style="width: 80%">
					<h3>python</h3>
					<p>C언어를 기반으로 한 오픈소스 고급 프로그래밍 언어로, 초보자뿐만 아니라 전문가들도 포함하는 매우 다양한
						사용자층을 가지고 있으며, 플랫폼 독립적이기 때문에 다양한 플랫폼에서 사용 가능하고 또한 기본 제공되는 라이브러리가
						매우 많다.</p>
				</div>
			</div>
			<!-- END GRID -->
		</div>
		<!-- END MAIN -->
	</div>

	</div>
<!-- footer -->
		<jsp:include page="./footer.jsp"></jsp:include>
	<!------------------------------ 전체 프레임 end ------------------------------>

</body>
</html>

