<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenVentas;

/**
 * VenVentasSearch represents the model behind the search form about `app\models\VenVentas`.
 */
class VenVentasSearch extends VenVentas
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ven_id'], 'integer'],
            [['ven_folio', 'ven_fecha', 'ven_nombre', 'ven_fullname', 'ven_domicilio', 'ven_ciudad', 'ven_rfc'], 'safe'],
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
        $query = VenVentas::find()->orderBy(['ven_id'=>SORT_DESC]);


        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);
       
        if (!empty($params['VenVentaSearch']['intervalo'])) 
        {
            $fecha = explode( ' a ', $params['VenVentaSearch']['intervalo']);
            $query->andFilterWhere(['>=', 'ven_fecha', $fecha[0]])
                ->andFilterWhere(['<=', 'ven_fecha', $fecha[1]]);
        }

       
        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'ven_id' => $this->ven_id,
            'ven_fecha' => $this->ven_fecha,
        ]);

        if(\Yii::$app->user->isSuperAdmin && array_key_exists('c',$params))
        {
            $query->andFilterWhere(['ven_status' => 0]);
        }
        else
        {
            $query->andFilterWhere(['ven_status' => 1]);
        }


        $query->andFilterWhere(['like', 'REPLACE(ven_folio, "-", "")',  $this->ven_folio])
            //->andFilterWhere(['like', 'ven_nombre', $this->ven_nombre])
            ->andFilterWhere([
            	'like',
            	'concat_ws(ven_nombre,ven_paterno,ven_materno)',
            	$this->ven_fullname,
            ])
            ->andFilterWhere(['like', 'ven_domicilio', $this->ven_domicilio])
            ->andFilterWhere(['like', 'ven_ciudad', $this->ven_ciudad])
            ->andFilterWhere(['like', 'ven_rfc', $this->ven_rfc]);

        $dataProvider->sort->attributes['ven_fullname'] = [
                            'asc' => ['ven_nombre' => SORT_ASC],
                            'desc' => ['ven_nombre' => SORT_DESC],
                            'default' => SORT_ASC
                        ];
        return $dataProvider;
    }
}
