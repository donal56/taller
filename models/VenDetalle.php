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
            'det_id' => 'Det ID',
            'det_cantidad' => 'Det Cantidad',
            'det_partida' => 'Det Partida',
            'det_descripcion' => 'Det Descripcion',
            'det_unitario' => 'Det Unitario',
            'det_fkcotizacion' => 'Det Fkcotizacion',
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
