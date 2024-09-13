<div class="container is-fluid mb-6 mt-5">
	<h1 class="title">Productos</h1>
	<h2 class="subtitle">Nuevo producto</h2>
</div>

<div class="container pb-4 pt-4">
    <?php
        require_once "./php/main.php";
    ?>

    <div class="form-rest mb-6 mt-6"></div>

    <form action="./php/producto_guardar.php" method="POST" class="FormularioAjax" autocomplete="off" enctype="multipart/form-data">
        <div class="columns">
            <div class="column">
                <div class="control">
                    <label>Numero de SERIE</label>
                    <input class="input" type="text" name="producto_codigo" maxlength="70" required>
                </div>
            </div>
            <div class="column">
                <div class="control">
                    <label>Modelo</label>
                    <input class="input" type="text" name="producto_nombre" maxlength="70" required>
                </div>
            </div>
			<div class="column">
                <label>Categoría</label><br>
                <div class="select is-rounded">
                    <select name="producto_categoria" onchange="verComponentes(this.value)">
                        <option value="" selected="">Seleccione una opción</option>
                        <?php
                            $categorias = conexion();
                            $categorias = $categorias->query("SELECT * FROM categoria");
                            if ($categorias->rowCount() > 0) {
                                $categorias = $categorias->fetchAll();
                                foreach ($categorias as $row) {
                                    echo '<option value="' . $row['categoria_id'] . '" >' . $row['categoria_nombre'] . '</option>';
                                }
                            }
                            $categorias = null;
                        ?>
                    </select>
                </div>
            </div>
            
        </div>
        <div class="columns">
            <!-- <div class="column">
                <div class="control">
                    <label>Precio</label>
                    <input class="input" type="text" name="producto_precio" pattern="[0-9.]{1,25}" maxlength="25" required>
                </div>
            </div> -->
              
            <!-- <div class="column">
                <div class="control">
                    <label>Stock</label>
                    <input class="input" type="text" name="producto_stock" pattern="[0-9]{1,25}" maxlength="25">
                </div>
            </div> -->
	

			<div class="column">
                <label>Descripción del activo</label>
                <textarea class="input" type="text" name="descripcion" required></textarea>
            </div>
            <div class="column">
                <label>Marca</label><br>
                <div class="select is-rounded">
                <select name="marca" require>
                        <option value="" selected="">Seleccione una opción</option>
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
                <label>Ubicación interna  (area)</label> <br>
                <div class="select is-rounded">
                <select name="area" require>
                        <option value="" selected="">Seleccione una opción</option>
                        <?php
                            $area = conexion();
                            $area = $area->query("SELECT * FROM areas");
                            if ($area->rowCount() > 0) {
                                $area  = $area->fetchAll();
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
        <div class="columns">
            <div class="column is-half">
                <label>Nombre completo del Responsable</label>
                <input class="input" name="responsable" required>
            </div>
			<div class="column">
                <label>Plaza del responsable</label><br>
                <div class="select is-rounded">
                    <select name="plaza_res" require>
                        <option value="" selected="">Seleccione una opción</option>
                        <?php
                            $plaza_res = conexion();
                            $plaza_res = $plaza_res->query("SELECT * FROM plazas where status = 1");
                            if ($plaza_res->rowCount() > 0) {
                                $plaza_res = $plaza_res->fetchAll();
                                foreach ($plaza_res as $row) {
                                    echo '<option value="' . $row['id_plaza'] . '" >' . $row['nombre_plaza'] . '</option>';
                                }
                            }
                            $plaza_res = null;
                        ?>
                    </select>
                </div>
            </div>
			<div class="column">
                <label>Foto o imagen del producto</label><br>
                <div class="file is-small has-name">
                    <label class="file-label">
                        <input class="file-input" type="file" name="producto_foto" accept=".jpg, .png, .jpeg">
                        <span class="file-cta">
                            <span class="file-label">Imagen</span>
                        </span>
                        <span class="file-name">JPG, JPEG, PNG. (MAX 3MB)</span>
                    </label>
                </div>
            </div>
        </div>


        <div class="columns">
            
        </div>


        <div id="componentes" class="mb-5">
            <hr style="background-color: black;"> <br>
            <p class="title is-3 has-text-centered">Componentes básicos</p>
			<div class="columns">
				<div class="column">
					<label for="tipo_equipo">Tipo de computadora</label><br>

					<div class="select is-rounded">
							<select name="tipo_equipo" id="">
								<option value="" selected="">Seleccione una opción</option>
								<option value="escritorio">Computadora de escritorio</option>
								<option value="laptop">Computadora portatil</option>
							</select>
					</div>

				</div>
				<div class="column">
                    <label>Memoria interna</label><br>
                    <div class="select is-rounded">
                        <select name="memoria">
                            <option value="" selected="">Seleccione una opción</option>
                            <option value="128gb">128 GB</option>
                            <option value="256gb">256 GB</option>
                            <option value="480gb">480 GB</option>
                            <option value="500gb">512 o 500 GB</option>
                            <option value="1tb">1 TB</option>
                        </select>
                    </div>
                </div>
				<div class="column">
                    <label>Memoria RAM</label><br>
                    <div class="select is-rounded">
                        <select name="ram">
                            <option value="" selected="">Seleccione una opción</option>
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
                    <input class="input" name="procesador">
                </div>
				<div class="column">
                    <label>Tipo de memoria interna</label><br>
                    <div class="select is-rounded">
                        <select name="tipo_memoria">
                            <option value="" selected="">Seleccione una opción</option>
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



		<p class="has-text-centered">
			<button type="submit" class="button is-info is-rounded">Guardar</button>
		</p>
	</form>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<script>
	$(document).ready(function() {
		$('#componentes').hide();
});

	function verComponentes(valor) {
		
    if (valor == 1) {
        $('#componentes').show();
    } else {
        $('#componentes').hide();
    }
}

        
</script>