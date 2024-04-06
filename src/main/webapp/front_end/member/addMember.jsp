<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>

<% 
	MemberVO memVO = (MemberVO)request.getAttribute("memVO"); 
%>
<%= memVO==null %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�s�W�|�� --- From addMember.jsp</title>
</head>


<body>

<h3>---�s�W�|�����---</h3>
<br>
<h4><a href="<%=request.getContextPath()%>/front_end/member/select_page.jsp">�^����</a></h4>
<br>

<%-- ���~�T���C���e�{�B --%>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form method="post" action="<%=request.getContextPath()%>/member.do" enctype="multipart/form-data">

<table>

<tr>
<td>Email</td>
<td><input type="text" name="email" value="<%= (memVO==null) ? "" : memVO.getEmail()%>"></td>
</tr>

<tr>
<td>Name</td>
<td><input type="text" name="memberName" value="<%=(memVO==null) ? "" : memVO.getMemberName()%>"></td>
</tr>

<tr>
<td>Password</td>
<td><input type="text" name="password" value="<%=(memVO==null) ? "" : memVO.getPassword()%>"></td>
</tr>

<tr>
<td>Birthday</td>
<td><input type="text" name="birthday" value="<%=(memVO==null) ? "" : memVO.getBirthday()%>"></td>
</tr>

<tr>
<td>Gender</td>
<td>
	<select name="gender">
		<option value="0">�k</option>
		<option value="1">�k</option>
		<option value="2">��L</option>
	</select>
</td>
</tr>

<tr>
<td>Phone</td>
<td><input type="text" name="phone" value="<%=(memVO==null) ? "" : memVO.getPhone()%>"></td>
</tr>

<tr>
<td>Address</td>
<td><input type="text" name="address" value="<%=(memVO==null) ? "" : memVO.getAddress()%>"></td>
</tr>

<tr>
<td>Picture</td>
<td><input type="file" name="memberPic"></td>
</tr>


</table>

<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W">

</form>

</body>


<% 
  java.sql.Date birthday = null;
  try {
	    birthday = memVO.getBirthday();
   } catch (Exception e) {
	   birthday = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$.datetimepicker.setLocale('zh');
$('#f_date1').datetimepicker({
    theme: '',              //theme: 'dark',
    timepicker:false,       //timepicker:true,
    step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
    format:'Y-m-d',         //format:'Y-m-d H:i:s',
	   value: '<%=birthday%>', // value:   new Date(),
    //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
    //startDate:	            '2017/07/10',  // �_�l��
    //minDate:               '-1970-01-01', // �h������(���t)���e
    //maxDate:               '+1970-01-01'  // �h������(���t)����
 });
 
</script>
</html>