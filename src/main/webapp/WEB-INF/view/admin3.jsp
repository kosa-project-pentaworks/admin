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
                        <a class="nav-link active" id="dashboard1-tab" data-toggle="tab" href="#dashboard1" role="tab" aria-controls="dashboard1" aria-selected="true">Dashboard1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="dashboard2-tab" data-toggle="tab" href="#dashboard2" role="tab" aria-controls="dashboard2" aria-selected="false">Dashboard2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="dashboard3-tab" data-toggle="tab" href="#dashboard3" role="tab" aria-controls="dashboard3" aria-selected="false">Dashboard3</a>
                    </li>
                </ul>
            </div>
        </nav>

            <div class="tab-content" id="dashboardTabContent">

                <!-- Dashboard1: 현재 통계 -->
                <div class="tab-pane fade show active" id="dashboard1" role="tabpanel" aria-labelledby="dashboard1-tab">

                    <!-- 메인 콘텐츠 영역 -->
                            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                                <!-- 대시보드 제목 -->
                                 <h1 class="h2">Admin Dashboard</h1>

                                <!-- 통계 카드 영역 -->
                                <div class="row mt-4">
                                    <!-- 전체 사용자 수 카드 -->
                                    <div class="col-md-3">
                                        <div class="card text-white bg-primary mb-3">
                                            <div class="card-body">
                                                <h5 class="card-title">전체 유저</h5>
                                                <!-- 데이터 로딩 영역 -->
                                                <p id="totalUsers" class="card-text">Loading...</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 활성 사용자 수 카드 -->
                                    <div class="col-md-3">
                                        <div class="card text-white bg-success mb-3">
                                            <div class="card-body">
                                                <h5 class="card-title">활성화된 유저</h5>
                                                <p id="activeUsers" class="card-text">Loading...</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 전체 병원 수 카드 -->
                                    <div class="col-md-3">
                                        <div class="card text-white bg-warning mb-3">
                                            <div class="card-body">
                                                <h5 class="card-title">전체 병원</h5>
                                                <p id="totalHospitals" class="card-text">Loading...</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 차트 영역 -->
                                <div class="row mt-4">
                                    <!-- 도시별 사용자 수 차트 -->
                                    <div class="col-md-6">
                                        <canvas id="userCountByCityChart"></canvas>
                                    </div>
                                    <!-- 월별 예약 추이 차트 -->
                                    <div class="col-md-6">
                                        <canvas id="monthlyReservationTrendChart"></canvas>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <!-- 지역별 병원 수 차트 -->
                                    <div class="col-md-6">
                                        <canvas id="hospitalCountByProvinceChart"></canvas>
                                    </div>
                                    <!-- 병원별 평균 리뷰 평점 차트 -->
                                    <div class="col-md-6">
                                        <canvas id="averageRatingByHospitalChart"></canvas>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <!-- 병원별 참석률 차트 -->
                                    <div class="col-md-6">
                                        <canvas id="attendanceRateByHospitalChart"></canvas>
                                    </div>
                                    <!-- 일별 신규 회원 가입 수 차트 -->
                                    <div class="col-md-6">
                                        <canvas id="dailyNewUsersChart"></canvas>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <!-- 리뷰 수 상위 10개 병원 차트 -->
                                    <div class="col-md-6">
                                        <canvas id="top10HospitalsByReviewCountChart"></canvas>
                                    </div>
                                    <!-- 병원별 총 결제 금액 차트 -->
                                    <div class="col-md-6">
                                        <canvas id="totalPaymentAmountByHospitalChart"></canvas>
                                    </div>
                                </div>
                            </main>

                </div>

                <!-- Dashboard2: 병원 관리 리스트 -->
                <div class="tab-pane fade" id="dashboard2" role="tabpanel" aria-labelledby="dashboard2-tab">
                    <h2>Hospital Management</h2>
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

                <!-- Dashboard3: 예약 리스트 조회 -->
                <div class="tab-pane fade" id="dashboard3" role="tabpanel" aria-labelledby="dashboard3-tab">
                    <h2>Reservation List</h2>
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
        </main>
    </div>
</div>

<script>
    $(document).ready(function () {
        // 여기서 필요시 AJAX를 통해 병원 및 예약 데이터 로딩 코드 추가
    });
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<script src="/js/adminDashboard.js"></script>
</html>
