                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <!DOCTYPE html>
<!--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/10/2016*/-->
    
        <!--Aqui coloco el header, OJO con include-->
       <jsp:include page="diseno.jsp"/>
       <jsp:include page="../plantilla/header.jsp"/>

        <!--Contenido-->
        <!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
        a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
        en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
        dentro de un div-->
        <div class="ufps-container-fluid">
        <div class="ufps_row">
        <form  align="center">

            <!--AQUI VA TODO EL CODIGO DINAMICO QUE CAMBIA SEGUN LAS INFORMACION, FUNCION Y USUARIO-->

            <h1 align="center">Registro Actividades de Administración Académica</h1>

            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Consecutivo</label>
             <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="20" name="consecutivo" id="consecutivo" required disabled="true">
            </div>
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Cargo</label>
             <select id="cargo" name="cargo" class="ufps-input ufps-red">
                <option value="decano">Decano</option>
                <option value="director">Director</option>
                <option value="vicerrector">Vicerrector</option>
                <option value="asistente">Asistente</option>
                 <option value="jefeDivision">Jefe de División</option>
                <option value="jefeDepartamento">Jefe de Departamento</option
                <option value="coordinadorPrograma">Coordinador de Programa</option>
                <option value="representacionInstitucional">Representación Institucional</option>
                <option value="representacionGremial">Representación Gremial</option>
             </select>
            </div>
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Horas Semanal:</label>
             <input class="ufps-input ufps-red" value="0" type="number" maxlength="2" min="0" max="50" name="horaSemanal" id="horaSemanal" required="required">
            </div>
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
              <label>Consecutivo:</label>
              <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="20" name="consecutivo2" id="consecutivo2" required="required" disabled="true">
            </div>
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Otras actividades Administrativas:</label>
             <input class="ufps-input ufps-red" type="text" placeholder="Ej:actividad 1" name="actividad" id="actividad" required="required">
            </div>
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
             <label>Horas Semanal:</label>
             <input class="ufps-input ufps-red" value="0" type="number" maxlength="2" min="0" max="50" name="horaSemanal2" id="horaSemanal2" required="required" onclick=horaSemestral()>
            </div>
            
            
            <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">
                <input class="ufps-btn" type="submit" id="registrar" name="registrar" value="guardar">
                <a href="Servicios.jsp">Atrás</a>    
            </div>
            
        </form><!--Aqui se termina el div del area de trabajo-->
        </div>
        </div>
        
    <br>
    <table class="ufps-table ufps-container">
        <tr align="center"><th>Consecutivo</th><th>Cargo</th><th>Horas Semanales</th></tr>
        <tr align="center"><td>1</td><td>Director de división</td><td>10</td></tr>
    </table>
        
    <!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
    universidad, programa, materia y desarrolladores-->
    <!--Aqui coloco el footer, OJO con include-->
    <jsp:include page="../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                                 