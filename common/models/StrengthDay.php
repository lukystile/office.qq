<?php
namespace common\models;

use common\models\StrengthWeek;
use common\models\StrengthExercise;
use yii\db\ActiveRecord;

/**
 * StrengthDay model
 *
 * @property integer $id
 * @property integer $week_id
 * @property string $description
 * @property string $details
 * @property string $recheck
 */
class StrengthDay extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%strength_day}}';
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
                ['training_tips'], 'trim'
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
        return $this->hasOne(StrengthWeek::className(), ['id' => 'week_id']);
    }
    
    public function getExercises()
    {
        return $this->hasMany(StrengthExercise::className(), ['day_id' => 'id'])->orderBy(['order' => 'ASC']);
    }
    
    public static function deleteDays( $ids = [] ) {
        if( !empty($ids) ) {
            \Yii::$app
                ->db
                ->createCommand()
                ->delete('{{%strength_day}}', ['id' => $ids])
                ->execute();
        }
    }
}