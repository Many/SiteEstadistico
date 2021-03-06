<%--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/--%>
       <%@page import="gestionUsuarios.ICuenta"%>
<!--Aqui coloco el header, OJO con include-->
       <jsp:include page="diseno.jsp"/>
       <jsp:include page="../plantilla/header.jsp"/>
<%@page import="CargaAcademica.Fachada.Fachada" %>
<%@page import="CargaAcademica.DTO.carga_otraDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
    Fachada f = new Fachada();
    ICuenta cuenta=(ICuenta) session.getAttribute("usuario");

%>       
        <!--Contenido-->
        <!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
        a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
        en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
        dentro de un div-->
        <div class="ufps-container-fluid">
        <div class="ufps_row">
         <form  method="post" action="procesar/otras_pro.jsp" align="center">
           <input type="hidden" value="<%=cuenta.getUser()%>" name="codigodoc">  
          <!--AQUI VA TODO EL CODIGO DINAMICO QUE CAMBIA SEGUN LAS INFORMACION, FUNCION Y USUARIO-->

            <h1 align="center">Registro de Otras Actividades</h1>

       
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Nombre de la actividad</label>
             <input class="ufps-input ufps-red" type="text" placeholder="Ej:actividad 1" name="actividad" id="actividad" required="required">
            </div>
            
             <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-3">
                <label>Horas a la semana:</label>
                <input class="ufps-input ufps-red horasD" value="0" type="number" maxlength="2" min="0" max="20" name="horas" id="teoricoPractico" required="required">
            </div>
            
           
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <input type="submit" class="ufps-btn" id="registrar" name="registrar" value="guardar">
             <a href="index.jsp">Atrás</a>
            </div>
            
      
        </form><!--Aqui se termina el div del area de trabajo-->
        </div>
        </div>

        <br>
 <%
    ArrayList<carga_otraDTO> lista=f.obtenerOtrasActividades(cuenta.getUser());
 
 %>       
        
        

<table class="table table-bordered  table-striped table-bordered container-fluid" >
   <thead>   <tr align="center"><th>Nombre Actividad</th><th>Horas semanal</th><th>Total horas semestre</th></tr> </thead>
      <tbody>
 <%   
       int suma=0;
       for(carga_otraDTO x:lista){
          
    %> 
    <tr>
        <td><%= x.getNombre()%></td>
        <td><%= x.getHoras()%></td>
        <td><%= x.getHoras()*16%></td>
        
    </tr>
 <%
     }
 %>
   
    </tbody>
    
    
</table>
 
 
        <!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
        universidad, programa, materia y desarrolladores-->
    
<!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                                                