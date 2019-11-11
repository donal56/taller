<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenRecibo;

/**
 * VenReciboSearch represents the model behind the search form about `app\models\VenRecibo`.
 */
class VenReciboSearch extends VenRecibo
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['rec_id'], 'integer'],
            [['rec_nomcliente', 'rec_concepto', 'rec_nomresponsable', 'rec_fecha', 'rec_folio'], 'safe'],
            [['rec_cantidad'], 'number'],
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
        $query = VenRecibo::find();
        
        if (!empty($params['VenReciboSearch']['intervalo'])) 
        {
            $fecha = explode( ' a ', $params['VenReciboSearch']['intervalo']);   
            $query->andFilterWhere(['>=', 'rec_fecha', $fecha[0] ])
                ->andFilterWhere(['<=', 'rec_fecha', $fecha[1]]);
        }   
  
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
            'rec_id' => $this->rec_id,
            'rec_cantidad' => $this->rec_cantidad,
            'rec_fecha' => $this->rec_fecha,
        ]);

        $query->andFilterWhere(['like', 'rec_nomcliente', $this->rec_nomcliente])
            ->andFilterWhere(['like', 'rec_concepto', $this->rec_concepto])
            ->andFilterWhere(['like', 'rec_nomresponsable', $this->rec_nomresponsable])   
            ->andFilterWhere(['like', 'REPLACE(rec_folio, "-", "")',  $this->rec_folio]);

       
        return $dataProvider;
    }
}
