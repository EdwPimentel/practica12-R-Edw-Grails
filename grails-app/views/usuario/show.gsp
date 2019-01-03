<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
</head>
<body>
<div id="content" class="container-fluid">
    <div class="row">

        <div class="col">
            <g:if test="${flash.message}">
                <div role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <div class="card">
                <div class="card-header">
                    <h5><g:message code="usuario.label"/></h5>
                </div>
                <div class="card-body">
                    <dl class="row">

                        <dt class="col-sm-3"><g:message code="username.label"/></dt>
                        <dd class="col-sm-9"> <f:display bean="usuario" property="username"/></dd>
                        <dt class="col-sm-3"><g:message code="role.label"/></dt>
                        <dd class="col-sm-9">

                            <g:each var="cont" in="${userRoleList}">
                                <g:if test="${cont.user == this.user}">

                                    <g:if test="${cont.role.toString() == "Rol(authority:ROLE_USER)"}">
                                        User
                                    </g:if>

                                    <g:if test="${cont.role.toString() == "Rol(authority:ROLE_ADMIN)"}">
                                        Admin
                                    </g:if>

                                </g:if>

                            </g:each>

                        </dd>

                        <dt class="col-sm-3"><g:message code="departamentos.label"/></dt>
                        <dd class="col-sm-9">
                            <ul>

                                <g:each in="${this.user.deps}">

                                    <li>
                                        ${it.nombre}
                                        ${it.descripcion}
                                    </li>

                                </g:each>
                            </ul>

                        </dd>

                    </dl>

                </div>
                <div class="card-footer">
                    <g:form resource="${this.departamento}" method="DELETE">
                        <g:link class="btn btn-primary btn-mini" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="btn btn-danger btn-mini delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
            </div>
        </div>

    </div>

</div>
</body>
</html>
