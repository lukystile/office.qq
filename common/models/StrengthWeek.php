<?php
namespace common\models;

use common\models\StrengthPlan;
use common\models\StrengthDay;
use yii\db\ActiveRecord;

/**
 * StrengthWeek model
 *
 * @property integer $id
 * @property integer $plan_id
 */
class StrengthWeek extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%strength_week}}';
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
        return $this->hasMany(StrengthPlan::className(), ['id' => 'plan_id']);
    }
    
    public function getDays()
    {
        return $this->hasMany(StrengthDay::className(), ['week_id' => 'id']);
    }
    
    public static function deleteWeeks( $ids = [] ) {
        if( !empty($ids) ) {
            \Yii::$app
                ->db
                ->createCommand()
                ->delete('{{%strength_week}}', ['id' => $ids])
                ->execute();
        }
    }
}