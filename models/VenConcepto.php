<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_concepto".
 *
 * @property integer $con_id
 * @property double $con_cantidad
 * @property string $con_descripcion
 * @property double $con_precioUnitario
 * @property integer $con_fkalm_id
 *
 * @property VenAlmacen $conFkalm
 */
class VenConcepto extends \yii\db\ActiveRecord
{
    public $temp = null;
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ven_concepto';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[ 'temp'] , 'safe' ],
            [['con_cantidad', 'con_descripcion', 'con_precioUnitario', 'con_fkalm_id'], 'required'],
            [['con_cantidad', 'con_precioUnitario'], 'number'],
            [['con_id','con_fkalm_id'], 'integer'],
            [['con_descripcion'], 'string', 'max' => 255],
            [['con_fkalm_id'], 'exist', 'skipOnError' => true, 'targetClass' => VenAlmacen::className(), 'targetAttribute' => ['con_fkalm_id' => 'alm_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'con_id' => 'Con ID',
            'con_cantidad' => 'Con Cantidad',
            'con_descripcion' => 'Con Descripcion',
            'con_precioUnitario' => 'Con Precio Unitario',
            'con_fkalm_id' => 'Con Fkalm ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getConFkalm()
    {
        return $this->hasOne(VenAlmacen::className(), ['alm_id' => 'con_fkalm_id']);
    }
}
