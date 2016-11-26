/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var pos = 1;
var posD = 1;


/* Crea el objeto AJAX. Esta funcion es generica para cualquier utilidad de este tipo, por
 lo que se puede copiar tal como esta aqui */
function nuevoAjax()
{
    var xmlhttp = false;
    try {
        // Creacion del objeto AJAX para navegadores no IE Ejemplo:Mozilla, Safari 
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            // Creacion del objet AJAX para IE
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
                xmlhttp = new XMLHttpRequest();
        }
    }
    return xmlhttp;
}

function ingresar() {
    var nombre_usuario = document.getElementById("nombre_usuario");
    var password = document.getElementById("password");
    ajax = nuevoAjax();
    parametros = "nombre_usuario=" + nombre_usuario.value + "&password=" + password.value;
    url = "procesar/procesarSesion.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") < 0) {
                    document.getElementById("divError").innerHTML = ajax.responseText;
                }
                else {
                    if (rta.indexOf("1") >= 0) {
                        login.action = "listar_modulos.jsp";
                        login.submit();
                    } else if (rta.indexOf("2") >= 0) {
                        login.action = "listar_modulos.jsp";
                        login.submit();
                    }
                }
            }
        }
        else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

//javascript carlos torres 19/11/2016

/*
 * genera el pop-up para crear publicacion
 */
function abrirVentana() {

    $.ajax({
        type: "GET",
        url: "../GestorPublicaciones",
        data: {
            'medio': 'abrirVentanaCrearPublicacion'
        },
        cache: false,
        success: function (data) {
            var $dialog = $('<div id="ventana" syle="height=450px;"></div>')
                    .html(data).dialog({
                autoOpen: false,
                modal: true,
                height: 600,
                width: 600,
                title: "",
                close: function (event, ui) {
                    $(this).dialog('destroy').remove();
                }
            });

            $dialog.dialog('open');


        }
    });

}

/**
 * este metodo cierra el pop-up
 * @returns {undefined}
 */
function eliminarVentana() {
    $("#ventana").dialog('destroy').remove();
}


/**
 * este metodo registra una publicacion en el sistema
 * @returns {undefined}
 */
function registrarPublicacion() {

    var titulo = $("#titulo").val();
    var modulo = $("#modulo").val();
    var informe = $("#informe").val();
    var texto = $("#texto").val();

    $.ajax({
        type: "POST",
        url: "../GestorPublicaciones",
        data: {
            'medio': 'registrarPublicacion',
            'titulo': titulo,
            'modulo': modulo,
            'informe': informe,
            'texto': texto
        },
        cache: false,
        success: function (data) {

            if (data) {
                alert("registro exitoso");
                eliminarVentana();
            } else {
                alert("Error en el registro");
            }


        }
    });

}

function registrarUsuario() {
    var nombre_usuario = document.getElementById("nombre_usuario");
    var password = document.getElementById("password");
    var modulos = document.getElementById("modulos");
    var roles = document.getElementById("registro");
    var rol = "";
    for (var i = 0; i < roles.elements.length; i++) {
        if ((roles[i].type === 'checkbox') && (roles[i].checked === true)) {
            var val = roles[i].value;
            rol = rol.concat(val, '\n')
        }
    }
    alert(rol);
    ajax = nuevoAjax();
    parametros = "nombre_usuario=" + nombre_usuario.value + "&password=" + password.value + "&roles=" + rol + "&modulo=" + modulos.value;
    url = "procesar/procesarRegUsuario.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Registro exitoso";
                }
                else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        }
        else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function registrarModulo() {
    var nombre_mod = document.getElementById("nombre_mod");
    var descripcion = document.getElementById("descripcion");
    var dir = document.getElementById("url");
    ajax = nuevoAjax();
    parametros = "nombre_mod=" + nombre_mod.value + "&descripcion=" + descripcion.value + "&url=" + dir.value;
    url = "procesar/procesarRegModulo.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Registro exitoso";
                    document.getElementById("registro").reset;
                }
                else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        }
        else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function validarId() {
    var id = document.getElementById("id");
    var modulo = document.getElementById("selectMod");
    ajax = nuevoAjax();
    parametros = "id=" + id.value + "&modulo=" + modulo.value;
    url = "procesar/validarIdRF.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("id").innerHTML = "style='border-color: red;'";
                    document.getElementById("registro").reset;
                }
                else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        }
        else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function registrarRF() {
    var id = document.getElementById("id");
    var modulo = document.getElementById("selectMod");
    var nombre= document.getElementById("nombre");
    var dir= document.getElementById("url");
    var descripcion= document.getElementById("descripcion");
    ajax = nuevoAjax();
    parametros = "id=" + id.value + "&modulo=" + modulo.value+ "&nombre="+ nombre.value+"&url="+dir.value+ "&descripcion="+descripcion.value;
    url = "procesar/procesarRegistroRF.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Registro exitoso";
                    document.getElementById("registro").reset;
                }
                else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        }
        else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}
    
function registrarRol(){
    var rol = document.getElementById("rol");
    var descripcion = document.getElementById("descripcion");
    var req= document.getElementById("registro");
    //Falta hacer método que recorrar los checks, falta pestañas
    ajax = nuevoAjax();
    parametros = "rol="+rol.value +"&descripcion="+descripcion.value + "&reqs="+req;
    url = "procesar/procesarRegistroRol.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Registro exitoso";
                    document.getElementById("registro").reset;
                }
                else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        }
        else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}