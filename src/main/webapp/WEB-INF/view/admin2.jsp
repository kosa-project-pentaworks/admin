<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%><!-- JSTL -->


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />

<!-- =================================== Bootstrap ============================================ -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원 목록</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


<!-- =================================== CSS ============================================ -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
</style>

 <!-- =================================== Chart.js ============================================ --> 

</head>

<body class="sb-nav-fixed">

<!-- =================================== Left Menu ============================================ -->
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-light">
    <!-- Navbar Brand-->
    <!-- <a class="navbar-brand ps-3" href="/view/index">Start Bootstrap</a> -->
    <a class="navbar-brand ps-3 text-dark noto-sans-kr" href="/view/admin2">관리자</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>


    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#!">Settings</a></li>
                <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="#!">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>

<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <a class="nav-link disabled noto-sans-kr"  data-bs-target="#pagesCollapseError" aria-expanded="true" aria-controls="pagesCollapseError">
                    관리
                    </a>
                    <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link noto-sans-kr" href="/admin/selectUserListAll">회원 </a>
                    <a class="nav-link noto-sans-kr" href="/view/hospitalReservatioList">진료 예약</a>
                    </nav>

                    <a class="nav-link disabled noto-sans-kr"  data-bs-target="#pagesCollapseError" aria-expanded="true" aria-controls="pagesCollapseError">
                    통계
                    </a>
                    <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link noto-sans-kr" href="/view/userdashboard">회원(활동/비활동)</a>
                    <a class="nav-link noto-sans-kr" href="/view/reservationDashboard">진료 예약(요일별)</a>
                    </nav>
                </div>
            </div>
        </nav>
    </div>
</div>

<!-- =================================== Contents : Chart ============================================ -->
<div id="layoutSidenav_content">
    <main>
    <br/>
        <div class="container-fluid px-4">
            <!-- 내용  -->
            <a>1내용</a>

            <div class="graphBox">
            <canvas id="lineCanvas" width="384" height="210"></canvas>
            </div>

         </div>
    </main>
</div>

</body>
</html>
