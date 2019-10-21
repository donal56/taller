<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_orden".
 *
 * @property int $ord_id
 * @property int $ord_folio
 * @property string $ord_nombre
 * @property string $ord_direccion
 * @property string $ord_codigoPostal
 * @property string $ord_telefono
 * @property string $ord_ife
 * @property string $ord_modelo
 * @property string $ord_marca
 * @property string $ord_placa
 * @property string $ord_fechaIngreso
 * @property string $ord_fechaEntrega
 * @property string $ord_noSerie
 * @property string $ord_color
 * @property int $ord_kilometraje
 * @property string $ord_vehiculoExterior
 * @property string $ord_vehiculoInterior
 * @property string $ord_observaciones
 * @property string $ord_tanque
 * @property string $ord_accesoriosExterior
 * @property string $ord_accesoriosInterior
 * @property string $ord_problemas
 * @property string $ord_diagnostico
 */
class VenOrden extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ven_orden';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ord_folio', 'ord_nombre', 'ord_fechaIngreso'], 'required'],
            [['ord_folio', 'ord_kilometraje'], 'integer'],
            [['ord_fechaIngreso', 'ord_fechaEntrega'], 'safe'],
            [['ord_vehiculoExterior', 'ord_vehiculoInterior', 'ord_observaciones', 'ord_tanque', 'ord_accesoriosExterior', 'ord_accesoriosInterior', 'ord_problemas', 'ord_diagnostico'], 'string'],
            [['ord_nombre', 'ord_direccion'], 'string', 'max' => 255],
            [['ord_codigoPostal'], 'string', 'max' => 11],
            [['ord_telefono', 'ord_ife', 'ord_placa', 'ord_noSerie', 'ord_color'], 'string', 'max' => 20],
            [['ord_modelo', 'ord_marca'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ord_id' => 'Ord ID',
            'ord_folio' => 'Ord Folio',
            'ord_nombre' => 'Ord Nombre',
            'ord_direccion' => 'Ord Direccion',
            'ord_codigoPostal' => 'Ord Codigo Postal',
            'ord_telefono' => 'Ord Telefono',
            'ord_ife' => 'Ord Ife',
            'ord_modelo' => 'Ord Modelo',
            'ord_marca' => 'Ord Marca',
            'ord_placa' => 'Ord Placa',
            'ord_fechaIngreso' => 'Ord Fecha Ingreso',
            'ord_fechaEntrega' => 'Ord Fecha Entrega',
            'ord_noSerie' => 'Ord No Serie',
            'ord_color' => 'Ord Color',
            'ord_kilometraje' => 'Ord Kilometraje',
            'ord_vehiculoExterior' => 'Ord Vehiculo Exterior',
            'ord_vehiculoInterior' => 'Ord Vehiculo Interior',
            'ord_observaciones' => 'Ord Observaciones',
            'ord_tanque' => 'Ord Tanque',
            'ord_accesoriosExterior' => 'Ord Accesorios Exterior',
            'ord_accesoriosInterior' => 'Ord Accesorios Interior',
            'ord_problemas' => 'Ord Problemas',
            'ord_diagnostico' => 'Ord Diagnostico',
        ];
    }
}
