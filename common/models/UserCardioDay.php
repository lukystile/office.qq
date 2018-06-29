<?php
namespace common\models;

use common\models\UserCardioWeek;
use yii\db\ActiveRecord;

/**
 * UserCardioDay model
 *
 * @property integer $id
 * @property integer $week_id
 * @property string $training_zone
 * @property string $suggested_bpm
 * @property string $suggested_time
 * @property string $training_tips
 */
class UserCardioDay extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_cardio_day}}';
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
        return $this->hasOne(UserCardioWeek::className(), ['id' => 'week_id']);
    }
    
    public static function deleteDays( $ids = [] ) {
        if( !empty($ids) ) {
            \Yii::$app
                ->db
                ->createCommand()
                ->delete('{{%user_cardio_day}}', ['id' => $ids])
                ->execute();
        }
    }
}