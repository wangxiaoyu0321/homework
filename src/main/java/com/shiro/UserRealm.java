/**
 * 
 */
package com.shiro;

import java.security.Principal;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Role;
import com.entity.UserEntity;
import com.service.UserService;
import com.util.Base64;
import com.util.MD5;

/**
 * @description：
 */
public class UserRealm extends AuthorizingRealm {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	UserService us;
	
	public void setName(String name){
		super.setName("customRealm");
	}
	
	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection pc) {
		log.info("----------------------------进入授权------------------------");
		UserEntity user = (UserEntity) SecurityUtils.getSubject().getSession().getAttribute("username");
		Integer id = user.getRoleId();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.setRoles(us.findRoleNameById(id));
		id=user.getRoleId();
		Set<String> set = us.findPermissionByRole(id);
		info.setStringPermissions(us.findPermissionByRole(id));
		log.info("----------------------------完成授权------------------------");
		log.info(info);
		return info;		
	}
	
	/**
	  *@description： 认证
	  */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// token中包含用户输入的用户名和密码  
        // 第一步从token中取出用户名 
		String username = (String) token.getPrincipal();
		UserEntity ue = us.findUserByName(username);
		if(ue == null){
			 log.info("------------------------当前用户不存在-------------------------");
			 throw new UnknownAccountException();
		}
//		String pwd = ue.getPassword();
//		String pwd = Base64.encode(MD5.MD5(ue.getPassword()));
//		String password2 = MD5.MD5(ue.getPassword());
//		String pwd = Base64.encode(password2);
//		ue.getPassword();
//		log.info("-------------------------"+pwd+"-------------------------");
		return new SimpleAuthenticationInfo(ue.getName(),ue.getPassword(),"customRealm");		
	}
	
	
}
