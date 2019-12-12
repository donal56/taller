<?php 
$elab='';
$user = $recibo->rec_fkuser;
if (isset($user)) 
{
    if ($user==12) 
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
<div style="position: absolute; top: 13mm; right: 100mm; width: 11mm"><img src="var:donpolo"></div>
<div style="position: absolute; top: 155mm; right: 100mm; width: 11mm"><img src="var:donpolo"></div>
<div>
    <div style="width: 80mm; float: left;">

        <div style="float:left;  width: 80mm;"><img style="float:left;width: 80mm;" src="var:polo"></div>

        <span class="fblue">No es con espada ni con ejército, sino el poder del espíritu santo</span>

        <div class="fblue bold" style="float:left;">
            CALLE NIÑOS HEROES No. 165 COL. ATASTA <br>
            C.P. 86100 VILLAHERMOSA, CENTRO, TABASCO
        </div>
    </div>

    <div class="border">
        <div style="font-size: 13px;">
            <b>*POLO TRANSMISIONES AUTOMÁTICAS*</b>
        </div>
        <span class="fblue">TEL. 99 33 54 86 83 &nbsp;&nbsp; & &nbsp;&nbsp; 99 33 54 02 47</span><br>
        <img src="var:whats" style="vertical-align: middle;width:18px;"> 9933 86 74 17<br>
        <div class="rounded">
            <table width="110mm">
                <tr>
                    <td class="fwhite" style="border-right: 1.5px solid #3369b7;border-bottom: 1.5px solid #3369b7;">
                        FECHA</td>
                    <td class="fwhite" style="border-bottom: 1.5px solid #3369b7;">RECIBO</td>
                </tr>
                <tr>
                    <td style="font-size:2em;border-right: 1.5px solid #3369b7"> <?= date('d-m-Y') ?></td>
                    <td style="color:red; font-size:2em;">
                        <?= mb_strtoupper('Nº ' . explode("-", $recibo->rec_folio)[1]) ?>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="fullheight rounded">
    <div style="width: 23mm;" class="div-label">RECIBÍ DE:</div>
    <div style="width: 145mm;" class="underline">&#8203;<?= mb_strtoupper($recibo->rec_nomcliente) ?></div>
    <br>
    <div style="width: 37mm;" class="div-label">LA CANTIDAD DE:</div>
    <div style="width: 131mm;" class="underline">&#8203;$<?= number_format($recibo->rec_cantidad,2, '.', ',') ?> MXN
    </div>
    <br>
    <div style="height: 40mm;text-align: left">
        <span class="div-label">POR CONCEPTO DE:</span>
        <span class="underline">&#8203;<?= mb_strtoupper($recibo->rec_concepto) ?></span>
    </div>
    <div class="firmas">
        <div class="div-label">RECIBIÓ</div>
        <div class="center-line">&#8203;<?= mb_strtoupper($recibo->rec_nomresponsable) ?></div>
        <div class="div-label">NOMBRE Y FIRMA</div>
    </div>
    <br>
</div>

<div class="underline" style="position:absolute;top:80.39mm;left:61mm; width: 127.5mm;"></div>
<div class="underline" style="position:absolute;top:222.35mm;left:61mm; width: 127.5mm;"></div>
<div class="underline" style="position:absolute;top:85.65mm;left:21mm; width: 167.5mm;"></div>
<div class="underline" style="position:absolute;top:227.70mm;left:21mm; width: 167.5mm;"></div>
<div class="underline" style="position:absolute;top:90.95mm;left:21mm; width: 167.5mm;"></div>
<div class="underline" style="position:absolute;top:232.90mm;left:21mm; width: 167.5mm;"></div>

</html>