<?php
namespace common\models;

use common\models\UserStrengthDay;
use common\models\Exercise;
use yii\db\ActiveRecord;

/**
 * UserStrengthExercise model
 *
 * @property integer $id
 * @property integer $day_id
 * @property integer $exercise_id
 * @property string $muscle_group
 * @property string $type
 * @property string $sets
 * @property string $reps
 * @property string $weight
 */
class UserStrengthExercise extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_strength_exercise}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                ['day_id', 'exercise_id', 'order'], 'integer'
            ],
            [
                [
                    'exercise_name',
                    'muscle_group', 'type',
                    'sets', 'reps', 'weight'
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
    
    public function getDay()
    {
        return $this->hasOne(UserStrengthDay::className(), ['id' => 'day_id']);
    }
    
    public function getExercise()
    {
        return $this->hasOne(Exercise::className(), ['id' => 'exercise_id']);
    }
    
    public static function deleteExercises( $ids = [] ) {
        if( !empty($ids) ) {
            \Yii::$app
                ->db
                ->createCommand()
                ->delete('{{%user_strength_exercise}}', ['id' => $ids])
                ->execute();
        }
    }
}