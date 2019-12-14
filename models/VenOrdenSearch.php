<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenOrden;

/**
 * VenOrdenSearch represents the model behind the search form of `app\models\VenOrden`.
 */
class VenOrdenSearch extends VenOrden
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ord_id', 'ord_kilometraje','ord_user'], 'integer'],
            [['ord_folio', 'ord_nombre', 'ord_direccion', 'ord_codigoPostal', 'ord_telefono', 'ord_ife', 'ord_modelo', 'ord_marca', 'ord_placa', 'ord_fechaIngreso', 'ord_fechaEntrega', 'ord_noSerie', 'ord_color', 'ord_vehiculoExterior', 'ord_vehiculoInterior', 'ord_tipo', 'ord_observaciones', 'ord_tanque', 'ord_accesoriosExterior', 'ord_accesoriosInterior', 'ord_problemas', 'ord_diagnostico'], 'safe'],
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
        $query = VenOrden::find()->orderBy(['ord_id'=>SORT_DESC]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);
        
        if ( !empty($params['VenOrdenSearch']['intervaloIngreso'])) 
        {
            $fechaIngreso = explode( ' a ', $params['VenOrdenSearch']['intervaloIngreso']);
            $query->andFilterWhere(['>=', 'ord_fechaIngreso', $fechaIngreso[0] ])
                ->andFilterWhere(['<=', 'ord_fechaIngreso', $fechaIngreso[1]]);  
        }

        if ( !empty($params['VenOrdenSearch']['intervaloEntrega'])) 
        {
            $fechaEntrega = explode( ' a ', $params['VenOrdenSearch']['intervaloEntrega']);
            $query->andFilterWhere(['>=', 'ord_fechaEntrega', $fechaEntrega[0]])
                ->andFilterWhere(['<=', 'ord_fechaEntrega', $fechaEntrega[1]]);
        }

        if( array_key_exists('usr', $params)){
            $query->andFilterWhere(['ord_user' => $params['usr']]);
        }
      

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'ord_id' => $this->ord_id,
            'ord_kilometraje' => $this->ord_kilometraje,
            'ord_user' => $this->ord_user,
        ]);

        if(\Yii::$app->user->isSuperAdmin && array_key_exists('c',$params))
        {
            $query->andFilterWhere(['ord_status' => 0]);
        }
        else
        {
            $query->andFilterWhere(['ord_status' => 1]);
        }

        $query->andFilterWhere(['like', 'ord_nombre', $this->ord_nombre])
            ->andFilterWhere(['like', 'REPLACE(ord_folio, "-", "")',  $this->ord_folio])
            ->andFilterWhere(['like', 'ord_direccion', $this->ord_direccion])
            ->andFilterWhere(['like', 'ord_codigoPostal', $this->ord_codigoPostal])
            ->andFilterWhere(['like', 'ord_telefono', $this->ord_telefono])
            ->andFilterWhere(['like', 'ord_ife', $this->ord_ife])
            ->andFilterWhere(['like', 'ord_tipo', $this->ord_tipo])
            ->andFilterWhere(['like', 'ord_modelo', $this->ord_modelo])
            ->andFilterWhere(['like', 'ord_marca', $this->ord_marca])
            ->andFilterWhere(['like', 'ord_placa', $this->ord_placa])
            ->andFilterWhere(['like', 'ord_noSerie', $this->ord_noSerie])
            ->andFilterWhere(['like', 'ord_color', $this->ord_color])
            ->andFilterWhere(['like', 'ord_vehiculoExterior', $this->ord_vehiculoExterior])
            ->andFilterWhere(['like', 'ord_vehiculoInterior', $this->ord_vehiculoInterior])
            ->andFilterWhere(['like', 'ord_observaciones', $this->ord_observaciones])
            ->andFilterWhere(['like', 'ord_tanque', $this->ord_tanque])
            ->andFilterWhere(['like', 'ord_accesoriosExterior', $this->ord_accesoriosExterior])
            ->andFilterWhere(['like', 'ord_accesoriosInterior', $this->ord_accesoriosInterior])
            ->andFilterWhere(['like', 'ord_problemas', $this->ord_problemas])
            ->andFilterWhere(['like', 'ord_user', $this->ord_user])
            ->andFilterWhere(['like', 'ord_diagnostico', $this->ord_diagnostico]);

        return $dataProvider;
    }
}
