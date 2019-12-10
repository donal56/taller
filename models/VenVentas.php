<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_ventas".
 *
 * @property integer $ven_id
 * @property string $ven_folio
 * @property string $ven_fecha
 * @property string $ven_nombre
 * @property string $ven_domicilio
 * @property string $ven_ciudad
 * @property string $RFC
 *
 * @property VenProducto[] $venProductos
 */
class VenVentas extends \yii\db\ActiveRecord
{
    public $ven_fullname = "";
    public $total = 0;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ven_ventas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ven_fecha'], 'required'],
            [['ven_fecha'], 'safe'],
            [['ven_folio'], 'string', 'max' => 11],
            [['ven_nombre'], 'string', 'max' => 200],
            [['ven_nombre'], 'string', 'max' => 200],
            [['ven_paterno'], 'string', 'max' => 200],
            [['ven_materno'], 'string', 'max' => 200],
            [['ven_domicilio'], 'string', 'max' => 255],
            [['ven_ciudad'], 'string', 'max' => 100],
            [['ven_rfc'], 'string', 'max' => 14],
			[['ven_vehiculo'], 'string', 'max' => 20],
			[['ven_color'], 'string', 'max' => 20],
			[['ven_modelo'], 'string', 'max' => 20],
			[['ven_placa'], 'string', 'max' => 20],
			[['ven_tecnico'], 'string', 'max' => 20],
			[['ven_oi'], 'string', 'max' => 20],
			[['ven_garantia'], 'string', 'max' => 200],
            [['ven_fullname'], 'safe'],
            [['ven_fkuser'], 'number'],
        ];
		

    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ven_id' => 'ID',
            'ven_folio' => 'Folio',
            'ven_fecha' => 'Fecha',
            'ven_nombre' => 'Nombre',
            'ven_paterno' => 'Apellido Paterno',
            'ven_materno' => 'Apellido Materno',
            'ven_domicilio' => 'Domicilio',
            'ven_ciudad' => 'Ciudad',
            'ven_rfc' => 'RFC',
			'ven_vehiculo' => 'Vehiculo',
			'ven_color' => 'Color',
			'ven_modelo' => 'Modelo',
			'ven_placa' => 'Placa',
			'ven_tecnico' => 'Tecnico',
			'ven_oi' => 'O.I.',
			'ven_garantia' => 'Garantia',
            'ven_fullname' =>'Nombre',
            'ven_fkuser' => 'Elaboró',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVenProductos()
    {
        return $this->hasMany(VenProducto::className(), ['pro_fkventas' => 'ven_id']);
    }

    public function getProductos()
    {
        if (($model = VenProducto::findAll(['pro_fkventas' => $this->ven_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function afterFind() {
        parent::afterFind();
        $this->ven_fullname =
                            $this->ven_nombre ." ".
                            $this->ven_paterno." ".
                            $this->ven_materno;
                   
    }
}
