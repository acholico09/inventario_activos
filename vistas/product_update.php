
<div class="container is-fluid mb-6 mt-5">
	<h1 class="title">Activos</h1>
	<h2 class="subtitle">Actualizar activo</h2>
</div>

<div class="container pb-6 pt-1">
	<?php
		include "./inc/btn_back.php";

		require_once "./php/main.php";

		$id = (isset($_GET['product_id_up'])) ? $_GET['product_id_up'] : 0;
		$id=limpiar_cadena($id);

		/*== Verificando producto ==*/
    	$check_producto=conexion();
    	$check_producto=$check_producto->query("SELECT * FROM producto as pr  inner join areas as ar on pr.area_asignada=ar.id_area  WHERE producto_id='$id'");

        if($check_producto->rowCount()>0){
        	$datos=$check_producto->fetch();
	?>

	<div class="form-rest mb-6 mt-2"></div>
	
	<h2 class="title has-text-centered"> <?php echo $datos['producto_nombre']; ?></h2>

	<form action="./php/producto_actualizar.php" method="POST" class="FormularioAjax" autocomplete="off" >

		<input type="hidden" name="producto_id" value="<?php echo $datos['producto_id']; ?>" required >
		<input type="hidden" name="categoria_id" value="<?php echo $datos['categoria_id']; ?>" required >

		<div class="columns">
		  	<div class="column">
		    	<div class="control">
					<label>Numero de SERIE</label>
				  	<input class="input" type="text" name="producto_codigo" maxlength="70" required value="<?php echo $datos['producto_codigo']; ?>" >
				</div>
		  	</div>
		  	<div class="column">
		    	<div class="control">
					<label>Modelo</label>
				  	<input class="input" type="text" name="producto_nombre"  maxlength="70" required value="<?php echo $datos['producto_nombre']; ?>" >
				</div>
		  	</div>
		</div>
		<div class="columns">
		<div class="column is-one-fifth">
                <label>Marca</label><br>
                <div class="select is-rounded ">
                <select name="marca" require>
					<option value="<?php echo $datos['marca'] ?>" selected=""><?php echo $datos['marca'] ?> (Actual)</option>
                        <?php
                            $marca = conexion();
                            $marca = $marca->query("SELECT * FROM marcas");
                            if ($marca->rowCount() > 0) {
                                $marca = $marca->fetchAll();
                                foreach ($marca as $row2) {
                                    echo '<option value="' . $row2['nombre'] . '" >' . $row2['nombre'] .' ( '.$row2['tipo'].' ) '.'</option>';
                                }
                            }
                            $marca = null;
                        ?>
                    </select>
                </div>
            </div>
		  	<div class="column">
		    	<div class="control">
					<label>Descripción</label>
				  	<input class="input" type="text" name="descripcion" maxlength="200" required value="<?php echo $datos['descripcion']; ?>" >
				</div>
		  	</div>
		</div>
		<div class="columns">
		<div class="column">
		    	<div class="control">
					<label>Nombre completo del responsable</label>
				  	<input class="input" type="text" name="responsable" maxlength="25" required value="<?php echo $datos['responsable']; ?>" >
				</div>
		  	</div>
			  <div class="column">
                <label>Área responsable</label><br>
                <div class="select is-rounded ">
                <select name="area" require>
					<option value="<?php echo $datos['id_area'] ?>" selected=""><?php echo $datos['nombre_area'] ?> (Actual)</option>
                        <?php
                            $area = conexion();
                            $area = $area->query("SELECT * FROM areas");
                            if ($area->rowCount() > 0) {
                                $area = $area->fetchAll();
                                foreach ($area as $row2) {
                                    echo '<option value="' . $row2['id_area'] . '">' . $row2['nombre_area'] . '</option>';
                                }
                            }
                            $area = null;
                        ?>
                    </select>
                </div>
            </div>
		</div>

		
	<?php
	if ($datos['categoria_id']==1){
	?>
		<div id="componentes" class="mb-5">
            <hr style="background-color: black;"> <br>
            <p class="title is-3 has-text-centered">Actualizar Componentes básicos</p>
			<div class="columns">
				<div class="column">
					<label for="tipo_equipo">Tipo de computadora</label><br>

					<div class="select is-rounded">
							<select name="tipo_equipo" id="">
							<option value="<?php echo  $datos['tipo_equipo'] ?>" selected=""><?php echo $datos['tipo_equipo'] ?> (Actual)</option>
								<option value="escritorio">Computadora de escritorio</option>
								<option value="laptop">Computadora portatil</option>
							</select>
					</div>

				</div>
				<div class="column">
                    <label>Memoria interna</label><br>
                    <div class="select is-rounded">
                        <select name="memoria">
						<option value="<?php echo $datos['memoria'] ?>" selected=""><?php echo $datos['memoria'] ?> (Actual)</option>
                            <option value="128gb">128 GB</option>
                            <option value="256gb">256 GB</option>
                            <option value="480gb">480 GB</option>
                            <option value="500gb">512 o 500 GB</option>
                            <option value="1tb">1 TB</option>
							<option value="2tb">2 TB</option>
                        </select>
                    </div>
                </div>
				<div class="column">
                    <label>Memoria RAM</label><br>
                    <div class="select is-rounded">
                        <select name="ram">
							<option value="<?php echo $datos['ram'] ?>" selected=""><?php echo $datos['ram'] ?> GB (Actual)</option>
							<option value="2">2 GB</option>
							<option value="3">3 GB</option>
                            <option value="4">4 GB</option>
                            <option value="6">6 GB</option>
                            <option value="8">8 GB</option>
                            <option value="16">16 GB</option>
                            <option value="32">32 GB</option>
                        </select>
                    </div>
                </div>
				<div class="column">
                    <label>Nombre del Procesador</label>
                    <input class="input" name="procesador" value="<?php echo $datos['procesador']; ?>">
                </div>
				<div class="column">
                    <label>Tipo de memoria interna</label><br>
                    <div class="select is-rounded">
                        <select name="tipo_memoria">
						<option value="<?php echo $datos['tipo_memoria'] ?>" selected=""><?php echo $datos['tipo_memoria'] ?>  (Actual)</option>
                            <option value="HDD">HDD (Disco Duro)</option>
                            <option value="SSD">SSD (Unidad de estado solido)</option>
                        </select>
                    </div>
                </div>
                

			</div>
            <div class="columns">
                
            
              
                <div class="column">
                    <label>Archivo de especificaciones</label><br>
                    <div class="file is-small has-name">
                        <label class="file-label">
                            <input class="file-input" type="file" name="archivo_detalle" accept=".pdf">
                            <span class="file-cta">
                                <span class="file-label">PDF</span>
                            </span>
                            <span class="file-name">PDF. (MAX 50MB)</span>
                        </label>
                    </div>
                </div>
            </div>
		
        </div>
		<?php
		}
		?>


		<p class="has-text-centered">
			<button type="submit" class="button is-success is-rounded">Actualizar</button>
		</p>
	</form>
	<?php 
		}else{
			include "./inc/error_alert.php";
		}
		$check_producto=null;
	?>
</div>
