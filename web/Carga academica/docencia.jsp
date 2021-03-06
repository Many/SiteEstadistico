
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="CargaAcademica.DAO.DAOCargaAcademica"%>
<%--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/--%>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <!DOCTYPE html>
<!--Aqui coloco el header, OJO con include-->
<jsp:include page="diseno.jsp"/>
<jsp:include page="../plantilla/header.jsp"/>
<%@page import="CargaAcademica.Fachada.Fachada" %>
<%@page import="CargaAcademica.DTO.carga_extensionDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CargaAcademica.DTO.general_asignaturaDTO"%>
<%@page import="java.util.ArrayList"%>
<%
    Fachada f = new Fachada();
    ArrayList<general_asignaturaDTO> lista = f.obtenerAsignaturas();
    
    ICuenta cuenta=(ICuenta) session.getAttribute("usuario");
    
   
   
%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!--Contenido-->
<!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
dentro de un div-->
<div class="ufps-container-fluid">
    <div class="ufps_row">
       <!-- <div class="row" >
                <div class="alert alert-danger" id="error">
                    <strong>Error!</strong> El numero de horas no corresponde con el numero de creditos
                </div>
            </div> -->
        
        <form id="form" action="procesar/docencia_pro.jsp" method="post" align="center">
            <input type="hidden" value="<%=cuenta.getUser()%>" name="codigodoc">  
            <!--AQUI VA TODO EL CODIGO DINAMICO QUE CAMBIA SEGUN LAS INFORMACION, FUNCION Y USUARIO-->
            <h1 align="center">Regitro de Actividades de Docencia</h1>
            <!--tabla del formato de la ing pilar rodriguez relacionado a docencia de 6*10
            6 filas por 10 columnas y luego se subdividen segun el caso.-->

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>Código de la Materia:</label>
                <select  class="ufps-input ufps-red" id="codigo" name="codigo">
                    <%
                        for (general_asignaturaDTO x : lista) {
                    %>

                    <option id="A" ><%= x.getCodigo() + "-" + x.getNombre() + "-Creditos: " + x.getCreditos()%></option>

                    <%
                        }
                    %>
                </select>
            </div>

            <!--   <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                   <label>Créditos:</label>
                   <input class="ufps-input ufps-red" type="number" min="0" max="7777777" name="creditos" id="creditos" required="required">
               </div> -->

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>Grupo</label>
                <select class="ufps-input ufps-red" id="grupo" name="grupo">
                    <option id="A" name="A">A</option>
                    <option id="B" name="B">B</option>
                    <option id="C" name="C">C</option>
                    <option id="D" name="D">D</option>
                </select>
            </div>

            <!--     <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                     <label>Nivel:</label>
                     <select class="ufps-input ufps-red" id="nivel" name="nivel">
                         <option id="pregrado" name="pregrado">Pregrado</option>
                         <option id="postgrado" name="postgrado">Postgrado</option>
                     </select>
                 </div> -->

            <!--   <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                   <label>Nombre:</label>
                   <input class="ufps-input ufps-red" type="text" placeholder="Ej:Seminario Integrador 3" name="materia" id="materia" required="required">
               </div> -->

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>Horas Teóricas:</label>
                <input class="ufps-input ufps-red horasD" value="0" type="number" maxlength="2" min="0" max="20" name="teorico" id="teorico" required="required">
            </div>   

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>Horas Teórico Prácticas:</label>
                <input class="ufps-input ufps-red horasD" value="0" type="number" maxlength="2" min="0" max="20" name="teoricoPractico" id="teoricoPractico" required="required">
            </div>

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>Horas Prácticas:</label>
                <input class="ufps-input ufps-red horasD" value="0" type="number" maxlength="2" min="0" max="20" name="practico" id="practico" required="required" >
            </div>

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>Hora Semanal:</label>
                <input class="ufps-input ufps-red" value="0" type="number" maxlength="2" min="0" max="20" name="semanal" id="semanal" required="required" disabled="true">
            </div>

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>Hora Semestral:</label>
                <input class="ufps-input ufps-red" value="0" type="number" maxlength="2" min="0" max="20" name="semestral" id="semestral" required="required" disabled="true">
            </div>

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>N° Estudiantes:</label>
                <input class="ufps-input ufps-red" value="0" type="number" maxlength="2" min="1" max="50" name="estudiantes" id="estudiantes" required="required">
            </div>

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <input type="submit" class="ufps-btn" id="registrar" name="registrar" value="guardar">
                <a href="index.jsp">Atrás</a>
            </div>

        </form><!--Aqui se termina el div del area de trabajo-->
    </div>
    <br>
    <%DAOCargaAcademica c = new DAOCargaAcademica();%>
    <%String profeq[] = c.consultarDocenciaDeDocente(cuenta.getUser()).split(",");%>
    <div id="docenciam" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">     
        <table class="ufps-table ufps-card">
            <tr><th colspan="6" align="center"></th></tr>
            <tr align="center"><th>Código</th><th>Grupo</th><th>Nombre</th><th>Créditos</th><th>#Estudiantes</th><th>Nivel</th></tr>

            <%String cod = "";
                String gru = "";
                String nom = "";
                String cre = "";
                String est = "";
                String niv = "";
                for (int i = 0; i < profeq.length; i++) {
                    String ing[] = profeq[i].split("-");
                    cod = ing[0];
                    gru = ing[1];
                    nom = ing[2];
                    cre = ing[3];
                    est = ing[4];
                    niv = ing[5];
            %>
            <tr align="center"><td><%=cod%></td><td><%=gru%></td><td><%=nom%></td><td><%=cre%></td><td><%=est%></td><td><%=niv%></td></tr>
                    <%}%>

        </table>
        <br><br>
    </div>

</div>

<br>


<!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
universidad, programa, materia y desarrolladores-->

<!--Aqui coloco el footer, OJO con include-->
<!--<script src="js/general.js" ></script> -->
<jsp:include page="../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                          