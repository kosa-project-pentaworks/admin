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
              case "email" :  // 변수 = 상수1이면, 실행문 A실행
                document.querySelector('#search').disabled = false;
                break; // swith{} 코드 블록 탈출
              case "username" :  // 변수 = 상수1이면, 실행문 A실행
                document.querySelector('#search').disabled = false;
                break; // swith{} 코드 블록 탈출

              case "phone" : // 변수 != 상수1 이고, 변수 = 상수2 이면, 실행문 B 실행
                document.querySelector('#search').disabled = false;
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
            <form class="d-flex"  action="/admin/selectUserListAll" method="get">

                         <select class="form-select" name = "searchType" id="searchType" onchange = "searchTypeChange()">
                              <option value="all" <%=searchType.equals("")|| searchType == null?"selected":""%>>회원 전체</option>
                              <option value="email"  <%=searchType.equals("email")?"selected":""%>>이메일</option>
                              <option value="username"  <%=searchType.equals("username")?"selected":""%>>이름</option>
                              <option value="phone"  <%=searchType.equals("phone")?"selected":""%>>전화번호</option>
                         </select>

                            &nbsp;&nbsp;
                          <input class="form-control me-2" type="search"name="search" placeholder="Search"  value="${search}" id="search"  aria-label="Search">
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
                                            <a class="nav-link noto-sans-kr" href="/view/reservationDashboard">병원(지역)</a>
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
                                회원 목록
                            </div>
                            <div class="card-body">
                             <table class="datatable-table">
                                <thead class="table-success">
                                    <tr>
                                        <th>회원번호</th>
                                        <th>이메일</th>
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>주소</th>
                                        <th>가입날짜</th>
                                        <th>상태  </th>
                                    </tr>
                                </thead>
                                    <tbody id="userList" class="table-group-divider">
                                		<c:forEach var="userList" items="${userList}" varStatus="vs">
                                		    <form action="/admin/getUserInfo" method="get">
                                			<tr>
                                			    <td id="userUpdate">
                                                    <button class="startButton btn" name ="paramId" type="submit" data-user-id="${userList.userId}" id="startButton" value="${userList.userId}">
                                                    <c:out value="${userList.userId}"></c:out>
                                                    </button>
                                			    </td>
                                                 <!-- <td><c:out value="${userList.userId}"></c:out></td>  -->
                                                <td><c:out value="${userList.email}"></c:out></td>
                                                <td><c:out value="${userList.username}"></c:out></td>
                                                <td><c:out value="${userList.phoneStr}"></c:out></td>
                                                <td><c:out value="${userList.addressStr}"></c:out></td>
                                                <td><c:out value="${userList.createdAtStr}"></c:out></td>
                                                <td><c:out value="${userList.statusStr}"></c:out></td>
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

</body>

</html>
