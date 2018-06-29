<?php
namespace common\models;

use common\models\UserStrengthWeek;
use common\models\UserStrengthExercise;
use yii\db\ActiveRecord;

/**
 * UserStrengthDay model
 *
 * @property integer $id
 * @property integer $week_id
 * @property string $training_tips
 */
class UserStrengthDay extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_strength_day}}';
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
        return $this->hasOne(UserStrengthWeek::className(), ['id' => 'week_id']);
    }
    
    public function getExercises()
    {
        return $this->hasMany(UserStrengthExercise::className(), ['day_id' => 'id']);
    }
    
    public static function deleteDays( $ids = [] ) {
        if( !empty($ids) ) {
            \Yii::$app
                ->db
                ->createCommand()
                ->delete('{{%user_strength_day}}', ['id' => $ids])
                ->execute();
        }
    }
}