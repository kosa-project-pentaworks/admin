//                                   document.addEventListener('DOMContentLoaded', () => {
//                                       // 병원 데이터를 가져오는 비동기 요청
//                                       axios.get('http://localhost:8080/admin/selectUserListAll')
//                                           .then(response => {
//                                               const userList = response.data;
//
//                                               let html = '';
//                                               console.log('회원 리스트 데이터:', userList);
//                                               // 병원 데이터를 반복하여 테이블에 추가
//                                               userList.forEach(user => {
//                                                   html += `
//                                                       <tr>
//                                                           <td>\${user.userId}</td>
//                                                           <td>\${user.email}</td>
//                                                           <td>\${user.username}</td>
//                                                           <td>\${user.phoneStr}</td>
//                                                           <td>\${user.addressStr}</td>
//                                                           <td>\${user.createdAtStr}</td>
//                                                           <td>\${user.status}</td>
//                                                       </tr>
//                                                   `;
//                                               });
//
//                                               // 테이블에 데이터를 추가
//                                               document.getElementById('userList').innerHTML = html;
//
//                                           })
//                                           .catch(error => {
//                                               console.error('데이터 가져오기 실패:', error);
//                                               document.getElementById('userList').innerHTML =
//                                                   '<tr><td colspan="5">병원 목록을 가져오는 데 실패했습니다.</td></tr>';
//                                           });
//                                   });

document.addEventListener('DOMContentLoaded', () => {
    // 병원 데이터를 가져오는 비동기 요청
    // window.location.href
    // http://localhost:8080/admin/selectUserListAll?searchType=all&search=${}
    fetch('/admin/selectUserListAll')
        .then(response => {
            if (!response.ok) {
                throw new Error('네트워크 응답이 올바르지 않습니다.');
            }
            return response.json();
        })
        .then(userList => {
            let html = '';
            console.log('회원 리스트 데이터:', userList);

            // 병원 데이터를 반복하여 테이블에 추가
            userList.forEach(user => {
                html += `
                    <tr>
                        <td>#{user.userId}</td>
                        <td>${user.email}</td>
                        <td>${user.username}</td>
                        <td>${user.phoneStr}</td>
                        <td>${user.addressStr}</td>
                        <td>${user.createdAtStr}</td>
                        <td>${user.status}</td>
                    </tr>
                `;
            });

            // 테이블에 데이터를 추가
            document.getElementById('userList').innerHTML = html;
        })
        .catch(error => {
            console.error('데이터 가져오기 실패:', error);
            document.getElementById('userList').innerHTML =
                '<tr><td colspan="7">병원 목록을 가져오는 데 실패했습니다.</td></tr>';
        });



        $('#searchButton').click(function(event) {

            const searchType = document.querySelector("#searchType");
            const search = document.querySelector("#search");
        
            // 유효성 검사 함수 호출
            if (!validateForm(data)) {
                return;
            }
        
            // Fetch 요청 ${text}
                fetch('http://localhost:8080/api/admin/selectUserListAll?searchType=${searchType}&search=${search}')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('네트워크 응답이 올바르지 않습니다.');
                    }
                    return response.json();
                })
                .then(userList => {
                    let html = '';
                    console.log('회원 리스트 데이터:', userList);
        
                    // 병원 데이터를 반복하여 테이블에 추가
                    userList.forEach(user => {
                        html += `
                            <tr>
                                <td>${user.userId}</td>
                                <td>${user.email}</td>
                                <td>${user.username}</td>
                                <td>${user.phoneStr}</td>
                                <td>${user.addressStr}</td>
                                <td>${user.createdAtStr}</td>
                                <td>${user.status}</td>
                            </tr>
                        `;
                    });
        
                    // 테이블에 데이터를 추가
                    document.getElementById('userList').innerHTML = html;
                })
                .catch(error => {
                    console.error('데이터 가져오기 실패:', error);
                    document.getElementById('userList').innerHTML =
                        '<tr><td colspan="7">병원 목록을 가져오는 데 실패했습니다.</td></tr>';
                });
        })
});


// document.addEventListener('DOMContentLoaded', () => {
//     // 병원 데이터를 가져오는 비동기 요청
//     // window.location.href
//     // http://localhost:8080/admin/selectUserListAll?searchType=all&search=
//     fetch("http://localhost:8080/admin/selectUserListAll?searchType=all&search=")
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error('네트워크 응답이 올바르지 않습니다.');
//             }
//             return response.json();
//         })
//         .then(userList => {
//             let html = '';
//             console.log('회원 리스트 데이터:', userList);

//             // 병원 데이터를 반복하여 테이블에 추가
//             userList.forEach(user => {
//                 html += `
//                     <tr>
//                         <td>${user.userId}</td>
//                         <td>${user.email}</td>
//                         <td>${user.username}</td>
//                         <td>${user.phoneStr}</td>
//                         <td>${user.addressStr}</td>
//                         <td>${user.createdAtStr}</td>
//                         <td>${user.status}</td>
//                     </tr>
//                 `;
//             });

//             // 테이블에 데이터를 추가
//             document.getElementById('userList').innerHTML = html;
//         })
//         .catch(error => {
//             console.error('데이터 가져오기 실패:', error);
//             document.getElementById('userList').innerHTML =
//                 '<tr><td colspan="7">병원 목록을 가져오는 데 실패했습니다.</td></tr>';
//         });
// });


