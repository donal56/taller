<body>
	<div>
		<div style="width: 125mm; float: left;">
			<div style="margin-bottom: 4px;">
				<div class="fblue div-underline" style="text-align: center;font-size:6mm">
					<b>POLO TRANSMISIONES AUTOMÁTICAS</b>
				</div>
				<span class="fblue">No es con espada ni con ejército, sino el poder del espíritu santo</span>
			</div>

			<div style="float:left;  width: 70mm;"><img src="var:polo"></div>
			<div class="fblue" style="float:right; text-align:center;width: 55mm;">
				<b>Niños Heroes No. 165 Col. Atasta,
					<br>Villahermosa, Centro, Tabasco
					<br>Tels. 354 02 47, 354 86 83 
					<br>
					<img src="var:facebook" style="vertical-align: middle;width:18px;"> 
					polotransmisionesautomaticas<br>
					<img src="var:whats" style="vertical-align: middle;width:18px;"> 
					9933 86 74 17<br>
					
				</b>
	
				<div class="fblue" style="float:right; text-align:center;width: 72mm;"><b>E-mail: <br>polotransmisionesautomaticas@hotmail.com<b>
				<!--<span style="font-size:12px;"><b>E-mail: polotransmisionesautomaticas@hotmail.com<b>
				</span>-->
				</div>
			</div>
		</div>	

		<div class="rounded" style="width: 50mm;border:0px;">
			<table cellpadding="3" cellspacing="0" width="50mm">
			  <tr>
			    <td class="fwhite" colspan="3">PRESUPUESTO</td>
			  </tr>
			  <tr>
			  	<td style="color:red; font-size:2em;" colspan="3" >
			  		<?= mb_strtoupper('Nº ' . explode("-", $model->ven_folio)[1]) ?> 
			  	</td>
			  </tr>
			  <tr>
			    <td class="fwhite" colspan="3">FECHA</td>
			  </tr>
			  <tr>
			    <td style="border-bottom: 0px;" class="fblue"> DÍA </td>
			    <td style="border-bottom: 0px;" class="fblue"> MES </td>
			    <td style="border-bottom: 0px;" class="fblue"> AÑO </td>
			  </tr>
			  <tr>
			    <td style="border-top: 0px; "><?= explode('-',$model->ven_fecha)[2] ?></td>
			    <td style="border-top: 0px;"><?= explode('-',$model->ven_fecha)[1] ?></td>
			    <td style="border-top: 0px;"><?= explode('-',$model->ven_fecha)[0] ?></td>
			  </tr>
			  <tr>
			  	<td style="border:0mm;"></td>
			  </tr>
			</table>
			<img src="var:pez" style="width: 26mm;">
		</div>

	</div>
<br>
	<div style="width: 18mm;" class="div-label">Nombre:</div>
	<div style="width: 159mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->ven_fullname) ?></div>
	<br>
	<div style="width: 20mm;" class="div-label">Domicilio:</div>
	<div style="width: 157mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->ven_domicilio) ?></div>
	<br>
	<div style="width: 16mm;" class="div-label">Ciudad:</div>
	<div style="width: 71mm; padding-left: 9px;" class="div-underline">&#8203;<?= strtoupper($model->ven_ciudad) ?></div>
	<div style="width: 12mm;" class="div-label">RFC:</div>
	<div style="width: 78mm;" class="div-underline">&#8203;<?= strtoupper($model->ven_rfc) ?></div>
	<br>

</body>
