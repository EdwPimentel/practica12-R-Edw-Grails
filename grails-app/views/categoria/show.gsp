<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
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
                    <h5><g:message code="categoria.label"/></h5>
                </div>
                <div class="card-body">
                    <dl class="row">

                        <dt class="col-sm-3"><g:message code="nombre.label"/></dt>
                        <dd class="col-sm-9"> <f:display bean="categoria" property="nombre"/></dd>
                        <dt class="col-sm-3"><g:message code="descripcion.label"/></dt>
                        <dd class="col-sm-9"> <f:display bean="categoria" property="descripcion"/></dd>

                    </dl>

                </div>
                <div class="card-footer">
                    <g:form resource="${this.categoria}" method="DELETE">
                        <g:link class="btn btn-primary btn-mini" action="edit" resource="${this.categoria}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="btn btn-danger btn-mini delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
            </div>

        </div>
    </div>

</div>
</body>
</html>
