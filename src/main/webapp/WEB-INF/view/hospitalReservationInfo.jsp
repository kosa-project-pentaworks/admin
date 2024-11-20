<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%><!-- JSTL -->
<!DOCTYPE html>
<html lang="ko">
<head>
<%--
    <meta charset="UTF-8">
    <title>회원 목록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    --%>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>회원 목록</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
             <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
             <style>
             @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
             </style>



</head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-light">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3 text-dark noto-sans-kr" href="/admin/selectUserListAll">관리자</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <!--
            <form class="d-flex"  action="/admin/selectUserListAll" method="get">

                            <select class="form-select" name ="searchType" id="searchType">
                              <option value="all">회원 전체 검색</option>
                              <option value="email">이메일</option>
                              <option value="username">이름</option>
                              <option value="phone">전화번호</option>
                            </select>

                            &nbsp;&nbsp;
                          <input class="form-control me-2" type="search"name="search" placeholder="Search" id="search" aria-label="Search">
                          <button class="btn btn-outline-success" type="submit" id="searchButton" >Search</button>
            </form>
            -->
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
                                            <a class="nav-link noto-sans-kr" href="/admin/selectHospitalReservationListAll">진료 예약</a>
                                        </nav>

                                    <a class="nav-link disabled noto-sans-kr"  data-bs-target="#pagesCollapseError" aria-expanded="true" aria-controls="pagesCollapseError">
                                        통계
                                    </a>
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link noto-sans-kr" href="/admin/userdashboard">회원(활동/비활동)</a>
                                            <a class="nav-link noto-sans-kr" href="/admin/reservationDashboard">병원(지역)</a>
                                            <a class="nav-link noto-sans-kr" href="/admin/selectYearmonthCount">진료예약(기간)</a>
                                        </nav>

                        </nav>
                    </div>
            <div id="layoutSidenav_content">
                <main>
                    <br/>
                    <div class="container-fluid px-4">
                         <!-- 내용  -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                진료 예약 정보
                            </div>

                            <form action="/admin/reservation/update" method="post">
                                <div class="card-body ">
                                    <table style="width:60%;" class="datatable-table table-align-center">
                                        <thead class="table-success">
                                                <tr>
                                                    <th>항목</th>
                                                    <th>정보</th>
                                                </tr>
                                        </thead>

                                        <tbody id="userList" class="table-group-divider">

                                            <tr>
                                                <td style="width:30%;">예약번호</td>
                                                <td><input style="width:100%;" type="text" name="hospReservationId" value = "${reservation.hospReservationId}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td>병원</td>
                                                <td	><input style="width:100%;" type="email" name="yadmNm"  value = "${reservation.yadmNm}" readonly > </td>
                                            </tr>
                                            <tr>
                                                <td>회원번호</td>
                                                <td><input style="width:100%;" type="text" name="userId" value = "${reservation.userId}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td>회원이름</td>
                                                <td ><input style="width:100%;" type="text" name="username" value = "${reservation.username}" readonly></td>
                                            <!--   <td><div> ${user.addressStr}</div> </td> -->
                                            </tr>
                                            <tr>
                                                <td>예약날짜</td>
                                                <td><input style="width:100%;" type="text" name="reservationAt" value = "${reservation.reservationAt}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td>예약시간</td>
                                                <td><input style="width:100%;" type="text" name="reservationTime" value = "${reservation.reservationTime}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td>상태</td>
                                                <td>
                                                <input type="radio" name="reservationStatus" value="SUCCESS" <c:out value="${reservation.reservationStatus == '예약' ? 'checked' : ''}"/>>&nbsp;<a>예약확인</a>
                                                &nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="reservationStatus" value="CANCELLED" <c:out value="${reservation.reservationStatus == '취소' ? 'checked' : ''}"/>>&nbsp;<a>예약취소</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                </table>
                                <div class="text-align-center">
                                    <input type="submit" value="수정">&nbsp;<input type="reset" value="취소">
                                </div>
                                <br/>
                            </div>
                            </form>
                                <!--
                                <div>
                                    <button onclick="history.back()">Back</button>
                                </div>
                                -->
                        </div>
                    </div>
                </main>
            </div>
</body>

</html>
