<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div id="content" class="container-fluid">
    <div class="row">
        <g:if test="${flash.message}">
            <div role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
        </g:if>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h5><g:message code="contacto.label"/></h5>
                </div>
                <div class="card-body">
                    <dl class="row">

                        <dt class="col-sm-3"><g:message code="nombre.label"/></dt>
                        <dd class="col-sm-9"> <f:display bean="contacto" property="nombre"/></dd>
                        <dt class="col-sm-3"><g:message code="apellido.label"/></dt>
                        <dd class="col-sm-9"> <f:display bean="contacto" property="apellido"/></dd>
                        <dt class="col-sm-3"><g:message code="tel.label"/></dt>
                        <dd class="col-sm-9"> <f:display bean="contacto" property="telefono"/></dd>
                        <dt class="col-sm-3"><g:message code="direccion.label"/></dt>
                        <dd class="col-sm-9"> <f:display bean="contacto" property="direccion"/></dd>
                        <dt class="col-sm-3"><g:message code="puesto.label"/></dt>
                        <dd class="col-sm-9"> <f:display bean="contacto" property="puesto"/></dd>
                        <dt class="col-sm-3"><g:message code="departamentos.label"/></dt>
                        <dd class="col-sm-9">
                            <ul>

                            <g:each in="${this.contacto.deps}">

                                <li>
                                    ${it.nombre}
                                </li>

                            </g:each>
                             </ul>

                        </dd>
                        <dt class="col-sm-3"><g:message code="categoria.label"/></dt>
                        <dd class="col-sm-9"> ${this.contacto.categoria.nombre}</dd>

                    </dl>

                </div>
                <div class="card-footer">
                    <g:form resource="${this.contacto}" method="DELETE">
                        <g:link class="btn btn-primary btn-mini" action="edit" resource="${this.contacto}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="btn btn-danger btn-mini delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
            </div>

        </div>
    </div>

</div>
</body>
</html>
