<html>

<?php 
	$date1=new DateTime($model->ord_fechaIngreso);
	$date2=new DateTime($model->ord_fechaEntrega);
	$exteriores=json_decode($model->ord_vehiculoExterior,true);
?>
<body>
<!--Logo-->
<div style= "position: absolute; top: 6mm; left: 15mm">
	<img src="var:donpolo" id= "polo" >
</div>
<!-- Imagen auto -->
<div style= "position: absolute; top: 90mm; left: 48mm">
	<img  width="73%" src="var:auto">
</div>
<!-- linea del tanque -->
<div class="linea">
	<img  style="transform: rotate(<?= (($model->ord_tanque)*180);?>);" src="var:linea"  id= "linea" >
</div>
<!-- tanque de gasolina -->
<div class="tanque" style= "padding-left: 3mm; padding-top: 3mm">
	<img src="var:fondoTan" id="fondoTanque">
	<br><br>
	<span class= "px-10"><?= $model->ord_tanque*100 ?>%</span>
	<div class="px-12 azul bold">TANQUE DE GASOLINA</div>
</div>
<!--Líneas fijas-->
<div style= "border-bottom: 0.05mm solid #3369b7; width: 80mm; position: absolute; top: 197.1mm; left: 18.17mm"></div>
<div style= "border-bottom: 0.05mm solid #3369b7; width: 80mm; position: absolute; top: 197.1mm; left: 111.8mm"></div>
<div style= "border-bottom: 0.05mm solid #3369b7; width: 80mm; position: absolute; top: 201.1mm; left: 18.17mm"></div>
<div style= "border-bottom: 0.05mm solid #3369b7; width: 80mm; position: absolute; top: 201.1mm; left: 111.8mm"></div>

<!-- Imagen pez -->
<div style="position: absolute; top:17mm; left: 160mm;">
	<img width="77%" src="var:pez" id="pez">
</div>
<!-- Cuadro del folio -->
<div id="cuadroFolio" class= "bordered azul" style="color:red; font-size:1.5em; text-align: center; vertical-align: middle;">
	<?= mb_strtoupper('Nº ' . explode("-", $model->ord_folio)[1])?>
</div>

	<div class="borde">
		<!-- *************************** header ************************ -->
		<div class="fondoAzul">
			<!-- Letras "POLO"-->
			<div class= "mb-2">
				<img src="var:logopolo" id="letraPolo" style= "width: 120mm;">
			</div>
			<b>No es con espada ni con ejército, sino con el poder del espíritu santo</b>
			<br>
			<b>Niños Héroes No. 165 Col. Atasta, Villahermosa, Centro, Tabasco.</b>
			<br>
			<b class= "px-12">Tels. 354 86 83 y 354 02 47</b> &nbsp;&nbsp;&nbsp;
			<img src="var:whats" class= "icon" style= "width: 3mm; height: 3mm">
			<b class= "px-14">9933 86 74 17</b>
			<br>
			<b class= "px-8"><span class="condensed">Email: polotransmisionesautomaticas@hotmail.com</span></b>&nbsp;
			<img src="var:facebook" class= "icon" style= "width: 3mm; height: 3mm">
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

			<!-- tabla exteriores -->
			<div style="width: 40mm;float:left;">
				<table class="tabla">
					<tr>
						<td style="text-align: center; font-size: 10px;" colspan="3">EXTERIORES</td>
					</tr>
					<tr>
						<td></td>
						<td class="cell-sm">Sí</td>	
						<td class="cell-sm">No</td>
					</tr>
					<?php
						$exteriores=json_decode($model->ord_vehiculoExterior,true);
						foreach ($exteriores as $key=>$value) 
						{
							$cad='<tr>
								<td>'.$key.'</td>';
							if($value=='off')
							{
								$cad .=<<<CAD
								<td></td>
								<td class="cell-sm px-14">✓</td>
								</tr>
CAD;
							echo ($cad);
							}else{
								$cad .= <<<CAD
								<td class="cell-sm">✓</td>
								<td></td>
								</tr>
CAD;
							echo ($cad);
							}
						}
					?>
					<?php
						$exteriores=json_decode($model->ord_accesoriosExterior,true);
						foreach ($exteriores as $key=>$value) 
						{
							$cad='<tr>
								<td>'.$key.'</td>';
							if($value=='off')
							{
								$cad .=<<<CAD
								<td></td>
								<td class="cell-sm px-14">✓</td>
								</tr>
CAD;
							echo ($cad);
							}else{
								$cad .= <<<CAD
								<td class="cell-sm">✓</td>
								<td></td>
								</tr>
CAD;
							echo ($cad);
							}
						}
					?>
				</table>
			</div>

			<!-- tabla interiores -->
			<div style="width: 35mm; float:right;">
				<table class="tabla">
					<tr>
						<td style="text-align: center; font-size: 10px;"  colspan="3">INTERIORES</td>
					</tr>
					<tr>
						<td></td>
						<td>Sí</td>	
						<td>No</td>
					</tr>
					<?php
						$interiores=json_decode($model->ord_vehiculoInterior,true);
						foreach ($interiores as $key=>$value) 
						{
							$cad='<tr>
								<td>'.$key.'</td>';
							if($value=='off')
							{
								$cad .=<<<CAD
								<td></td>
								<td class="cell-sm px-14">✓</td>
								</tr>
CAD;
							echo ($cad);
							}else{
								$cad .= <<<CAD
								<td class="cell-sm">✓</td>
								<td></td>
								</tr>
CAD;
							echo ($cad);
							}
						}
					?>
					<?php
						$interiores=json_decode($model->ord_accesoriosInterior,true);
						foreach ($interiores as $key=>$value) 
						{
							$cad='<tr>
								<td>'.$key.'</td>';
							if($value=='off')
							{
								$cad .=<<<CAD
								<td></td>
								<td class="cell-sm px-14">✓</td>
								</tr>
CAD;
							echo ($cad);
							}else{
								$cad .= <<<CAD
								<td class="cell-sm">✓</td>
								<td></td>
								</tr>
CAD;
							echo ($cad);
							}
						}
					?>
				</table>
			</div>
		</div>	

		<!-- problemas del vehiculo -->
		<div style="width: 80mm; height: 40mm; float: left; padding-left: 3mm">
			<div class="px-14 azul bold" style="text-align: center;">PROBLEMAS DEL VEHICULO</div>
			<div class="px-8 justify bigger-spacing"><span class= "underline2">&#8203;<?= mb_strtoupper($model->ord_problemas)?></span></div>
		</div>
		<!-- diagnostico tecnico -->
		<div style="width: 80mm; height: 40mm; float: right; padding-right: 3mm">
			<div class="px-14 azul bold" style="text-align: center;">DIAGNOSTICO TECNICO</div>
			<div class="px-8 justify bigger-spacing" ><span class= "underline2">&#8203;<?= mb_strtoupper($model->ord_diagnostico)?></span></div>
		</div>
		<br>
		<!-- observaciones -->
		<div style="width: 30mm ; padding: 0;" class="div-label">OBSERVACIONES:</div>
		<div style="width: 145mm; padding: 0;" class="div-underline px-8 justify">&#8203;<?= mb_strtoupper($model->ord_observaciones)?></div>

		<div style="width: 180mm; height: 20mm;">
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
