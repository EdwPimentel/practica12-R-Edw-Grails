<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'departamento.label', default: 'Dep')}" />
    </head>
    <body>
    <div id="content" class="container-fluid">

        <div class="row">

            <div class="col">
                <g:if test="${flash.message}">
                    <div role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.contacto}">
                    <ul role="alert"><a class="close" data-dismiss="alert" href="#">×</a>
                        <g:eachError bean="${this.contacto}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <div class="card">
                    <div class="card-header">
                        <h5><g:message code="default.create.label" args="[entityName]" /></h5>
                    </div>
                    <div id="tabl" class="card-body">
                        <g:form resource="${this.departamento}" method="POST" class="form-horizontal">

                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="nombre"><g:message code="nombre.label" /></label>
                                <div class="col-md-9">
                                    <g:textField name="nombre" type="text" class="form-control" required="required"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="descripcion"><g:message code="descripcion.label" /></label>
                                <div class="col-md-9">
                                    <g:textField name="descripcion" type="text" class="form-control" required="required"/>
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
