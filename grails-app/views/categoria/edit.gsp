<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />

</head>
<body>

<!--sidebar-menu-->

<!--main-container-part-->
<!--End-breadcrumbs-->
<div id="content" class="container-fluid">

    <div class="row">

        <div class="col">
            <g:if test="${flash.message}">
                <div role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.categoria}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.categoria}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div class="card">
                <div class="card-header">
                    <h5><g:message code="default.edit.label" args="[entityName]" /></h5>
                </div>

                <div class="card-body">

                    <g:form resource="${this.categoria}" method="PUT" class="form-horizontal">
                        <g:hiddenField name="version" value="${this.categoria?.version}" />

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="nombre"><g:message code="nombre.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="nombre" type="text" class="form-control" value="${this.categoria?.nombre}" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="descripcion"><g:message code="nombre.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="descripcion" type="text" class="form-control" value="${this.categoria?.descripcion}" required="required"/>
                            </div>
                        </div>


                </div>
                        <div class="card-footer">
                            <g:submitButton name="create" class="btn btn-success save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </div>
                    </g:form>
            </div>
        </div>
    </div>

</div>

</body>
</html>
