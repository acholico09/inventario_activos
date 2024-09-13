<div class="container is-fluid mb-6 mt-6">
    <h1 class="title">Productos</h1>
    <h2 class="subtitle">Archivo componentes</h2>
</div>

<div class="container pb-6 pt-6">
    <?php
        include "./inc/btn_back.php";
        require_once "./php/main.php";

        $id = (isset($_GET['product_id_up'])) ? $_GET['product_id_up'] : 0;

        /*== Verificando producto ==*/
        $check_producto = conexion();
        $check_producto = $check_producto->query("SELECT * FROM producto WHERE producto_id='$id'");

        if ($check_producto->rowCount() > 0) {
            $datos = $check_producto->fetch();

            if ($datos['archivo_detalle'] == "NO") {
                echo '<script type="text/javascript">
                    alert("Agrega un documento de componentes primero para visualizarlo");
                    window.location.href = "index.php?vista=product_update&product_id_up=' . $datos['producto_id'] . '";
                </script>';
            }
    ?>

    <div class="form-rest mb-6 mt-6"></div>

    <div class="columns">
        <div class="column has-text-centered">
            <strong class="title is-1"> Nombre: </strong> <br>
         <div class="mb-4 subtitle is-2">
              <?php echo $datos['producto_nombre'] ?>
         </div>
            <embed src= "<?php echo $datos['archivo_detalle'] ?>" type="application/pdf" width="100%" height="600px">
        </div>
    </div>
    <?php 
        } else {
            include "./inc/error_alert.php";
        }
        $check_producto = null;
    ?>
</div>
