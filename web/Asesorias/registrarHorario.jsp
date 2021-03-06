<%-- 
    Document   : registrarHorario
    Created on : 5/12/2016, 02:30:20 PM
    Author     : DiegoLeal
--%><%@page import="gestionUsuarios.ICuenta"%>

            <%

    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    if (cuenta == null) {
        response.sendRedirect("../index.jsp");
    } else {
        if (cuenta.containRol("Docente")) {

        } else {
            response.sendRedirect("../index.jsp");
        }
    }
%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <!DOCTYPE html>
<html lang="es">

    <head>
        <link href="recursos/img/favicon.ico" rel="shortcut icon"  />
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualización en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ingenieria de sistemas</title>
        <!--Añada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="../public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="diseno/css/toastr.css">
        <link href="diseno/css/bootstrap.css" rel="stylesheet">
        <link href="diseno/css/estilos.css" rel="stylesheet">
        <link rel="stylesheet" href="diseno/css/font-awesome.min.css">

        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!--Algunos componentes requieren el uso de la librería en javascript-->


    </head>
    <body>

        <jsp:include page="../plantilla/header.jsp"></jsp:include>

            <div class="barraIzq">
                <div class="ref">
                    <a href="index.jsp">
                        Registrar Asesoria
                    </a>
                </div>
                <div class="ref">
                    <a href="consultaAsesoria.jsp">
                        Consultar horario
                    </a>
                </div>
                <div class="ref">
                    <a href="administrador.jsp">
                        Administrador
                    </a>
                </div>
                <div class="ref">
                    <a href="registrarHorario.jsp">
                        Mi horario
                    </a>
                </div>
            </div>
            <!--Contenido-->
            <div class="ufps-container">
            <jsp:useBean id="controlador" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>

                <div class="ufps-col-desktop-10 ufps-col-desktop-push-1 ufps-col-netbook-10 ufps-col-tablet-10 ufps-col-mobile-10">
                    <div class="ufps-col-desktop-4 ufps-col-desktop-offset-5 ufps-col-netbook-4 ufps-col-netbook-offset-5 ufps-col-tablet-6 ufps-col-tablet-offset-4 ufps-col-mobile-12">
                        <h4>Registrar horario de asesoria</h4>
                    </div>
                </div>    
                <div class="ufps-col-desktop-10 ufps-col-desktop-push-1 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                    <div class="ufps-col-desktop-3">
                        <label>D�a asesoria</label>
                        <select class="form-control" id="diaAseso">
                            <option>Lunes</option>
                            <option>Martes</option>
                            <option>Miercoles</option>
                            <option>Jueves</option>
                            <option>Viernes</option>
                        </select>
                    </div>
                    <div class="ufps-col-desktop-3">
                        <label>Hora inicio</label>
                        <input type="time" class="form-control" id="horaIniAseso">
                    </div>
                    <div class="ufps-col-desktop-3">
                        <label>Hora fin</label>
                        <input type="time" class="form-control" id="horaFinAseso">
                    </div>
                    <div class="ufps-col-desktop-3" style="margin-top: 20px;">
                        <button type="button" class="ufps-btn" onclick="registrarHorario()">Registrar</button>
                    </div>
                </div>
                <br>
                <br>
                <br>
                <div class="ufps-col-desktop-10 ufps-col-desktop-push-1 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                    <div class="ufps-col-desktop-4 ufps-col-desktop-offset-5 ufps-col-netbook-4 ufps-col-netbook-offset-5 ufps-col-tablet-6 ufps-col-tablet-offset-4 ufps-col-mobile-10 ufps-col-mobile-offset-2">
                        <table class="ufps-table">
                            <thead>
                                <tr>
                                    <td><strong>Acci�n</strong></td>
                                    <td align="center"><strong>Dia de asesoria</strong></td>
                                    <td align="center"><strong>Hora</strong></td>
                                </tr>
                            </thead>
                            <tbody>

                            <%
                                String codDoc = cuenta.getUser();
                                String horario = controlador.consultarHorarioAsesoria(codDoc);
                                System.out.println("este es el horario " + horario);
                                if (!horario.isEmpty()) {
                                    String v1[] = horario.split("#");
                                    for (int i = 0; i < v1.length; i++) {
                                        String v2[] = v1[i].split(";");
                                        //dia, horaini, horafin, id
                                        String dia = "";
                                        if (v2[0].equals("1")) {
                                            dia = "Lunes";
                                        } else if (v2[0].equals("2")) {
                                            dia = "Martes";
                                        } else if (v2[0].equals("3")) {
                                            dia = "Miercoles";
                                        } else if (v2[0].equals("4")) {
                                            dia = "Jueves";
                                        } else if (v2[0].equals("5")) {
                                            dia = "Viernes";
                                        }
                                        String horaAseso = v2[1] + " - " + v2[2];
                            %>
                            <tr>
                                <td align="center"><a style="size: 18px;color: red;" id="<%=v2[3]%>" onclick="eliminarHorario(id)"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                                <td><%=dia%></td>
                                <td><%=horaAseso%></td>
                            </tr>
                            <%
                                    }
                                } else {

                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="diseno/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../public/js/ufps.min.js" type="text/javascript"></script>
        <script src="diseno/js/blockUI.js" type="text/javascript"></script>
        <script src="diseno/js/toastr.js" type="text/javascript"></script>
        <script src="diseno/js/scripts.js" type="text/javascript"></script>
    </body>



</html>                                                                                                                                                                                                                                                                                                                          