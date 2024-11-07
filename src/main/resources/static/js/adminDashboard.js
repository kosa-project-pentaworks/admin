// adminDashboard.js

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
                    label: "지역별 이용자 수",
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
                    label: "월별 예약 건수",
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
                    label: "지역별 병원 수",
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
                    label: "병원별 평균 리뷰 평점",
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
                    label: "병원별",
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
                    label: "일별 신규 회원 가입 수",
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

});
