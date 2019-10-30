<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenAlmacen;

/**
 * VenAlmacenSearch represents the model behind the search form about `app\models\VenAlmacen`.
 */
class VenAlmacenSearch extends VenAlmacen
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['alm_id', 'alm_noPedido'], 'integer'],
            [['alm_folio', 'alm_fecha', 'alm_vehiculo', 'alm_modelo', 'alm_mecanico', 'alm_placa', 'alm_color', 'alm_trabajo', 'alm_garantia'], 'safe'],
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
        $query = VenAlmacen::find();

        if (isset($params['VenAlmacenSearch']['intervalo'])) {
            $fecha = explode( ' a ', $params['VenAlmacenSearch']['intervalo']);
            if (isset($fecha[1])) {
                $query->andFilterWhere(['>=', 'alm_fecha', $fecha[0] ])
                ->andFilterWhere(['<=', 'alm_fecha', $fecha[1]]);
            }
           
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
            'alm_id' => $this->alm_id,
            'alm_fecha' => $this->alm_fecha,
            'alm_noPedido' => $this->alm_noPedido,
        ]);

        $query->andFilterWhere(['like', 'alm_folio', $this->alm_folio])
            ->andFilterWhere(['like', 'alm_vehiculo', $this->alm_vehiculo])
            ->andFilterWhere(['like', 'alm_modelo', $this->alm_modelo])
            ->andFilterWhere(['like', 'alm_mecanico', $this->alm_mecanico])
            ->andFilterWhere(['like', 'alm_placa', $this->alm_placa])
            ->andFilterWhere(['like', 'alm_color', $this->alm_color])
            ->andFilterWhere(['like', 'alm_trabajo', $this->alm_trabajo])
            ->andFilterWhere(['like', 'alm_garantia', $this->alm_garantia]);

            
        return $dataProvider;
    }
}
