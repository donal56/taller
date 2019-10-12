<?php

namespace app\models;

use Yii;

class Roles extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'auth_assignment';
    }

    public function rules()
    {
        return [
            [['item_name', 'user_id', 'created_at'], 'required'],
            [['user_id', 'created_at'], 'integer'],
            [['item_name'], 'string', 'max' => 64],
        ];
    }
}