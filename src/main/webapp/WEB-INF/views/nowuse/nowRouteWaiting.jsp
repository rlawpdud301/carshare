<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="../include/header.jsp"%>
<div>
	<h1>배차 기다리는중...</h1>
	<table>
		<tr>
			<td>출발지 : </td>
			<td>${routeVO.startAddress }</td>
		</tr>
		<tr>
			<td>도착지 : </td>
			<td>${routeVO.endAddress }</td>
		</tr>
		<tr>
			<td></td>
			<td><button type="button">등록 취소 할래요</button></td>
		</tr>
	</table>
	
</div>

<%@ include file="../include/footer.jsp"%>