<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 메타 정보와 외부 라이브러리 로드 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS: 대시보드 레이아웃 및 스타일링 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Chart.js: 차트 생성을 위한 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- jQuery: AJAX 요청 및 DOM 조작을 위한 라이브러리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column nav-tabs" id="dashboardTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="dashboard1-tab" data-toggle="tab" href="#dashboard1" role="tab" aria-controls="dashboard1" aria-selected="true">통계</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="dashboard2-tab" data-toggle="tab" href="#dashboard2" role="tab" aria-controls="dashboard2" aria-selected="false">병원</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="dashboard3-tab" data-toggle="tab" href="#dashboard3" role="tab" aria-controls="dashboard3" aria-selected="false">회원</a>
                    </li>
                </ul>
            </div>
        </nav>

            <div class="tab-content" id="dashboardTabContent">

                <!-- Dashboard1: 현재 통계 -->
                <div class="tab-pane fade show active" id="dashboard1" role="tabpanel" aria-labelledby="dashboard1-tab">

                    <!-- 메인 콘텐츠 영역 -->
                    <!-- 대시보드 제목 -->
                    <h1 class="h2">통계 대시보드</h1>
                            <!-- Dashboard3: 예약 리스트 조회 -->
                            <div  id="reservation" role="tabpanel">
                                <h2>예약 List</h2>
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Reservation ID</th>
                                        <th>Patient Name</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- 예약 리스트 데이터 로드 -->
                                    </tbody>
                                </table>
                            </div>
                </div>

                <!-- Dashboard2: 병원 관리 리스트 -->
                <div class="tab-pane fade" id="dashboard2" role="tabpanel" aria-labelledby="dashboard2-tab">
                    <h2>병원 Management</h2>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Hospital Name</th>
                            <th>Location</th>
                            <th>Contact</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 병원 리스트 데이터 로드 -->
                        </tbody>
                    </table>
                </div>

                <!-- Dashboard3: 회원 리스트 조회 -->
                <div class="tab-pane fade" id="dashboard3" role="tabpanel" aria-labelledby="dashboard3-tab">
                    <h2>회원 리스트</h2>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>User ID</th>
                            <th>User Name</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 예약 리스트 데이터 로드 -->
                        </tbody>
                    </table>
                </div>

            </div>
        </main>
    </div>
</div>

<script>

</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<!-- <script src="/js/admin.js"></script> -->
</html>
