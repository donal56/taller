<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ven_folio".
 *
 * @property integer $fol_id
 * @property string $fol_serie
 * @property string $fol_folio
 * @property string $fol_descripcion
 */
class VenFolio extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ven_folio';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fol_id'], 'integer'],
            [['fol_serie'], 'required'],
            [['fol_serie', 'fol_folio', 'fol_descripcion'], 'string', 'max' => 255],
            [['fol_serie'], 'filter', 'filter'=>'strtoupper'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'fol_id' => 'ID',
            'fol_serie' => 'Serie',
            'fol_folio' => 'Folio Anterior',
            'fol_descripcion' => 'Descripción'
        ];
    }

    public function aumentarFolio()
    {
        $this->fol_folio = strval($this->fol_folio + 1);
    }

    public function getFolio()
    {
        return $this->fol_serie . "-" . $this->fol_folio;
    }

}
