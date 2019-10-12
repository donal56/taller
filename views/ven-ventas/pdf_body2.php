<?php 
use app\components\Utilidades; 
$iva = 0.16;	
?>
<!DOCTYPE html>
<html>

<body>
		<div class="line" style="width: 19.30mm;"></div>
		<div class="fullheight line" style="left:35.1mm; width: 128.6mm;"></div>
		<div class="line" style="right: 15.3mm; width: 29.2mm;"></div>
<!-- bienes -->
<div class="fullheight">
	<table class="rounded" style="border: 0px;" width="100%" cellpadding="3" cellspacing="0">
		<tr>
			<td class="fwhite"><b>CANT.</b></td>
			<td class="fwhite"><b>CONCEPTO</b></td>
			<td class="fwhite"><b>TOTAL</b></td>
		</tr>
	
	<?php
		foreach ($model->getProductos() as $productos)
		{
			echo <<<EOT
			<tr>;
				<td style="border:0px;" width="20mm"> {$productos->pro_unidad}</td>

				<td style="border:0px;padding-bottom: 5mm;"> {$productos->pro_nombre}</td>

				<td style="border:0px;" width="30mm">
EOT;
			echo "$".str_replace(",", ",\u{200B}", $numformat($productos->pro_unidad * $productos->pro_precio) );
			echo "</td>
			</tr>";


		$model->total +=($productos->pro_unidad * $productos->pro_precio);
		}
		
	?>
	</table>
</div>
	<table class="rounded" style="position:absolute;bottom:0px; border: 0px;" width="100%" cellpadding="3" cellspacing="0">
			<tr>
				<td style="border-bottom: 0px;" class="fblue bold">CANTIDAD CON LETRA</td>
				<td class="fwhite right">SUB-TOTAL</td>
				<td>$<?= $numformat($model->total)?></td>
			</tr>

			<tr>
				<td style="border-top: 0px;"><?= Utilidades::convertir($model->total) ?></td>
				<!--<td class="fwhite right">I.V.A.</td>-->
				<td><?//= $numformat($model->total*$iva)?></td>
			</tr>
			<tr>
				<td style="border: 0px;"></td>
				<td class="fwhite right">TOTAL</td>
				<td><?= $numformat($model->total) ?></td>
			</tr>
	</table> 
</body>
</html>
<?php  ?>