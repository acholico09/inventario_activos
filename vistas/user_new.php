<?php require('./php/main.php') ?>
<div class="container is-fluid mb-6">
	<h1 class="title">Usuarios</h1>
	<h2 class="subtitle">Nuevo usuario</h2>
</div>
<div class="container pb-6 pt-6">

	<div class="form-rest mb-6 mt-6"></div>

	<form action="./php/usuario_guardar.php" method="POST" class="FormularioAjax" autocomplete="off" >
		<div class="columns">
		  	<div class="column">
		    	<div class="control">
					<label>Nombres</label>
				  	<input class="input" type="text" name="usuario_nombre"  maxlength="40" required >
				</div>
		  	</div>
		  	<div class="column">
		    	<div class="control">
					<label>Apellidos</label>
				  	<input class="input" type="text" name="usuario_apellido"  maxlength="40" required >
				</div>
		  	</div>
		</div>
		<div class="columns">
		  	<div class="column">
		    	<div class="control">
					<label>Usuario</label>
				  	<input class="input" type="text" name="usuario_usuario"  maxlength="20" required >
				</div>
		  	</div>
		  	<div class="column">
		    	<div class="control">
					<label>Email</label>
				  	<input class="input" type="email" name="usuario_email" maxlength="70" >
				</div>
		  	</div>
			<div class="column">
					<div class="field">
						<label>Plaza</label>
					</div>
					
					<div class="select is-rounded">
                    <select name="plaza">
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
		</div>
		<div class="columns">
		  	<div class="column">
		    	<div class="control">
					<label>Clave</label>
				  	<input class="input" type="password" name="usuario_clave_1"  maxlength="100" required >
				</div>
		  	</div>
		  	<div class="column">
		    	<div class="control">
					<label>Repetir clave</label>
				  	<input class="input" type="password" name="usuario_clave_2"  maxlength="100" required >
				</div>
		  	</div>
		</div>
		<p class="has-text-centered">
			<button type="submit" class="button is-info is-rounded">Guardar</button>
		</p>
	</form>
</div>