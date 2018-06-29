<?php
namespace common\models;

use common\models\CardioWeek;
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
class CardioDay extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cardio_day}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                ['week_id'], 'integer'
            ],
            [
                [
                    'training_zone',
                    'suggested_bpm',
                    'suggested_time',
                    'training_tips'
                ],
                'trim'
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
    
    public function getWeek()
    {
        return $this->hasOne(CardioWeek::className(), ['id' => 'week_id']);
    }
    
    public static function deleteDays( $ids = [] ) {
        if( !empty($ids) ) {
            \Yii::$app
                ->db
                ->createCommand()
                ->delete('{{%cardio_day}}', ['id' => $ids])
                ->execute();
        }
    }
}