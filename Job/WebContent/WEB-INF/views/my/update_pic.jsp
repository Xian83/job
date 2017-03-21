<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <h2>사진 등록 결과</h2>
<%-- <c:choose>
	<c:when test="${rst ne 1 }">
		<h2>변경 성공!! <b>2초</b> 후 이전 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/my/info" />
	</c:when>
	<c:otherwise>
		<h2>변경 실패! <b>2초</b> 후 이전 페이지로 이동합니다.</h2>
		<meta http-equiv="refresh" content="2;url=/my/info" />
	</c:otherwise>
</c:choose> --%>
    
<%-- <%
	try {
		
		String save = application.getRealPath("/picture");
		File dir = new File(save);
		if(!dir.exists()) {
			dir.mkdir();
		}
		MultipartRequest multi = 
			new MultipartRequest(request, save, 1024*1024*30, "utf-8");	// 업로드가 처리됨.
		String ct = multi.getContentType("pic");
		File f = multi.getFile("pic");
		
		if(!ct.startsWith("image")) {
			f.delete();
			throw new Exception("not image file..");
		}
		String fn = f.getName();
		String id = (String)session.getAttribute("auth_id");
		long ti = System.currentTimeMillis();		
			f.renameTo(new File(f.getParent() , id+"_"+ti+".jpg") );	// 이름변경
		// 이파일의 URL 설정은..?
		//==================================================================
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 검색 성공");

		String url = "jdbc:oracle:thin:@192.168.10.1:1521:xe";
		String user = "SHJ";
		String password = "oracle";
		Connection conn = DriverManager.getConnection(url, user, password);
		System.out.println("DB 연결 성공");
		
		String sql= String.format("insert into picture values(picture_seq.nextval, '%s', '%s')", 
				id, "/picture/"+id+"_"+ti+".jpg");
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		
		conn.close();
		
		response.sendRedirect("/my/info.jsp");
		
	}catch(Exception e) {
		%>
			개인 사진 변경 처리 실패 (<%=e.toString() %>)
			<a href="/my/info.jsp">다시 변경</a>
		<%
	}

%> --%>