<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />


</head>
<body>


<div id="content" class="container-fluid">
    <div class="row">
        <div class="animated fadeIn">
            <div class="col">
                <g:if test="${flash.message}">
                    <div role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
                </g:if>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <g:link class="btn btn-success create" action="create"><i class="fa fa-plus"></i> <g:message code="contacto.label"  /></g:link>
                </sec:ifAllGranted>

                <div class="card">
                    <div class="card-header"> <i class="fa fa-align-justify"></i>
                        <g:message code="contacto.label" />
                    </div>
                    <div  class="card-body">
                        <table class="table table-responsive-sm table-striped table-sm">
                            <thead>
                            <tr>
                                <th><g:message code="nombre.label" /></th>
                                <th><g:message code="apellido.label" /></th>
                                <th><g:message code="email.label"/></th>
                                <th><g:message code="direccion.label" /></th>
                                <th><g:message code="puesto.label" /></th>
                                <th><g:message code="tel.label" /></th>
                                <th><g:message code="categoria.label" /></th>
                                <th><g:message code="departamentos.label" /></th>
                                <th><g:message code="usuario.label" /></th>
                                <th><g:message code="fecha.label" /></th>
                                <th><g:message code="accion.label" /></th>
                            </tr>
                            </thead>
                            <tbody>

                            <g:each in="${contactoList}">
                                <tr>

                                    <td>${it.nombre}</td>
                                    <td>${it.apellido}</td>
                                    <td>${it.email}</td>
                                    <td>${it.direccion}</td>
                                    <td>${it.puesto}</td>
                                    <td>${it.telefono}</td>
                                    <td>${it.categoria.nombre}</td>
                                    <td>
                                        <ol>
                                            <g:each var="dep" in="${it.deps}">

                                                <li>${dep.nombre}</li>

                                            </g:each>
                                        </ol>
                                    </td>
                                    <td>${it.usuario.username}</td>
                                    <td>${it.fecha}</td>

                                    <td>
                                        <g:form action="delete"   method="delete">
                                            <div class="btn-group">
                                                <a role="button" class="btn btn-success" href="/contacto/show/${it.id}"><i class="cui-info"></i></a>
                                                <a role="button" class="btn btn-primary" href="/contacto/edit/${it.id}"><i class="cui-pencil"></i></a>
                                                <input name="id" id="id" value="${it.id}" type="hidden"/>
                                                <button type="submit" class="btn btn-danger"><i class="cui-circle-x"></i></button>
                                            </div>
                                        </g:form>
                                    </td>

                                </tr>
                            </g:each>

                            </tbody>

                        </table>


                        <div class="pagination">
                            <g:paginate total="${contactoCount ?: 0}" />
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </div>

    </div>


</body>
</html>

