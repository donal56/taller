<?php 
use app\components\Utilidades;
?>
<div class="left col-sm-4"><img src="var:polo" style="width: 75mm;"></div>

<div class=" col-sm-4 right rounded text-right" style="border:0px;">
	<table cellpadding="3" cellspacing="0" width="100%">

	  <tr>
	    <td class="fwhite" colspan="3">FECHA</td>
	  </tr>
	  <tr>
	    <td style="border-bottom: 0px;"><b> DÍA </b></td>
	    <td style="border-bottom: 0px;"><b> MES </b></td>
	    <td style="border-bottom: 0px;"><b> AÑO </b></td>
	  </tr>
	  <tr>
	    <td style="border-top: 0px;"> <?= Utilidades::getDate('d') ?></td>
	    <td style="border-top: 0px;"> <?= Utilidades::getDate('m') ?></td>
	    <td style="border-top: 0px;"> <?= Utilidades::getDate('Y') ?></td>
	  </tr>
	  <tr>
	  	<td style="border:0mm;"></td>
	  </tr>
	</table>
</div>

<div class="right col-sm-4 text-center">
    <div><img src="var:pez" style="width: 30mm;"></div>
    <span class="px-10">No es con espada ni con ejército,</span>
    <br>
    <span class="px-10"> sino el poder del espíritu santo.</span> 
</div>


<div class="col-sm-12 title-header">REPORTE DE ÓRDENES DE SERVICIO</div>

<div class="title">Ordenes de la semana <?= Utilidades::getDate('W') ?></div>

<div>
	<table class="rounded" style="border: 0px;" width="100%" cellpadding="3" cellspacing="0">
		<tr>
			<td class="fwhite"><b>Usuario</b></td>
			<td class="fwhite"><b>Órdenes Atendidas</b></td>
		</tr>
	
	<?php
		foreach ($users as $user)
		{
			echo <<<EOT

			<tr>
				<td> {$user->username}</td>

				<td> {$user->countOrdenes(['WEEK(ord_fechaIngreso,1)' => Utilidades::getDate('W')])}</td>

			<tr>
EOT;

		}	
	?>
	</table>
</div>


<div class="title">Ordenes del mes <?= Utilidades::getDate('m') ?></div>

<div>
	<table class="rounded" style="border: 0px;" width="100%" cellpadding="3" cellspacing="0">
		<tr>
			<td class="fwhite"><b>Usuario</b></td>
			<td class="fwhite"><b>Órdenes Atendidas</b></td>
		</tr>
	
	<?php
		foreach ($users as $user)
		{
			echo <<<EOT

			<tr>
				<td> {$user->username}</td>

				<td> {$user->countOrdenes([ 'MONTH(ord_fechaIngreso)' =>  Utilidades::getDate('m')])}</td>

			<tr>
EOT;

		}	
	?>
	</table>
</div>