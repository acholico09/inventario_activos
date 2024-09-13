<?php

require_once('main.php');
$id=$_POST['producto_id'];

$conexion = conexion();
$fecha_fin=date('Y-m-d');


    $consulta = "UPDATE producto SET status = 0, fecha_fin=:fecha_fin WHERE producto_id = :producto_id ";

    // Preparar la consulta
    $stmt = $conexion->prepare($consulta);

   
    $stmt->bindParam(':producto_id', $id);
    $stmt->bindParam(':fecha_fin', $fecha_fin);


if($stmt->execute()){

    echo 1;
  
      $conexion = null;
}else{
echo("NO se pudo actualizar el status ");

}

?>