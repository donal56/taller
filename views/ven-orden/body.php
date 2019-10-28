<html>

<?php 
	$date1=new DateTime($model->ord_fechaIngreso);
	$date2=new DateTime($model->ord_fechaEntrega);
	$exteriores=json_decode($model->ord_vehiculoExterior,true);
	print_r($exteriores);
?>
<body>
<!--Logo-->
<div style= "position: absolute; top: 16mm; left: 15mm">
	<img src="var:donpolo" id= "polo" >
</div>
<!-- Imagen auto -->
<div style= "position: absolute; top: 92mm; left: 66mm; border: 0">
	<img  width="53%" src="var:auto" id= "auto" >
</div> -->
<!-- linea del tanque -->
<div class="linea">
	<img  style="transform: rotate(<?= (($model->ord_tanque)*180);?>);" src="var:linea"  id= "linea" >
</div>
<!-- tanque de gasolina -->
<div class="tanque">
	<img src="var:fondoTan" id="fondoTanque">
	<br><br>
	<div class="px-12 azul bold">TANQUE DE GASOLINA</div>
</div>
<!-- Cuadro del folio -->
<div id="cuadroFolio" class= "bordered px-16 azul" style="color:red; font-size:3em; text-align: center; vertical-align: middle;">
	<?= mb_strtoupper($model->ord_folio)?>
</div>
	<div class="borde">
		<!-- *************************** header ************************ -->
		<div class="fondoAzul">
			<!-- Letras "POLO"-->
			<div>
				<img src="var:logopolo" id="letraPolo" style= "width: 120mm;">	
				<hr class="azul">
			</div>
			<b>No es con espada ni con ejército, sino con el poder del espíritu santo</b>
			<br>
			<b>Niños Héroes No. 165 Col. Atasta, Villahermosa, Centro, Tabasco.</b>
			<br>
			<b class= "px-12">Tels. 354 86 83 y 354 02 47</b> &nbsp;&nbsp;&nbsp;
			<img src="var:whats" class= "icon">
			<b class= "px-14">9933 86 74 17</b>
			<br>
			<b class= "px-8"><span class="condensed">Email: polotransmisionesautomaticas@hotmail.com</span></b>&nbsp;
			<img src="var:facebook" class= "icon">
			<b class= "px-8">polotransmisionesautomaticas</b>
			<br>
		</div>	
		<div id="barraAzul">
			<span><b class="blanco px-16">ORDEN DE SERVICIO</b></span>
		</div>
		<!-- *************************** body ****************************** -->
		<!--   ********************** 1era Parte ***********************     -->
		<div class="panel">
			<!-- linea1 -->
			<div style="width: 15mm ;" class="div-label">NOMBRE:</div>
			<div style="width: 160mm;" class="div-underline">&#8203; <?= mb_strtoupper($model->ord_nombre) ?></div>
			<!-- linea2 -->
			<div style="width: 18mm ;" class="div-label">DIRECCIÓN:</div>
			<div style="width: 157mm;" class="div-underline">&#8203; <?= mb_strtoupper($model->ord_direccion)?></div>
			<!-- linea3 -->
			<div style="width: 7mm  ;" class="div-label">C.P.:</div>
			<div style="width: 45mm ;" class="div-underline">&#8203; <?=$model->ord_codigoPostal?></div>
			
			<div style="width: 18mm ;" class="div-label">TELEFONO:</div>
			<div style="width: 50mm ;" class="div-underline">&#8203;<?= mb_strtoupper($model->ord_telefono)?></div>
			
			<div style="width: 6mm  ;" class="div-label">IFE:</div>
			<div style="width: 46.3mm ;" class="div-underline">&#8203;<?= mb_strtoupper($model->ord_ife)?></div>
			<!-- linea4 -->
			<div style="width: 14mm ;" class="div-label">MODELO:</div>
			<div style="width: 30mm ;" class="div-underline">&#8203;<?= mb_strtoupper($model->ord_modelo)?></div>
			
			<div style="width: 9mm ;" class="div-label">TIPO:</div>
			<div style="width: 30mm ;" class="div-underline">&#8203;<?= mb_strtoupper($model->ord_tipo)?></div>
			
			<div style="width: 13mm ;" class="div-label">MARCA:</div>
			<div style="width: 32mm ;" class="div-underline">&#8203;<?= mb_strtoupper($model->ord_marca)?></div>
			
			<div style="width: 13mm ;" class="div-label">PLACAS:</div>
			<div style="width: 30mm ;" class="div-underline">&#8203;<?= mb_strtoupper($model->ord_placa)?></div>
			<!-- linea5 -->
			<div style="width: 31mm ;" class="div-label">FECHA DE INGRESO:</div>
			<div style="width: 40mm ;" class="div-underline">&#8203;<?= $date1->format('d/m/Y')?></div>
			
			<div style="width: 10mm ;" class="div-label">HORA:</div>
			<div style="width: 32mm ;" class="div-underline">&#8203;<?= $date1->format('g:i A')?></div>
			
			<div style="width: 18mm ;" class="div-label">F/ENTREGA:</div>
			<div style="width: 41.3mm ;" class="div-underline">&#8203;<?= $date2->format('g:i A');?></div>
			<!-- linea6 -->
			<div style="width: 21mm ;" class="div-label">NO.DE SERIE:</div>
			<div style="width: 35mm ;" class="div-underline">&#8203; <?= mb_strtoupper($model->ord_noSerie)?></div>
			
			<div style="width: 12mm ;" class="div-label">COLOR:</div>
			<div style="width: 35mm ;" class="div-underline">&#8203;<?= mb_strtoupper($model->ord_color)?></div>
			
			<div style="width: 27mm ;" class="div-label">KM.RECORRIDOS:</div>
			<div style="width: 42.2mm ;" class="div-underline">&#8203;<?= mb_strtoupper($model->ord_kilometraje)?></div>
		</div>
		<!--   ********************** 2da  Parte Inventario del Vehiculo  ***********************     -->
		<div class="azul px-12 bold">INVENTARIO DEL VEHICULO</div>
		<div style="width: 200mm; position: absolute;">
			<!-- titulos -->
			<div style="width: 60mm; float:left;"  class="div-label2 borde">EXTERIORES</div>
			<div style="width: 60mm; float:right;" class="div-label2 borde">INTERIORES</div>
			<!-- tabla exteriores -->
			<div style="width: 60mm;float:left;">
				<table class="tabla">
					<tr>
						<td></td>
						<td>Sí</td>	
						<td>No</td>
					</tr>
					<?php
						$exteriores=json_decode($model->ord_vehiculoExterior,true);
						print_r("<p>".$exteriores."</p>");
						foreach ($exteriores as $exterior) 
						{
							if($exterior=='off')
							{
								$cad= <<<CAD
								<tr>
								<td></td>
								<td></td>
								<td>*</td>
								</tr>
CAD;
							echo ($cad);
							}else{
								$cad= <<<CAD
								<tr>
								<td></td>
								<td>*</td>
								<td></td>
								</tr>
CAD;
							echo ($cad);

							}
						}
					?>
					<tr>
						<td>UNIDAD DE LUCES</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>

			<!-- tabla interiores -->
			<div style="width: 60mm; float:right;">
				<table class="tabla">
					<tr>
						<td></td>
						<td>Sí</td>	
						<td>No</td>
					</tr>
					<tr>
						<td>INST.DE TABLERO</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br>
		<!-- observaciones -->
		<div style="width: 30mm ; padding: 0;" class="div-label">OBSERVACIONES:</div>
		<div style="width: 145mm; padding: 0;" class="div-underline px-8 justify">&#8203;<?= mb_strtoupper($model->ord_observaciones)?></div>

		<!-- titulos2 -->
		<div style="width: 120mm; height: 5mm; float: right;">
			<div style="width: 51mm; float:left;" class="div-label2 borde">EXTERIORES</div>
			<div style="width: 50mm; float:right;" class="div-label2 borde">INTERIORES</div>
		</div>

		<!-- tablas 2 -->
		<div style="width: 120mm; height: 5mm; float: right;">
			<div style="width: 50mm;float:left;">
				<table class="tabla2" border="1">
					<tr>
						<td></td>
						<td>Sí</td>	
						<td>No</td>
					</tr>
					<tr>
						<td>GATO</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>MANERALDE GATO</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>LLAVE DE RUEDAS</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ESTUCHE HERRAMIENTAS</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>TRIANGULOS SEGURIDAD</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>LLANTA DE REFACCION</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>EXTINTOR</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div style="width: 50mm; float:right;">
				<table class="tabla2" border="1">
					<tr>
						<td></td>
						<td>Sí</td>	
						<td>No</td>
					</tr>
					<tr>
						<td>CLAXON</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>TAPON ACEITE</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>TAPON RADIADOR</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>VARILLA ACEITE</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>FILTRO AIRE</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>BATERIA</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<br><br><br><br><br><br><br><br>
		<div>
			<!-- problemas del vehiculo -->
			<div style="width: 80mm; height: 40mm; float: left;">
				<div class="px-14 azul bold" style="text-align: left;">PROBLEMAS DEL VEHICULO</div>
				<div class="div-underline px-8 justify">&#8203;<?= mb_strtoupper($model->ord_problemas)?></div>
			</div>
			<!-- diagnostico tecnico -->
			<div style="width: 80mm; height: 40mm; float: right;">
				<div class="px-14 azul bold" style="text-align: left;">DIAGNOSTICO TECNICO</div>
				<div class="div-underline px-8 justify">&#8203;<?= mb_strtoupper($model->ord_diagnostico)?></div>
			</div>
		</div>
		<div style="width: 180mm; height: 20mm;">
			<br><br><br>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="firmas">FIRMA DEL ASESOR</div>
			<div class="firmas">FIRMA DEL MECANICO</div>
			<div class="firmas">FIRMA DEL CLIENTE</div>
		</div>
	</div>
	<!-- *************************** footer ************************ -->
	<div class="px-16 azul bold">NOTAS IMPORTANTES</div>
	<div class="px-10" style="text-align: justify;">1.- EL CLIENTE ESTÁ DE ACUERDO Y AUTORIZA QUE SU UNIDAD SEA PROBADA Y CHECADA FUERA DE NUESTRAS INSTALACIONES EN UN RADIO DE DISTANCIA NO MAYOR A 50 KILÓMETROS A LA REDONDA PARA GARANTIZAR EL BUEN DESEMPEÑO DE LA MISMA PARA LO CUAL EL CLIENTE FIRMA DE CONFORMIDAD.</div>
	<div class="px-10" style="text-align: justify;">
	2.- DURANTE EL PERIODO DE PRUEBA LA RESPONSABILIDAD DE ACCIDENTES O DAÑOS QUE SUFRA LA UNIDAD DURANTE EL PERIODO DE PRUEBA POR MOTIVOS AJENOS A NUESTRA RESPONSABILIDAD TÉCNICA SERA BAJO LA COBERTURA PRIMERAMENTE POR EL SEGURO DEL CLIENTE Y EN CASO DE CARECER DE DICHO SEGURO, EL CLIENTE PAGARÁ EL DEDUCIBLE QUE SE DERIVE EL PAGO DE DAÑOS QUE NUESTRO SEGURO LIQUIDE.
	</div>
	<div class="px-10" style="text-align: justify;">
	3.-EN PARTES ELECTRÓNICAS NO HAY GARANTÍAS.
	</div>
	<div class="px-10" style="text-align: justify;">
	4.- NO NOS HACEMOS RESPONSABLES POR OBJETOS DE VALOR NO REPORTADOS EN LA ADMINISTRACIÓN.
	</div>
	<div class="px-10" style="text-align: justify;">
	5.- DESPUÉS DE 24 HRS. QUE HAYA RECIBIDO EL CLIENTE LA CONFIRMACIÓN DE TERMINADA SU UNIDAD Y ÉSTA NO ES RECOGIDA PAGARÁ $50 PESOS DE PENSIÓN DIARIA Y SERÁ RESPONSABLE DE LOS DAÑOS QUE ÉSTA SUFRA DURANTE LA ESTANCIA.
	</div>
</body>
</html>
