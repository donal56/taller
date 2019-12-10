<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenCotizacion;

/**
 * VenCotizacionSearch represents the model behind the search form of `app\models\VenCotizacion`.
 */
class VenCotizacionSearch extends VenCotizacion
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cot_id', 'cot_nonuevoscontratos', 'cot_nocont', 'cot_fkuser'], 'integer'],
            [['cot_folio', 'cot_fecha', 'cot_nombre', 'cot_telefono', 'cot_atencion', 'cot_modelo', 'cot_tipo', 'cot_marca', 'cot_placas', 'cot_color', 'cot_mecanico', 'cot_psalida', 'cot_fechasalida', 'cot_solocotizacion', 'cot_observaciones', 'cot_acepto', 'cot_elaboro'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = VenCotizacion::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'cot_id' => $this->cot_id,
            'cot_fecha' => $this->cot_fecha,
            'cot_nonuevoscontratos' => $this->cot_nonuevoscontratos,
            'cot_nocont' => $this->cot_nocont,
            'cot_fechasalida' => $this->cot_fechasalida,
            'cot_fkuser' => $this->cot_fkuser,
        ]);

        $query->andFilterWhere(['like', 'cot_folio', $this->cot_folio])
            ->andFilterWhere(['like', 'cot_nombre', $this->cot_nombre])
            ->andFilterWhere(['like', 'cot_telefono', $this->cot_telefono])
            ->andFilterWhere(['like', 'cot_atencion', $this->cot_atencion])
            ->andFilterWhere(['like', 'cot_modelo', $this->cot_modelo])
            ->andFilterWhere(['like', 'cot_tipo', $this->cot_tipo])
            ->andFilterWhere(['like', 'cot_marca', $this->cot_marca])
            ->andFilterWhere(['like', 'cot_placas', $this->cot_placas])
            ->andFilterWhere(['like', 'cot_color', $this->cot_color])
            ->andFilterWhere(['like', 'cot_mecanico', $this->cot_mecanico])
            ->andFilterWhere(['like', 'cot_psalida', $this->cot_psalida])
            ->andFilterWhere(['like', 'cot_solocotizacion', $this->cot_solocotizacion])
            ->andFilterWhere(['like', 'cot_observaciones', $this->cot_observaciones])
            ->andFilterWhere(['like', 'cot_acepto', $this->cot_acepto])
            ->andFilterWhere(['like', 'cot_elaboro', $this->cot_elaboro]);

        return $dataProvider;
    }
}
