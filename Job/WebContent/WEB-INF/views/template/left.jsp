<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
	th {
	width: 200px;
	height: 100px;
	text-align: center;
}
</style>
<div class="panel panel-default ">
		<div class="panel-heading " align="center" style="background: #f4511e">
			������
			<div class="btn-group " align="right">
				<a class="btn dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-align-justify"></i> <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li>���� �� ���</li>
					<li>�ֱ� �� ���</li>
					<li>��ä�޷�</li>
				</ul>
			</div>
		</div>

		<div class="panel-body" align="center" style="background: #ECF1EF">
			
			<form action="/my/update_pic" method="post"
				enctype="multipart/form-data">
				<b>PICTURE</b><br /> <img src="${url}" width="150" height="150" />
				<hr/>
				<input type="file" name="pic" style="display: inline;"/>  
				<input type="hidden" name="email" value="${sessionScope.email}"/>
				<button type="submit" class="btn">��������</button>
			</form>
			<hr />	
			<table>
				<tr>
					<th><a href="/my/info">ȸ����������</a></th>
					<th><a href="/my/recommand">��õ ��� ����</a></th>
					<th><a href="/my/interest">��ũ���� ��� ����</a></th>
				</tr>
			</table>
		</div>

	</div>
