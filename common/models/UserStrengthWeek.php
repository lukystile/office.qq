<?php
namespace common\models;

use common\models\UserStrengthPlan;
use common\models\UserStrengthDay;
use yii\db\ActiveRecord;

/**
 * UserStrengthWeek model
 *
 * @property integer $id
 * @property string $plan_name
 * @property string $description
 * @property string $details
 * @property string $recheck
 */
class UserStrengthWeek extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_strength_week}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'plan_id'
                ],
                'integer'
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
    
    public function getPlan()
    {
        return $this->hasMany(UserStrengthPlan::className(), ['id' => 'plan_id']);
    }
    
    public function getDays()
    {
        return $this->hasMany(UserStrengthDay::className(), ['week_id' => 'id']);
    }
    
    public static function deleteWeeks( $ids = [] ) {
        if( !empty($ids) ) {
            \Yii::$app
                ->db
                ->createCommand()
                ->delete('{{%user_strength_week}}', ['id' => $ids])
                ->execute();
        }
    }
}