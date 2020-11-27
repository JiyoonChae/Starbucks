<%@page import="com.starbucks.sw4.admin.tables.member.AdminMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Starbucks Coffee Korea :: 매장 직원현황</title>
		
		<c:import url="../template/bootstrap.jsp"></c:import>
		<c:import url="../template/commonCSS.jsp"></c:import>
		
		<link rel="stylesheet" type="text/css" href="/sw4/resources/admin/css/jquery-ui.min.css">
		<link rel="stylesheet" type="text/css" href="/sw4/resources/admin/css/boardList.css">
		<link rel="stylesheet" type="text/css" href="/sw4/resources/admin/css/memberPage.css">
	 	
		<style type="text/css">
			/*background-color: #006633;*/

		</style>
	</head>
	
	<body class="sb-nav-fixed">
	
		<c:import url="../template/navigation.jsp"></c:import>
		<div id="layoutSidenav">
			
			<!-- template -->
			<c:import url="../template/sidebar.jsp"></c:import>
			<div id="layoutSidenav_content">
				
				<main>
					
					<div class="container-fluid">
						<h1 class="mt-4">매장 직원 리스트</h1>
						<div class="breadcrumb mb-4">
							<span id="login-staff-info">${login.name}</span>님이 근무하시는&nbsp;<span id="login-staff-info">${login.storeDTO.storeName}</span>&nbsp;매장 근로자 리스트 입니다. 개인정보 보호를 위해 STAFF의 상세 정보는 제한됩니다.
						</div>
					</div>
					
					<div class="container-fluid">
						<div id="store-info">
							<table class="table table-bordered" id="store-info-table">
								<tr>
									<td id="store-image" rowspan="4"></td>
									<td colspan="4" id="store-title">근무지 정보</td>
								</tr>
								<tr class="store-row">
									<td id="store-column-name">이름</td>
									<td class="store-row-data" id="name">${login.name}</td>
									<td id="store-column-name">직급</td>
									<td class="store-row-data" id="type">
										<c:choose>
											<c:when test="${login.type eq 2}">Staff</c:when>
											<c:when test="${login.type eq 3}">Manager</c:when>
											<c:otherwise>Admin</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr class="store-row">
									<td id="store-column-name">근무 매장</td>
									<td class="store-row-data" id="work-store">${store.storeName}</td>
									<td id="store-column-name">근무인원</td>
									<td class="store-row-data"><span id="work-store-count">${storeMember}</span> 명</td>
								</tr>
								<tr class="store-row">
									<td id="store-column-name">매장 주소</td>
									<td colspan="3" id="doro-addr">${store.doro_addr}</td>
								</tr>
							</table>
						</div>

					</div>
					
					<div class="container-fluid" id="btn-area">
						<c:if test="${login.type eq 4}">
							<div id="update-btn-area">
								<form action="#" id="update-btn-frm" method="POST">
									<button id="update-btn" type="button">정보 수정</button>
								</form>
							</div>
						</c:if>
						<div id="select-area">
							<ul class="navbar-nav ml-auto ml-md-0" id="drop" role="type">
								<a class="nav-link dropdown-toggle" id="typeDropdown"
									href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fas fa-user fa-fw" id="icon-type"></i><span id="select-type">직급 선택</span>
								</a>
								<div class="dropdown-menu dropdown-menu-righ">
									<span class="dropdown-item" title="0" id="staff">All</span>
					                <span class="dropdown-item" title="2" id="staff">Staff</span>
					                <span class="dropdown-item" title="3" id="manager">Manager</span>
								</div>
							</ul>
						</div>
					</div>
					
					<div class="container-fluid" id="table-area">
	
						<table class="table"  width="100%">
							<thead>
								<tr>
									<th id="table-num-size">번호</th>
									<th id="table-info-size" colspan="2">직원 요약 정보</th>
									<th id="table-writer-size">직급</th>
									<th id="table-date-size">입사일</th>
									<th id="table-hit-size">성별</th>
								</tr>
							</thead>
							<tbody id="member-list">

							</tbody>
						</table>
						
					</div>
					
					<div class="container-fluid" id="">
						<button class="btn btn-info" id="more">view more</button>
					</div>

					<div id="staff-update-area" style="display:none;" role="dialog">
	
					</div>
					
					<div id="store-info-area" style="display:none;" class="modal" role="dialog">
		
					</div>
			
				</main>
	
				<c:import url="../template/footer.jsp"></c:import>
				
			</div>		

		</div>		
		
		<!-- script template -->
		<c:import url="../template/javascript.jsp"></c:import>
		<script src="/sw4/resources/admin/js/jquery-ui.min.js"></script>
		<script type="text/javascript">
		
			var curPage = 1;
			var searchType = 0;
			
			var type = 0;
			var loginType = ${login.type};
			
			var search = "";
			var staffNum;
			var staffStoreCode;
			var staffStoreName;
			var staffId;
			var staffInsertId;
			var staffInsertNum;
			
			var sidoTxt = "";
			var storeSearchTxt = "";
			
			var noWidth = window.screen.width;
			var noHeight = window.screen.height;
			
			var beforeChk=0;
			var storeChk=0;
			var countChk=0;
			
			$("#search-btn").attr("type","button");
			$("#search-frm").attr("action","#");
			
			getList()
			typeSelect(type)
			
			$(document).ready(function(){
				
				var x = noWidth/4.3;
				var y = noHeight/7.3;
				
				$("#update-btn").click(function(){
					
					// 변경 불필요 -------------------------------------------------------
					
					// ajax member update ---------------------------------------------
					$.ajax({
						url:"./memberUpdate",
						type:"get",
						data:{
							num:staffNum
						},
						success:function(data){
							
							$("#staff-update-area").empty();
							$("#staff-update-area").append(data);
							
							// store dialog -------------------------------------------
							$("#store-search").click(function(){
								if (loginType == 4) {
									// doal log get Store search Function
									getDialogStore(sidoTxt, storeSearchTxt);
								} else {
									alert("접근 권한이 없습니다.");
								}
							})
							// ------------------------------------------------------------
							var btnTxt = $("#update-btn").attr("title");
							initBtn(btnTxt)
							
							// adminMember table : time table Y,N -------------------------
							// update-btn text 값에 따라 수정하기와 입력하기가 나뉨
							
							$("#pop-update-btn").click(function(){	
								
								var update_btn_chk = $("#pop-update-btn").text();
								
								if(update_btn_chk == "수정하기"){
									init("수정하기", true)
									$("#pop-update-btn").text("수정");
									$("#store-search").css("visibility","visible");
									$(".work-time").attr("readonly",false)
								} else if(update_btn_chk == "수정"){
									memberUpdate()
								} else if (update_btn_chk == "입력"){
									memberWrite();
								}
								
							})
							// if문 종료
							
							$("#pop-cancle-btn").click(function(){
								$("#staff-update-area").dialog('close');
							});
							
						}
					})
					// 종료: ajax member update ---------------------------------------------

					$("#staff-update-area").dialog({
						modal:true,
						width:'65%',
						height:'600',
						resizable:false,
						open:function(){
							$(this).parent().offset ({top : y, left: x } );
						}
					});

				})				
			})
			
			function initBtn(btnTxt){
				if(btnTxt == '입력'){
					$("#pop-update-btn").text("입력");
					$(".work-time").attr("readonly",false)
				} else {
					$(".work-time").attr("readonly",true);
					$("#pop-update-btn").text("수정하기");
				}
			}
			
			function memberWrite(){
				
				init("입력", false)
				// $.post 실행 후 닫기
				
				var url = "./memberWrite"
				
				var sun = $("#sunStart").val()+"-"+$("#sunEnd").val();
				var mon = $("#monStart").val()+"-"+$("#monEnd").val();
				var tue = $("#tueStart").val()+"-"+$("#tueEnd").val();
				var wed = $("#wedStart").val()+"-"+$("#wedEnd").val();
				var thu = $("#thuStart").val()+"-"+$("#thuEnd").val();
				var fri = $("#friStart").val()+"-"+$("#friEnd").val();
				var sat = $("#satStart").val()+"-"+$("#satEnd").val();

				$.ajax({
					url: url,
					type: "post",
					data: {
						id:staffInsertId,
						num:staffInsertNum,
						sun:sun,
						mon:mon,
						tue:tue,
						wed:wed,
						thu:thu,
						fri:fri,
						sat:sat
					},
					success: function(result){
						alert("작성을 성공하였습니다.");
						location.href="./memberList";
					},
					error: function(result){
						alert("작성에 실패하였습니다.")
					}
				})

			}
			
			function memberUpdate(){
				var staffNum = $("#staff-info-num").attr("title");
				var staffAdminNum = $("#staff-info-admin-num").attr("title");
				var staffStoreCode = $("#work-store-txt").attr("title");
				
				var sun = $("#sunStart").val()+"-"+$("#sunEnd").val();
				var mon = $("#monStart").val()+"-"+$("#monEnd").val();
				var tue = $("#tueStart").val()+"-"+$("#tueEnd").val();
				var wed = $("#wedStart").val()+"-"+$("#wedEnd").val();
				var thu = $("#thuStart").val()+"-"+$("#thuEnd").val();
				var fri = $("#friStart").val()+"-"+$("#friEnd").val();
				var sat = $("#satStart").val()+"-"+$("#satEnd").val();

				// 출퇴근 시간 update
				$.ajax({
					url: "./memberUpdate",
					type: "post",
					data:{
						num:staffNum,
						adminNum:staffAdminNum,
						storeCode:staffStoreCode,
						sun:sun,
						mon:mon,
						tue:tue,
						wed:wed,
						thu:thu,
						fri:fri,
						sat:sat
					},
					success: function(result){
						alert("수정이 완료되었습니다.")
						location.href="./memberList";
					},
					error: function(){
						alert("수정을 실패하였습니다.")
					}
				});

			}
			
			function init(btnText, readOnly){
				$("#pop-update-btn").text(btnText);
				$(".work-time").attr("readonly",readOnly)
			}

			function showList(id,timeTable, num, name, type, storeName, doro_addr, staffCount, storeCode){
				
				$("#name").text(name)
				$("#update-btn").css("visibility","visible")
				
				if (type == 2){
					type = "Staff"
				} else if (type == 3){
					type = "Manager"
				} else {
					type = "Admin"
					$("#update-btn").css("visibility","hidden")
				}
				$("#type").text(type)
				
				$("#work-store").text(storeName)
				
				$("#doro-addr").text(doro_addr)
				$("#work-store-count").text(staffCount)
				
				staffId = id;
				staffInsertId = id;
				
				staffNum = num;
				staffInsertNum = num;
				staffStoreCode = storeCode;
				
				if(timeTable == 'Y'){
					$("#update-btn").text("정보 수정")
					$("#update-btn").attr("title","수정")
				} else if(timeTable == 'N'){
					$("#update-btn").text("정보 입력")
					$("#update-btn").attr("title","입력")
				}
				
			}
			
			$("#search-btn").click(function(){
				curPage = 1;
				search = $("#search").val();
				$("#member-list").empty();
				getList()
			})
			
			$("#more").click(function(){
				curPage++;
				getList();
			})
			
			$(".dropdown-item").click(function(){
				searchType = $(this).attr("title");
				curPage = 1;
				
				if (searchType == 0){
					search = "";	
				}
				
				$("#member-list").empty();
				getList();
			})
			
			function getList(){
				
				$.ajax({
					url:"./getMemberList",
					type:"GET",
					data:{
						curPage:curPage,
						searchType:searchType,
						search:search
					},
					success:function(data){
						$("#member-list").append(data);
					}
				});
				
			}
			
			function typeSelect(type){
				
				var text = "직급 선택"
				
				if(type == 2){
					text = "Staff"
				} else if (type == 3){
					text = "Manager"
				}
				
				$("#select-type").text(text)
				
			}
		
			$(".dropdown-item").click(function(){
				type = $(this).attr("title")
				typeSelect(type)
			})

			// 종료: get store list function 분리 -----------------------------------
			// function 으로 분리 -------------------------------
			function getDialogStore(sidoTxt, storeSearchTxt){
				
				x = noWidth/3.1; 
				y = noHeight/5;
				
				getStoreList(sidoTxt,storeSearchTxt);
								
				beforeChk=0;
				storeChk=0;
				countChk=0;
												
				$("#store-info-area").dialog({
					modal:true,
					width:'50%',
					height:'500',
					resizable:false,
					open:function(){
						$(this).parent().offset ({top: y,left: x } );
					}
				});
			}
			// 종료: function 분리 --------------------------------------------------
			
			function getStoreSearch(sidoTxt){
				storeSearchTxt = $("#search-store-txt").val();
				getSidoList(sidoTxt, storeSearchTxt);
			}
			
			function getSidoList(sidoTxt, search){
				getStoreList(sidoTxt,search);
			}
			
			// function 분리하기 ---------------------------
			function getStoreList(sidoTxt, search){
				$.ajax({
					url:"../store/storeList",
					type:"GET",
					data:{
						sidoName:sidoTxt,
						search:search
					},
					success: function(data){
						
						$("#store-info-area").empty();
						$("#store-info-area").append(data);
						$("#search-store-txt").val(search);
						
						$(".sido").click(function(){
							sidoTxt = $(this).attr("title");
							getSidoList(sidoTxt,search);
						})
						
						var showSido;
						if(sidoTxt == ''){
							showSido = '전체';
						} else {
							showSido = sidoTxt;
						}
						
						$(".sido-type").text(showSido);
						$(".select-store").click(function(){
							
							storeChk = $(this).index();
							
							if(countChk > 0){
								$(".select-store:eq("+beforeChk+")").css('background-color','white');
								$(".select-store:eq("+beforeChk+")").css('border','none');
								beforeChk = storeChk;
							} else {
								beforeChk = $(this).index();
							}
							
							$(this).attr("check", "Y");
							$(this).css("background-color","#F6F6F6");
							$(this).css("border","1px solid #006633");
							
							staffStoreCode = $(this).attr("title");
							staffStoreName = $(this).attr("name");
								
							countChk++;
			
						})
						
						$("#store-search-btn").click(function(){
							getStoreSearch(sidoTxt);
							/* storeSearchTxt = $("#search-store-txt").val();
							getSidoList(sidoTxt, search) */
						})
						
						$("#search-store-txt").keydown(function(key){
							if(key.keyCode == 13){
								getStoreSearch(sidoTxt);
								/* storeSearchTxt = $("#search-store-txt").val();
								getSidoList(sidoTxt, search) */
							}
						});
						
						$(".store-choose").click(function(){
							$("#work-store-txt").val(staffStoreName);
							$("#work-store-txt").attr("title",staffStoreCode);
							$("#pop-update-btn").text("수정");
							$(".work-time").attr("readonly",false);
							$("#pop-update-btn").attr("title","수정");
							$("#store-info-area").dialog('close');
						});
						
						$(".store-cancle").click(function(){
							$("#store-info-area").dialog('close');
						});
						
					}
				});
				
			}

		</script>
		
	</body>
	
</html>