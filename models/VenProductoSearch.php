<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenProducto;

/**
 * VenProductoSearch represents the model behind the search form about `app\models\VenProducto`.
 */
class VenProductoSearch extends VenProducto
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pro_id', 'pro_unidad', 'pro_fkventas'], 'integer'],
            [['pro_nombre'], 'safe'],
            [['pro_precio'], 'number'],
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
        $query = VenProducto::find();

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
            'pro_id' => $this->pro_id,
            'pro_unidad' => $this->pro_unidad,
            'pro_precio' => $this->pro_precio,
            'pro_fkventas' => $this->pro_fkventas,
        ]);

        $query->andFilterWhere(['like', 'pro_nombre', $this->pro_nombre]);

        return $dataProvider;
    }
}
