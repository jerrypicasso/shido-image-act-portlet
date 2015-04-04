package com.njshido.component;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.portlet.DefaultConfigurationAction;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portlet.PortletPreferencesFactoryUtil;

public class ShidoImageActConfigurationAction extends DefaultConfigurationAction {
	
	public static final String SHIDO_IMAGE_ACT_BG_COLOR = "shido_image_act_bg_color";
	public static final String SHIDO_IMAGE_ACT_IMG_URL = "shido_image_act_img_url";
	public static final String SHIDO_IMAGE_ACT_HEIGHT = "shido_image_act_height";
	public static final String SHIDO_IMAGE_ACT_LINK = "shido_image_act_link";
	public static final String SHIDO_IMAGE_ACT_IMG_POSITION = "shido_image_act_img_position";
	
	public static final String SHIDO_IMAGE_ACT_IS_ALLOWED = "shido_image_act_is_allowed";
	public static final String SHIDO_IMAGE_ACT_DURATION = "shido_image_act_duration";
	public static final String SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET = "shido_image_act_horizontal_from_offset";
	public static final String SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET = "shido_image_act_horizontal_to_offset";
	public static final String SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET = "shido_image_act_vertical_from_offset";
	public static final String SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET = "shido_image_act_vertical_to_offset";
	public static final String SHIDO_IMAGE_ACT_FROM_OPACITY = "shido_image_act_from_opacity";
	public static final String SHIDO_IMAGE_ACT_TO_OPACITY = "shido_image_act_to_opacity";
	
	private static final String CONFIG_JSP = "/WEB-INF/config/config.jsp";
	private static final String SUCCESS = "success";
	
	private static final String SHIDO_IMAGE_ACT_BG_COLOR_DEFAULT_VAL = "#F2F2F2";
	private static final String SHIDO_IMAGE_ACT_HEIGHT_DEFAULT_VAL = "400";
	private static final String SHIDO_IMAGE_ACT_LINK_DEFAULT_VAL = "#";
	private static final String SHIDO_IMAGE_ACT_IMG_POSITION_DEFAULT_VAL = "right";
	private static final String SHIDO_IMAGE_ACT_IS_ALLOWED_DEFAULT_VAL = "false";
	private static final String SHIDO_IMAGE_ACT_DURATION_DEFAULT_VAL = "1";
	private static final String SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET_DEFAULT_VAL = "0";
	private static final String SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET_DEFAULT_VAL = "0";
	private static final String SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET_DEFAULT_VAL = "100";
	private static final String SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET_DEFAULT_VAL = "0";
	private static final String SHIDO_IMAGE_ACT_FROM_OPACITY_DEFAULT_VAL = "1";
	private static final String SHIDO_IMAGE_ACT_TO_OPACITY_DEFAULT_VAL = "1";
	
	@Override
	public String render(PortletConfig portletConfig, RenderRequest renderRequest, RenderResponse renderResponse) throws Exception {
		String portletId = renderRequest.getParameter("portletResource");
		PortletPreferences preferences = PortletPreferencesFactoryUtil.getPortletSetup(renderRequest, portletId);
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_BG_COLOR, preferences.getValue(SHIDO_IMAGE_ACT_BG_COLOR, SHIDO_IMAGE_ACT_BG_COLOR_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_IMG_URL, preferences.getValue(SHIDO_IMAGE_ACT_IMG_URL, StringPool.BLANK));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_HEIGHT, preferences.getValue(SHIDO_IMAGE_ACT_HEIGHT, SHIDO_IMAGE_ACT_HEIGHT_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_LINK, preferences.getValue(SHIDO_IMAGE_ACT_LINK, SHIDO_IMAGE_ACT_LINK_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_IMG_POSITION, preferences.getValue(SHIDO_IMAGE_ACT_IMG_POSITION, SHIDO_IMAGE_ACT_IMG_POSITION_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_IS_ALLOWED, preferences.getValue(SHIDO_IMAGE_ACT_IS_ALLOWED, SHIDO_IMAGE_ACT_IS_ALLOWED_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_DURATION, preferences.getValue(SHIDO_IMAGE_ACT_DURATION, SHIDO_IMAGE_ACT_DURATION_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET, preferences.getValue(SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET, SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET, preferences.getValue(SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET, SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET, preferences.getValue(SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET, SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET, preferences.getValue(SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET, SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_FROM_OPACITY, preferences.getValue(SHIDO_IMAGE_ACT_FROM_OPACITY, SHIDO_IMAGE_ACT_FROM_OPACITY_DEFAULT_VAL));
		renderRequest.setAttribute(SHIDO_IMAGE_ACT_TO_OPACITY, preferences.getValue(SHIDO_IMAGE_ACT_TO_OPACITY, SHIDO_IMAGE_ACT_TO_OPACITY_DEFAULT_VAL));
		return CONFIG_JSP;
	}
	
	@Override
	public void processAction(PortletConfig portletConfig, ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
		String portletResource = ParamUtil.getString(actionRequest, "portletResource");
		PortletPreferences preferences = PortletPreferencesFactoryUtil.getPortletSetup(actionRequest, portletResource);
		if (Validator.isNotNull(preferences)) {
			String bgColor = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_BG_COLOR);
			String imgUrl = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_IMG_URL);
			String height = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_HEIGHT);
			String link = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_LINK);
			String imgPos = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_IMG_POSITION);
			String actAllowed = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_IS_ALLOWED);
			String actDura = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_DURATION);
			String hFromOffset = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET);
			String hToOffset = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET);
			String vFromOffset = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET);
			String vToOffset = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET);
			String fromOpacity = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_FROM_OPACITY);
			String toOpacity = ParamUtil.getString(actionRequest, SHIDO_IMAGE_ACT_TO_OPACITY);
			
			preferences.setValue(SHIDO_IMAGE_ACT_BG_COLOR, bgColor);
			preferences.setValue(SHIDO_IMAGE_ACT_IMG_URL, imgUrl);
			preferences.setValue(SHIDO_IMAGE_ACT_HEIGHT, height);
			preferences.setValue(SHIDO_IMAGE_ACT_LINK, link);
			preferences.setValue(SHIDO_IMAGE_ACT_IMG_POSITION, imgPos);
			preferences.setValue(SHIDO_IMAGE_ACT_IS_ALLOWED, actAllowed);
			preferences.setValue(SHIDO_IMAGE_ACT_DURATION, actDura);
			preferences.setValue(SHIDO_IMAGE_ACT_HORIZONTAL_FROM_OFFSET, hFromOffset);
			preferences.setValue(SHIDO_IMAGE_ACT_HORIZONTAL_TO_OFFSET, hToOffset);
			preferences.setValue(SHIDO_IMAGE_ACT_VERTICAL_FROM_OFFSET, vFromOffset);
			preferences.setValue(SHIDO_IMAGE_ACT_VERTICAL_TO_OFFSET, vToOffset);
			preferences.setValue(SHIDO_IMAGE_ACT_FROM_OPACITY, fromOpacity);
			preferences.setValue(SHIDO_IMAGE_ACT_TO_OPACITY, toOpacity);
			preferences.store();
			
			SessionMessages.add(actionRequest, SUCCESS);
		}
		super.processAction(portletConfig, actionRequest, actionResponse);
	}
}
