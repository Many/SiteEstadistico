
<%@page import="CargaAcademica.DAO.DAOCargaAcademica"%>
  
<!--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/10/2016*/-->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <!DOCTYPE html>

<!--Aqui coloco el header, OJO con include-->
<jsp:include page="diseno.jsp"/>
<jsp:include page="../plantilla/header.jsp"/>

<!--Contenido-->
<!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
dentro de un div-->

<h1 align="center">Administrar el Sistema</h1>

<div class="ufps-tab-container" id="tabs">
    
    <ul class="ufps-tabs">
        <li><a class="ufps-tab-links ufps-tab-active" onclick="openTab(event, 'tab1', 'tabs')">Habilitar el Sistema</a></li>
        <li><a class="ufps-tab-links" onclick="openTab(event, 'tab2', 'tabs')" data-toggle="tab">Dar Prorroga a Docente</a></li>
    </ul>
    
    <div id="tab1" class="ufps-tab-content" style="display:block">
    
        <p>Sr Director al iniciar el semestre aqu� podr� habilitar el sistema para algun/os o todos los docentes definiendo
           el a�o, per�odo y fecha de cierre, tiempo en el cual los docentes podr�n ingresar al sistema y registrar su carga
           acad�mica en docencia, investigacion, extensi�n y otras.</p>
        <%
        if (request.getSession().getAttribute("respuesta_habilito") != null) {
        %>
        <div class="ufps-alert-green" style="height:30px;">
        <span class="ufps-close-alert-btn">x</span><%=request.getSession().getAttribute("respuesta_habilito")%>
        </div>
        <%}
            request.getSession().setAttribute("respuesta_habilito", null);
        %>
        
        <%
        if (request.getSession().getAttribute("respuesta_prorroga") != null) {
        %>
        <div class="ufps-alert-green" style="height:30px;">
        <span class="ufps-close-alert-btn">x</span><%=request.getSession().getAttribute("respuesta_prorroga")%>
        </div>
        <%}
            request.getSession().setAttribute("respuesta_prorroga", null);
        %>
        
        <form  align="center" id="inicio" action="administrar_pro.jsp" method="POST">
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
                <img src="../public/img/carga/administrar.png">
                <label>A�o:</label>
                <input align=left class=" ufps-red" type="number" name="ano" id="ano" required="required" value="2016" min="1900" max="2100">
                <br><br>
                
                <label>Per�odo Semestre:</label><br><br>
                <input class="ufps-red" type="radio" name="periodo" id="periodo" value="1" required="required">1
                <input class="ufps-red" type="radio" name="periodo" id="periodo" value="2" required="required">2
                <br><br>
                
                <label>Fecha de cierre:</label>
                <input class="ufps-red" type="date" name="fin" id="fin" required="required">
                
           </div>
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
                
                <label>Docentes a Habilitar:</label><br><br>
                <input type="radio" id="habilito" name="habilito" value="todos" onclick="nolistarDocentes()">Todos
                <img src="../public/img/carga/docencia.png">
                <br><br>
                <input type="radio" id="habilito" name="habilito" value="algunos" onclick="listarDocentes()">Algunos
                <img src="../public/img/carga/info.png">
            </div>
            
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4" align="left" id="lista" style="display: none">
                <label> Listado de Profesores:</label><br><br>
                
                <%DAOCargaAcademica c=new DAOCargaAcademica();
                  String profes[]=c.consultarDocentes().split(",");
                 
                  for(int i=0;i<profes.length;i++){
                      String ing[]=profes[i].split("-");
                      String cod=ing[0];
                      String nom=ing[1];
                      if(i==6){
                 %>
                <input type="checkbox" value="<%=cod%>" checked="true" disabled="true">
                  <label class="ufps-red"><%=cod%>-<%=nom%></label><br>   
                <%}else{%>
                  <input type="checkbox" value="<%=cod%>">
                  <label class="ufps-red">
                  <%=cod%>-<%=nom%>
                  </label><br> 
                    <%}
                   }
                %>
                <input type="text" hidden=true id="code" name="code">
                <br><br>
                <input type="radio" onclick="codificar()" id="ok">Confirmar Docentes
                
            </div>
            
            
            <script>
                
                function listarDocentes(){document.getElementById("lista").style.display='block';}
                function nolistarDocentes(){document.getElementById("lista").style.display='none';}
                
                function codificar(){
                    var cod="";
                    var formulario = document.getElementById("inicio");
                    for(var i=0; i<formulario.elements.length;i++) {
                        var elemento = formulario.elements[i];
                        if(elemento.type=="checkbox") {
                          if(elemento.checked) {
                             cod+=formulario.elements[i].value+"-";}
                        }
                    }
                    document.getElementById("code").value=cod;
               }
                
            </script>
           
             <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">
                <br><br>
                <input class="ufps-btn" value="Iniciar Sistema" type="submit">
                <a href="index.jsp">Atr�s</a>
            </div>
            
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <!--Aqui coloco los n profesores, listados con checkbox los cuales seran habilitados
            por el director para ingresar informacion al sistema para periodo definido, se crea
            dinamicamente trayendo el codigo y el nombre del profesor-->
            
        </form>
        
    </div>
    

    <div id="tab2" class="ufps-tab-content">
    
        <p>Sr Director aqu� usted podr� habilitar el sistema dando una pr�rroga a algun/os o todos 
        los docentes que no alcanzaron o pudieron registrar su carga acad�mica, defina una nueva
        fecha de cierre </p>
        
        <form align="center" action="administrar_pro.jsp" method="POST" id="mas">
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
                
                <br><br>
                <label>Docentes a Dar Prorroga:</label><br><br>
                <input type="radio" id="habilito2" name="habilito2" value="todos" onclick="nolistarDocentes2()">Todos
                <img src="../public/img/carga/docencia.png">
                <br><br>
                <input type="radio" id="habilito2" name="habilito2" value="algunos" onclick="listarDocentes2()">Algunos
                <img src="../public/img/carga/info.png">
            </div>
           
             <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4" align="left" id="lista2" style="display: none">
                <label> Listado de Profesores:</label><br><br>
                
                <%DAOCargaAcademica cc=new DAOCargaAcademica();
                  String profess[]=cc.consultarDocentes().split(",");
                 
                  for(int i=0;i<profess.length;i++){
                      String ingg[]=profess[i].split("-");
                      String codd=ingg[0];
                      String nomb=ingg[1];
                      if(i==6){
                %>
                <input type="checkbox" value="<%=codd%>" checked="true" disabled="true">
                  <label class="ufps-red"><%=codd%>-<%=nomb%></label><br>   
                <%}else{%>
                  <input type="checkbox" value="<%=codd%>">
                  <label class="ufps-red">
                  <%=codd%>-<%=nomb%>
                  </label><br> 
                    <%}
                   }
                %>
                <input type="text" hidden=true id="code2" name="code2">
                <br><br>
                <input type="radio" onclick="codificar2()" id="ok">Confirmar Docentes
            </div>
            
            
            <script>
                
                function listarDocentes2(){document.getElementById("lista2").style.display='block';}
                function nolistarDocentes2(){document.getElementById("lista2").style.display='none';}
                
                function codificar2(){
                    var cod="";
                    var formulario = document.getElementById("mas");
                    for(var i=0; i<formulario.elements.length;i++) {
                        var elemento = formulario.elements[i];
                        if(elemento.type=="checkbox") {
                          if(elemento.checked) {
                             cod+=formulario.elements[i].value+"-";}
                        }
                    }
                    document.getElementById("code2").value=cod;
               }
                
            </script>
            
            <div class="ufps-col-mobile-4 ufps-col-tablet-6 ufps-col-netbook-4">
                <br><br>
            <img src="../public/img/carga/reloj.png"><br><br>
            <label>Nueva Fecha de Cierre:</label>
            <input class="ufps-input ufps-red" type="date" id="nfin" name="nfin">
            </div>
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">
            <input class="ufps-btn" type="submit" id="registar" name="registrar" value="Guardar">
            <a href="Servicios.jsp">Atr�s</a>
            </div>
             <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
        </form><!--Aqui se termina el div del area de trabajo--> 
        
    </div>
</div> 

<!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
universidad, programa, materia y desarrolladores-->

<!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                                                 