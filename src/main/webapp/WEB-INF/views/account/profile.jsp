<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>资料修改</title>
</head>

<body>
	<form id="inputForm" action="${ctx}/profile" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${user.id}"/>
		<fieldset>
			<legend><small>资料修改</small></legend>
			<div class="control-group">
				<label for="name" class="control-label">昵称:</label>
				<div class="controls">
					<input type="text" id="name" name="name" value="${user.name}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="plainPassword" class="control-label">密码:</label>
				<div class="controls">
					<input type="password" id="plainPassword" name="plainPassword" class="input-large" placeholder="...Leave it blank if no change"/>
				</div>
			</div>
			<div class="control-group">
				<label for="confirmPassword" class="control-label">确认密码:</label>
				<div class="controls">
					<input type="password" id="confirmPassword" name="confirmPassword" class="input-large" equalTo="#plainPassword" />
				</div>
			</div>
			<div class="control-group">
				<label for="name" class="control-label">QQ号码:</label>
				<div class="controls">
					<input type="text" id="qqNumber" name="qqNumber" value="${user.qqNumber}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="name" class="control-label">手机号码:</label>
				<div class="controls">
					<input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="name" class="control-label">email:</label>
				<div class="controls">
					<input type="text" id="email" name="email" value="${user.email}" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="name" class="control-label">支付宝账号:</label>
				<div class="controls">
					<input type="text" id="aliPay" name="aliPay" value="${user.aliPay}" />
				</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
