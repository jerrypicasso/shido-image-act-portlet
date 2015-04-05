<%@page import="com.njshido.component.ShidoImageActConfigurationAction" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>

<portlet:defineObjects />

<liferay-theme:defineObjects />

<%
	String bgColor = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_BG_COLOR));
	String imgUrl = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IMG_URL));	
	String height = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HEIGHT));
	String link = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_LINK));
	String imgPos = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IMG_POSITION));	
	String actAllowed = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IS_ALLOWED));
	String actDura = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_DURATION));
	String hFromOffset = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET));	
	String hToOffset = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET));
	String vFromOffset = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET));
	String vToOffset = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET));	
	String fromOpacity = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_FROM_OPACITY));
	String toOpacity = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_TO_OPACITY));
	String title = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_TITLE));
	String desc = String.valueOf(request.getAttribute(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_DESC));
%>
<liferay-ui:success key="success" message="your-configuration-was-saved-sucessfully"/>
<form action="<liferay-portlet:actionURL portletConfiguration='true' />" method="post">
	<div id="" style="background:#ddd;padding:20px 0px;opacity:0.8">
		<ul>
			<li>
				<span>高度：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HEIGHT%>" type="number" style="width:30%;" value="<%=height%>"/>
			</li>
			<li>
				<span>图片位置：</span>
				<select name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IMG_POSITION%>" style="width:50px;">
					<option value="right" <%="right".equals(imgPos) ? "selected":"" %> >右</option>
					<option value="left" <%="left".equals(imgPos) ? "selected":"" %> >左</option>
				</select>
			</li>
			<li>
				<span>图片地址：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IMG_URL%>" type="text" style="width:80%;" value="<%=imgUrl%>"/>
			</li>
			<li>
				<span>标题：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_TITLE%>" type="text" style="width:80%;" value="<%=title%>"/>
			</li>
			<li>
				<span>描述：</span>
				<textarea name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_DESC%>" style="width:80%;"><%=desc%></textarea>
			</li>
			<li>
				<span>背景颜色：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_BG_COLOR%>" type="text" value="<%=bgColor%>"/>
			</li>
			<li>
				<span>链接地址：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_LINK%>" type="text" value="<%=link%>"/>
			</li>
			<li>
				<span>动画效果：</span>
				<input name='<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IS_ALLOWED%>' 
					type="radio" value="true" <%="true".equals(actAllowed) ? "checked":"" %> />开
				<input name='<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IS_ALLOWED%>' 
					type="radio" value="false" <%=!"true".equals(actAllowed) ? "checked":"" %>/>关
			</li>
			<li>
				<span>动画时长：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_DURATION%>" type="number" style="width:30%;"  value="<%=actDura%>"/>
			</li>
			<li>
				<span>横向起点偏移值：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET%>" type="number" style="width:30%;"  value="<%=hFromOffset%>"/>
			</li>
			<li>
				<span>纵向起点偏移值：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET%>" type="number" style="width:30%;"  value="<%=vFromOffset%>"/>
			</li>
			<li>
				<span>横向终点偏移值：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET%>" type="number" style="width:30%;"  value="<%=hToOffset%>"/>
			</li>
			<li>
				<span>纵向终点偏移值：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET%>" type="number" style="width:30%;"  value="<%=vToOffset%>"/>
			</li>
			<li>
				<span>起始透明度：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_FROM_OPACITY%>" type="number" style="width:30%;"  value="<%=fromOpacity%>"/>
			</li>
			<li>
				<span>最终透明度：</span>
				<input name="<portlet:namespace/><%=ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_TO_OPACITY%>" type="number" style="width:30%;"  value="<%=toOpacity%>"/>
			</li>
		</ul>
	</div>
	<input type="submit" value="save"/>
</form>