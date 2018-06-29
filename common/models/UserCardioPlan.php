<?php
namespace common\models;

use common\models\CardioPlan;
use common\models\UserCardioWeek;
use yii\db\ActiveRecord;

/**
 * UserCardioPlan model
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $plan_id
 * @property string $plan_name
 * @property string $description
 * @property string $details
 * @property string $recheck
 */
class UserCardioPlan extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_cardio_plan}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'plan_name',
                    'description',
                    'details',
                    'recheck'
                ],
                'trim'
            ],
            [['user_id', 'plan_id'], 'required']
        ];
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
    
    public function getWeeks()
    {
        return $this->hasMany(UserCardioWeek::className(), ['plan_id' => 'id']);
    }
    
    public function getPlan()
    {
        return $this->hasOne(CardioPlan::className(), ['id' => 'plan_id']);
    }
}