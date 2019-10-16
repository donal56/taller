	<div class="borde">
		<div style="width: 125mm; float: left;">
			<div style="float:left;width: 70mm;"><img src="var:polo"></div>
			<div style="margin-left: 20mm; font-size:25px;font-weight: bold; ">TEL.354 86 83</div>
			<div style="width: 45mm; font-size:10px;font-style: italic; text-align: justify;">"No es con espada ni con ejército, sino el poder del espíritu santo"</div>
		</div>
		
		<div class="rounded">
			<table cellspacing="0" width="50mm">
			  <tr>
			    <td class="fwhite f16" colspan="3">VALE DE ALMACÉN</td>
			  </tr>
			  <tr>
			  	<td style="color:red; font-size:2em;height: 50px; text-align: center" colspan="3" >
			  		N&#xba; <?= str_replace("-", "",  $model->alm_folio) ?> 
			  	</td>
			  </tr>
			  <tr>
			    <td class="fwhite  f16" colspan="3">FECHA</td>
			  </tr>
			  <tr>
			    <td style="border-bottom: 0px;height: 60px" class="fblue center bold"> DÍA </td>
			    <td style="border-bottom: 0px;" class="fblue center bold"> MES </td>
			    <td style="border-bottom: 0px;" class="fblue center bold"> AÑO </td>
			  </tr>
			  <tr>
			    <td style="border-top: 0px; text-align: center;"><?= explode('-',$model->alm_fecha)[2] ?></td>
			    <td style="border-top: 0px; text-align: center;"><?= explode('-',$model->alm_fecha)[1] ?></td>
			    <td style="border-top: 0px; text-align: center;"><?= explode('-',$model->alm_fecha)[0] ?></td>
			  </tr>
			</table>
		</div>
	<div style="width: 80%;height: 20px; float: center;">
		<div style="width: 15mm;" class="div-label">No. pedido:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_noPedido) ?></div>
		<div style="width: 14mm;" class="div-label">Vehículo:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_vehiculo) ?></div>
		<div style="width: 13mm;" class="div-label">Modelo:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_modelo) ?></div>
		<div style="width: 16mm;" class="div-label">Mecánico:</div>
		<div style="width: 23mm;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_mecanico) ?></div>
	</div>
	<div style="width: 80%;height: 30px; float: center;">
		<div style="width: 9mm;" class="div-label">Placa:</div>
		<div style="width: 24mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_placa) ?></div>
		<div style="width: 9mm;" class="div-label">Color:</div>
		<div style="width: 24mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_color) ?></div>
		<div style="width: 12mm;" class="div-label">Trabajo:</div>
		<div style="width: 19mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_trabajo) ?></div>
		<div style="width: 14mm;" class="div-label">Garantía:</div>
		<div style="width: 24mm;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_garantia) ?></div>
	</div>
		<div class="fullheight">
			<table class="rounded2" style="border: 0px; border-collapse: collapse;" width="100%">
				<tr>
					<td class="td1 fwhite f12" style= "padding: 0; margin: 0">PARTIDA   </td>
					<td class="td1 fwhite f12" style= "padding: 0; margin: 0">CANTIDAD  </td>
					<td class="td1 fwhite f12" style= "padding: 0; margin: 0">C&nbsp;&nbsp;&nbsp;&nbsp;O&nbsp;&nbsp;&nbsp;&nbsp;N&nbsp;&nbsp;&nbsp;&nbsp;C&nbsp;&nbsp;&nbsp;&nbsp;E&nbsp;&nbsp;&nbsp;&nbsp;P&nbsp;&nbsp;&nbsp;&nbsp;T&nbsp;&nbsp;&nbsp;&nbsp;O</td>
					<td class="td1 fwhite f12" style= "padding: 0; margin: 0">P.UNITARIO</td>
					<td class="td1 fwhite f12" style= "padding: 0; margin: 0">IMPORTE   </td>
				</tr>
				<?php
					for($i = 1; $i <= 10; $i++)
					{	
						$concepto = $modelCon[$i-1];
						
						$cantidad = $concepto['con_cantidad'];
						$descripcion = $concepto['con_descripcion'];
						$precioU = "";
						$importe = "";

						if(isset($concepto))
						{
							$precioU = '$' . number_format($concepto['con_precioUnitario'], 2, '.', ',');
							$importe = '$' . number_format($concepto->con_cantidad * $concepto->con_precioUnitario, 2, '.', ',');
						}

						$str = <<<STR
						<tr>
							<td class= "cell"><b>$i</b></td>
							<td class= "cell">$cantidad</td>
							<td class= "cell">$descripcion</td>
							<td class= "cell">$precioU</td>
							<td class= "cell">$importe</td>
						</tr>
STR;
						echo $str;
					}
				?>
			</table>
		</div>
		<br>
		<br>
		<div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="firmas">FIRMA ENCARGADO</div>
			<div class="firmas">FIRMA MECÁNICO </div>
			<div class="firmas">FIRMA ALMACÉN  </div>
			<div class="firmas">FIRMA GERENTE  </div>
			
		</div>
	</div>