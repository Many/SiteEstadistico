<%-- 
    Document   : filtrarUsuarios
    Created on : 14/12/2016, 08:22:57 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.UsuarioDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String clave = request.getParameter("rol");
    System.out.println(clave);
    boolean exito = false;
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<UsuarioDTO> usuarios =null;
    if(clave.equalsIgnoreCase("seleccione una opción")){
        usuarios=gestor.filtrar("");
    }else{
        usuarios=gestor.filtrar(clave);
    }
    if (!usuarios.isEmpty()) {
        exito = true;
    }
    if (exito) {
%>
<table class="ufps-table ufps-table-inserted" cellspacing="0" width="100%">
    <thead>
        <tr>

            <th>CÓDIGO</th>
            <th>NOMBRE</th>
            <th>MODIFICAR</th>
            <th>ELIMINAR</th>
        </tr>
    </thead>
    <tbody>
        <% for (UsuarioDTO dto : usuarios) {
                UsuarioDTO dto1 = gestor.obtenerUsuario(dto.getUssername());
        %>
        <tr>
            <td><%= dto1.getUssername()%></td>
            <td><%= dto1.getNombre()%></td>
<td><center><button onclick="javascript:modalMUsuario('<%=dto.getUssername()%>', '<%=dto.getNombre()%>')" class="ufps-btn ufps-btn-light" href="modificarUsuario.jsp?user=<%=dto.getUssername()%>&password=<%=dto.getPassword()%>">Modificar</button></center> </td>
<td><center><button onclick="javascript:eliminarUsuario('<%=dto.getUssername()%>') " class="ufps-btn" href="procesar/eliminarUsuario.jsp?user=<%=dto.getUssername()%>&password=<%=dto.getPassword()%>">Eliminar</button></center> </td>
</tr>
<% }%>
</tbody>
</table>
<% } else { %>
<table class="ufps-table" cellspacing="0" width="100%">
    <thead>
        <tr>

            <th>CÓDIGO</th>
            <th>NOMBRE</th>
            <th>Acción</th>
            <th>Acción</th>
        </tr>
    </thead>
    <tbody>

        <tr>
            <td colspan="4"><center> No existen usuarios</center></td>
</tr>
</tbody>
</table>
<% }%>