<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>






<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    font-family: 'Montserrat', sans-serif;
}

p {
    margin: 0;
}

.topnav a {
    float: left;
    display: block;
    color: #8d8b8b;
    font-weight: 800;
    font-size: 14px;
    text-transform: uppercase;
    padding: 14px 10px;
    text-decoration: none;
    border-bottom: 3px solid transparent;
}

.topnav a:hover {
    color: black;
    border-bottom: 3px solid red;
}

.topnav .active {
    color: black;
    border-bottom: 3px solid red;
}

.category .job {
    height: 280px;
    border: 1px solid transparent;
    padding: 30px 19px 25px 19px;
    border-radius: 5px;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.category .job:hover {
    border: 1px solid #0d6efd;
}

.category .job span {
    padding: 6px 20px;
    font-weight: 400;
    border-radius: 26px;
    display: inline-block;
}

.category .job .colors1 {
    font-weight: 800;
    color: #F27E42;
    background: #f27e4242;
}

.category .job .colors2 {
    font-weight: 800;
    color: #4294F2;
    background: rgba(66, 148, 255, 0.26);
}

.category .job .colors3 {
    font-weight: 800;
    color: #2EB98D;
    background: rgba(46, 185, 141, 0.03);
}

.category .job .colors4 {
    font-weight: 800;
    color: #6A42F2;
    background: rgba(106, 66, 242, 0.07);
}

.category .job .colors5 {
    font-weight: 800;
    color: #F162BC;
    background: rgba(241, 98, 188, 0.07);
}

.category .job .colors2 {
    font-weight: 800;
    color: #4294F2;
    background: rgba(66, 148, 255, 0.26);
}

a {
    text-decoration: none;
    font-size: 20px;
    font-weight: 600;
    color: #071112;
    text-transform: capitalize;
    margin-bottom: 17px;
    display: block;
}

.place {
    display: flex;
    align-items: center;
    font-size: 12px;
    padding-left: 0px;
    color: #76787A;
}

.left {
    font-weight: 800;
}

.category .job span.time {
    font-weight: 900;
}

.btn.btn-primary {
    width: 150px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}


.mt-30 {
    margin-top: 30px;
}

.mb-30 {
    margin-bottom: 30px;
}

</style>

<link rel="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
<link rel="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<script scr="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script scr="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">JobLabs</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav topnav  ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">All<span>categoryegories</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Creative</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Programming</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Corporate</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Finance</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Medical</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Marketing</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="category mb-30">
                    <div class="job">
                        <span class="colors1 mb-4">Creative &amp; Art</span>
                        <h5><a href="#">User Experience Designer Employee</a></h5>
                        <ul class="place">
                            <li>
                                <p><i class="fas fa-map-marker-alt pe-2"></i> New York, USA</p>
                            </li>
                            <li>
                                <p class="ps-5"><i class="fas fa-map-marker-alt pe-2"></i>Full Time</p>
                            </li>
                        </ul>
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="left">
                                <p>Globe Solution Ltd.</p>
                            </div>
                            <span class="time">2h ago</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="category mb-30">
                    <div class="job">
                        <span class="colors2 mb-4">Finance &amp; Accounting</span>
                        <h5><a href="#">Foreign Language Research Analyst</a></h5>
                        <ul class="place">
                            <li>
                                <p><i class="fas fa-map-marker-alt pe-2"></i> New York, USA</p>
                            </li>
                            <li>
                                <p class="ps-5"><i class="fas fa-map-marker-alt pe-2"></i>Full Time</p>
                            </li>
                        </ul>
                        <div class="pricing d-flex justify-content-between align-items-center">
                            <div class="left">
                                <p>Globe Solution Ltd.</p>
                            </div>
                            <span class="time">2h ago</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="category mb-30">
                    <div class="job">
                        <span class="colors3 mb-4">Medical</span>
                        <h5><a href="#">Medical Assistant, East Valley Primary Care</a></h5>
                        <ul class="place">
                            <li>
                                <p><i class="fas fa-map-marker-alt pe-2"></i> New York, USA</p>
                            </li>
                            <li>
                                <p class="ps-5"><i class="fas fa-map-marker-alt pe-2"></i>Full Time</p>
                            </li>
                        </ul>
                        <div class="pricing d-flex justify-content-between align-items-center">
                            <div class="left">
                                <p>Globe Solution Ltd.</p>
                            </div>
                            <span class="time">2h ago</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="category mb-30">
                    <div class="job">
                        <span class="colors4 mb-4">Corporate</span>
                        <h5><a href="#">Foreign Language Research Analyst</a></h5>
                        <ul class="place">
                            <li>
                                <p><i class="fas fa-map-marker-alt pe-2"></i> New York, USA</p>
                            </li>
                            <li>
                                <p class="ps-5"><i class="fas fa-map-marker-alt pe-2"></i>Full Time</p>
                            </li>
                        </ul>
                        <div class="pricing d-flex justify-content-between align-items-center">
                            <div class="left">
                                <p>Globe Solution Ltd.</p>
                            </div>
                            <span class="time">2h ago</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="category mb-30">
                    <div class="job">
                        <span class="colors5 mb-4">Marketing</span>
                        <h5><a href="#">User Experience Designer Employee</a></h5>
                        <ul class="place">
                            <li>
                                <p><i class="fas fa-map-marker-alt pe-2"></i> New York, USA</p>
                            </li>
                            <li>
                                <p class="ps-5"><i class="fas fa-map-marker-alt pe-2"></i>Full Time</p>
                            </li>
                        </ul>
                        <div class="pricing d-flex justify-content-between align-items-center">
                            <div class="left">
                                <p>Globe Solution Ltd.</p>
                            </div>
                            <span class="time">2h ago</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="category mb-30">
                    <div class="job">
                        <span class="colors2 mb-4">Programming &amp; IT</span>
                        <h5><a href="#">Medical Assistant, East Valley Primary Care</a></h5>
                        <ul class="place">
                            <li>
                                <p><i class="fas fa-map-marker-alt pe-2"></i> New York, USA</p>
                            </li>
                            <li>
                                <p class="ps-5"><i class="fas fa-map-marker-alt pe-2"></i>Full Time</p>
                            </li>
                        </ul>
                        <div class="pricing d-flex justify-content-between align-items-center">
                            <div class="left">
                                <p>Globe Solution Ltd.</p>
                            </div>
                            <span class="time">2h ago</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 d-flex align-items-center justify-content-center">
                <div class="btn btn-primary mb-30">
                    <span>Find More</span>
                    <span class="fas fa-arrow-right"></span>
                </div>
            </div>
        </div>
    </div>


</body>
</html>