<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_detalle".
 *
 * @property int $det_id
 * @property int $det_cantidad
 * @property string $det_partida
 * @property string $det_descripcion
 * @property string $det_unitario
 * @property int $det_fkcotizacion
 *
 * @property VenCotizacion $detFkcotizacion
 */
class VenDetalle extends \yii\db\ActiveRecord
{
    public $temp = null;
    
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ven_detalle';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [[ 'temp'] , 'safe' ],
            [['det_cantidad', 'det_fkcotizacion'], 'integer'],
            [['det_descripcion'], 'required'],
            [['det_descripcion'], 'string'],
            [['det_unitario'], 'number'],
            [['det_partida'], 'string', 'max' => 20],
            [['det_fkcotizacion'], 'exist', 'skipOnError' => true, 'targetClass' => VenCotizacion::className(), 'targetAttribute' => ['det_fkcotizacion' => 'cot_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'det_id' => 'ID',
            'det_cantidad' => 'Cantidad',
            'det_partida' => 'Partida',
            'det_descripcion' => 'Descripcion',
            'det_unitario' => 'Unitario',
            'det_fkcotizacion' => 'ID cotización',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDetFkcotizacion()
    {
        return $this->hasOne(VenCotizacion::className(), ['cot_id' => 'det_fkcotizacion']);
    }
}
