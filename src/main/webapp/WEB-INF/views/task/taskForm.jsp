<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tld/fu.tld" prefix="fu"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>任务管理</title>
</head>

<body>
	<form id="inputForm" action="${ctx}/task/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${task.id}"/>
		<fieldset>
			<legend><small>管理任务</small></legend>
			<div class="control-group">
				<label for="task_title" class="control-label">任务名称:</label>
				<div class="controls">
					<input type="text" id="task_title" name="title"  value="${task.title}" class="input-large required" minlength="3"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">任务描述:</label>
				<div class="controls">
					<textarea id="description" name="description" class="input-large">${task.description}</textarea>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">要求完成日期:</label>
				<div class="controls">
					<textarea id="planDate" name="planDate" class="input-large">${task.planDate}</textarea>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">实际完成日期:</label>
				<div class="controls">
					<textarea id="realDate" name="realDate" class="input-large">${task.realDate}</textarea>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">总费用:</label>
				<div class="controls">
					<textarea id="feeTotle" name="feeTotle" class="input-large">${task.feeTotle}</textarea>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">已支付:</label>
				<div class="controls">
					<textarea id="feePaid" name="feePaid" class="input-large">${task.feePaid}</textarea>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">附件:</label>
				<div class="controls">
			<input type="hidden" name="realName" id="realName"
							value="${realName }" />
						<input type="text" name="fileName" id="fileName" size="70"
							readonly value="${fileName}" />
						<fu:fu oldFileId="fileName" newFileId="realName"
							filePath="taskman" />
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
			$("#task_title").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
