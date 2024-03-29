<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<style>
/* NeoBrutalism style  */
/* source : https://www.codewithfaraz.com/content/61/how-to-create-neobrutalism-sign-up-form-using-html-and-css-only */
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700,800,900');

*{
    margin: 0;
    padding: 0;
}

body{
    font-family: 'Poppins', sans-serif;
    height: 100vh;
    width: 100vw;
    background: #7b4397;
}

.container{
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    text-align: center;
}

.form_area{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background-color: #fff;
    height: auto;
    width: auto;
    border-radius: 20px;
    box-shadow: 30px 35px 2px #52206b;
}

.title{
    color: #7b4397;
    font-weight: 900;
    font-size: 1.5em;
    margin-top: 20px;
}

.sub_title{
    font-weight: 600;
    margin: 5px 0;
}

.form_group{
    display: flex;
    flex-direction: column;
    align-items: baseline;
    margin: 20px;
}

.form_style{
    outline: none;
    border: 2px solid #000;
    box-shadow: 3px 4px 0px 1px #000;
    width: 290px;
    padding: 12px 10px;
    border-radius: 4px;
    font-size: 15px;
}

.form_style:focus, .btn:focus{
    transform: translateY(4px);
    box-shadow: 1px 2px 0px 0px #000;
}

.btn{
    padding: 15px;
    margin: 30px 0px;
    width: 310px;
    font-size: 15px;
    background: #7b4397;
    border-radius: 30px;
    font-weight: 800;
    box-shadow: 5px 5px 0px 0px #000;
}

p{
    margin: 20px 0px;
}

.link{
    font-weight: 800;
}
</style>
</head>
<body class="container">
    <div class="form_area">
        <h4 class="title">SIGN UP</h4>
        <form action="">
            <div class="form_group">
                <label for="name" class="sub_title">Name</label>
                <input type="text" class="form_style" id="name" placeholder="Enter your full name">
            </div>
            <div class="form_group">
                <label for="email" class="sub_title">Email</label>
                <input type="email" class="form_style" id="email" placeholder="Enter your email" />
            </div>
            <div class="form_group">
                <label for="password" class="sub_title">Password</label>
                <input type="password" class="form_style" id="password" placeholder="Enter your password" />
            </div>
            <div>
                <button class="btn">SIGN UP!</button>
                <p>Have an Account? <a href="" class="link">Login Here!</p>
            </div>
        </form>
    </div>
</body>
</html>