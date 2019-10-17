<div >

	<div style="width: 80mm; float: left;">
	
		<div style="float:left;  width: 80mm;"><img style="float:left;width: 80mm;" src="var:polo"></div>

		<span class="fblue">No es con espada ni con ejército, sino el poder del espíritu santo</span>

		<div class="fblue bold" style="float:left;">
			CALLE NiÑOS HEROES No. 165 COL. ATASTA	<br>
			C.P. 86100 VILLAHERMOSA, CENTRO, TABASCO
		</div>
	</div>	

	<div class="border">
		<div style="font-size: 12px;">
			<b>POLO TRANSMISIONES AUTOMÁTICAS S. DE R.L. DE C.V.</b>
		</div>
		<span class="fblue">R.F.C. PTA0907035Q1</span><br><br>
		<div class="rounded">
			<table width="110mm" >
			  <tr>
			    <td class="fwhite" style="border-right: 1.5px solid #3369b7;border-bottom: 1.5px solid #3369b7;">FECHA</td>
			    <td class="fwhite" style="border-bottom: 1.5px solid #3369b7;">RECIBO</td>
			  </tr>
			  <tr>
			  	<td style="font-size:2em;border-right: 1.5px solid #3369b7"> <?= date('d-m-Y') ?></td>
			  	<td style="color:red; font-size:2em;">
			  		N&#186; <?= strtoupper(str_replace("-", "",  $recibo->rec_folio)) ?>
			  	</td>
			  </tr> 
			</table>
		</div>
	</div>	
</div>
<div class="fullheight rounded">
		<div style="width: 23mm;" class="div-label">RECIBÍ DE:</div>
		<div style="width: 145mm;" class="underline">&#8203;<?= strtoupper($recibo->rec_nomcliente) ?></div>
	<br>
		<div style="width: 37mm;" class="div-label">LA CANTIDAD DE:</div>
		<div style="width: 131mm;" class="underline">&#8203;$<?= number_format($recibo->rec_cantidad,2, '.', ',') ?> MXN</div>
	<br>
	<div style="height: 40mm;text-align: justify;">
		<span class="div-label">POR CONCEPTO DE:</span>
		<span class="underline">&#8203;<?= str_replace(" ", "&nbsp;", strtoupper(str_pad($recibo->rec_concepto,81))) ?></span>
	</div>
	<div class="firmas">
		<div class="div-label">RECIBIÓ</div>
		<div class="center-line">&#8203;<?= strtoupper($recibo->rec_nomresponsable) ?></div>
		<div class="div-label">NOMBRE Y FIRMA</div>
	</div>
	<br>
</div>