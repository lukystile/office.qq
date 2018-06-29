<?php
namespace common\models;
use yii\db\ActiveRecord;

use common\models\NutritionPlan;

/**
 * UserMeta model
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $plan_id
 * @property string $plan_name
 * @property string $nutrition_goal
 * @property string $energy_intake
 * @property string $activity_level
 * @property string $body_type
 * @property string $psy_profile
 * @property string $dietary_profile
 * @property string $foods_list
 * @property string $scheduling_meals
 * @property string $week_menu
 * @property string $training_tips
 */
class UserNutritionPlan extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_nutrition_plan}}';
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
                    'energy_intake',
                    'activity_level',
                    'body_type',
                    'psy_profile',
                    'dietary_profile',
                    'foods_list',
                    'scheduling_meals',
                    'week_menu',
                    'training_tips'
                ],
                'trim'
            ],
            [
                [
                    'user_id',
                    'plan_id',
                    'nutrition_goal'
                ],
                'required'
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
    
    public function getOriginal()
    {
        return $this->hasOne(NutritionPlan::className(), ['id' => 'plan_id']);
    }
    
    public function getPlan()
    {
        return $this->hasOne(NutritionPlan::className(), ['id' => 'plan_id']);
    }
}