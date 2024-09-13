<?php require "./inc/session_start.php"; ?>
<!DOCTYPE html>
<html>
    <head>
        <?php include "./inc/head.php"; ?>
    </head>
    <body>
        <?php

            if(!isset($_GET['vista']) || $_GET['vista']==""){
                $_GET['vista']="login";
            }


            if(is_file("./vistas/".$_GET['vista'].".php") && $_GET['vista']!="login" && $_GET['vista']!="404"){

                /*== Cerrar sesion ==*/
                if((!isset($_SESSION['id']) || $_SESSION['id']=="") || (!isset($_SESSION['usuario']) || $_SESSION['usuario']=="")){
                    include "./vistas/logout.php";
                    exit();
                }

                include "./inc/navbar.php";

                include "./vistas/".$_GET['vista'].".php";

                include "./inc/script.php";

            }else{
                if($_GET['vista']=="login"){
                    include "./vistas/login.php";
                }else{
                    include "./vistas/404.php";
                }
            }
        ?>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <script>
$(document).ready(function() {
    $(".finalizarActivo").click(function() {
        var confirmacion = confirm("¿Estás seguro de que quieres cambiar el estado del activo?");
        if (confirmacion) {
            var productoId = $(this).data("id");
            $.ajax({
                url: "./php/actualizar_status.php",
                type: "POST",
                data: {producto_id: productoId},
                success: function(data) {
                    if (data == 1){
                        alert("Status actualizado");
                        location.reload(); 
                    } else {
                        alert(data);  
                    }
                }
            });
        }
    });


});
</script>

</html>