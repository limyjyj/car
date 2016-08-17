<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
	<title>Chat</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<h1>Chat</h1>
	
	<form id="joinChatForm" action="/car/mvc/chat" th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() == null">
		<p>
			<label for="user">User: </label>
			<input id="user" name="user" type="text" data-bind="value: userName"/>
			<input name="messageIndex" type="hidden" data-bind="value: messageIndex"/>
			<button id="start" type="submit" data-bind="click: joinChat">Join Chat</button>
		</p>
	</form>

	<form id="leaveChatForm" action="/car/mvc/chat"  th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() != null">
		<p>
			You're chatting as <strong data-bind="text: userName"></strong>
			<button id="leave" type="submit" data-bind="click: leaveChat">Leave Chat</button>
		</p>
	</form>

	<div data-bind="visible: activePollingXhr() != null">
		<textarea rows="15" cols="60" readonly="readonly" data-bind="text: chatContent"></textarea>
	</div>
	
	<form id="postMessageForm" action="/car/mvc/chat"  th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() != null">
		<p>
			<input id="message" name="message" type="text" data-bind="value: message" />
			<button id="post" type="submit" data-bind="click: postMessage">Post</button>
		</p>
	</form>
</body>
<script type="text/javascript" src="/car/resources/js/jquery-1.7.2.min.js" th:src="@{/car/resources/js/jquery-1.7.2.min.js}"></script>
<script type="text/javascript" src="/car/resources/js/knockout-2.0.0.js" th:src="@{/car/resources/js/knockout-2.0.0.js}"></script>
<script type="text/javascript" src="/car/resources/js/chat.js" th:src="@{/car/resources/js/chat.js}"></script>

</html>