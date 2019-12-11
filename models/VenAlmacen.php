<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_almacen".
 *
 * @property integer $alm_id
 * @property string $alm_folio
 * @property string $alm_fecha
 * @property integer $alm_noPedido
 * @property string $alm_vehiculo
 * @property string $alm_modelo
 * @property string $alm_mecanico
 * @property string $alm_placa
 * @property string $alm_color
 * @property string $alm_trabajo
 * @property string $alm_garantia
 *
 * @property VenConcepto[] $venConceptos
 */
class VenAlmacen extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ven_almacen';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['alm_fecha'], 'required'],
            [['alm_fecha'], 'safe'],
            [['alm_noPedido','alm_fkuser'], 'integer'],
            [['alm_folio'], 'string', 'max' => 11],
            [['alm_vehiculo', 'alm_modelo', 'alm_mecanico', 'alm_trabajo', 'alm_garantia'], 'string', 'max' => 255],
            [['alm_placa'], 'string', 'max' => 20],
            [['alm_color'], 'string', 'max' => 80],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'alm_id' => 'ID',
            'alm_folio' => 'Folio',
            'alm_fecha' => 'Fecha de elaboración',
            'alm_noPedido' => 'Número de pedido',
            'alm_vehiculo' => 'Vehículo',
            'alm_modelo' => 'Modelo',
            'alm_mecanico' => 'Mecánico',
            'alm_placa' => 'Número de placa',
            'alm_color' => 'Color',
            'alm_trabajo' => 'Trabajo',
            'alm_garantia' => 'Garantia',
            'alm_fkuser' => 'Elaboró',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVenConceptos()
    {
        return $this->hasMany(VenConcepto::className(), ['con_fkalm_id' => 'alm_id']);
    }

    public function getSerie()
    {
        return explode("-", $this->alm_folio)[0];
    }


    public function getFolio()
    {
        return explode("-", $this->alm_folio)[1];
    }
}
