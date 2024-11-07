<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- 사이드바 영역 -->
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <!-- 탭 메뉴 -->
                    <li class="nav-item">
                        <a class="nav-link active" id="dashboard1-tab" data-toggle="tab" href="#dashboard1">Dashboard1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="dashboard2-tab" data-toggle="tab" href="#dashboard2">Dashboard2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="dashboard3-tab" data-toggle="tab" href="#dashboard3">Dashboard3</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- 메인 콘텐츠 영역 -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <!-- 탭 콘텐츠 -->
            <div class="tab-content">
                <!-- Dashboard1 (기존 통계 내용) -->
                <div class="tab-pane fade show active" id="dashboard1">
                    <h1 class="h2">Admin Dashboard</h1>

                    <!-- 통계 카드 영역 -->
                    <div class="row mt-4">
                        <div class="col-md-3">
                            <div class="card text-white bg-primary mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Total Users</h5>
                                    <p id="totalUsers" class="card-text">Loading...</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card text-white bg-success mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Active Users</h5>
                                    <p id="activeUsers" class="card-text">Loading...</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card text-white bg-warning mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Total Hospitals</h5>
                                    <p id="totalHospitals" class="card-text">Loading...</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 차트 영역 (예시: 도시별 사용자 수)  -->
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <canvas id="userCountByCityChart"></canvas>
                        </div>
                        <div class="col-md-6">
                            <canvas id="averageRatingByDate"></canvas>
                        </div>
                    </div>
                    <!-- 다른 차트 영역들도 추가 -->

                </div>

                <!-- Dashboard2 (병원 리스트) -->
                <div class="tab-pane fade" id="dashboard2">
                    <h1 class="h2">Hospital List</h1>
                    <!-- 병원 리스트 테이블 -->
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Hospital Name</th>
                                <th scope="col">Location</th>
                                <th scope="col">Rating</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="hospitalList">
                            <!-- 병원 리스트 내용은 AJAX로 로드될 예정 -->
                        </tbody>
                    </table>
                </div>

                <!-- Dashboard3 (예약 리스트) -->
                <div class="tab-pane fade" id="dashboard3">
                    <h1 class="h2">Reservation List</h1>
                    <!-- 예약 리스트 테이블 -->
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Reservation ID</th>
                                <th scope="col">User</th>
                                <th scope="col">Hospital</th>
                                <th scope="col">Date</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody id="reservationList">
                            <!-- 예약 리스트 내용은 AJAX로 로드될 예정 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS, Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 데이터 로딩 및 차트 생성 스크립트 -->
<script>
    $(document).ready(function () {
        // 각 탭에 맞는 데이터 로드

        // Dashboard1 통계 카드 데이터 로딩
        $.get("/admin/totalUsers", function (data) {
            $("#totalUsers").text(data);
        });
        $.get("/admin/activeUsers", function (data) {
            $("#activeUsers").text(data);
        });
        $.get("/admin/totalHospitals", function (data) {
            $("#totalHospitals").text(data);
        });

        // 병원 리스트 로딩 (Dashboard2)
        $.get("/admin/hospitals", function (data) {
            let hospitalList = data.map(item => `
                <tr>
                    <td>${item.name}</td>
                    <td>${item.location}</td>
                    <td>${item.rating}</td>
                    <td><button class="btn btn-info">View</button></td>
                </tr>
            `);
            $("#hospitalList").html(hospitalList.join(''));
        });

        // 예약 리스트 로딩 (Dashboard3)
        $.get("/admin/reservations", function (data) {
            let reservationList = data.map(item => `
                <tr>
                    <td>${item.reservation_id}</td>
                    <td>${item.user}</td>
                    <td>${item.hospital}</td>
                    <td>${item.date}</td>
                    <td>${item.status}</td>
                </tr>
            `);
            $("#reservationList").html(reservationList.join(''));
        });

        // 일별 신규 회원 가입 수 차트 생성
        $.get("/admin/averageRatingByDate", function (data) {
            let dates = data.map(item => item.review_date); // 날짜 배열
            let avgRating = data.map(item => item.avg_rating); // 신규 가입자 수 배열

            // 라인 차트 생성
            new Chart(document.getElementById("averageRatingByDate"), {
                type: "line",
                data: {
                    labels: dates,
                    datasets: [{
                        label: "일별 신규 회원 가입 수",
                        data: avgRating,
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


        // 예시 차트 (도시별 사용자 수)
        $.get("/admin/hospitalAndUserCountByCity", function (data) {
            // 데이터 매핑
            let userCounts = data.map(item => item.user_count);
            let hospitalCounts = data.map(item => item.hospital_count);
            let regions = data.map(item => item.region);

            // Chart.js 차트 생성
            new Chart(document.getElementById("userCountByCityChart"), {
                type: 'bar',
                data: {
                    labels: regions,
                    datasets: [
                        {
                            label: 'User Count',
                            type: 'line',
                            borderColor: '#4BC0C0',
                            backgroundColor: '#4BC0C0',
                            data: userCounts,
                            fill: false,
                            yAxisID: 'y-axis-1'
                        },
                        {
                            label: 'Hospital Count',
                            type: 'bar',
                            backgroundColor: '#565656',
                            data: hospitalCounts,
                            yAxisID: 'y-axis-2'
                        }
                    ]
                },

                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'User and Hospital Count by Region'
                    },
                    scales: {
                        yAxes: [
                            {
                                id: 'y-axis-1',
                                type: 'linear',
                                position: 'left',
                                ticks: {
                                    beginAtZero: true,
                                    callback: function(value) {
                                        return value % 1 === 0 ? value : null; // 정수만 표시
                                    }
                                },
                                scaleLabel: {
                                    display: true,
                                    labelString: 'User Count'
                                }
                            },
                            {
                                id: 'y-axis-2',
                                type: 'linear',
                                position: 'right',
                                ticks: {
                                    beginAtZero: true,
                                    callback: function(value) {
                                        return value % 1 === 0 ? value : null; // 정수만 표시
                                    }
                                },
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Hospital Count'
                                }
                            }
                        ],
                        xAxes: [{
                            ticks: {
                                autoSkip: false
                            }
                        }]
                    }
                }
            });
        });
    });
</script>
</body>
</html>
