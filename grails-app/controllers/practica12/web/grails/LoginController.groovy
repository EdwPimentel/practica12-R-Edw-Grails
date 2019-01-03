package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityUtils

class LoginController extends grails.plugin.springsecurity.LoginController  {

    static allowedMethods = [logout: 'POST']

    def auth() {

        def conf = getConf()

        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }


        String postUrl = request.contextPath + conf.apf.filterProcessesUrl
        render view: 'logPage', model: [postUrl            : postUrl,
                                        rememberMeParameter: conf.rememberMe.parameter,
                                        usernameParameter  : conf.apf.usernameParameter,
                                        passwordParameter  : conf.apf.passwordParameter,
                                        gspLayout          : conf.gsp.layoutAuth]
    }

    def logout() {
        redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/logoff'
    }


}