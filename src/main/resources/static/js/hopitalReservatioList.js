//        document.addEventListener('DOMContentLoaded', () => {
//            // 병원 데이터를 가져오는 비동기 요청
//            axios.get('http://localhost:8080/admin/selectHospitalReservationListAll')
//                .then(response => {
//                    const hospitalReservationList = response.data;
//                    let html = '';
//                   //  console.log('병원 얘약 리스트 데이터:', hospitalReservationList);
//                    // 병원 데이터를 반복하여 테이블에 추가
//                    hospitalReservationList.forEach(reservation => {
//                        html += `
//                            <tr>
//                                <td>\${reservation.hospReservationId}</td>
//                                <td>\${reservation.userId}</td>
//                                <td>\${reservation.hospId}</td>
//                                <td>\${reservation.paymentId}</td>
//                                <td>\${reservation.reservationAtStr}</td>
//                                <td>\${reservation.reservationTime}</td>
//                                <td>\${reservation.createdAtStr}</td>
//                                <td>\${reservation.modifiedAtStr}</td>
//                                <td>\${reservation.reservationStatus}</td>
//                            </tr>
//                        `;
//                    });
//
//                    // 테이블에 데이터를 추가
//                    document.getElementById('hospitalReservationList').innerHTML = html;
//
//                })
//                .catch(error => {
//                    console.error('데이터 가져오기 실패:', error);
//                    document.getElementById('hospitalReservationList').innerHTML =
//                        '<tr><td colspan="5">병원 목록을 가져오는 데 실패했습니다.</td></tr>';
//                });
//        });



document.addEventListener('DOMContentLoaded', () => {
    // 병원 예약 데이터를 가져오는 비동기 요청
    fetch('http://52.79.220.59:8090/admin/selectHospitalReservationListAll')
        .then(response => {
            if (!response.ok) {
                throw new Error('네트워크 응답이 올바르지 않습니다.');
            }
            return response.json();
        })
        .then(hospitalReservationList => {
            let html = '';

            // 병원 예약 데이터를 반복하여 테이블에 추가
            hospitalReservationList.forEach(reservation => {
                html += `
                    <tr>
                        <td>${reservation.hospReservationId}</td>
                        <td>${reservation.userId}</td>
                        <td>${reservation.hospId}</td>
                        <td>${reservation.paymentId}</td>
                        <td>${reservation.reservationAtStr}</td>
                        <td>${reservation.reservationTime}</td>
                        <td>${reservation.createdAtStr}</td>
                        <td>${reservation.modifiedAtStr}</td>
                        <td>${reservation.reservationStatus}</td>
                    </tr>
                `;
            });

            // 테이블에 데이터를 추가
            document.getElementById('hospitalReservationList').innerHTML = html;
        })
        .catch(error => {
            console.error('데이터 가져오기 실패:', error);
            document.getElementById('hospitalReservationList').innerHTML =
                '<tr><td colspan="9">병원 예약 목록을 가져오는 데 실패했습니다.</td></tr>';
        });
});