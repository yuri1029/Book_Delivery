<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <style>
        #searchFrm {
            text-align: right;
            margin: 0 0 15px 0 ;
        }
        #category {
            width: 70px;
            height: 37px;
            border: 1.5px solid #858796;
            font-size: 0.8em;
        }
        #textBox {
            border: 1.5px solid #858796;
            padding:5px;
        }
        #detail {
            text-decoration: none;
            color: #4e73df;
        }
        #detail:hover {
            background-color: #4e73df;
            color: white;
        }
        #btn {
            border: 2px solid #5a5c69;
            border-radius: 8px;
            background-color: #5a5c69;
            color: #f8f9fc;
            font-size: 0.9em;
        }
        #btn:hover {
            border: 2px solid #4e73df;
            background-color: #4e73df;
            color: white;
        }
        /***** 페이징 스타일 ****/
        .paging {
            list-style: none;
            padding: 0;
        }
        .paging li {
            float: left;
            margin-right: 8px;
        }
        .paging li a {
            text-decoration: none;
            display: block;
            padding: 3px 7px;
            border: 1px solid #858796;
            color: #5a5c69;
        }
        .paging .disable {
            border: 1px solid silver;
            padding: 3px 7px;
            color: silver;
        }
        .paging .now {
            border: 1px solid #5a5c69;
            padding: 3px 7px;
            background-color: #5a5c69;
            color: white;
        }
        .paging li a:hover {
            background-color: #4e73df;
            color: white;
        }
        #pagingBox, #btnTd {
            border: none;
        }
    </style>

    <title>세상의 모든 도서관</title>

    <!-- Custom fonts for this template -->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/static/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">세모 도서관</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            카테고리
        </div>

        <!-- Nav Item - 공지사항 -->
        <li class="nav-item">
            <a class="nav-link" href="/notice">
                <i class="fas fa-fw fa-table"></i>
                <span>공지사항</span></a>
        </li>

        <!-- Nav Item - 도서 -->
        <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>도서</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">도서 메뉴</h6>
                            <a class="collapse-item" href="/books">도서검색 및 대출신청</a>
                            <a class="collapse-item" href="/books/booksRecent">신간도서</a>
                        </div>
                    </div>
                </li>

        <!-- Nav Item - 커뮤니티 -->
        <li class="nav-item">
            <a class="nav-link" href="/community">
                <i class="fas fa-fw fa-table"></i>
                <span>커뮤니티</span></a>
        </li>

        <!-- Nav Item - 건의사항 -->
        <li class="nav-item">
            <a class="nav-link" href="/suggest">
                <i class="fas fa-fw fa-wrench"></i>
                <span>건의사항</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            회원
        </div>

        <!--로그인 안했을 때 보여지는 부분-->
        <div id="loginNo">
            <!-- Nav Item - 회원가입 -->
            <li class="nav-item">
                <a class="nav-link" href="/member/register">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>회원가입</span></a>
            </li>

            <!-- Nav Item - 로그인 -->
            <li class="nav-item">
                <a class="nav-link" href="/auth/login">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>로그인</span></a>
            </li>
        </div>
        <!--로그인 안했을 때 보여지는 부분-->

        <!--로그인 했을 때 보여지는 부분-->
        <div id="loginOk">
            <!-- Nav Item - 마이페이지 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>마이페이지</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">마이페이지 메뉴</h6>
                        <a class="collapse-item" href="#" id="myInfo">내 정보 수정</a>
                        <a class="collapse-item" href="#" id="myRental">내가 대여한 도서</a>
                        <a class="collapse-item" href="#" id="myCommunity">나의 커뮤니티글</a>
                        <a class="collapse-item" href="#" id="mySuggest">나의 건의사항</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - 로그아웃 -->
            <li class="nav-item" id="logout">
                <a href="#" class="nav-link" onClick="logout()"><i class="fas fa-fw fa-cog"></i><span> 로그아웃</span></a>
            </li>
        </div>
        <!--로그인 했을 때 보여지는 부분-->

        <!--관리자 로그인 했을 때 보여지는 부분-->
        <div id="loginAdmin">
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                관리자
            </div>

            <!-- Nav Item - 관리자 -->
            <li class="nav-item" id="adminMenu">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>관리자</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리자 메뉴</h6>
                        <a class="collapse-item" href="/memberss">회원 조회</a>
                        <a class="collapse-item" href="/adminBooks">도서 현황 조회</a>
                        <a class="collapse-item" href="/insertBooks">도서 등록</a>
                        <a class="collapse-item" href="/deleteBooks">도서 삭제</a>
                        <a class="collapse-item" href="/readyBooks">도서 반납 처리</a>
                    </div>
                </div>
            </li>
        </div>
        <!--관리자 로그인 했을 때 보여지는 부분-->

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <div id="ment"><h5>로그인이 필요합니다.</h5></div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">건의사항</h1>
                <p class="mb-4">도서 신청, 도서 관련 문의, 이용 관련 문의, 기타 문의에 관한 게시글을 작성할 수 있습니다.<br>작성자와 관리자만 조회 가능합니다.</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">건의사항 목록</h6>
                        <!--검색 키워드 있을 때 검색 정보-->
                        <c:if test="${ not empty searchCondition && not empty searchKeyword}">
                                <c:choose>
                                    <c:when test="${ searchCondition eq 'category'}">
                                        카테고리 <b>[말머리]</b> &nbsp;
                                    </c:when>
                                    <c:when test="${ searchCondition eq 'title'}">
                                        카테고리 <b>[제목]</b> &nbsp;
                                    </c:when>
                                    <c:when test="${ searchCondition eq 'content'}">
                                        카테고리 <b>[내용]</b> &nbsp;
                                    </c:when>
                                </c:choose>
                                키워드 <b>[${ searchKeyword}]</b> &nbsp;
                                총 <b>[${ listCnt}]</b>건
                        </c:if>
                    </div>
                    <div class="card-body">
                        <!--검색-->
                        <div id="searchFrm">
                            <form method="get" name="frm">
                                <select name="searchCondition" title="카테고리" id="category">
                                    <option value="category">말머리</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                                <input type="text" name="searchKeyword" title="키워드" id="textBox">
                                <input type="button" id="btn" value="검색" onclick="search(this.form)">
                            </form>
                        </div>

                        <div class="table-responsive">
                            <table data-order='[[0, "desc"]]' class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>말머리</th>
                                    <th width="40%">제목</th>
                                    <th>작성자</th>
                                    <th>작성일자</th>
                                    <th>조회수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${ empty suggestList}">
                                    <tr><td colspan="6">데이터가 없습니다.</td></tr>
                                </c:if>
                                <c:if test="${ not empty suggestList}">
                                    <c:forEach items="${ suggestList}" var="suggest">
                                        <tr>
                                            <td>${suggest.suggest_id}</td>
                                            <td>${suggest.category}</td>
                                            <td>    <!--글 작성자와 로그인 세션이 일치할때, 관리자 계정일때만 상세보기 가능-->
                                                <a href="#" onclick="if(${suggest.member_id} == sessionStorage.getItem('memberId') || sessionStorage.getItem('loginId') == 'admin')
                                                { document.location.href='/suggestDetail?suggest_id=${suggest.suggest_id}'; }
                                                else { alert('작성자와 관리자만 확인할 수 있습니다.') }" id="detail">${suggest.title}</a>
                                            </td>
                                            <td>${suggest.name}</td>
                                            <td>${suggest.regdate}</td>
                                            <td>${suggest.hit}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                                <!--페이징 처리 부분-->
                                <tfoot>
                                <tr>
                                    <td colspan="5" id="pagingBox">
                                        <ol class="paging">
                                            <!-- [이전으로] 사용여부 -->
                                            <c:choose>
                                                <c:when test="${ paging.startPage == 1}">   <!-- 첫번째 블록인 경우 hidden -->
                                                    <li class="disable">이전으로</li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <c:if test="${ empty searchCondition && empty searchKeyword}">  <!--검색 키워드 없을 때-->
                                                            <a href="/suggest?curPage=${ paging.startPage-1}">이전으로</a>
                                                        </c:if>
                                                        <c:if test="${ not empty searchCondition && not empty searchKeyword}">  <!--검색 키워드 있을 때-->
                                                            <a href="/suggest?searchCondition=${ searchCondition}&searchKeyword=${ searchKeyword}&curPage=${ paging.startPage-1}">이전으로</a>
                                                        </c:if>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>

                                            <!-- 시작페이지~끝페이지 -->
                                            <c:forEach var="pageNo" begin="${ paging.startPage}" end="${ paging.endPage}">
                                                <c:choose>
                                                    <c:when test="${ pageNo == paging.curPage}">
                                                        <li class="now">${ pageNo}</li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <c:if test="${ empty searchCondition && empty searchKeyword}">  <!--검색 키워드 없을 때-->
                                                                <a href="/suggest?curPage=${pageNo}">${pageNo}</a>
                                                            </c:if>
                                                            <c:if test="${ not empty searchCondition && not empty searchKeyword}">  <!--검색 키워드 있을 때-->
                                                                <a href="/suggest?searchCondition=${ searchCondition}&searchKeyword=${ searchKeyword}&curPage=${pageNo}">${pageNo}</a>
                                                            </c:if>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <!-- [다음으로] 사용여부 -->
                                            <c:choose>
                                                <c:when test="${ paging.endPage >= paging.pageCnt}">   <!-- 마지막 블록인 경우 hidden -->
                                                    <li class="disable">다음으로</li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <c:if test="${ empty searchCondition && empty searchKeyword}">  <!--검색 키워드 없을 때-->
                                                            <a href="/suggest?curPage=${ paging.endPage+1}">다음으로</a>
                                                        </c:if>
                                                        <c:if test="${ not empty searchCondition && not empty searchKeyword}">  <!--검색 키워드 있을 때-->
                                                            <a href="/suggest?searchCondition=${ searchCondition}&searchKeyword=${ searchKeyword}&curPage=${ paging.endPage+1}">다음으로</a>
                                                        </c:if>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ol>
                                    </td>
                                    <td id="btnTd"><input type="button" id="btn" value="글쓰기" onclick="write_go()"></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="/static/vendor/jquery/jquery.min.js"></script>
<script src="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/static/js/sb-admin-2.min.js"></script>

<%--<!-- Page level plugins -->
<script src="/static/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/static/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/static/js/demo/datatables-demo.js"></script>--%>

</body>
<script>
    //로그인 세션 가져오기
    let loginId = sessionStorage.getItem("loginId");    //ID
    let memberId = sessionStorage.getItem("memberId");  //MEMBER_ID
    if (loginId === null){
        alert("로그인이 필요합니다.")
        document.location.href="/auth/login"
    }

    //검색
    function search(frm){
        var searchForm = document.forms[0];
        for (var i=0; i<searchForm.elements.length; i++) {
            if (searchForm.elements[i].value.trim() == "") {
                alert(searchForm.elements[i].title + "를 입력하세요.");
                searchForm.elements[i].focus();
                return;
            }
        }
        frm.action = "/suggest"
        frm.submit();
    }

    //글쓰기 버튼 클릭
    function write_go(){
        document.location.href="/suggestWrite";
    }

    //==========사이드바 기능==========
    //미로그인 시 사이드바 수정
    if (loginId === null){
        document.getElementById('loginOk').innerHTML='';
    }

    //로그인 성공 시 상단 안내 멘트, 사이드바 수정
    if (loginId !== null){
        welcome();
        document.getElementById('loginNo').innerHTML='';
    }

    //관리자 로그인 성공 시 사이드바 수정
    if (loginId !== 'admin'){
        document.getElementById('loginAdmin').innerHTML='';
    }

    //로그인 시 상단에 문구 표시
    function welcome() {
        console.log(loginId);
        document.getElementById('ment').innerHTML = '<h5>' + loginId + ' 님 환영합니다!</h5>';
    }

    //로그아웃 버튼 클릭
    function logout() {
        sessionStorage.clear();
        document.location.href="/main"
    }

    //마이페이지에서 대여한 도서 조회
    if (memberId !== null) {
        document.getElementById('myRental').innerHTML='<a class="collapse-item" href="/myRental?member_id='+memberId+'" id="myRental">내가 대여한 도서</a>';
    }

    //마이페이지 내 정보 수정
    if (memberId !== null) {
        document.getElementById('myInfo').innerHTML='<a class="collapse-item" href="/checkGo?member_id='+memberId+'" id="myInfo">내 정보 수정</a>';
    }

    //마이페이지 내가 쓴 커뮤니티 조회
    if (memberId !== null) {
        document.getElementById('myCommunity').innerHTML='<a class="collapse-item" href="/myCommunity?member_id='+memberId+'" id="myCommunity">내가 쓴 글 조회</a>';
    }

    //마이페이지 내가 쓴 건의사항 조회
    if (memberId !== null) {
        document.getElementById('mySuggest').innerHTML='<a class="collapse-item" href="/mySuggest?member_id='+memberId+'" id="mySuggest">내가 쓴 건의</a>';
    }
</script>
</html>
