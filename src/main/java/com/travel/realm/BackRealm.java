package com.travel.realm;

import com.travel.entity.Admin;
import com.travel.service.IAdminService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author:吴小富
 * @Date: 2019/12/25
 */
public class BackRealm extends AuthorizingRealm {

    @Autowired
    private IAdminService adminService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token= (UsernamePasswordToken) authenticationToken;
        Admin admin=adminService.loginByName(token.getUsername());
        //System.out.println(admin);
        if(admin!=null){
            ByteSource byteSource = ByteSource.Util.bytes(admin.getName());
            return new SimpleAuthenticationInfo(admin, admin.getPassword(), byteSource, this.getName());
        }
        return null;
    }
}
