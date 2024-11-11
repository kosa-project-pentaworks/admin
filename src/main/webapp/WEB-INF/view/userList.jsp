<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>병원 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</head>
<body>
    <h2>병원 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th>병원명</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>설립일</th>
                <th>병원 상태</th>
            </tr>
        </thead>
        <tbody id="hospitalList">
        <!-- 비동기 처리 -->
        </tbody>
    </table>

<script>

document.addEventListener('DOMContentLoaded', () => {
    axios.get('http://localhost:8080/admin/selectHospListAll')
        .then(response => {
            const hospitals = response.data;
            let html = '';
             console.log('병원 리스트 데이터:', hospitals);

            hospitals.forEach(hospital => {
                html += `
                    <tr>
                        <td>${hospital.yadmNm}</td>
                        <td>${hospital.addr}</td>
                        <td>${hospital.telno}</td>
                        <td>${hospital.hospStatus}</td>
                        <td>${hospital.clCdNm}</td>
                    </tr>
                `;
            });

            document.getElementById('hospitalList').innerHTML = html;
        })
        .catch(error => {
            console.error('Error:', error);
        });
});

</script>
</body>
</html>
