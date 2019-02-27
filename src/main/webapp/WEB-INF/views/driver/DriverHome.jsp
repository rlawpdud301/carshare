<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	
	<script>
	$(function () {
		$("#mode").text("Drive mode");
		$("body").removeClass("skin-blue");
    	$("body").addClass("skin-green");
	})
	</script>
<%@ include file="../include/footer.jsp"%>