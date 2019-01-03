<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'departamento.label', default: 'Categoria')}" />

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
            <g:hasErrors bean="${this.departamento}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.departamento}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div class="card">
                <div class="card-header">
                    <h5><g:message code="default.edit.label" args="[entityName]" /></h5>
                </div>

                <div class="card-body">
                    <g:form resource="${this.departamento}" method="PUT" class="form-horizontal">
                        <g:hiddenField name="version" value="${this.departamento?.version}" />


                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="nombre"><g:message code="nombre.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="nombre" type="text" class="form-control" value="${this.departamento?.nombre}" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="descripcion"><g:message code="nombre.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="descripcion" type="text" class="form-control" value="${this.departamento?.descripcion}" required="required"/>
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"><g:message code="contactos.label" /></label>
                            <div class="col-md-9">
                                <table class="table table-responsive-sm table-sm">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th ><g:message code="nombre.label" /></th>
                                        <th ><g:message code="apellido.label" /></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <g:each in="${contactoList}">
                                        <tr>
                                            <td><g:checkBox name="contacto" value="${it.id}" checked="false" /></td>
                                            <td>${it.nombre}</td>
                                            <td>${it.apellido}</td>
                                        </tr>
                                    </g:each>

                                    </tbody>

                                </table>
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
