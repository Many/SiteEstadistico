
<%@page import="CargaAcademica.DAO.DAOCargaAcademica"%>
<!--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/10/2016*/-->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <!DOCTYPE html>

<!--Aqui coloco el header, OJO con include-->
<jsp:include page="diseno.jsp"/>
<jsp:include page="../plantilla/header.jsp"/>

<!--Contenido-->
<!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
dentro de un div-->

<h1 align="center">Generar Consultas y Reportes</h1>

<div class="ufps-tab-container" id="tabs">
    
    <ul class="ufps-tabs">
        <li><a class="ufps-tab-links ufps-tab-active" onclick="openTab(event, 'tab1', 'tabs')">Generales</a></li>
        <li><a class="ufps-tab-links" onclick="openTab(event, 'tab2', 'tabs')" data-toggle="tab">Especificos</a></li>
    </ul>

    <div id="tab1" class="ufps-tab-content" style="display:block">
    
        <%
        if (request.getSession().getAttribute("pdf") != null) {
        %>
        <div class="ufps-alert-green" style="height:30px;">
        <span class="ufps-close-alert-btn">x</span><%=request.getSession().getAttribute("pdf")%>
        </div>
        <%}
            request.getSession().setAttribute("pdf", null);
        %>
        
        <%
        if (request.getSession().getAttribute("excel") != null) {
        %>
        <div class="ufps-alert-green" style="height:30px;">
        <span class="ufps-close-alert-btn">x</span><%=request.getSession().getAttribute("excel")%>
        </div>
        <%}
            request.getSession().setAttribute("excel", null);
        %>
        
             <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4" align="center">
                <br><br><br>
                
                <input style="width:300px" align="center" class="ufps-btn" id="todos" name="todos" value="Consultar Todos Los Docentes" type="submit" onclick="todos()"><br>
                <input style="width:300px" align="center" class="ufps-btn" id="docencia" name="docencia" value="Consultar Docentes en Docencia" type="submit" onclick="docencia()"><br>
                <input style="width:300px" align="center" class="ufps-btn" id="investigacion" name="investigacion" value="Consultar Docentes en Investigacion" type="submit" onclick="investigacion()"><br>
                <input style="width:300px" align="center" class="ufps-btn" id="extension" name="extension" value="Consultar Docentes en Extensi�n" type="submit" onclick="extension()"><br>
                <input style="width:300px" align="center" class="ufps-btn" id="administracion" name="administracion" value="Consultar Docentes en Administraci�n" type="submit" onclick="administracion()"><br>
                <a href="index.jsp">Atr�s</a> 
                
           </div>
        
            <%DAOCargaAcademica c=new DAOCargaAcademica();%>
            
            <%String profes[]=c.consultarDocentes().split(",");%>
            <div id="todosm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Listado de Todos los Docentes</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th></tr>

            <%for(int i=0;i<profes.length;i++){
            String ing[]=profes[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td></tr>
            <%}%>
            </table>
            <a class="ufps-btn" href="pdf/todosDocentes.jsp">GENERAR EN PDF</a>
            <a class="ufps-btn" href="excel/todosDocentes.jsp">GENERAR EN EXCEL</a>
            </div> 
            
            <%String profess[]=c.consultarDocentesDocencia().split(",");%>
            <div id="docenciam" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Docentes en Docencia</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th></tr>

            <%for(int i=0;i<profess.length;i++){
            String ing[]=profess[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td></tr>
            <%}%>
            </table>
            <a class="ufps-btn" href="pdf/docentesDocencia.jsp">GENERAR EN PDF</a>
            </div>
            
            <%String professs[]=c.consultarDocentesInvestigacion().split(",");%>
            <div id="investigacionm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Docentes en Investigaci�n</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th></tr>

            <%for(int i=0;i<professs.length;i++){
            String ing[]=professs[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td></tr>
            <%}%>
            </table>
            <a class="ufps-btn" href="pdf/docentesInvestigacion.jsp">GENERAR EN PDF</a>
            </div>
            
            <%String profesa[]=c.consultarDocentesExtension().split(",");%>
            <div id="extensionm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Docentes en Extensi�n</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th></tr>

            <%for(int i=0;i<profesa.length;i++){
            String ing[]=profesa[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td></tr>
            <%}%>
            </table>
            <a class="ufps-btn" href="pdf/docentesExtension.jsp">GENERAR EN PDF</a>
            </div>
            
           <%String profesaa[]=c.consultarDocentesAdministrativos().split(",");%>
            <div id="administracionm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Docentes en Administraci�n</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th></tr>

            <%for(int i=0;i<profesaa.length;i++){
            String ing[]=profesaa[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td></tr>
            <%}%>
            </table>
            <a class="ufps-btn" href="pdf/docentesAdministracion.jsp">GENERAR EN PDF</a>
            </div>
            
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br>
            <!--Aqui coloco los n profesores, listados con checkbox los cuales seran habilitados
            por el director para ingresar informacion al sistema para periodo definido, se crea
            dinamicamente trayendo el codigo y el nombre del profesor-->
       
        <script>
            function todos(){
                document.getElementById("todosm").style.display="block";
                document.getElementById("docenciam").style.display="none";
                document.getElementById("investigacionm").style.display="none";
                document.getElementById("administracionm").style.display="none";
                document.getElementById("extensionm").style.display="none";
            }
            function docencia(){
                document.getElementById("docenciam").style.display="block";
                document.getElementById("todosm").style.display="none";
                document.getElementById("investigacionm").style.display="none";
                document.getElementById("administracionm").style.display="none";
                document.getElementById("extensionm").style.display="none";
            }
            function investigacion(){
                document.getElementById("investigacionm").style.display="block";
                document.getElementById("docenciam").style.display="none";
                document.getElementById("todosm").style.display="none";
                document.getElementById("administracionm").style.display="none";
                document.getElementById("extensionm").style.display="none";
            }
            function extension(){
                document.getElementById("extensionm").style.display="block";
                document.getElementById("docenciam").style.display="none";
                document.getElementById("todosm").style.display="none";
                document.getElementById("investigacionm").style.display="none";
                document.getElementById("administracionm").style.display="none";
            }
            function administracion(){
                document.getElementById("administracionm").style.display="block";
                document.getElementById("docenciam").style.display="none";
                document.getElementById("investigacionm").style.display="none";
                document.getElementById("todosm").style.display="none";
                document.getElementById("extensionm").style.display="none";
            }
        </script>
    </div>

    <div id="tab2" class="ufps-tab-content">
       
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4" align="center">
                <br>
                <input style="width:300px" align="center" class="ufps-btn" id="cantidad" name="cantidad" value="Cantidad Horas en Docencia por Profesor" type="submit" onclick="cantidad()"><br>
                <input style="width:300px" align="center" class="ufps-btn" id="completo" name="completo" value="Docentes Tiempo completo" type="submit" onclick="completo()"><br>
                <input style="width:300px" align="center" class="ufps-btn" id="medio" name="medio" value="Docentes Medio Tiempo" type="submit" onclick="medio()"><br>
                <input style="width:300px" align="center" class="ufps-btn" id="catedra" name="catedra" value="Docentes catedra" type="submit" onclick="catedra()"><br> 
                <a href="Servicios.jsp">Atr�s</a>  
            </div>
        
            <%String profeyy[]=c.consultarDocentesHorasDocencia().split(",");%>
            <div id="cantidadm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Total Horas en Docencia de Docentes</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th><th>Horas</th></tr>

            <%for(int i=0;i<profeyy.length;i++){
            String ing[]=profeyy[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            String hor=ing[2];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td><td><%=hor%></td></tr>
            <%}%>
            </table>
            </div>
        
        
            <%String profe[]=c.consultarDocentesCompleto().split(",");%>
            <div id="completom" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Docentes Tiempo Completo</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th></tr>

            <%for(int i=0;i<profe.length;i++){
            String ing[]=profe[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td></tr>
            <%}%>
            </table>
            </div>
            
            <%String profeq[]=c.consultarDocentesMedio().split(",");%>
            <div id="mediom" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Docentes Medio Tiempo</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th></tr>

            <%for(int i=0;i<profeq.length;i++){
            String ing[]=profeq[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td></tr>
            <%}%>
            </table>
            </div>
            
            <%String profew[]=c.consultarDocentesCatedra().split(",");%>
            <div id="catedram" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-8" align="center" style="display: none">     
            <h3>Docentes Catedra</h3>
            <table class="ufps-table-inserted ufps-card"><tr align="center"><th>C�digo</th><th>Nombre Completo</th></tr>

            <%for(int i=0;i<profew.length;i++){
            String ing[]=profew[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            %>
            <tr align="center"><td><%=cod%></td><td><%=nom%></td></tr>
            <%}%>
            </table>
            </div>
            
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br>
            <!--Aqui coloco los n profesores, listados con checkbox los cuales seran habilitados
            por el director para ingresar informacion al sistema para periodo definido, se crea
        </form><!--Aqui se termina el div del area de trabajo--> 
        
            <script>
            function cantidad(){
                document.getElementById("cantidadm").style.display="block";
                document.getElementById("completom").style.display="none";
                document.getElementById("mediom").style.display="none";
                document.getElementById("catedram").style.display="none";
            }
            function completo(){
                document.getElementById("completom").style.display="block";
                document.getElementById("cantidadm").style.display="none";
                document.getElementById("mediom").style.display="none";
                document.getElementById("catedram").style.display="none";
            }
            function medio(){
                document.getElementById("mediom").style.display="block";
                document.getElementById("cantidadm").style.display="none";
                document.getElementById("completom").style.display="none";
                document.getElementById("catedram").style.display="none";
            }
            function catedra(){
                document.getElementById("catedram").style.display="block";
                document.getElementById("cantidadm").style.display="none";
                document.getElementById("completom").style.display="none";
                document.getElementById("mediom").style.display="none";
            }
        </script>
    </div>
</div> 

<!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
universidad, programa, materia y desarrolladores-->

<!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <!DOCTYPE html>
                                                                                                                                                                                                                                                                                                              