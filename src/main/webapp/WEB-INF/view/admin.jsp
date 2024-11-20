<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>병원 목록</title>
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
        </tbody>
    </table>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // 병원 데이터를 가져오는 비동기 요청
            axios.get('http://localhost:8080/admin/selectHospListAll')
                .then(response => {
                    const hospitals = response.data;
                    let html = '';
                    console.log('병원 리스트 데이터:', hospitals);
                    console.log('병원 리스트 데이터:', hospitals[0].addr);
                    // 병원 데이터를 반복하여 테이블에 추가
                    hospitals.forEach(hospital => {
                        // 자바스크립트에서 날짜를 형식화 index 숫자
                        const formattedDate = hospital.estbDd ? new Date(hospital.estbDd).toLocaleDateString() : 'N/A';
                        html += `
                            <tr>

                                <td>\${hospital.yadmNm}</td>
                                <td>\${hospital.addr}</td>
                                <td>\${hospital.telno}</td>
                                <td>\${hospital[index].estbDd}</td>
                                <td>\${hospital[index].hospStatus}</td>
                            </tr>
                        `;
                    });

                    // 테이블에 데이터를 추가
                    document.getElementById('hospitalList').innerHTML = html;

                })
                .catch(error => {
                    console.error('데이터 가져오기 실패:', error);
                    document.getElementById('hospitalList').innerHTML =
                        '<tr><td colspan="5">병원 목록을 가져오는 데 실패했습니다.</td></tr>';
                });
        });
    </script>
</body>
</html>
