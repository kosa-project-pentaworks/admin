<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%><!-- JSTL -->
            <%

             //selected searchType set

            String searchType = request.getParameter("searchType");

            //System.out.println("searchType ===>"+searchType);

            if(searchType == null) searchType = "";
            String search = request.getParameter("search");
            if (searchType == null || searchType.equals("") || searchType.equals("all")) {
                search = "";
            } else {
                search = search;
            }

             %>

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
                 <style>
                   table, th, td {
                     border: 1px solid #bcbcbc;
                   }

                 </style>


    <script src = "/css/modal.css"></script>
    <script>
        function searchTypeChange(){
           // alert("searchTypeChange()");
           document.querySelector("#search").value = '';
           if(document.querySelector("#searchType").value === 'all'){
                 document.querySelector('#search').disabled = true;
           }
           else{
             document.querySelector('#search').disabled = false;
           }
        }
        function initPage(){
            let searchType = document.querySelector("#searchType").value;

            switch (searchType){

              case "all" :  // 변수 = 상수1이면, 실행문 A실행
                document.querySelector('#search').disabled = true;
            
                break; // swith{} 코드 블록 탈출
              case "yadmNm" :  // 변수 = 상수1이면, 실행문 A실행
                document.querySelector('#search').disabled = false;
                break; // swith{} 코드 블록 탈출
              case "username" :  // 변수 = 상수1이면, 실행문 A실행
                document.querySelector('#search').disabled = false;
                break; // swith{} 코드 블록 탈출

              case "reservationStatus" : // 변수 != 상수1 이고, 변수 = 상수2 이면, 실행문 B 실행
                document.querySelector('#search').disabled = false;
                document.querySelector('#reservationSearch').display = true;
                break; // swith{} 코드 블록 탈출

              default: // 변수 != 상수1 이고, 변수 != 상수2 이면, 실행문 C 실행
                document.querySelector('#search').disabled = true;
            }
        }
     </script>
</head>
    <body class="sb-nav-fixed" onload = "initPage();" >
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-light">
            <!-- Navbar Brand-->
            <!-- <a class="navbar-brand ps-3" href="/view/index">Start Bootstrap</a> -->
            <a class="navbar-brand ps-3 text-dark noto-sans-kr" href="/view/admin2">관리자</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-flex"  action="/admin/selectHospitalReservationListAll" method="get">

                         <select class="form-select" name = "searchType" id="searchType" onchange = "searchTypeChange()">
                              <option value="all" <%=searchType.equals("")|| searchType == null?"selected":""%>>진료 예약 전체</option>
                              <option value="yadmNm"  <%=searchType.equals("yadmNm")?"selected":""%>>병원</option>
                              <option value="username"  <%=searchType.equals("username")?"selected":""%>>회원이름</option>
                              <option value="reservationStatus"  <%=searchType.equals("reservationStatus")?"selected":""%>>예약상태</option>
                         </select>


                            &nbsp;&nbsp;
                          <input style="display:block;" class="form-control me-2" type="search"name="search" placeholder="Search" id="search"  value="${search}"  aria-label="Search">

                          <!-- 온클릿  서브밋-->
                          <button class="btn btn-outline-success" type="submit" id="searchButton" >Search</button>
            </form>
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
                            <!-- <div class="sb-sidenav-menu-heading noto-sans-kr">관리</div> -->
                                    <a class="nav-link disabled noto-sans-kr"  data-bs-target="#pagesCollapseError" aria-expanded="true" aria-controls="pagesCollapseError">
                                        관리
                                    </a>
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link noto-sans-kr" href="/admin/selectUserListAll">회원</a>
                                            <a class="nav-link noto-sans-kr" href="/view/hospitalReservatioList">진료 예약</a>
                                        </nav>

                            <%-- <div class="sb-sidenav-menu-heading">통계</div> --%>
                                    <a class="nav-link disabled noto-sans-kr"  data-bs-target="#pagesCollapseError" aria-expanded="true" aria-controls="pagesCollapseError">
                                        통계
                                    </a>
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link noto-sans-kr" href="/view/userdashboard">회원(활동/비활동)</a>
                                            <a class="nav-link noto-sans-kr" href="/view/reservationDashboard">진료 예약(요일별)</a>
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
                                진료 예약 목록
                            </div>
                            <div class="card-body">
                             <table class="datatable-table">
                                <thead class="table-success">
                                    <tr>
                                        <th>예약번호</th>
                                        <th>병원</th>
                                        <th>회원번호</th>
                                        <th>회원이름</th>
                                        <th>예약날짜</th>
                                        <th>예약시간</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                    <tbody id="userList" class="table-group-divider">
                                		<c:forEach var="reservationList" items="${reservationList}" varStatus="vs">
                                		    <form action="/admin/getReservationInfo" method="get">
                                			<tr>
                                			    <td id="userUpdate">
                                                    <button class="startButton btn" name ="paramId" type="submit" data-user-id="${reservationList.hospReservationId}" id="startButton" value="${reservationList.hospReservationId}">
                                                    <c:out value="${reservationList.hospReservationId}"></c:out>
                                                    </button>
                                			    </td>
                                                 <!-- <td><c:out value="${userList.userId}"></c:out></td>  -->
                                                <td><c:out value="${reservationList.yadmNm}"></c:out></td>
                                                <td><c:out value="${reservationList.userId}"></c:out></td>
                                                <td><c:out value="${reservationList.username}"></c:out></td>
                                                <td><c:out value="${reservationList.reservationAt}"></c:out></td>
                                                <td><c:out value="${reservationList.reservationTime}"></c:out></td>
                                                <td><c:out value="${reservationList.reservationStatus}"></c:out></td>
                                            <!-- 모달 창 -->
                                            <!-- <div id="modal" class="modal"   role="dialog" style="display: none;">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">회원 관리</h5>
                                                            <button type="button" class="btn btn-secondary" aria-label="Close">
                                                                <span aria-hidden="true" data-bs-dismiss="modal">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                                <a ><c:out value="${userList.userId}"></c:out></a>
                                                        </div>
                                                        <div id="modalId${vs.index}" class="modal-body">

                                                        모달 내용 ${userList.userId} 입니다.

                                                        </div>
                                                  </div>
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                                  </div>
                                                </div>
                                            </div> -->
                                			</tr>
                                			</form>
                                		</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
<!--    <script src = "/js/user.js"></script> -->
    <script>


    </script>

</body>

<%--    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

     <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   --%>
           <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="/js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
            <script src="/assets/demo/chart-area-demo.js"></script>
            <script src="/assets/demo/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
            <script src="/js/datatables-simple-demo.js"></script>
</html>
