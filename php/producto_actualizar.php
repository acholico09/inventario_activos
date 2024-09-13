<?php
	require_once "main.php";

	/*== Almacenando id ==*/
    $id=$_POST['producto_id'];


    /*== Verificando producto ==*/
	$check_producto=conexion();
	$check_producto=$check_producto->query("SELECT * FROM producto WHERE producto_id='$id'");

    if($check_producto->rowCount()<=0){
    	echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error inesperado!</strong><br>
                El producto no existe en el sistema
            </div>
        ';
        exit();
    }else{
    	$datos=$check_producto->fetch();
    }
    $check_producto=null;

    $ruta_vieja=$datos['archivo_detalle'];
    $codigo=$_POST['producto_codigo'];
	$nombre=$_POST['producto_nombre'];
	$marca=$_POST['marca'];
    $categoria=$_POST['categoria_id'];
    $responsable=$_POST['responsable'];
    $descripcion=$_POST['descripcion'];




    if ($categoria == 1) {
        $tipo_equipo = $_POST['tipo_equipo'];
        $memoria = $_POST['memoria'];
        $ram = $_POST['ram'];
        $procesador = $_POST['procesador'];
        $tipo_memoria = $_POST['tipo_memoria'];
        $pdf_dir = '../documentos/';




        if ($_FILES['archivo_detalle']['error'] == UPLOAD_ERR_OK) {
            $tamanio_maximo = 50 * 1024 * 1024; // 50 MB en bytes
    
        if ($_FILES['archivo_detalle']['size'] > $tamanio_maximo) {
            echo '
                <div class="notification is-danger is-light">
                    <strong>¡Error!</strong><br>
                    El tamaño del archivo excede el límite máximo permitido (50 MB).
                </div>
            ';
            exit();
        }
    
        $nombreTemporal = $_FILES['archivo_detalle']['tmp_name'];
        $nombreArchivo = $nombre . '_' . $codigo . '.pdf'; // Usando $nombre y $codigo previamente definidos
    
        // Intentar mover el archivo a la carpeta deseada
        if (!move_uploaded_file($nombreTemporal, $pdf_dir . $nombreArchivo)) {
            echo '
                <div class="notification is-danger is-light">
                    <strong>¡Ocurrió un error inesperado!</strong><br>
                    Hubo un problema al mover el archivo.
                </div>
            ';
            // Registrar el error en el archivo de registro del servidor
            error_log("Error al mover el archivo de especificaciones: " . $nombreArchivo);
            exit();
        }
        $pdf_dir = './documentos/';
        $pdf = $pdf_dir . $nombreArchivo;
     
        if (file_exists($ruta_vieja)) {
            if (!unlink($ruta_vieja)) {
                
                echo "Error al eliminar el archivo antiguo.";
            }
        }
        
        } else {
            $pdf=$ruta_vieja;

        }
    
        
        
    }
    


    /*== Verificando codigo ==*/
    if($codigo!=$datos['producto_codigo']){
	    $check_codigo=conexion();
	    $check_codigo=$check_codigo->query("SELECT producto_codigo FROM producto WHERE producto_codigo='$codigo'");
	    if($check_codigo->rowCount()>0){
	        echo '
	            <div class="notification is-danger is-light">
	                <strong>¡Ocurrio un error inesperado!</strong><br>
	                El CODIGO de BARRAS ingresado ya se encuentra registrado, por favor elija otro
	            </div>
	        ';
	        exit();
	    }
	    $check_codigo=null;
    }


    
if($categoria==1){

    $actualizar_producto=conexion();
    $actualizar_producto=$actualizar_producto->prepare("UPDATE producto SET producto_codigo=:codigo, producto_nombre=:nombre, responsable=:responsable, marca=:marca, descripcion=:descripcion, archivo_detalle=:archivo_detalle, tipo_equipo=:tipo_equipo, memoria=:memoria, ram=:ram, procesador=:procesador, tipo_memoria=:tipo_memoria WHERE producto_id=:id");
    $marcadores=[
        ":codigo"=>$codigo,
        ":nombre"=>$nombre,
        ":responsable"=>$responsable,
        ":archivo_detalle"=>$pdf,
        ":marca"=>$marca,
        ":descripcion"=>$descripcion,
        ":tipo_equipo"=>$tipo_equipo,
        ":memoria"=>$memoria,
        ":ram"=>$ram,
        ":id"=>$id,
        ":procesador"=>$procesador,
        ":tipo_memoria"=>$tipo_memoria,
    ];
    if($actualizar_producto->execute($marcadores)){
        echo  '
            <div class="notification is-info is-light">
                <strong>¡PRODUCTO ACTUALIZADO!</strong><br>
                El producto se actualizo con exito
            </div>
        ';
    }else{
        echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error inesperado!</strong><br>
                No se pudo actualizar el producto, por favor intente nuevamente
            </div>
        ';
    }
    $actualizar_producto=null;
    
}else{
   /*== Actualizando datos ==*/
    $actualizar_producto=conexion();
    $actualizar_producto=$actualizar_producto->prepare("UPDATE producto SET producto_codigo=:codigo, producto_nombre=:nombre, responsable=:responsable, marca=:marca, descripcion=:descripcion WHERE producto_id=:id");
    
    $marcadores=[
        ":codigo"=>$codigo,
        ":nombre"=>$nombre,
        ":id"=>$id,
        ":responsable"=>$responsable,
        ":marca"=>$marca,
        ":descripcion"=>$descripcion,
    ];
    if($actualizar_producto->execute($marcadores)){
        echo '
            <div class="notification is-info is-light">
                <strong>¡PRODUCTO ACTUALIZADO!</strong><br>
                El producto se actualizo con exito
            </div>
        ';
    }else{
        echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error inesperado!</strong><br>
                No se pudo actualizar el producto, por favor intente nuevamente
            </div>
        ';
    }
    $actualizar_producto=null;
    
}

   