<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-11
  Time: 오후 2:52
--%>
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

<!-- 전체 컨테이너 -->
<div class="container-fluid">
    <div class="row">
        <!-- 사이드바 영역 -->
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <!-- 사이드바 콘텐츠 -->
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <!-- 대시보드 링크 -->
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Dashboard1</a>
                    </li>
                    <!-- 대시보드 링크 -->
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Dashboard2</a>
                    </li>
                    <!-- 대시보드 링크 -->
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Dashboard3</a>
                    </li>
                </ul>
            </div>
        </nav>

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
                            <h5 class="card-title">Total Users</h5>
                            <!-- 데이터 로딩 영역 -->
                            <p id="totalUsers" class="card-text">Loading...</p>
                        </div>
                    </div>
                </div>
                <!-- 활성 사용자 수 카드 -->
                <div class="col-md-3">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Active Users</h5>
                            <p id="activeUsers" class="card-text">Loading...</p>
                        </div>
                    </div>
                </div>
                <!-- 전체 병원 수 카드 -->
                <div class="col-md-3">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Total Hospitals</h5>
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
            <div class="row mt-4">
                <!-- 혼합 차트 -->
                <div class="col-md-6">

                    <canvas id="hospitalAndUserCountByProvinceChart"></canvas>
                </div>
            </div>

        </main>
    </div>
</div>

<!-- 스크립트 영역: 데이터 로딩 및 차트 생성 -->
<script>
    // 페이지가 로드되면 실행되는 함수
    $(document).ready(function () {

        // 전체 사용자 수를 가져와서 표시
        $.get("/admin/totalUsers", function (data) {
            $("#totalUsers").text(data);
        });

        // 활성 사용자 수를 가져와서 표시
        $.get("/admin/activeUsers", function (data) {
            $("#activeUsers").text(data);
        });

        // 전체 병원 수를 가져와서 표시
        $.get("/admin/totalHospitals", function (data) {
            $("#totalHospitals").text(data);
        });

        // 도시별 사용자 수 차트 생성
        $.get("/admin/userCountByCity", function (data) {
            let cities = data.map(item => item.city); // 도시 이름 배열
            let userCounts = data.map(item => item.user_count); // 사용자 수 배열

            // 바 차트 생성
            new Chart(document.getElementById("userCountByCityChart"), {
                type: "bar",
                data: {
                    labels: cities,
                    datasets: [{
                        label: "User Count by City",
                        data: userCounts,
                        backgroundColor: 'rgba(54, 162, 235, 0.6)' // 막대 색상
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false // 차트의 종횡비 유지
                }
            });
        });

        // 월별 예약 추이 차트 생성
        $.get("/admin/monthlyReservationTrend", function (data) {
            let months = data.map(item => item.month); // 월 배열
            let reservationCounts = data.map(item => item.reservation_count); // 예약 수 배열

            // 라인 차트 생성
            new Chart(document.getElementById("monthlyReservationTrendChart"), {
                type: "line",
                data: {
                    labels: months,
                    datasets: [{
                        label: "Monthly Reservation Trend",
                        data: reservationCounts,
                        backgroundColor: 'rgba(255, 206, 86, 0.6)',
                        fill: false,
                        borderColor: 'rgba(255, 206, 86, 1)' // 선 색상
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        });

        // 지역별 병원 수 차트 생성
        $.get("/admin/hospitalCountByProvince", function (data) {
            let provinces = data.map(item => item.province); // 지역 이름 배열
            let hospitalCounts = data.map(item => item.hospital_count); // 병원 수 배열

            // 파이 차트 생성
            new Chart(document.getElementById("hospitalCountByProvinceChart"), {
                type: "pie",
                data: {
                    labels: provinces,
                    datasets: [{
                        label: "Hospital Count by Province",
                        data: hospitalCounts,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.6)',
                            'rgba(54, 162, 235, 0.6)',
                            'rgba(255, 206, 86, 0.6)',
                            'rgba(75, 192, 192, 0.6)',
                            'rgba(153, 102, 255, 0.6)',
                            'rgba(255, 159, 64, 0.6)'
                            // 필요에 따라 색상 추가
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        });

        // 병원별 평균 리뷰 평점 차트 생성
        $.get("/admin/averageRatingByHospital", function (data) {
            let hospitals = data.map(item => item.hospital_name); // 병원 이름 배열
            let ratings = data.map(item => item.average_rating); // 평균 평점 배열

            // 바 차트 생성
            new Chart(document.getElementById("averageRatingByHospitalChart"), {
                type: "bar",
                data: {
                    labels: hospitals,
                    datasets: [{
                        label: "Average Rating by Hospital",
                        data: ratings,
                        backgroundColor: 'rgba(153, 102, 255, 0.6)'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        });

        // 병원별 참석률 차트 생성
        $.get("/admin/attendanceRateByHospital", function (data) {
            let hospitals = data.map(item => item.hospital_name); // 병원 이름 배열
            let attendanceRates = data.map(item => item.attendance_rate); // 참석률 배열

            // 바 차트 생성
            new Chart(document.getElementById("attendanceRateByHospitalChart"), {
                type: "bar",
                data: {
                    labels: hospitals,
                    datasets: [{
                        label: "Attendance Rate (%)",
                        data: attendanceRates,
                        backgroundColor: 'rgba(255, 159, 64, 0.6)'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        });

        // 일별 신규 회원 가입 수 차트 생성
        $.get("/admin/dailyNewUsers", function (data) {
            let dates = data.map(item => item.date); // 날짜 배열
            let newUsers = data.map(item => item.new_users); // 신규 가입자 수 배열

            // 라인 차트 생성
            new Chart(document.getElementById("dailyNewUsersChart"), {
                type: "line",
                data: {
                    labels: dates,
                    datasets: [{
                        label: "Daily New Users",
                        data: newUsers,
                        backgroundColor: 'rgba(75, 192, 192, 0.6)',
                        fill: false,
                        borderColor: 'rgba(75, 192, 192, 1)'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        });

        // 리뷰 수 상위 10개 병원 차트 생성
        $.get("/admin/top10HospitalsByReviewCount", function (data) {
            let hospitals = data.map(item => item.hospital_name); // 병원 이름 배열
            let reviewCounts = data.map(item => item.review_count); // 리뷰 수 배열

            // 바 차트 생성
            new Chart(document.getElementById("top10HospitalsByReviewCountChart"), {
                type: "bar",
                data: {
                    labels: hospitals,
                    datasets: [{
                        label: "Top 10 Hospitals by Review Count",
                        data: reviewCounts,
                        backgroundColor: 'rgba(255, 99, 132, 0.6)'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        });

        // 병원별 총 결제 금액 차트 생성
        $.get("/admin/totalPaymentAmountByHospital", function (data) {
            let hospitals = data.map(item => item.hospital_name); // 병원 이름 배열
            let totalAmounts = data.map(item => item.total_amount); // 총 결제 금액 배열

            // 바 차트 생성
            new Chart(document.getElementById("totalPaymentAmountByHospitalChart"), {
                type: "bar",
                data: {
                    labels: hospitals,
                    datasets: [{
                        label: "Total Payment Amount by Hospital",
                        data: totalAmounts,
                        backgroundColor: 'rgba(54, 162, 235, 0.6)'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        });

        // 지역별 병원 수와 사용자 수 차트 생성
        $.get("/admin/hospitalAndUserCountByProvince", function (data) {
            let provinces = data.map(item => item.province); // 지역 이름 배열
            let hospitalCounts = data.map(item => item.hospital_count); // 병원 수 배열
            let userCounts = data.map(item => item.user_count); // 사용자 수 배열

            // 혼합형 차트 생성
            new Chart(document.getElementById("hospitalAndUserCountByProvinceChart"), {
                type: "bar",
                data: {
                    labels: provinces,
                    datasets: [
                        {
                            label: "Hospital Count",
                            type: "bar",
                            data: hospitalCounts,
                            backgroundColor: 'rgba(54, 162, 235, 0.6)' // 병원 수 막대 색상
                        },
                        {
                            label: "User Count",
                            type: "line",
                            data: userCounts,
                            borderColor: 'rgba(255, 99, 132, 1)', // 사용자 수 선 색상
                            fill: false
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });

    });
</script>
</body>
</html>
