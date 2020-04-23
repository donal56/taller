<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenGarantia;

/**
 * VenGarantiaSearch represents the model behind the search form of `app\models\VenGarantia`.
 */
class VenGarantiaSearch extends VenGarantia
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['gar_id'], 'integer'],
            [['gar_fecha1', 'gar_fecha2', 'gar_fecha3', 'gar_observacion1', 'gar_observacion2', 'gar_observacion3'], 'safe'],
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
        $query = VenGarantia::find();

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
            'gar_id' => $this->gar_id,
            'gar_fecha1' => $this->gar_fecha1,
            'gar_fecha2' => $this->gar_fecha2,
            'gar_fecha3' => $this->gar_fecha3,
        ]);

        $query->andFilterWhere(['like', 'gar_observacion1', $this->gar_observacion1])
            ->andFilterWhere(['like', 'gar_observacion2', $this->gar_observacion2])
            ->andFilterWhere(['like', 'gar_observacion3', $this->gar_observacion3]);

        return $dataProvider;
    }
}
