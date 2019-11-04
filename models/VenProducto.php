<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_producto".
 *
 * @property integer $pro_id
 * @property integer $pro_unidad
 * @property string $pro_nombre
 * @property string $pro_precio
 * @property integer $pro_fkventas
 *
 * @property VenVentas $proFkventas
 */
class VenProducto extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $temp = null;


    public static function tableName()
    {
        return 'ven_producto';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[ 'temp'] , 'safe' ],
            [[ 'pro_id','pro_unidad', 'pro_nombre', 'pro_precio'], 'required'],
            [['pro_unidad', 'pro_fkventas'], 'integer'],
            [['pro_precio'], 'number'],
            [['pro_nombre'], 'string', 'max' => 255],
            [['pro_fkventas'], 'exist', 'skipOnError' => true, 'targetClass' => VenVentas::className(), 'targetAttribute' => ['pro_fkventas' => 'ven_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'pro_id' => 'ID',
            'pro_unidad' => 'Unidad',
            'pro_nombre' => 'Nombre',
            'pro_precio' => 'Precio',
            'pro_fkventas' => 'ID de la venta',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProFkventas()
    {
        return $this->hasOne(VenVentas::className(), ['ven_id' => 'pro_fkventas']);
    }

    public function getVentas()
    {
        if (($model = VenVentas::findAll(['ven_id' => $this->pro_fkventas])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
