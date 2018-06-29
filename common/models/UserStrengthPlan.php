<?php
namespace common\models;

use common\models\StrengthPlan;
use common\models\UserStrengthWeek;
use yii\db\ActiveRecord;

/**
 * UserStrengthPlan model
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $plan_id
 * @property string $plan_name
 * @property string $category
 * @property string $description
 * @property string $details
 * @property string $recheck
 */
class UserStrengthPlan extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_strength_plan}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'user_id',
                    'plan_id',
                    'plan_name',
                    'category',
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
        return $this->hasMany(UserStrengthWeek::className(), ['plan_id' => 'id']);
    }
    
    public function getPlan()
    {
        return $this->hasOne(StrengthPlan::className(), ['id' => 'plan_id']);
    }
}