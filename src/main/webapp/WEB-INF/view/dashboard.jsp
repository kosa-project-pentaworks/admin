<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2024-09-11
  Time: 오후 2:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 대시보드</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .statistics-summary {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin: 20px 0;
        }
        .stat-box {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            text-align: center;
        }
        .charts {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>병원 통계 대시보드</h1>

        <div class="statistics-filters">
            <input type="date" id="startDate">
            <input type="date" id="endDate">
            <button onclick="loadStatistics()">조회</button>
        </div>

        <div class="statistics-summary">
            <div class="stat-box">
                <h3>전체 예약</h3>
                <p id="totalReservations">0</p>
            </div>
            <div class="stat-box">
                <h3>완료된 예약</h3>
                <p id="completedReservations">0</p>
            </div>
            <div class="stat-box">
                <h3>취소된 예약</h3>
                <p id="cancelledReservations">0</p>
            </div>
            <div class="stat-box">
                <h3>평균 평점</h3>
                <p id="averageRating">0</p>
            </div>
        </div>

        <div class="charts">
            <canvas id="reservationsChart"></canvas>
            <canvas id="revenueChart"></canvas>
        </div>
    </div>

    <script>
    function loadStatistics() {
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;
        const hospitalId = 1; // 실제 구현시 동적으로 설정

        fetch(`/admin/api/statistics/${hospitalId}?startDate=${startDate}&endDate=${endDate}`)
            .then(response => response.json())
            .then(data => {
                updateDashboard(data);
            });
    }

    function updateDashboard(data) {
        // 요약 통계 업데이트
        document.getElementById('totalReservations').textContent = data.totalReservations;
        document.getElementById('completedReservations').textContent = data.completedReservations;
        document.getElementById('cancelledReservations').textContent = data.cancelledReservations;
        document.getElementById('averageRating').textContent = data.averageRating.toFixed(1);

        // 차트 데이터 준비
        const labels = data.monthlyStats.map(stat => stat.yearMonth);
        const reservations = data.monthlyStats.map(stat => stat.reservationCount);
        const revenues = data.monthlyStats.map(stat => stat.totalRevenue);

        // 예약 차트 업데이트
        updateChart('reservationsChart', '월별 예약 현황', labels, reservations);
        updateChart('revenueChart', '월별 매출 현황', labels, revenues);
    }

    function updateChart(canvasId, label, labels, data) {
        const ctx = document.getElementById(canvasId).getContext('2d');
        new Chart(ctx, {
            type: canvasId === 'reservationsChart' ? 'line' : 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: label,
                    data: data,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
    </script>
</body>
</html>
