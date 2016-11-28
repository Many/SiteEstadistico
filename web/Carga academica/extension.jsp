                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <!DOCTYPE html>
<%--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/--%>

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
<form>

    <!--AQUI VA TODO EL CODIGO DINAMICO QUE CAMBIA SEGUN LAS INFORMACION, FUNCION Y USUARIO-->
    <h1 align="center">Registro de Actividades de Extensi�n</h1>

    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
    <label>C�digo</label>
    <input class="ufps-input ufps-red" type="number" min="0" max="7777777" name="codigo" id="codigo" required="required">
    </div>
    
    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
    <label>Actividad</label>
    <input class="ufps-input ufps-red" type="text" placeholder="Ej:actividad 1" name="actividad" id="actividad" required="required">
    </div>
    
    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
    <label>Responsabilidad</label>
    <select class="ufps-input ufps-red" id="responsabilidad" name="responsabilidad">
       <option value="directorGrupo">Director de Grupo</option>
       <option value="directorProyecto">Director de Proyecto</option>
       <option value="directorSemillero">Director de Semillero</option>
       <option value="jovenInvestigador">Joven Investigador</option>
       <option value="participante">Participante</option>
    </select>
    </div>
    
    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
    <label>Unidad</label>
    <input class="ufps-input ufps-red" type="text" placeholder="Ej:facultad/departamento" name="unidadInvestigativa" id="unidadInvestigativa" required="required">
    </div>

    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">    
    <label>Programa o Beneficiario</label>
    <input class="ufps-input ufps-red" type="text" placeholder="Ej:fundacion..." name="beneficiario" id="beneficiario" required="required">
    </div>
    
    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
    <label>Horas Semanal Ejecuci�n:</label>
    <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="50" name="ejecucion" id="ejecucion" required="required">
    </div>
    
    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
    <label>Horas Semanal Programaci�n:</label>
    <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="50" name="programacion" id="programacion" required="required">
    </div>
    
    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
    <label>Horas Semestre</label>
    <input class="ufps-input ufps-red" type="number" min="0" max="20" name="horaSemestre" id="horaSemestre" required disabled="true">
    </div>
    
    <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4" align="center">
    <input class="ufps-btn" type="submit" id="registrar" name="registrar" value="guardar">
    <a href="Servicios.jsp">Atr�s</a>
    </div>
    
</form><!--Aqui se termina el div del area de trabajo-->
</div>
</div>

<br>
<table class="ufps-table ufps-container">
    <tr align="center"><th>C�digo</th><th>Actividad</th><th>Responsabilidad</th><th>Unidad</th></tr>
    <tr align="center"><td>1</td><td>estudio xyz</td><td>Lider Proyecto</td><td>GIDIS</td></tr>
</table>

<!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
universidad, programa, materia y desarrolladores-->

<!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                              