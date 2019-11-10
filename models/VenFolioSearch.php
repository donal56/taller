<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\VenFolio;

/**
 * VenFolioSearch represents the model behind the search form about `app\models\VenFolio`.
 */
class VenFolioSearch extends VenFolio
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fol_id'], 'integer'],
            [['fol_serie', 'fol_folio'], 'safe'],
            [['fol_descripcion'],'string'],
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
        $query = VenFolio::find();

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
            'fol_id' => $this->fol_id,
        ]);

        $query->andFilterWhere(['like', 'fol_serie', $this->fol_serie])
            ->andFilterWhere(['like', 'fol_folio', $this->fol_folio])
            ->andFilterWhere(['like','fol_descripcion',$this->fol_descripcion]);

        return $dataProvider;
    }
}
