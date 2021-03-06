
<%@page import="gestionUsuarios.ICuenta"%>
<%--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/--%>

   <!--Aqui coloco el header, OJO con include-->
    <jsp:include page="diseno.jsp"/>
    <jsp:include page="../plantilla/header.jsp"/>
<%@page import="CargaAcademica.Fachada.Fachada" %>
<%@page import="java.util.ArrayList"%>
<%@page import="CargaAcademica.DTO.carga_investigacionDTO"%>  
<%
    Fachada f=new Fachada();
    ICuenta cuenta=(ICuenta) session.getAttribute("usuario");
    
%>
    <!--Contenido-->
    <!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
    a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
    en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
    dentro de un div-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" >

    <div class="ufps-container-fluid">
    <div class="ufps_row">
        <form action="procesar/investagacion_pro.jsp"  align="center">
             <input type="hidden" value="<%=cuenta.getUser()%>" name="codigodoc">  
    <!--AQUI VA TODO EL CODIGO DINAMICO QUE CAMBIA SEGUN LAS INFORMACION, FUNCION Y USUARIO-->
   
        <h1 align="center">Registro Actividades de Investigación</h1>
         <!--Aqui creo una tabla donde se ingresan los datos concernientes a las 
         actividades de investigacion, con 6 columas por 12 filas-->
         
         <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Código-Acta Administrativa</label>
             <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="100" name="acta" id="acta" required="required">
         </div>
         
         <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Proyecto investigativo</label>
             <input class="ufps-input ufps-red" type="text" placeholder="Ej:nombre del proyecto en que trabaja" name="actividades" id="actividades" required="required">
         </div>
         
         <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Responsabilidad</label>
             <select class="ufps-input ufps-red" id="responsabilidad" name="responsabilidad">
                 <option value="directorGrupo">Director de Grupo</option>
                 <option value="directorProyecto">Director de Proyecto</option>
                 <option value="directorSemillero">Director de Semillero</option>
                 <option value="participante">Participante</option>
                 <option value="participante">Investigador</option>
                 <option value="participante">Co-investigador</option>
                 
             </select>
         </div>
         
         <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Unidad Investigativa</label>
               <input class="ufps-input ufps-red" type="text" placeholder="Ej:facultad/departamento" name="unidadInvestigativa" id="unidadInvestigativa" required="required">
         </div>
         
         <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Institución</label>
             <select class="ufps-input ufps-red" id="institucional" name="institucional">
                <option value="UFPS">UFPS</option>
              </select>
         </div>
         
         <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Hora Semanal</label>
             <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="50" name="horaSemanal" id="horaSemanal" required="required">
         </div>
         
         <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">
             <input type="submit" class="ufps-btn" id="registrar" name="registrar" value="guardar">
             <a href="index.jsp">Atrás</a>
         </div>
         
    </form><!--Aqui se termina el div del area de trabajo-->
    </div>
    </div>
 <%
     ArrayList<carga_investigacionDTO> lista=f.obtenerInvestigaciones(cuenta.getUser());
    // carga_investigacionDTO dto=lista.get(0);
     
    // lista.add(dto);

 %>
    
<br>
<table class="table table-bordered  table-striped table-bordered container-fluid" >
   <thead>  <tr align="center"><th>codigo acta</th><th>Nombre</th><th>Responsabilidad</th><th>Unidad investigación</th><th>Institución</th>
                <th>Horas semana</th> </tr> </thead>
      <tbody>
 <%   
       int suma=0;
       for(carga_investigacionDTO x:lista){
           suma+=x.getHoras_semana();
    %> 
    <tr>
        <td><%= x.getCod_acta()%></td>
        <td><%= x.getNombre()%></td>
        <td><%= x.getResponsabilidad()%></td>
        <td><%= x.getUnidad_investigativa()%></td>
        <td><%= x.getInstitucion()%></td>
        <td><%= x.getHoras_semana()%></td>
        
    </tr>
 <%
     }
 %>
    <tr>
        
        <td class="table-danger " colspan="5">Sub-total</td>
        <td class="table-danger"><%= suma %></td>
    </tr>
    </tbody>
    
    
</table>
        <!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
        universidad, programa, materia y desarrolladores-->
        
 <!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                                                