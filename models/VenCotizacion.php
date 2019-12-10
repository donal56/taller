<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_cotizacion".
 *
 * @property int $cot_id
 * @property string $cot_folio
 * @property string $cot_fecha
 * @property string $cot_nombre
 * @property int $cot_nonuevoscontratos
 * @property int $cot_nocont
 * @property string $cot_telefono
 * @property string $cot_atencion
 * @property string $cot_modelo
 * @property string $cot_tipo
 * @property string $cot_marca
 * @property string $cot_placas
 * @property string $cot_color
 * @property string $cot_mecanico
 * @property string $cot_psalida
 * @property string $cot_fechasalida
 * @property string $cot_solocotizacion
 * @property string $cot_observaciones
 * @property string $cot_acepto
 * @property string $cot_elaboro
 * @property int $cot_fkuser
 *
 * @property VenDetalle[] $venDetalles
 */
class VenCotizacion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ven_cotizacion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cot_folio'], 'required'],
            [['cot_nonuevoscontratos', 'cot_nocont', 'cot_fkuser'], 'integer'], 
            [['cot_fecha', 'cot_fechasalida'], 'safe'],
            [['cot_observaciones'], 'string'],
            [['cot_folio'], 'string', 'max' => 11],
            [['cot_nombre', 'cot_atencion'], 'string', 'max' => 100],
            [['cot_telefono', 'cot_modelo', 'cot_tipo', 'cot_marca', 'cot_placas', 'cot_color'], 'string', 'max' => 20],
            [['cot_mecanico', 'cot_psalida', 'cot_solocotizacion', 'cot_acepto', 'cot_elaboro'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'cot_id' => 'ID',
            'cot_folio' => 'Folio',
            'cot_fecha' => 'Fecha',
            'cot_nombre' => 'Nombre',
            'cot_nonuevoscontratos' => 'No. Contratos Nuevos',
            'cot_nocont' => 'No. Cont.',
            'cot_telefono' => 'Teléfono',
            'cot_atencion' => 'Atención',
            'cot_modelo' => 'Modelo',
            'cot_tipo' => 'Tipo',
            'cot_marca' => 'Marca',
            'cot_placas' => 'Placas',
            'cot_color' => 'Color',
            'cot_mecanico' => 'Mecánico',
            'cot_psalida' => 'P. Salida',
            'cot_fechasalida' => 'Fecha de Salida',
            'cot_solocotizacion' => 'Solo Cotización',
            'cot_observaciones' => 'Observaciones',
            'cot_acepto' => 'Aceptó',
            'cot_elaboro' => 'Elaboró',
            'cot_fkuser' => 'Elaborador',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVenDetalles()
    {
        return $this->hasMany(VenDetalle::className(), ['det_fkcotizacion' => 'cot_id']);
    }
}
