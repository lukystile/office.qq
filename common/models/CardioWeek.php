<?php
namespace common\models;

use common\models\CardioPlan;
use yii\db\ActiveRecord;

/**
 * CardioPlan model
 *
 * @property integer $id
 * @property string $plan_name
 * @property string $description
 * @property string $details
 * @property string $recheck
 */
class CardioWeek extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cardio_week}}';
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
        return $this->hasMany(CardioPlan::className(), ['id' => 'plan_id']);
    }
    
    public function getDays()
    {
        return $this->hasMany(CardioDay::className(), ['week_id' => 'id']);
    }
    
    public static function deleteWeeks( $ids = [] ) {
        if( !empty($ids) ) {
            \Yii::$app
                ->db
                ->createCommand()
                ->delete('{{%cardio_week}}', ['id' => $ids])
                ->execute();
        }
    }
}