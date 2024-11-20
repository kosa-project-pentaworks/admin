document.addEventListener('DOMContentLoaded', function () {
    // 모든 시작 버튼 선택
    const startButtons = document.querySelectorAll('.startButton');
    const modalElement = document.getElementById('modal');
    const bootstrapModal = new bootstrap.Modal(modalElement);

    // 각 버튼에 클릭 이벤트 추가
    startButtons.forEach(button => {
        button.addEventListener('click', () => {
            bootstrapModal.show();
        });
    });

    // 모달 닫기 버튼 클릭 이벤트
    const closeButton = document.querySelector('[data-bs-dismiss="modal"]');
    if (closeButton) {
        closeButton.addEventListener('click', () => {
            bootstrapModal.hide();
        });
    }
});


// document.addEventListener('DOMContentLoaded', function () {
//     // 모든 시작 버튼 선택
//     const startButtons = document.querySelectorAll('.startButton');
//     const modalElement = document.getElementById('modal');
//     const modalBody = modalElement.querySelector('.modal-body');
//     const bootstrapModal = new bootstrap.Modal(modalElement);

    // // 각 버튼에 클릭 이벤트 추가
    // startButtons.forEach(button => {
    //     button.addEventListener('click', () => {
    //         // 버튼의 data-user-id 값 가져오기
    //         const userId = button.getAttribute('data-user-id');
            
    //         // 모달 내용 업데이트
    //         modalBody.innerHTML = `<p>회원 ID: ${userId}</p>`;

    //         // 모달 열기
    //         bootstrapModal.show();
    //     });
    // });

//     // 모달 닫기 버튼 클릭 이벤트
//     const closeButton = document.querySelector('[data-bs-dismiss="modal"]');
//     if (closeButton) {
//         closeButton.addEventListener('click', () => {
//             bootstrapModal.hide();
//         });
//     }
// });
//    수정한  
// const modalBody = modalElement.querySelector('.modal-body');

// startButtons.forEach(button => {
//     button.addEventListener('click', () => {
//         const userId = button.getAttribute('data-user-id');

//         // 서버로 POST 요청 보내기
//         fetch('/admin/getUserInfo', {
//             method: 'GET',
//             headers: {
//                 'Content-Type': 'application/json' // JSON 형식으로 요청 보냄
//             },
//             body: JSON.stringify({ userId: userId }) // userId 데이터를 JSON 형식으로 전송
//         })
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error('Network response was not ok');
//             }
//             return response.json(); // JSON 응답 파싱
//         })
//         .then(data => {
//             // 서버로부터 받은 데이터를 모달에 표시
//             if (data.success) {
//                 modalBody.innerHTML = `
//                     <p><strong>회원 ID:</strong> ${data.userId}</p>
//                     <p><strong>이메일:</strong> ${data.email}</p>
//                     <p><strong>이름:</strong> ${data.username}</p>
//                     <p><strong>전화번호:</strong> ${data.phone}</p>
//                     <p><strong>주소:</strong> ${data.address}</p>
//                     <p><strong>가입 날짜:</strong> ${data.createdAt}</p>
//                     <p><strong>상태:</strong> ${data.status}</p>
//                 `;
//                 bootstrapModal.show();
//             } else {
//                 alert('유저 정보를 불러오는 데 실패했습니다.');
//             }
//         })
//         .catch(error => {
//             console.error('Error:', error);
//             alert('오류가 발생했습니다. 관리자에게 문의하세요.');
//         });
//     });
// });

document.addEventListener('DOMContentLoaded', function () {
    const startButtons = document.querySelectorAll('.startButton');
    const modalElement = document.getElementById('modal');
    const modalBody = modalElement.querySelector('.modal-body');
    const bootstrapModal = new bootstrap.Modal(modalElement);

    startButtons.forEach(button => {
        button.addEventListener('click', () => {
            const userId = button.getAttribute('data-user-id');

            // 서버로 POST 요청 보내기
            fetch('/admin/getUserInfo', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json' // JSON 형식으로 요청 보냄
                },
                body: JSON.stringify({ userId: userId }) // userId 데이터를 JSON 형식으로 전송
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // JSON 응답 파싱
            })
            .then(data => {
                // 서버로부터 받은 데이터를 모달에 표시
                if (data.success) {
                    modalBody.innerHTML = `
                        <p><strong>회원 ID:</strong> ${data.userId}</p>
                        <p><strong>이메일:</strong> ${data.email}</p>
                        <p><strong>이름:</strong> ${data.username}</p>
                        <p><strong>전화번호:</strong> ${data.phone}</p>
                        <p><strong>주소:</strong> ${data.address}</p>
                        <p><strong>가입 날짜:</strong> ${data.createdAt}</p>
                        <p><strong>상태:</strong> ${data.status}</p>
                    `;
                    bootstrapModal.show();
                } else {
                    alert('유저 정보를 불러오는 데 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('오류가 발생했습니다. 관리자에게 문의하세요.');
            });
        });
    });
});


$(document).ready(function() {
    // 모달이 열릴 때마다 실행
    $('#userModal').on('show.bs.modal', function(event) {
        const button = $(event.relatedTarget); // 클릭한 버튼
        const userId = button.data('user-id'); // 버튼의 data-user-id 속성 값
        
        // AJAX 요청
        $.ajax({
            url: '/getUserInfo', // 서버 URL
            method: 'POST',
            data: { user_id: userId },
            success: function(response) {
                // 서버에서 받은 데이터를 모달 내용에 채움
                $('#modalContent').html(`
                    <p>아이디: ${response.userId}</p>
                    <p>이메일: ${response.email}</p>
                    <p>이름: ${response.username}</p>
                    <p>전화번호: ${response.phoneStr}</p>
                    <p>주소: ${response.addressStr}</p>
                    <p>가입일: ${response.createdAtStr}</p>
                    <p>상태: ${response.status}</p>
                `);
            },
            error: function() {
                $('#modalContent').html('<p>정보를 가져오는 중 오류가 발생했습니다.</p>');
            }
        });
    });
});


// // 상세보기 처리 (모달창 열어줌)
// 		// 실제 이벤트가 발생하는 곳은 반복문에 의해 생성되는 곳임으로 이벤트가 먹히지 않을 수 있음 
// 		// 그렇기 때문에 실제 요소가 있는 곳에 이벤트를 걸어 이벤트 전파방식으로 진행 
// 		$('#contentDiv').on('click', '.image-inner a', function(event){
// 			// image-inner안의 a태그에 클릭이 발생하면 함수 발동 
// 			event.preventDefault();
// 			// a태그의 고유기능 중지
			
// 			// 글번호 얻어오기 
// 			const bno = $(this).attr('href');
// 			// 이벤트가 발생한 곳의 href 속성의 값을 가져옴 
// 			console.log(bno);
			
// 			$.getJSON(
// 				'<c:url value="/snsBoard/getDetail/" />' + bno,
// 				function(data){
// 					console.log(data);
// 					// 서버에서 준 데이터 
					
// 					// 미리 준비한 모달창에 뿌림  
// 					// 값을 위치에 뿌려주고 모달을 열어줌 
// 					$('#snsModal').modal('show');
// 					// 모달 열어줌 
					
// 					// console.log(data.writer);
// 					// 값 입력
// 					$('#snsWriter').html(data.writer);
// 					$('#snsRegdate').html(timeStamp(data.regdate));
// 					if (data.content !== null){
// 						$('#snsContent').text(data.content);							
// 					}
// 					else {
// 						$('#snsContent').text('');
// 					}
// 					const src ='<c:url value="/snsBoard/display?fileLocation=' + data.fileloca + '&fileName=' + data.filename + '"/>';
// 					// const src = "<c:url value='/snsBoard/display?fileLocation=` + data.fileloca + `&fileName=` + data.filename + `'/>";
// 					$('#snsImg').attr("src", src);
// 					// 로컬에 저장되어 있는 이미지를 불러옴 

// 				}
// 			);
			
// 		}); // 상세보기 처리 끝



// 상세보기 처리 (모달창 열어줌)
// 실제 이벤트가 발생하는 곳은 반복문에 의해 생성되는 곳임으로 이벤트가 먹히지 않을 수 있음 
// 그렇기 때문에 실제 요소가 있는 곳에 이벤트를 걸어 이벤트 전파방식으로 진행 
$('#contentDiv').on('click', '.image-inner a', function(event){
    // image-inner안의 a태그에 클릭이 발생하면 함수 발동 
    event.preventDefault();
    // a태그의 고유기능 중지

    // 글번호 얻어오기 
    const bno = $(this).attr('href');
    // 이벤트가 발생한 곳의 href 속성의 값을 가져옴 
    console.log(bno);

    // Fetch를 사용하여 서버에서 JSON 데이터를 가져옴
    fetch('<c:url value="/snsBoard/getDetail/" />' + bno)
        .then(response => response.json())
        .then(data => {
            console.log(data);
            // 서버에서 준 데이터

            // 미리 준비한 모달창에 뿌림
            // 값을 위치에 뿌려주고 모달을 열어줌
            $('#snsModal').modal('show');
            // 모달 열어줌

            // console.log(data.writer);
            // 값 입력
            $('#snsWriter').html(data.writer);
            $('#snsRegdate').html(timeStamp(data.regdate));
            if (data.content !== null){
                $('#snsContent').text(data.content);
            }
            else {
                $('#snsContent').text('');
            }

            const src ='<c:url value="/snsBoard/display?fileLocation=' + data.fileloca + '&fileName=' + data.filename + '"/>';
            $('#snsImg').attr("src", src);
            // 로컬에 저장되어 있는 이미지를 불러옴
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}); // 상세보기 처리 끝
