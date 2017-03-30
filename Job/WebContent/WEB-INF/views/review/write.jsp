<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
textarea {
	width: 100%;
	height: 150px;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	background-color: #f8f8f8;
	font-size: 16px;
	resize: none;
}
</style>
<form>
	<label for="fname">First Name</label> : <label for="fname"><c:set
			var="email" value="${fn:split(review[i].EMAIL, '@')}"></c:set>
		${email[0]}</label><br /> <label for="fname">평가점수</label> : <select
		class="form-control" name="star" id="min">
		<c:forEach var="i" begin="0" end="100" step="5">
			<option value="${i}">${i}점</option>
		</c:forEach>
	</select>
	<hr />
	<label for="fname">리뷰</label> :<br />
	<form>
		<textarea></textarea>
	</form><br/>
	<button type="submit">올리기</button>

</form>