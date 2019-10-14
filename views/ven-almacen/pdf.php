<!DOCTYPE html>
<html>
<body>
	<div class="borde">
		<div style="width: 125mm; float: left;">
			<div style="float:left;width: 70mm;"><img src="var:polo"></div>
			<div style="margin-left: 20mm; font-size:25px;font-weight: bold; ">TEL.354 86 83</div>
			<div style="width: 45mm; font-size:10px;font-style: italic; text-align: justify;">"No es con espada ni con ejército, sino el poder del espíritu santo"</div>
		</div>
		
		<div class="rounded">
			<table cellpadding="3" cellspacing="0" width="50mm">
			  <tr>
			    <td class="fwhite f14" colspan="3">VALE DE ALMACEN</td>
			  </tr>
			  <tr>
			  	<td style="color:red; font-size:2em;height: 50px; text-align: center" colspan="3" >
			  		N&#xba; <?= str_replace("-", "",  $model->alm_folio) ?> 
			  	</td>
			  </tr>
			  <tr>
			    <td class="fwhite  f14" colspan="3">FECHA</td>
			  </tr>
			  <tr>
			    <td style="border-bottom: 0px;height: 60px" class="fblue center bold"> DÍA </td>
			    <td style="border-bottom: 0px;" class="fblue center bold"> MES </td>
			    <td style="border-bottom: 0px;" class="fblue center bold"> AÑO </td>
			  </tr>
			  <tr>
			    <td style="border-top: 0px; text-align: center;"><div class="valign"><?= explode('-',$model->alm_fecha)[2] ?></div></td>
			    <td style="border-top: 0px; text-align: center;"><div class="valign"><?= explode('-',$model->alm_fecha)[1] ?></div></td>
			    <td style="border-top: 0px; text-align: center;"><div class="valign"><?= explode('-',$model->alm_fecha)[0] ?></div></td>
			  </tr>
			</table>
		</div>
	<div style="width: 80%;height: 20px; float: center;">
		<div style="width: 15mm;" class="div-label">No.Pedido:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_noPedido) ?></div>
		<div style="width: 14mm;" class="div-label">Vehiculo:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_vehiculo) ?></div>
		<div style="width: 13mm;" class="div-label">Modelo:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_modelo) ?></div>
		<div style="width: 16mm;" class="div-label">Mecanico:</div>
		<div style="width: 23mm;" class="div-underline">&#8203;<?= strtoupper($model->alm_mecanico) ?></div>
	</div>
	<div style="width: 80%;height: 30px; float: center;">
		<div style="width: 9mm;" class="div-label">Placa:</div>
		<div style="width: 24mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_placa) ?></div>
		<div style="width: 9mm;" class="div-label">Color:</div>
		<div style="width: 24mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_color) ?></div>
		<div style="width: 12mm;" class="div-label">Trabajo:</div>
		<div style="width: 19mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_trabajo) ?></div>
		<div style="width: 14mm;" class="div-label">Garantía:</div>
		<div style="width: 24mm;" class="div-underline">&#8203;<?= strtoupper($model->alm_garantia) ?></div>
	</div>
		<div class="fullheight">
			<table class="rounded2" style="border: 0px;" width="100%" >
				<tr>
					<td class="fwhite"><b>PARTIDA   </b></td>
					<td class="fwhite"><b>CANTIDAD  </b></td>
					<td class="fwhite"><b>CONCEPTO  </b></td>
					<td class="fwhite"><b>P.UNITARIO</b></td>
					<td class="fwhite"><b>IMPORTE   </b></td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="firmas">Firma Encargado</div>
			<div class="firmas">Firma Mecanico </div>
			<div class="firmas">Firma Almacen  </div>
			<div class="firmas">Firma Gerente  </div>
			
		</div>
	</div>
	<hr>
	<div class="borde">
		<div style="width: 125mm; float: left;">
			<div style="float:left;width: 70mm;"><img src="var:polo"></div>
			<div style="font-size:25px;font-weight: bold; ">TEL.354 86 83</div>
			<div style="font-size:10px;font-style: italic; text-align: justify"> "No es con espada ni con ejército, sino el poder del espíritu santo" </div>
		</div>
		
		<div class="rounded">
			<table cellpadding="3" cellspacing="0" width="50mm">
			  <tr>
			    <td class="fwhite f14" colspan="3">VALE DE ALMACEN</td>
			  </tr>
			  <tr>
			  	<td style="color:red; font-size:2em;height: 50px" colspan="3" >
			  		N&#xba; <?= str_replace("-", "",  $model->alm_folio) ?> 
			  	</td>
			  </tr>
			  <tr>
			    <td class="fwhite f14" colspan="3">FECHA</td>
			  </tr>
			  <tr>
			    <td style="border-bottom: 0px;height: 60px" class="fblue center bold"> DÍA </td>
			    <td style="border-bottom: 0px;" class="fblue center bold"> MES </td>
			    <td style="border-bottom: 0px;" class="fblue center bold"> AÑO </td>
			  </tr>
			  <tr>
			    <td style="border-top: 0px; "><?= explode('-',$model->alm_fecha)[1] ?></td>
			    <td style="border-top: 0px; "><?= explode('-',$model->alm_fecha)[2] ?></td>
			    <td style="border-top: 0px; "><?= explode('-',$model->alm_fecha)[0] ?></td>
			  </tr>
			</table>
		</div>
	<div style="width: 80%;height: 20px; float: center;">
		<div style="width: 15mm;" class="div-label">No.Pedido:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_noPedido) ?></div>
		<div style="width: 14mm;" class="div-label">Vehiculo:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_vehiculo) ?></div>
		<div style="width: 13mm;" class="div-label">Modelo:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_modelo) ?></div>
		<div style="width: 16mm;" class="div-label">Mecanico:</div>
		<div style="width: 23mm;" class="div-underline">&#8203;<?= strtoupper($model->alm_mecanico) ?></div>
	</div>
	<div style="width: 80%;height: 30px; float: center;">
		<div style="width: 9mm;" class="div-label">Placa:</div>
		<div style="width: 24mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_placa) ?></div>
		<div style="width: 9mm;" class="div-label">Color:</div>
		<div style="width: 24mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_color) ?></div>
		<div style="width: 12mm;" class="div-label">Trabajo:</div>
		<div style="width: 19mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->alm_trabajo) ?></div>
		<div style="width: 14mm;" class="div-label">Garantía:</div>
		<div style="width: 24mm;" class="div-underline">&#8203;<?= strtoupper($model->alm_garantia) ?></div>
	</div>
		<div class="fullheight">
			<table class="rounded2" style="border: 0px;" width="100%" >
				<tr>
					<td class="fwhite"><b>PARTIDA   </b></td>
					<td class="fwhite"><b>CANTIDAD  </b></td>
					<td class="fwhite"><b>CONCEPTO  </b></td>
					<td class="fwhite"><b>P.UNITARIO</b></td>
					<td class="fwhite"><b>IMPORTE   </b></td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="lineaFirmas">&#8203;</div>
			<div class="firmas">Firma Encargado</div>
			<div class="firmas">Firma Mecanico </div>
			<div class="firmas">Firma Almacen  </div>
			<div class="firmas">Firma Gerente  </div>
			
		</div>
	</div>
</body>
</html>