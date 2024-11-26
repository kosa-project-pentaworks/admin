<!-- ////////////////////////////////////////////////////////////////////////////// -->
<!-- // JSP                                                                    // -->
<!-- ////////////////////////////////////////////////////////////////////////////// -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- ////////////////////////////////////////////////////////////////////////////// -->
<!-- // Meta                                                                    // -->
<!-- ////////////////////////////////////////////////////////////////////////////// -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>회원 목록</title>

<!-- //////////////////////////////////////////////////////.//////////////////////// -->
<!-- // BootStrap Lib                                                                 // -->
<!-- ////////////////////////////////////////////////////////////////////////////// -->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- ////////////////////////////////////////////////////////////////////////////// -->
<!-- // Etc.                                                                    // -->
<!-- ////////////////////////////////////////////////////////////////////////////// -->
    <!-- =============== Google Font ================ -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
    </style>

<!-- ////////////////////////////////////////////////////////////////////////////// -->
<!-- // Jquery.                                                                    // -->
<!-- ////////////////////////////////////////////////////////////////////////////// -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        
    </script>

</head>
<body class="sb-nav-fixed">

<!-- ////////////////////////////////////////////////////////////////////////////// -->
<!-- // Left Menu                                                                // -->
<!-- ////////////////////////////////////////////////////////////////////////////// -->

    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-light">
        <!-- Navbar Brand-->
        <!-- <a class="navbar-brand ps-3" href="/view/index">Start Bootstrap</a> -->

        <a class="navbar-brand ps-3 text-dark noto-sans-kr" href="/admin/selectUserListAll">관리자</a>

        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>

        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;

        <button class="btn btn-outline-success"><a class="dropdown-item" href="/admin/loginOut">Logout</a></button>
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
                        <a class="nav-link noto-sans-kr" href="/admin/selectHospitalListAll">병원</a>
                        <a class="nav-link noto-sans-kr" href="/admin/selectHospitalReservationListAll">진료 예약</a>

                        </nav>

                        <a class="nav-link disabled noto-sans-kr"  data-bs-target="#pagesCollapseError" aria-expanded="true" aria-controls="pagesCollapseError">
                        통계
                        </a>
                        <nav class="sb-sidenav-menu-nested nav">

                        <a class="nav-link noto-sans-kr" href="/admin/userdashboard">회원(활동/비활동)</a>
                        <a class="nav-link noto-sans-kr" href="/admin/reservationDashboard">병원(지역)</a>
                        <a class="nav-link noto-sans-kr" href="/admin/selectYearmonthCount">진료예약(6개월)</a>
                        <a class="nav-link noto-sans-kr" href="/admin/selectReservationCount">진료예약(병원)</a>

                        </nav>
                    </div>
                </div>
            </nav>
        </div>



<!-- ////////////////////////////////////////////////////////////////////////////// -->
<!-- // Body                                                                     // -->
<!-- ////////////////////////////////////////////////////////////////////////////// -->

    <div id="layoutSidenav_content">
        <main>
            <br/>
            <div class="container-fluid px-4">
                <!-- 내용  -->

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        진료예약(최근 6개월)
                    </div>

                    <div class="bar" style=" width:50%">
                        <canvas id="myBarChart"></canvas>
                    </div>
                    <br/>
                    <table  style="width:50%;" class="datatable-table table-align-center">
                        <!-- <thead class="table-success">
                                <tr>
                                    <th style="width:50%;">항목</th>
                                    <th>데이터</th>
                                </tr>
                        </thead> -->

                        <tbody  class="table-group-divider">

                            <tr>

                                <% 
                                    
                                    List<String> yearmonthList = (List<String>)request.getAttribute("yearmonth");
                                    for(int i=0; i<yearmonthList.size(); i++) {
                                        out.println("<td>"+ yearmonthList.get(i) +"</td>");	 
                                    } 
                                    out.println("<td  style='width:15%; background-color:  #e9ecef'>합계</td>");

                                %>
                            </tr>
                            <tr>
                                <% 
                                int totalsidocnt = 0;
                                List<Integer> sidoCntList = (List<Integer>)request.getAttribute("cnt");

                                for(int i=0; i<sidoCntList.size(); i++) {
                                    out.println("<td>"+ sidoCntList.get(i) +"</td>");	
                                    totalsidocnt = totalsidocnt + sidoCntList.get(i);
                                } 
                                String totalsidocntStr = String.format("%,d", totalsidocnt);
                                out.println("<td style='background-color:  #e9ecef'>"+totalsidocntStr+"</td>");
                                %>
                                 
                            </tr>
                        </tbody>
                </table>
                </div>
            </div>
        </main>
    </div>
</div>


<!-- ////////////////////////////////////////////////////////////////////////////// -->
<!-- // Chart                                                                   // -->
<!-- ////////////////////////////////////////////////////////////////////////////// -->

    <!-- ========== Lib ========== -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- ========== Chart ========== -->
    <script>
            

            let data = '${yearmonth}';
            // cnt
             let cnt = '${cnt}';
             let testString = data.replace("[", "").replace("]","");
             let cntString2 = cnt.replace("[", "").replace("]","");
             const arr1= testString.split(',');
             const cntarr2= cntString2.split(',');
            console.log(arr1);
            console.log(cntarr2);




            
// ['인천','경기','경남','부산','전북','서울','울산','충남','경북','대구','광주','강원','전남','충북','대전','제주','세종시']
        //  [63,290,114,160,75,109,37,66,104,72,61,32,79,36,45,11,4],
                    
            const ctx = document.querySelector('#myBarChart').getContext('2d');
            const myBarChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels:arr1,
                    datasets: [
                    {

                        label: 'Dataset 1',
                        type: 'line',
                        data: cntarr2,
                        // borderColor: 'rgba(75, 192, 192, 1)' // black
                        // borderColor: 'rgba(0, 0, 225, 1)' // blue 
                        borderColor: 'rgba(75, 192, 192, 1)' // light green

                    },
                                    
                    {
                        label: 'Color Votes',
                        data: cntarr2,
                        backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
    

                        ],
                        borderColor: [
                        'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'

                        ],
                        borderWidth: 1,
                        hoverBackgroundColor: [
                        'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
    
                        ]
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                            
                        }
                        
                    }
                }
            });

    </script>

</body>
</html>