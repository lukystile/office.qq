<?php
namespace common\models;
use yii\db\ActiveRecord;

/**
 * UserMeta model
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $staring_speed
 * @property string $speed_increase
 * @property string $distance_interval
 * @property string $incline
 * @property string $max_heart_rate
 * @property string $max_speed
 * @property string $max_estimated_vo2
 * @property string $max_distance
 * @property string $anaerobic_heart_rate
 * @property string $anaerobic_speed
 * @property string $recovery
 * @property string $reason
 */
class NutritionPlan extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%nutrition_plan}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'plan_name', 'body_type', 'psy_profile', 'dietary_profile',
                    'foods_list', 'scheduling_meals', 'week_menu', 'training_tips'
                ],
                'trim'
            ],
            [['plan_name'], 'required']
        ];
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
    
}