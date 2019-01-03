<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dep.label', default: 'Dep')}" />
    </head>
    <body>
    <div id="content" class="container-fluid">

        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:link class="btn btn-success create" action="create"><i class="fa fa-plus"></i> <g:message code="dep.label"  /></g:link>
        </sec:ifAllGranted>


        <div class="row">
            <div class="animated fadeIn">
                <div class="col">
                    <g:if test="${flash.message}">
                        <div role="status"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
                    </g:if>


                    <div class="card">
                        <div class="card-header">
                            <h5><g:message code="dep.label" /></h5>
                        </div>
                        <div class="card-body">

                            <table class="table table-responsive-sm table-striped table-sm">
                                <thead>
                                <tr>
                                    <th><g:message code="nombre.label" /></th>
                                    <th><g:message code="descripcion.label" /></th>
                                    <th><g:message code="contactos.label"/></th>
                                    <th><g:message code="usuario.label" /></th>
                                    <th><g:message code="fecha.label" /></th>
                                    <th><g:message code="accion.label" /></th>
                                </tr>
                                </thead>
                                <tbody>

                                <g:each in="${depList}">
                                    <tr>

                                        <td>${it.nombre}</td>
                                        <td>${it.descripcion}</td>
                                        <td>
                                            <ul>
                                                <g:each var="cont" in="${it.conts}">

                                                    <li>${cont.nombre}</li>

                                                </g:each>
                                            </ul>
                                        </td>
                                        <td>${it.usuario.username}</td>
                                        <td>${it.fecha}</td>
                                        <td>
                                            <g:form action="delete"  method="delete">
                                                <div class="btn-group">

                                                    <a role="button" class="btn btn-success" href="/dep/show/${it.id}"><i class="cui-info"></i></a>
                                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                                    <a role="button" class="btn btn-primary" href="/dep/edit/${it.id}"><i class="cui-pencil"></i></a>
                                                    <input name="id" id="id" value="${it.id}" type="hidden"/>
                                                    <button type="submit" class="btn btn-danger"><i class="cui-circle-x"></i></button>
                                                </sec:ifAllGranted>
                                                </div>

                                            </g:form>
                                        </td>

                                    </tr>
                                </g:each>

                                </tbody>

                            </table>



                            <div class="pagination">
                                <g:paginate total="${depCount ?: 0}" />
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>

    <script>

            function getLink(e)
            {
                window.location.replace('/dep/show/'+e);
            }


    </script>

    </body>
</html>