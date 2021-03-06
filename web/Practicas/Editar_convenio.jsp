<%-- 
    Document   : Editar_convenio
    Created on : 2/11/2016, 12:29:02 PM
    Author     : Administrador
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Practicas.DTO.convenioDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"/>  

<%

    ICuenta cuenta=null;
    String codigo=null;
    
    if(session.getAttribute("usuario")!=null){
        cuenta=(ICuenta)session.getAttribute("usuario");
    }
    
    if(cuenta!=null){
        codigo=cuenta.getUser();
        boolean b=cuenta.containRol("Coordinador practicas");
        boolean m=cuenta.containModulo("Practicas");
    }
    
%> 


<%
    Facade fachada = new Facade();
    
    String id = request.getParameter("id");
    System.out.println("id"+id);
            convenioDTO ed = new convenioDTO();
            ed = fachada.buscarConvenio(id);
            System.out.println("Convenio consultado. " + ed.toString());

    
if(request.getSession().getAttribute("respuesta_convenio")!=null){
    
    %>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_convenio")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_convenio", null);
%>

<%
/**
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  ICuenta cuenta=null;
  if(session.getAttribute("usuario")==null){
      System.out.print("entro");
      response.sendRedirect("login.jsp");
      return;
  }else{
        cuenta= (ICuenta) session.getAttribute("usuario");
  }
 */   
%> 

    <div class="ufps-col-mobile-12 ufps-col-tablet-2">
        <ul>
            <li><a href="index_1.jsp" class="  ufps-navbar-btn  " >INICIO</a></li>
            <li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li>
            <li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li>
            <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li>
            <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li>
            <li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li>
            <li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li>
        </ul>        
    </div>
      
      
      <div  class="ufps-container" id="contenido">
          
          <center><strong><h1>EDITAR  CONVENIO</h1></strong></center>
          <form action="editar_convenio_p.jsp" method ="POST">
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>                   
                  <label for="id">Codigo Convenio:</label>
                                     <input name="id" type="text" class="ufps-input-line" id="linea1" required="" readonly="readonly" value="<%=ed.getIdconvenio() %>">                              
             
                                                    
              </div>
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>                   
                                     <label for="fecha_radicacion">Fecha Radicación</label>
                                     <input type="date" class="ufps-input" id="fecha_radicacion" name="fecha_radicacion" required="" readonly="readonly" value="<%=ed.getFecha_radicacion() %>" >                             
             
                                                    
              </div>
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>
                  <label for="nombre">Nombre:</label>
                  <input name="nombre" type="text" class="ufps-input-line" id="linea1" required="" value="<%=ed.getNombreConvenio() %>">                              
             
                                                    
              </div>
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1"> 
              <BR>
                  <label for="fechaCreacion">Fecha de Creacion:</label>
                  <input type="date" class="ufps-input" id="linea1" name="fechaCreacion" required="" value="<%=ed.getFechainicio() %>">
                                     
                                
              </div>
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
 <BR>
                  <div class="form-group">
                                      <label for="FechaTerminacion">Fecha de terminacion:</label>
                                      <input type="date" class="ufps-input" id="linea3" name="fechaTerminacion" required="" value="<%=ed.getFechafin() %>" >
                                 </div>  
              </div>
             
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>
                  <div class="form-group">
                                      <label for="vigencia">Vigencia:</label>
                                     <input name="vigencia" type="text" class="ufps-input-line" id="linea3" readonly="readonly" required="" value="<%=ed.getVigencia() %>" >
                                 </div>  
              </div>
              
              
                            
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>
                  <div class="form-group" >
                                    <label for="estado">Estado</label>
                                    <select id="estado" name="estado" class="ufps-input-line " required="">
                                        <option value="Aprobado">Aprobado</option>
                                        <option value="Terminado">Terminado</option>


                                    </select>

                                </div> </div>
              
              
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1 ">
 <BR>
                  <div class="form-group">
                                     <label for="descripcion">Descripcion:</label>
                                     <input name="descripcion" type="text" class="ufps-input-line" id="linea7" required="" value="<%=ed.getDescripcion() %>" >
                                 </div>  
              </div>
               
                  <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
<BR>
                      <div class="form-group" >
                                    <label for="entidad" >Seleccione la Entidad asociada al Convenio</label>
                                    <select id="ambito" name="entidad" class="ufps-input-line " required="" value="<%=ed.getIdempresa() %>" >
                                        <%
                                            ArrayList<empresaDTO> entidades = fachada.obtenerEmpresas();
                                            for(empresaDTO e: entidades){
                                        %>
                                        <option value="<%=e.getIdempresa()%>"><%=e.getNombreEmpresa()%></option>
                                        
                                        <%}
                                        %>
                                    </select>

                                </div> </div>          
              
          </fieldset>
     <BR>     
      </div>
        
      
        <BR>
       <center><div class="ufps-col-tablet-12 ">  
               <div class="btn-group btn-group-justified">
                <button type="submit" class="ufps-btn">Editar Convenio</button>
                 <div class="caption">
                        <p><a href="mostrar_convenio.jsp" class="btn ufps-btn" role="button">Volver</a></p>
                    </div>
            </div>
                
       </div></center>
    <BR>
    </form>

 <jsp:include page="../plantilla/footer.jsp"/>   