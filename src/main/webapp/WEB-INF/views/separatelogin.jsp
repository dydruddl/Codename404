<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <title>CodeName 404</title>
  <style>
    .container {
      text-align: center;
      margin-top: 50px;
    }
    .button-container {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-bottom: 20px;
    }
    .button {
      flex: 1;
      background-color: silver;
      height: 300px;
    }
    .button a {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-decoration: none;
      color: white;
      height: 100%;
    }
    .button img {
      width: 110px;
      margin-bottom: 10px;
    }
    .button h2 {
      margin: 0;
    }
    .button.yellow {
      background-color: gray;
    }
  </style>
</head>
<body>
<br><br>
  <div class="container">
    <h1 class="headline" style="font-size: 70px;">CodeName 404</h1>
  </div>

  <div class="button-container">
    <div class="button">
      <a href="adminloginform.do">
        <img src="images/adminmode.png">
        <h2>관리자 모드</h2>
      </a>
    </div>

    <div class="button yellow">
      <a href="login_form.do">
        <img src="images/normalmember.png">
        <h2>일반회원 모드</h2>
      </a>
    </div>
  </div>
  
<!-- <div align="center">
<h1 class="headline" style="margin-top: 50px;">CodeName 404</h1>
</div>

<div align="center" style="background-color: blue;" width=300>
<a href="login_form.do" >
<img src="images/adminmode.png" width="110">
<h2 style="text-decoration: none">관리자 모드</h2>
</a>
</div>
<br>

<div align="center" style="background-color: yellow; ">
<a href="#" >
<img src="images/normalmember.png" width="110">
<h2 style="text-decoration: none">일반회원 모드</h2>
</a>
</div> -->
</body>
</html>