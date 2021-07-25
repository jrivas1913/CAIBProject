package es.caib.plabedu.back.security;

import es.caib.plabedu.commons.utils.Constants;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

/**
 * Proveeix una forma centralitzada de comprovar els permisos de l'usuari dins l'aplicació web.
 * 
 * @author areus
 */
@Named
@ApplicationScoped
public class Security {

    @Inject
    private HttpServletRequest request;

    public boolean isAdmin() {
        return request.isUserInRole(Constants.PLE_ADMIN);
    }
    
    public boolean isUser() {
        return request.isUserInRole(Constants.PLE_USER);
    }
    
    public boolean isBorsa() {
        return request.isUserInRole(Constants.PLE_BORSA);
    }
   
    public boolean isRRHH() {
        return request.isUserInRole(Constants.PLE_RRHH);
    }
    
    public boolean isUserOrAdmin() {
        return isUser() || isAdmin();
    }

}
