<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Contacto')}" />
</head>
<body>

<div id="content" class="container-fluid">

    <div class="row">

        <div class="col">
            <g:if test="${flash.message}">
                <div role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
                <ul role="alert"><a class="close" data-dismiss="alert" href="#">×</a>
                    <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div class="card">
                <div class="card-header">
                    <h5><g:message code="default.create.label" args="[entityName]" /></h5>
                </div>

                <div class="card-body">
                    <g:form resource="${this.user}" method="POST" class="form-horizontal">

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="username"><g:message code="username.label"/></label>
                            <div class="col-md-9">
                                <g:textField name="username" type="text" class="form-control" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"><g:message code="password.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="password" type="password" class="form-control" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Admin?</label>
                            <div class="col-md-10">
                                <g:checkBox class="form-check-input" name="admin" checked="false" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"><g:message code="departamentos.label" /></label>
                            <div class="col-md-9">
                                <table class="table table-responsive-sm table-sm">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th ><g:message code="nombre.label" /></th>
                                        <th ><g:message code="descripcion.label" /></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <g:each in="${departamentoList}">
                                        <tr>
                                            <td><g:checkBox name="departamento" value="${it.id}" checked="false" /></td>
                                            <td>${it.nombre}</td>
                                            <td>${it.descripcion}</td>
                                        </tr>
                                    </g:each>

                                    </tbody>

                                </table>
                            </div>


                        </div>

                </div>
                <div class="card-footer">
                    <g:submitButton name="create" class="btn btn-success save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
                </g:form>
            </div>
        </div>
    </div>

</div>

</body>
</html>

