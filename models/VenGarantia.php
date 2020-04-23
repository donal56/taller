<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_garantia".
 *
 * @property int $gar_id
 * @property string $gar_fecha1
 * @property string $gar_fecha2
 * @property string $gar_fecha3
 * @property string $gar_observacion1
 * @property string $gar_observacion2
 * @property string $gar_observacion3
 * @property string $gar_acepto
 * @property string $gar_elaboro
 */
class VenGarantia extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ven_garantia';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['gar_id'],'integer'],
            [['gar_id'], 'integer'],
            [['gar_fecha1', 'gar_fecha2', 'gar_fecha3','gar_acepto','gar_elaboro'], 'safe'],
            [['gar_observacion1', 'gar_observacion2', 'gar_observacion3'], 'string', 'max' => 15],
            [['gar_id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'gar_id' => 'Id',
            'gar_fecha1' => 'Fecha 1',
            'gar_fecha2' => 'Fecha 2',
            'gar_fecha3' => 'Fecha 3',
            'gar_observacion1' => 'Observacion 1',
            'gar_observacion2' => 'Observacion 2',
            'gar_observacion3' => 'Observacion 3',
            'gar_acepto'       => 'Acepto',
            'gar_elaboro'      => 'Elaboro',
        ];
    }
}
