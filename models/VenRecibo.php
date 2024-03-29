<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_recibo".
 *
 * @property integer $rec_id
 * @property string $rec_nomcliente
 * @property string $rec_cantidad
 * @property string $rec_concepto
 * @property string $rec_nomresponsable
 * @property string $rec_fecha
 * @property string $rec_folio
 */
class VenRecibo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ven_recibo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['rec_cantidad', 'rec_nomresponsable', 'rec_fecha', 'rec_folio'], 'required'],
            [['rec_cantidad','rec_fkuser'], 'number'],
            [['rec_fecha'], 'safe'],
            [['rec_nomcliente', 'rec_concepto', 'rec_nomresponsable'], 'string', 'max' => 200],
            [['rec_folio'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'rec_id' => 'ID',
            'rec_fecha' => 'Fecha',
            'rec_folio' => 'Folio',
            'rec_nomcliente' => 'Recibí de',
            'rec_cantidad' => 'Cantidad',
            'rec_concepto' => 'Concepto',
            'rec_nomresponsable' => 'Recibió',
            'rec_fkuser' => 'Elaboró',
        ];
    }
}
