

document.addEventListener('DOMContentLoaded', function () {
    // 모달 초기화
      $('#modal').modal({
        show: false // 모달 초기 상태를 숨김으로 설정
      });
    // 요소를 선택하는 함수
    function select(id) {
        return document.getElementById(id);
    }
    // 모달 표시 및 숨기기
    const startButton = select('startButton'); // 시작 버튼
    const modal = $('#modal'); // jQuery를 사용해 모달 요소 선택
    if (startButton) {
        startButton.addEventListener('click', function () {
            modal.modal('show'); // 모달 표시
        });
    }
    const closeButton = select('close'); // 모달 닫기 버튼
    if (closeButton) {
        closeButton.addEventListener('click', function () {
            modal.modal('hide'); // 모달 숨기기
        });
    }
    // 탭 기능 구현
    const tablinks = document.querySelectorAll('.tab a'); // 탭 링크 선택
    tablinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // 기본 링크 동작 방지
            const tabcontent = document.querySelectorAll('.tabcontent'); // 탭 콘텐츠 선택
            tabcontent.forEach(function (tab) {
                tab.style.display = 'none'; // 모든 탭 콘텐츠 숨기기
            });
            const href = link.getAttribute('href'); // 클릭한 탭의 href 값
            document.querySelector(href).style.display = 'block'; // 클릭한 탭의 콘텐츠만 표시
        });
    });
    if (tablinks.length > 0) { // 요소의 총 개수
        tablinks[0].click(); // 첫 번째 탭을 기본 활성화 상태로 설정
    }
});


    // 로그인
    $(document).ready(function() {
        $('#loginBtn').click(function(event) {
            event.preventDefault();
            console.log("로그인 버튼 클릭");
            const email = $('#loginemail').val();
            const password = $('#loginpassword').val();
            const data = {
                email,
                password
            };

            console.log("로그인 fetch 바로 전");

            fetch('/loginMain/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success === 1){
                        alert('로그인 성공!');
                        // 로그인 성공 후 처리 (예: 메인 페이지 이동)
                        // window.location.href = '/test-main';
                        window.location.href = `/baseleap/home/page?pageUserId=`+data.userId;
                    } else {
                        alert('로그인 실패');
                    }
                })
                .catch(error => {
                    alert('로그인 중 오류 발생');
                    console.error(error);
                });
        });
    });

    // 회원 가입
    $(document).ready(function() {
        $('#signupButton').click(function(event) {
            event.preventDefault();

            // 입력 값 가져오기
            const email = $('#email').val();
            const password = $('#password').val();
            const password2 = $('#password2').val();
            const nickName = $('#nickName').val();
            const profileImage = $('input[name="profileImage"]:checked').val();
            const userIntroduce = $('#userIntroduce').val();
            const validationQuizQuestion = $('#validationQuizQuestion').val();
            const validationQuizAnswer = $('#validationQuizAnswer').val();

            const data = {
                email,
                password,
                nickName,
                profileImage,
                userIntroduce,
                validationQuizQuestion,
                validationQuizAnswer
            };
            // 유효성 검사 함수 호출
            if (!validateForm(data)) {
                return;
            }

            // Fetch 요청
            fetch('/signup/signup', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json' // html head 같은 의미 여기서는 json 형식으로 보낼거라는 의미
                },
                body: JSON.stringify(data) // 실제 보내는 데이터
            })
            // 만약 뭐뭐 면 같은 임시? 예약?
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                // 여기서 부터 진짜 데이터 넘어옴
                .then(data => {
                    if (data.success == 1) {
                        alert('회원가입 성공!');
                        // 회원가입 후 처리 (메인 페이지 이동 등)
                        window.location.href = '/intro';
                    } else {
                        alert('회원가입 실패');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('회원가입 중 오류가 발생했습니다.');
                });

        });

        function validateForm(data) {
               const password2 = $('#password2').val();
            // 이메일 유효성 검사 (정규 표현식 활용)
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(data.email)) {
                alert('이메일 형식이 올바르지 않습니다.');
                return false;
            }

            // 비밀번호 유효성 검사 (기존 정규 표현식 활용)
            const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
            if (!passwordRegex.test(data.password)) {
                alert('비밀번호 형식이 올바르지 않습니다.');
                return false;
            }
            if (!isMatch(data.password, $('#password2').val())) {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }

            return true;
        }

        function isMatch(password, confirmPassword) {
           return password === confirmPassword;
        }

    });

// 비밀번호 찾기
$(document).ready(function() {
    $('#reset-form').submit(function(event) {
        event.preventDefault();

        const email = $('#findEmail').val();
        const validationQuizQuestion = $('#findValidationQuizQuestion').val();
        const validationQuizAnswer = $('#findValidationQuizAnswer').val();

        const data = {
            email,
            validationQuizQuestion,
            validationQuizAnswer
        };

        fetch('/find/passwordFind', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success == 1) {
                alert('비밀번호 찾기 성공! 새 비밀번호를 설정해주세요.');
                // 비밀번호 재설정 폼 표시 (이 부분은 HTML에 해당 폼이 있다고 가정)
                $('#password-reset-form').show();
                $('#reset-form').hide();
                $('#email-for-reset').val(email);  // 이메일 필드에 값 설정
            } else {
                alert('비밀번호 찾기 실패 ');
            }
        })
        .catch(error => {
            alert('비밀번호 찾기 중 오류 발생');
            console.error(error);
        });
    });

    // 새 비밀번호 설정
    $('#password-reset-form').submit(function(event) {
        event.preventDefault();

        const email = $('#email-for-reset').val();
        const newPassword = $('#new-password').val();

        const data = {
            email,
            password: newPassword
        };

        fetch('/find/passwordFindResult', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success == 1) {
                alert('비밀번호가 성공적으로 변경되었습니다.');
                window.location.href = '/';
            } else {
                alert('비밀번호 변경 실패');
            }
        })
        .catch(error => {
            alert('비밀번호 변경 중 오류 발생');
            console.error(error);
        });
    });
});


