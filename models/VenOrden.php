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
    public $vehiculoExterior = ['Unidad de luces', 'Cuarto de luces', 'Antena', 'Espejo lateral', 'Cristales', 'Emblema', 'Llantas(4)', 'Tapon de ruedas(4)', 'Molduras completas', 'Tapón de gasolina', 'Carrocería sin golpes', 'Bocinas de claxón'];
    public $vehiculoInterior = ['Instalación de tablero', 'Calefacción', 'Limpiadores plumas', 'Radio tipo', 'Bocinas', 'Encendedor', 'Espejo retrovisor', 'Ceniceros', 'Botones interiores', 'Manijas interiores', 'Tapetes', 'Vestiduras', 'Cinturones'];
    public $accesoriosExterior = ['Gato', 'Maneral de gato', 'Llave de ruedas', 'Estuche de  herramientas', 'Triángulos de seguridad', 'Llantas de refacción', 'Extintor'];
    public $accesoriosInterior = ['Claxón', 'Tapón de aceite', 'Tapón de radiador', 'Varilla para aceite', 'Filtro de aire', 'Batería'];

    public $image = null;

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
            [['ord_kilometraje'], 'integer'],
            [['ord_fechaIngreso', 'ord_fechaEntrega', 'ord_vehiculoExterior', 'ord_vehiculoInterior', 'ord_accesoriosExterior', 'ord_accesoriosInterior', 'ord_folio'], 'safe'],
            [['ord_observaciones',  'ord_problemas', 'ord_diagnostico'], 'string'],
            [['ord_tanque'], 'number'],
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
            'ord_id' => 'ID',
            'ord_folio' => 'Número de folio',
            'ord_nombre' => 'Nombre Completo',
            'ord_direccion' => 'Dirección',
            'ord_codigoPostal' => 'Código Postal',
            'ord_telefono' => 'Teléfono',
            'ord_ife' => 'INE',
            'ord_modelo' => 'Modelo',
            'ord_marca' => 'Marca',
            'ord_placa' => 'Placa',
            'ord_fechaIngreso' => 'Fecha de ingreso',
            'ord_fechaEntrega' => 'Fecha entrega',
            'ord_noSerie' => 'Número de serie',
            'ord_color' => 'Color',
            'ord_kilometraje' => 'Kilometros recorridos',
            'ord_vehiculoExterior' => 'Vehiculo Exterior',
            'ord_vehiculoInterior' => 'Vehiculo Interior',
            'ord_observaciones' => 'Observaciones',
            'ord_tanque' => 'Tanque',
            'ord_accesoriosExterior' => 'Accesorios Exterior',
            'ord_accesoriosInterior' => 'Accesorios Interior',
            'ord_problemas' => 'Problemas',
            'ord_diagnostico' => 'Diagnóstico',
        ];
    }
}
