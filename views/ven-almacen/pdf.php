<?php
$elab='';
$user = $model->alm_fkuser;
if (isset($user)) 
{
	if ($user==1) 
	{
	    $elab='V-1';
	}
	if ($user==5)
	{
	    $elab='V-2';
	}else
	{
	    $elab='V-3';
	}
}
?>
<html>
	<div style="position: absolute;width: 9mm;right: 15px;top:15px; color: rgb(100,100,100);"><?=$elab?></div>
	<div style= "position: absolute; width: 15mm; top: 18mm; right: 100mm;"><img src="var:polo0"></div>
	<div style= "position: absolute; width: 50mm; font-size:12px; font-weight: bold; top: 17mm; right: 165px;">TEL. 993 3 54 86 83</div>
	<div style= "position: absolute; width: 50mm; font-size:12px; font-weight: bold; top: 21mm; right: 150px;">     993 3 54 02 47</div>
	<div style= "position: absolute; width: 50mm; font-size:12px; font-weight: bold; top: 25mm; right: 158px;">
		<img src="var:whats" style="vertical-align: middle;width:12px;"> 993 3 86 74 17<br>
	</div>
	<div style= "position: absolute; margin-left: 2mm; width: 42mm; font-size:10px;font-style: italic; text-align: justify; top: 30mm; right: 198px;">"No es con espada ni con ejército, sino con el poder del espíritu santo"</div>
	
	<div style= "position: absolute; width: 15mm; top: 153mm; right: 100mm;"><img src="var:polo0"></div>
	<div style= "position: absolute; width: 50mm; font-size:12px; font-weight: bold; top: 152mm; right: 165px;">TEL. 993 3 54 86 83</div>
	<div style= "position: absolute; width: 50mm; font-size:12px; font-weight: bold; top: 156mm; right: 150px;">     993 3 54 02 47</div>
	<div style= "position: absolute; width: 50mm; font-size:12px; font-weight: bold; top: 160mm; right: 158px;">
		<img src="var:whats" style="vertical-align: middle;width:12px;"> 993 3 86 74 17<br>
	</div>
	<div style= "position: absolute; margin-left: 2mm; width: 42mm; font-size:10px;font-style: italic; text-align: justify; top: 165mm; right: 198px;">"No es con espada ni con ejército, sino con el poder del espíritu santo"</div>
	
	<div class="borde">
		<div style="width: 125mm; float: left;">
			<div style="float:left;width: 70mm;"><img src="var:polo"></div>
		</div>
		
		<div class="rounded">
			<table cellspacing="0" width="50mm">
			  <tr>
			    <td class="fwhite f16" style= 'border: 0' colspan="3">VALE DE ALMACÉN</td>
			  </tr>
			  <tr>
			  	<td style="color:red; font-size:3em;height: 22mm; text-align: center; vertical-align: middle" colspan="3" >
			  		<?= mb_strtoupper('Nº ' . explode("-", $model->alm_folio)[1]) ?> 
			  	</td>
			  </tr>
			  <tr>
			    <td class="fwhite  f16" colspan="3">FECHA</td>
			  </tr>
			  <tr>
			    <td style="border-bottom: 0px; vertical-align: middle; height: 8mm" class="fblue center bold"> DÍA </td>
			    <td style="border-bottom: 0px; vertical-align: middle;" class="fblue center bold"> MES </td>
			    <td style="border-bottom: 0px; vertical-align: middle;" class="fblue center bold"> AÑO </td>
			  </tr>
			  <tr>
			    <td style="height: 17.79mm; border-top: 0px; text-align: center; vertical-align: middle; font-size: 1.5em"><?= explode('-',$model->alm_fecha)[2] ?></td>
			    <td style="height: 17.79mm; border-top: 0px; text-align: center; vertical-align: middle; font-size: 1.5em"><?= explode('-',$model->alm_fecha)[1] ?></td>
			    <td style="height: 17.79mm; border-top: 0px; text-align: center; vertical-align: middle; font-size: 1.5em"><?= explode('-',$model->alm_fecha)[0] ?></td>
			  </tr>
			</table>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
	<hr>
	<div style="width: 79%; height: 20px; float: center; margin-left: 1mm">
		<div style="width: 15mm; padding: 0; margin: 0" class="div-label">No. PEDIDO:</div>
		<div style="width: 12mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_noPedido) ?></div>
		<div style="width: 14mm;" class="div-label">VEHÍCULO:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_vehiculo) ?></div>
		<div style="width: 13mm;" class="div-label">MODELO:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_modelo) ?></div>
		<div style="width: 16mm;" class="div-label">MECÁNICO:</div>
		<div style="width: 27mm;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_mecanico) ?></div>
	</div>
	<div style="width: 79%; height: 30px; float: center; margin-left: 1mm">
		<div style="width: 9mm;" class="div-label">PLACA:</div>
		<div style="width: 18mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_placa) ?></div>
		<div style="width: 10mm;" class="div-label">COLOR:</div>
		<div style="width: 22mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_color) ?></div>
		<div style="width: 12mm;" class="div-label">TRABAJO:</div>
		<div style="width: 19mm; padding-left: 9px;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_trabajo) ?></div>
		<div style="width: 14mm;" class="div-label">GARANTÍA:</div>
		<div style="width: 29mm;" class="div-underline">&#8203;<?= mb_strtoupper($model->alm_garantia) ?></div>
	</div>
		<div class="fullheight">
			<table class="rounded2" style="border: 0px; border-collapse: collapse;" width="100%">
				<tr style="">
					<td class="td1 fwhite f12 cell" style= "padding: 0; margin: 0" width="10%">PARTIDA   </td>
					<td class="td1 fwhite f12 cell" style= "padding: 0; margin: 0" width="15%">CANTIDAD  </td>
					<td class="td1 fwhite f12 cell" style= "padding: 0; margin: 0" width="45%">C&nbsp;&nbsp;&nbsp;&nbsp;O&nbsp;&nbsp;&nbsp;&nbsp;N&nbsp;&nbsp;&nbsp;&nbsp;C&nbsp;&nbsp;&nbsp;&nbsp;E&nbsp;&nbsp;&nbsp;&nbsp;P&nbsp;&nbsp;&nbsp;&nbsp;T&nbsp;&nbsp;&nbsp;&nbsp;O</td>
					<td class="td1 fwhite f12 cell" style= "padding: 0; margin: 0" width="15%">P.UNITARIO</td>
					<td class="td1 fwhite f12 cell" style= "padding: 0; margin: 0" width="15%">IMPORTE   </td>
				</tr>
				<?php
					for($i = 1; $i <= 10; $i++)
					{	

						$concepto = isset($modelCon[$i-1]) ? $modelCon[$i-1] : null ;
						
						$cantidad = $concepto['con_cantidad'];
						$descripcion = '&nbsp;' . mb_strtoupper($concepto['con_descripcion']);
						$precioU = "";
						$importe = "";

						if(isset($concepto))
						{
							$precioU = '$' . number_format($concepto['con_precioUnitario'], 2, '.', ',') . ' MXN';
							$importe = '$' . number_format($concepto->con_cantidad * $concepto->con_precioUnitario, 2, '.', ',') . ' MXN';
						}

						$str = <<<STR
						<tr>
							<td class= "cell"><b>$i</b></td>
							<td class= "cell">$cantidad</td>
							<td class= "cell" align= "left">$descripcion</td>
							<td class= "cell">$precioU</td>
							<td class= "cell">$importe</td>
						</tr>
STR;
						echo $str;
					}
				?>
			</table>
		</div>

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
</html>