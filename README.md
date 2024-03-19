<h1>:clap: jsp를 이용한 웹페이지 구현</h1>

모든 입력은 Enter로 함  

0. 구현 기능  
    * 로그인 (세션유지)
    * 로그아웃
    * 회원가입  
    * 커뮤니티 게시판
    * 마이페이지 
    * 관리자페이지 
1. 로그인
    -  로그인 정보 확인 : session을 이용한 id와 email을 DB에서 체크함
    -  아이디 기억하기 : Cookie를 이용하여 600초간 정보 유지
2. 커뮤니티 게시판
    -  검색 기능 구현 (제목 기준)
    -  작성자 아이디 클릭시 해당 작성자의 작성글 목록 조회 가능
    -  글 작성한 계정으로만 수정/삭제 가능함
3. 마이페이지
    -  마이페이지 클릭시 로그인 계정의 정보는 불러오나 회원탈퇴, 수정 버튼 미구현상태
4. 관리자페이지
    -  admin 계정으로 로그인시 자동으로 이동
    -  커뮤니티 게시판 모든 작성글 수정 및 삭제 가능
    -  Member 메뉴에서 회원 계정 관리 가능(추가/수정/삭제)