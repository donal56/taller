<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenConcepto;

/**
 * VenConceptoSearch represents the model behind the search form about `app\models\VenConcepto`.
 */
class VenConceptoSearch extends VenConcepto
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['con_id', 'con_fkalm_id'], 'integer'],
            [['con_cantidad', 'con_precioUnitario'], 'number'],
            [['con_descripcion'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
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
        $query = VenConcepto::find();

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
            'con_id' => $this->con_id,
            'con_cantidad' => $this->con_cantidad,
            'con_precioUnitario' => $this->con_precioUnitario,
            'con_fkalm_id' => $this->con_fkalm_id,
        ]);

        $query->andFilterWhere(['like', 'con_descripcion', $this->con_descripcion]);

        return $dataProvider;
    }
}
