<%@ page pageEncoding="utf-8"%>
<%@page import="com.liferay.portal.kernel.util.StringPool"%>
<%@page import="com.njshido.component.ShidoImageActConfigurationAction" %>
<%@page import="javax.portlet.PortletPreferences"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<portlet:defineObjects />

<%
	PortletPreferences preferences = renderRequest.getPreferences();
	String bgColor = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_BG_COLOR, StringPool.BLANK);
	String imgUrl = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IMG_URL, StringPool.BLANK);	
	String height = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HEIGHT, StringPool.BLANK);
	String link = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_LINK, StringPool.BLANK);
	String imgPos = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IMG_POSITION, StringPool.BLANK);	
	String actAllowed = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_IS_ALLOWED, StringPool.BLANK);
	String actDura = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_DURATION, StringPool.BLANK);
	String hFromOffset = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET, StringPool.BLANK);	
	String hToOffset = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET, StringPool.BLANK);
	String vFromOffset = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET, StringPool.BLANK);
	String vToOffset = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET, StringPool.BLANK);	
	String fromOpacity = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_FROM_OPACITY, StringPool.BLANK);
	String toOpacity = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_TO_OPACITY, StringPool.BLANK);
	String title = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_TITLE, StringPool.BLANK);
	String desc = preferences.getValue(ShidoImageActConfigurationAction.SHIDO_IMAGE_ACT_DESC, StringPool.BLANK);
%>
<div id="<portlet:namespace/>shido-image-act" class="shido-image-act"
	style="height:<%=height%>px;background:<%=bgColor%>;">
<%
	if("right".equalsIgnoreCase(imgPos)) {
%>
	<div class="words" style="left:0;">
		<div class="table">
			<div class="cell">
				<span class="title"><%= title%></span>
				<span class="desc"><%= desc.replaceAll("\\n", "<br/>")%></span>
				<span class="link">
					<a href="#">了解详情 &gt;</a>
				</span>
			</div>
		</div>
	</div>
	<div class="picture" id="<portlet:namespace/>shido-image-act-room" style="right:0;">
		<img alt="" style="left:0;" src="<%= imgUrl%>">
	</div>
<% 
	} else {
%>
	<div class="picture" id="<portlet:namespace/>shido-image-act-room" style="left:0;">
		<img alt="" style="right:0;" src="<%= imgUrl%>">
	</div>
	<div class="words" style="right:0;">
		<div class="table">
			<div class="cell">
				<span class="title"><%= title%></span>
				<span class="desc"><%= desc.replaceAll("\\n", "<br/>")%></span>
				<span class="link">
					<a href="#">了解详情 &gt;</a>
				</span>
			</div>
		</div>
	</div>
<%
	}
%>
</div>

<script>
	$(document).ready(function() {
		var isAct = "<%= actAllowed%>";
		var pos = "<%= imgPos%>";
		var dura = "<%= actDura%>";
		var fOpac = "<%= fromOpacity%>";
		var tOpac = "<%= toOpacity%>";
		var hfOffset = "<%= hFromOffset%>";
		var vfOffset = "<%= vFromOffset%>";
		var htOffset = "<%= hToOffset%>";
		var vtOffset = "<%= vToOffset%>";
		if (isAct == 'true') {
			var controller = $.superscrollorama();
			if(pos == "right") {
				controller.addTween(
						'#<portlet:namespace/>shido-image-act-room', 
						TweenMax.fromTo(
								'#<portlet:namespace/>shido-image-act-room img', 
								dura, 
								{css:{top:vfOffset,left:hfOffset,opacity:fOpac},immediateRender:true,ease:Quad.easeInOut}, 
								{css:{top:vtOffset,left:htOffset,opacity:tOpac}, ease:Quad.easeInOut}
						),
						0,
						0,
						false
				);
			} else {
				controller.addTween(
						'#<portlet:namespace/>shido-image-act-room', 
						TweenMax.fromTo(
								'#<portlet:namespace/>shido-image-act-room img', 
								dura, 
								{css:{top:vfOffset,right:hfOffset,opacity:fOpac},immediateRender:true,ease:Quad.easeInOut}, 
								{css:{top:vtOffset,right:htOffset,opacity:tOpac}, ease:Quad.easeInOut}
						),
						0,
						0,
						false
				);
			}
		}
	});
</script>