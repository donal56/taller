<?php $detalles=$model->venDetalles;?>
<html>
<div style="float:left;width: 75mm; padding-right: 15px;"><img src="var:polo"></div>
    <div class="fblue px-25 red" style="float: right; width: 190px;padding-top:30px;">Folio: <?=$model->cot_folio?></div>
<div style= "position: absolute; width: 50mm; font-size:12px; font-weight: bold; top: 265mm; left: 55px; color: #3369b7;">
        <img src="var:whats" style="width:12px;" class="px-10 fblue"> 993 3 86 74 17<br>
</div>

<div >
    <br>
    <div style="float: left;"><img src="var:pez" style="width: 25mm; margin-left: 20px;margin-right:25px;"></div>
    <span class="fblue px-9">No es con espada ni con ejército,</span>
    <br>
    <span class="fblue px-9"> sino el poder del espíritu santo.</span> 
</div>
<hr>

<div>
    <div style="text-align: center;" class="div-titulo">C&nbsp;O&nbsp;T&nbsp;I&nbsp;Z&nbsp;A&nbsp;C&nbsp;I&nbsp;Ó&nbsp;N</div>
    <div style="width: 20mm; float: right;" class="div-underline">&#8203;<?=$model->cot_fecha?></div>
    <div style="width: 12mm; float: right;" class="div-label">Fecha</div>
    <p>
    <div style="width: 20mm; float: right;" class="div-underline">&#8203;<?=$model->cot_nocont?></div>
    <div style="width: 16mm; float: right;" class="div-label">No.Cont.</div>
    <p>
    <div style="width: 15mm; " class="div-label">Nombre:</div>
    <div style="width: 105mm; padding-left: 9px;" class="div-underline">&#8203;<?=$model->cot_nombre?></div>

    <div style="width: 16mm; " class="div-label">Teléfono:</div>
    <div style="width: 44mm; padding-left: 9px;" class="div-underline">&#8203;<?=$model->cot_telefono?></div>

    <div style="width: 17mm; " class="div-label">Atención:</div>
    <div style="width: 165.6mm; padding-left: 9px;" class="div-underline">&#8203;<?=$model->cot_atencion?></div>

    <div style="width: 14mm;" class="div-label">Modelo:</div>
    <div style="width: 49mm;" class="div-underline">&#8203;<?=$model->cot_modelo?></div>
    <div style="width: 9mm;" class="div-label">Tipo:</div>
    <div style="width: 49mm;" class="div-underline">&#8203;<?=$model->cot_tipo?></div>
    <div style="width: 12mm;" class="div-label">Marca:</div>
    <div style="width: 50.2mm;" class="div-underline">&#8203;<?=$model->cot_marca?></div>

    <div style="width: 14mm;" class="div-label">Placas:</div>
    <div style="width: 49mm;" class="div-underline">&#8203;<?=$model->cot_placas?></div>
    <div style="width: 28mm;" class="div-label">Solo Cotización:</div>
    <div style="width: 30mm;" class="div-underline">&#8203;<?=$model->cot_solocotizacion?></div>
    <div style="width: 12mm;" class="div-label">Color:</div>
    <div style="width: 50.2mm;" class="div-underline">&#8203;<?=$model->cot_color?></div>

    <div style="width: 20mm;" class="div-label">N° P.Salida</div>
    <div style="width: 43mm;" class="div-underline">&#8203;<?=$model->cot_psalida?></div>
    <div style="width: 15mm;" class="div-label">F.Salida:</div>
    <div style="width: 43mm;" class="div-underline">&#8203;<?=$model->cot_fechasalida?></div>
    <div style="width: 33mm;" class="div-label">No.Nuevo Contrato:</div>
    <div style="width: 29mm;" class="div-underline">&#8203;<?=$model->cot_nonuevoscontratos?></div>

    <div style="width: 18mm; " class="div-label">Mecánico:</div>
    <div style="width: 164.6mm; padding-left: 9px;" class="div-underline">&#8203;<?=$model->cot_mecanico?></div>
</div>
<br>

<div class="fullheight border">
            <table class="rounded2" style="border: 0px; border-collapse: collapse;" width="100%">
                <tr style="">
                    <td class="td1 fwhite px-12 cell" style= "padding: 0; margin: 0" width="15%">CANTIDAD  </td>
                    <td class="td1 fwhite px-12 cell" style= "padding: 0; margin: 0" width="10%">PARTIDA   </td>
                    <td class="td1 fwhite px-12 cell" style= "padding: 0; margin: 0" width="45%">DESCRIPCIÓN</td>
                    <td class="td1 fwhite px-12 cell" style= "padding: 0; margin: 0" width="15%">P.UNITARIO</td>
                    <td class="td1 fwhite px-12 cell" style= "padding: 0; margin: 0" width="15%">TOTAL   </td>
                </tr>
            <?php
            $noDetalles=count($detalles);
            foreach ($detalles as $key => $value) 
            {
                $total=$value->det_cantidad*$value->det_unitario;
                $sub+=$total;
                $columns = <<<HTML
                        <tr>
                            <td class= "cell fblue">$value->det_cantidad</td>
                            <td class= "cell fblue">$value->det_partida</td>
                            <td class= "cell fblue">$value->det_descripcion</td>
                            <td class= "cell fblue">$$value->det_unitario</td>
                            <td class= "cell fblue">$$total</td>
                        </tr>
HTML;
                echo $columns;
            }
            $ext= 15-$noDetalles;
            if ($ext>0) 
            {
                for($i = 1; $i <= (15-$noDetalles); $i++)
                {
                    $str = <<<STR
                            <tr>
                                <td class= "cell"></td>
                                <td class= "cell"></td>
                                <td class= "cell"></td>
                                <td class= "cell"></td>
                                <td class= "cell"></td>
                            </tr>
STR;
                    echo $str;
                }
            }
            $iva= $sub*0.16;
            $tot=$sub+$iva;
            $ult = <<<HTML
            <tr>
                <td class= "cell2"></td>
                <td class= "cell2"></td>
                <td class= "cell2"></td>
                <td class= "td1 fwhite px-12 cell">SUB-TOTAL</td>
                <td class= "cell fblue">$$sub</td>
            </tr>
            <tr>
                <td class= "cell2"></td>
                <td class= "cell2"></td>
                <td class= "cell2"></td>
                <td class= "td1 fwhite px-12 cell">16% IVA</td>
                <td class= "cell fblue">$$iva</td>
            </tr>
            <tr>
                <td class= "cell2"></td>
                <td class= "cell2"></td>
                <td class= "cell2"></td>
                <td class= "td1 fwhite px-12 cell">TOTAL</td>
                <td class= "cell fblue">$$tot</td>
            </tr>
HTML;
            echo $ult;
            ?>
            </table>
</div>
<br>

    <div style="width: 25mm; " class="div-label">Observaciones:</div>
    <div style="width: 157.5mm; padding-left: 9px;" class="div-underline">&#8203;<?=$model->cot_observaciones?></div>

    <div style="width: 280mm; height: 20mm;">
            <div class="tfirmas">ACEPTÓ PRESUPUESTO</div>
            <div class="tfirmas">ELABORÓ PRESUPUESTO</div>    
            <div class="lineaFirmas">&#8203;<?=$model->cot_acepto?></div>
            <div class="lineaFirmas">&#8203;<?=$model->cot_elaboro?></div>
            <div class="firmas">NOMBRE Y FIRMA</div>
            <div class="firmas">VENTAS</div>
    </div>
    <div style="width: 20mm; float: left; text-align: left;" class="div-labelpie px-10">Telefonos 3-54-86-83 3-54-02-47</div>
    <div style="float:right;width: 25mm;"><img src="var:polo">
    <div style="width: 125mm; float: right; text-align: right;" class="div-labelpie px-10">www.polotransmisionesautomaticas.com.mx       polotransmisiones@hotmail.com   Av.Niños Héroes No.165 Col.Atasta C.P.86100 Villahermosa,Tabasco.</div>
</html>