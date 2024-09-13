<?php
	require_once "../inc/session_start.php";

	require_once "main.php";

	$codigo=$_POST['producto_codigo'];
	$nombre=$_POST['producto_nombre'];
	$marca=$_POST['marca'];
	$categoria=$_POST['producto_categoria'];
    $responsable=$_POST['responsable'];
    $descripcion=$_POST['descripcion'];
    $plaza_res=$_POST['plaza_res'];
    $area=$_POST['area'];
    $fecha_inicio = date("Y-m-d");

    if ($categoria == 1) {
        $tipo_equipo = $_POST['tipo_equipo'];
        $memoria = $_POST['memoria'];
        $ram = $_POST['ram'];
        $procesador = $_POST['procesador'];
        $tipo_memoria = $_POST['tipo_memoria'];
        $pdf_dir = '../documentos/';
        
        // Verificar el tamaño máximo del archivo (50 MB)
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
        $nombreArchivo = $nombre . '_' . $codigo . '.pdf'; // Nombre único del archivo
    
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
    }
    
    





   
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




    

	$img_dir='../img/producto/';


	/*== Comprobando si se ha seleccionado una imagen ==*/
	if($_FILES['producto_foto']['name']!="" && $_FILES['producto_foto']['size']>0){

        /* Creando directorio de imagenes */
        if(!file_exists($img_dir)){
            if(!mkdir($img_dir,0777)){
                echo '
                    <div class="notification is-danger is-light">
                        <strong>¡Ocurrio un error inesperado!</strong><br>
                        Error al crear el directorio de imagenes
                    </div>
                ';
                exit();
            }
        }
        
       

        


		/* extencion de las imagenes */
		switch(mime_content_type($_FILES['producto_foto']['tmp_name'])){
			case 'image/jpeg':
			  $img_ext=".jpg";
			break;
			case 'image/png':
			  $img_ext=".png";
			break;
		}

		/* Cambiando permisos al directorio */
		chmod($img_dir, 0777);

		/* Nombre de la imagen */
		$img_nombre=renombrar_fotos($nombre);

		/* Nombre final de la imagen */
		$foto=$img_nombre.$img_ext;

		/* Moviendo imagen al directorio */
		if(!move_uploaded_file($_FILES['producto_foto']['tmp_name'], $img_dir.$foto)){
			echo '
	            <div class="notification is-danger is-light">
	                <strong>¡Ocurrio un error inesperado!</strong><br>
	                No podemos subir la imagen al sistema en este momento, por favor intente nuevamente
	            </div>
	        ';
			exit();
		}

	}else{
		$foto="";
	}


    if($categoria==1){
        $guardar_producto=conexion();
        $guardar_producto=$guardar_producto->prepare("INSERT INTO producto(producto_codigo,producto_nombre,producto_foto,categoria_id,usuario_id,responsable,fecha_inicio,marca,descripcion,plaza_responsable,tipo_equipo,memoria,ram,procesador,tipo_memoria,archivo_detalle,plaza,area_asignada) 
        VALUES(:codigo,:nombre,:foto,:categoria,:usuario_id,:responsable,:fecha_inicio,:marca,:descripcion,:plaza_responsable,:tipo_equipo,:memoria,:ram,:procesador,:tipo_memoria,:archivo_detalle,:plaza,:area_asignada)");
        
        $marcadores=[
            ":codigo"=>$codigo,
            ":nombre"=>$nombre,
            ":foto"=>$foto,
            ":categoria"=>$categoria,
            ":responsable"=>$responsable,
            ":fecha_inicio"=>$fecha_inicio,
            ":usuario_id"=>$_SESSION['id'],
            ":plaza"=>$_SESSION['plaza'],
            ":archivo_detalle"=>$pdf,
            ":plaza_responsable"=>$plaza_res,
            ":marca"=>$marca,
            ":descripcion"=>$descripcion,
            ":tipo_equipo"=>$tipo_equipo,
            ":memoria"=>$memoria,
            ":ram"=>$ram,
            ":procesador"=>$procesador,
            ":tipo_memoria"=>$tipo_memoria,
            ":area_asignada"=>$area
        ];

    
        $guardar_producto->execute($marcadores);

    }else{

	/*== Guardando datos ==*/
    $guardar_producto=conexion();
    $guardar_producto=$guardar_producto->prepare("INSERT INTO producto(producto_codigo,producto_nombre,producto_foto,categoria_id,responsable,fecha_inicio,usuario_id,plaza,plaza_responsable,marca,descripcion,area_asignada) VALUES(:codigo,:nombre,:foto,:categoria,:responsable,:fecha_inicio,:usuario_id,:plaza,:plaza_responsable,:marca,:descripcion,:area_asignada)");

        $marcadores=[
            ":codigo"=>$codigo,
            ":nombre"=>$nombre,
            ":foto"=>$foto,
            ":categoria"=>$categoria,
            ":responsable"=>$responsable,
            ":fecha_inicio"=>$fecha_inicio,
            ":usuario_id"=>$_SESSION['id'],
            ":plaza"=>$_SESSION['plaza'],
            ":plaza_responsable"=>$plaza_res,
            ":marca"=>$marca,
            ":descripcion"=>$descripcion,
            ":area_asignada"=>$area
        ];


    $guardar_producto->execute($marcadores);
    }


    
    if($guardar_producto->rowCount()==1){
        echo '
            <div class="notification is-info is-light">
                <strong>¡PRODUCTO REGISTRADO!</strong><br>
                El producto se registro con exito
            </div>
        ';
    }else{

    	if(is_file($img_dir.$foto)){
			chmod($img_dir.$foto, 0777);
			unlink($img_dir.$foto);
        }

        echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error inesperado!</strong><br>
                No se pudo registrar el producto, por favor intente nuevamente
            </div>
        ';
    }
    $guardar_producto=null;
