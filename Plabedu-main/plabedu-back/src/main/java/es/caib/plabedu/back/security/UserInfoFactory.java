package es.caib.plabedu.back.security;

import javax.servlet.http.HttpServletRequest;

public interface UserInfoFactory {

    UserInfo createUserInfo(HttpServletRequest request);

}
