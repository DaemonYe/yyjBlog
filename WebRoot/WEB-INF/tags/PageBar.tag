<%@ tag pageEncoding="UTF-8" %>
<!-- 声明JSTL标签，以便在本标签中使用 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 定义了两个标签属性 -->
<%@ attribute name="pageUrl" required="true" rtexprvalue="true" description="分页页面对应的URl" %>
<%@ attribute name="pageAttrKey" required="true" rtexprvalue="true" description="Page对象在Request域中的键名称" %>
<c:set var="pageUrl" value="${pageUrl}" />
<!-- 将一些标签中需要引用的对象放置到PageContext属性列表中，以便后面可以直接通过EL表达式引用之 -->
<%
   String separator = pageUrl.indexOf("?") > -1?"&":"?";
   jspContext.setAttribute("pageResult", request.getAttribute(pageAttrKey));
   jspContext.setAttribute("pageUrl", pageUrl);
   jspContext.setAttribute("separator", separator);
%>		 				
<!-- 页码显示 -->
<!--首页 -->
<c:if test="${pageResult.currentPageNo >1 }">
   <a href='<c:url value="${pageUrl}"/>${separator}pageNo=1'><span class="page page-other">首页</span></a>
</c:if>
<!--上一页 -->
<c:if test="${pageResult.hasPreviousPage}">
  <a href='<c:url value="${pageUrl}"/>${separator}pageNo=${pageResult.currentPageNo -1 }'><span class="page page-other">&lt;上一页</span></a>
</c:if>
<!-- 总页面数小于10 都显示 -->
<c:if test="${pageResult.totalPageCount le 10}">
	<c:forEach var="num" begin="1" end="${pageResult.totalPageCount}" step="1">
		<!-- 当前页 -->
		<c:if test="${num eq pageResult.currentPageNo }">
			<span class="page now-page">${num}</span>
		</c:if>
		<!-- 其余页 -->
		<c:if test="${num ne pageResult.currentPageNo}">
			<a href='<c:url value="${pageUrl}"/>${separator}pageNo=${num }'><span class="page">${num}</span></a>
		</c:if>
	</c:forEach>
</c:if>

<!-- 总页面数大于10  -->
<c:if test="${pageResult.totalPageCount gt 10}">
	<c:set var="begin" value="${pageResult.currentPageNo - 10}"/> 
	<c:set var="end" value="${pageResult.currentPageNo + 11}"/>
	<c:if test="${begin lt 0}">
		<c:set var="begin" value="1"/> 
	</c:if>
	<c:if test="${end gt pageResult.totalPageCount}">
		<c:set var="end" value="${pageResult.totalPageCount}"/> 
	</c:if>
  		<c:forEach var="num" begin="${begin}" end="${end}" step="1">
		<c:if test="${num eq pageResult.currentPageNo}">
			<span class="page now-page">${num}</span>
		</c:if>
		<c:if test="${num ne pageResult.currentPageNo}">
			<a href='<c:url value="${pageUrl}"/>${separator}pageNo=${num }'><span class="page">${num}</span></a>
		</c:if>
	</c:forEach>
</c:if>
<!--下一页 -->
<c:if test="${pageResult.hasNextPage}">
  <a href='<c:url value="${pageUrl}"/>${separator}pageNo=${pageResult.currentPageNo +1 }'><span class="page page-other">下一页&gt;</span></a>
</c:if>
<!-- 末页 -->
<c:if test="${pageResult.currentPageNo < pageResult.totalPageCount}">
   <a href="<c:url value="${pageUrl}"/>${separator}pageNo=${pageResult.totalPageCount }"><span class="page page-other">末页</span></a>
</c:if>