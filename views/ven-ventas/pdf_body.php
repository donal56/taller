<?php 
use app\components\Utilidades; 
//$iva = 0.16;
$elab='';
$user = $model->ven_fkuser;
if (isset($user)) 
{
	if($user==1){
 		$elab='V-0';
	}
    elseif ($user==12) 
    {
        $elab='V-1';
    }
    elseif ($user==5)
    {
        $elab='V-2';
    }else
    {
        $elab='V-3';
    }
}	
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
				<td style="border:0px; text-align: center;" width="20mm" > {$productos->pro_unidad}</td>

				<td style="border:0px;padding-bottom: 5mm; padding-left: 10px;"> {$productos->pro_nombre}</td>

				<td style="border:0px; text-align: center;" width="30mm">
EOT;
			echo "$".str_replace(",", ",\u{200B}", $numformat($productos->pro_unidad * $productos->pro_precio) );
			echo "</td>
			</tr>";


		$model->total +=($productos->pro_unidad * $productos->pro_precio);
		}
		
	?>
	</table>
</div>

<div class="footer-top">
	<div style="float: left;text-align: left;width: 20mm;">
	<b>VEHÍCULO:</b><br>
	<b>COLOR:</b><br>
	<b>MODELO:</b><br>
	<b>PLACA:</b><br>
	<b>TÉCNICO</b><br>
	<b>O.I.:</b><br>
	</div>
	<div style="float: right; text-align: left;width:82mm;">
	<?= strtoupper($model->ven_vehiculo) ?><br>
	<?= strtoupper($model->ven_color) ?><br>
	<?= strtoupper($model->ven_modelo) ?><br>
	<?= strtoupper($model->ven_placa) ?><br>
	<?= strtoupper($model->ven_tecnico) ?><br>
	<?= strtoupper($model->ven_oi) ?><br>
	</div>
</div>
<div class="footer-botton">
	SE LE RECOMIENDA HACER EL LAVADO DEL SISTEMA DE LA DIRECCIÓN HIDRÁULICA POR LO MENOS UNA VEZ AL AÑO
	Y LA AFINACIÓN A LA TRANSMICIÓN AUTOMÁTICA CADA 6 MESES O CADA 20,000 KMS.<br><br>
	EL SERVICIO DE MANTENIMIENTONO CORRIGE LOS FALLOS PERO LOS PREVIENE.<br><br>
	EN PARTES ELÉCTRICAS NO HAY GARANTÍA.

	<h2 align="center">¡GRACIAS POR SU PREFERENCIA!</h2>
</div>

	<table class="rounded" style="position:absolute;bottom:0px; border: 0px;" width="100%" cellpadding="3" cellspacing="0">
			<tr>
				<td style="border-top: 0px;" class="fblue bold"><?= strtoupper($model->ven_garantia) ?></td>
				<td class="fwhite right">SUB-TOTAL</td>
				<td>$<?= $numformat($model->total)?></td>
			</tr>

			<tr>
				<td style="border-bottom: 0px;" class="fblue bold">CANTIDAD CON LETRA</td>
				<td colspan="2"></td>
				<!--<td class="fwhite right">I.V.A.</td>-->
			
			</tr>
			<tr>
				<td style="border-top: 0px;"><?= Utilidades::convertir($model->total) ?></td>
				<td class="fwhite right">TOTAL</td>
				<td>$<?= $numformat($model->total) ?></td>
			</tr>
	</table> 
	<div style="position: absolute;width: 9mm;right: 15px;top:15px; color: rgb(100,100,100);"><?=$elab?></div>
</body>
</html>