package auth.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;

import chok.sso.AuthUser;
import chok.util.http.HttpAction;
import chok.util.http.HttpResult;
import chok.util.http.HttpUtil;

public class SSOAuthFilter implements Filter 
{
	static Logger log = LoggerFactory.getLogger("sso.auth");
	
	private static String ssoURL = "";// SSO项目根地址
	private static String ssoApiURL = "";// SSO接口地址
	private static String appId = "";// SSO client端ID
	private final static String menuJson = "sso.menuJson";// 
	public final static String btnJson = "sso.btnJson";// 
	public final static String actJson = "sso.actJson";// 
	
	@Override
	public void init(FilterConfig config) throws ServletException 
	{
		try
		{
			ssoURL = String.valueOf(config.getInitParameter("ssoURL")).trim();
			ssoApiURL = String.valueOf(config.getInitParameter("ssoApiURL")).trim();
			appId = String.valueOf(config.getInitParameter("appId")).trim();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String relativeURI = req.getRequestURI();// request.getRequestURI()=request.getContextPath()+request.getServletPath()
		try
		{
			AuthUser u = (AuthUser)session.getAttribute(SSOLoginFilter.LOGINER);
			if (!u.getM().containsKey(menuJson) || u.getString(menuJson)==null) u.set(menuJson, getMenuJson(u));
			if (!u.getM().containsKey(btnJson) || u.getString(btnJson)==null) u.set(btnJson, getBtnJson(u));
			chain.doFilter(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() 
	{
	}
	
	public String getMenuJson(AuthUser u)
	{
		Map<String, String> param = new HashMap<String, String>();
		param.put("tc_user_id", u.getString("id"));
		param.put("tc_app_id", appId);
		HttpResult<String> r = HttpUtil.create(new HttpAction(ssoApiURL+"/getMenuByUserId.action", param), String.class, "GET");
		if(log.isInfoEnabled()) log.info("已获取 menuJson：" + r.getData());
		return r.getData();
	}
	
	public String getBtnJson(AuthUser u)
	{
		Map<String, String> param = new HashMap<String, String>();
		param.put("tc_user_id", u.getString("id"));
		param.put("tc_app_id", appId);
		HttpResult<String> r = HttpUtil.create(new HttpAction(ssoApiURL+"/getBtnByUserId.action", param), String.class, "GET");
		if(log.isInfoEnabled()) log.info("已获取 btnJson：" + r.getData());
		return r.getData();
	}
}
