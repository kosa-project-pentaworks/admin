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

                    <!-- 차트 영역 (예시: 도시별 사용자 수) -->
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <canvas id="userCountByCityChart"></canvas>
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

        // 예시 차트 (도시별 사용자 수)
        $.get("/admin/userCountByCity", function (data) {
            let cities = data.map(item => item.city);
            let userCounts = data.map(item => item.user_count);

            new Chart(document.getElementById("userCountByCityChart"), {
                type: "bar",
                data: {
                    labels: cities,
                    datasets: [{
                        label: "User Count by City",
                        data: userCounts,
                        backgroundColor: 'rgba(54, 162, 235, 0.6)'
                    }]
                }
            });
        });
    });
</script>
</body>
</html>
