<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib uri="/WEB-INF/tld/fd.tld" prefix="fd"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>任务管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="row">
		<div class="span4 offset7">
			<form class="form-search" action="#">
				<label>名称：</label> <input type="text" name="search_LIKE_title" class="input-medium" value="${param.search_LIKE_title}"> 
				<button type="submit" class="btn" id="search_btn">Search</button>
		    </form>
	    </div>
	    <tags:sort/>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>任务名称</th><th>任务简述</th><th>详细说明</th><th>要求完成时间</th><th>总价格</th><th>已支付</th><th>实际完成时间</th><th>抢单</th></tr></thead>
		<tbody>
		<c:forEach items="${tasks.content}" var="task">
			<tr>
				<td>${task.title}</td>
				<td>${task.description}</td>
				<td>
					<c:set var="fileR" value="${fn:split(task.realName,',')}" />
					<c:set var="fileN" value="${fn:split(task.fileName, ',')}" />
								
								<c:forEach var="fr" items="${fileR}" varStatus="str">
										<c:forEach var="fn" items="${fileN}" varStatus="stn">
											<c:if test="${str.index==stn.index}">
												<fd:fd fileNewName="${fn}" fileName="${fr}" filePath="taskman" />
											</c:if>
										</c:forEach>
								</c:forEach>
				</td>
				<td>${task.planDate}</td>
				<td>${task.feeTotle}</td>
				<td>${task.feePaid}</td>
				<td>${task.realDate}</td>
				<td>
				<c:if test="${null==task.developer}">
				<a href="${ctx}/task/tryit/${task.id}">抢单</a>
				</c:if>
				<c:if test="${ ! empty task.developer}">
				已被抢
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<tags:pagination page="${tasks}" paginationSize="5"/>

	<shiro:hasRole name="admin">
	<div><a class="btn" href="${ctx}/task/create">创建任务</a></div>
	</shiro:hasRole>
</body>
</html>
