<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />
    <gvisualization:apiImport/>
</head>
<body>

    <div id="content" class="container-fluid">

            <div class="row">

                <div class="col">
                    <div class="card">
                        <div class="card-header">
                            <i class="cui-chart"></i>
                            <g:message code="grafica.label"/>
                        </div>
                        <div class="card-body">
                            <%
                                def columns = [['string', message(code:'dep.label')], ['number', message(code:'contactos.label')]]

                                def arr = []
                                for (int i = 0; i < departamentos.size() ; i++) {
                                    def obj = [departamentos.get(i).nombre, departamentos.get(i).conts.size()]
                                    arr.add(obj)

                                }

                            %>

                            <div class="row">
                            <div class="col-sm-6">
                                <gvisualization:pieCoreChart elementId="depchart" width="${900}" height="${600}"
                                                             columns="${columns}" data="${arr}" />

                                <div id="depchart"></div>
                            </div>


                        </div>


                        </div>
                </div>
                </div>


        </div>

    </div>

</body>
</html>
