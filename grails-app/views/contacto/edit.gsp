<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />

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
            <g:hasErrors bean="${this.contacto}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.contacto}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div class="card">
                <div class="card-header">
                    <h5><g:message code="default.edit.label" args="[entityName]" /></h5>
                </div>

                <div class="card-body">

                    <g:form resource="${this.contacto}" method="PUT" class="form-horizontal">
                        <g:hiddenField name="version" value="${this.contacto?.version}" />


                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="nombre"><g:message code="nombre.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="nombre" type="text" class="form-control" value="${this.contacto?.nombre}" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="apellido"><g:message code="apellido.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="apellido" type="text" class="form-control" value="${this.contacto?.apellido}" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="telefono"><g:message code="tel.label" /></label>
                            <div class="col-md-9">
                                <g:field name="telefono" type="text" class="form-control" value="${this.contacto?.telefono}" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="email"><g:message code="email.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="email" type="text" class="form-control" value="${this.contacto?.email}" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="puesto"><g:message code="puesto.label" /></label>
                            <div class="col-md-9">
                                <g:textField name="puesto" type="text" class="form-control" value="${this.contacto?.puesto}" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="direccion"><g:message code="direccion.label" /></label>
                            <div class="col-md-9">
                                <g:field name="direccion" type="text"  value="${this.contacto?.direccion}" class="form-control" required="required"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"><g:message code="categoria.label" /> </label>
                            <div class="col-md-9">
                                <g:select class="form-control" name='categoria' value="${this.contacto?.categoria.nombre}"
                                          noSelection="${['null':'...']}"
                                          from='${categoriaList}'
                                          optionKey="id" optionValue="nombre" required="required"></g:select>
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

                                    <g:each in="${depList}">
                                        <tr>
                                            <td><g:checkBox name="dep" value="${it.id}" checked="false" /></td>
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
                            <g:submitButton name="create" class="btn btn-success save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </div>
                    </g:form>
            </div>
        </div>
    </div>

</div>

</body>
</html>
