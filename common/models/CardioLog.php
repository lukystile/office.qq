<?php
namespace common\models;

use common\models\User;
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
class CardioLog extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cardio_log}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'user_id',
                    'date',
                    'starting_speed',
                    'speed_increase',
                    'distance_interval',
                    'incline',
                    'max_heart_rate',
                    'max_speed',
                    'max_estimated_vo2',
                    'max_distance',
                    'anaerobic_heart_rate',
                    'anaerobic_speed',
                    'anaerobic_estimated_vo2',
                    'aerobic_heart_rate',
                    'aerobic_speed',
                    'recovery',
                    'reason'
                ],
                'trim'
            ],
            [['user_id'], 'filter', 'filter' => function($value) {
                return (int) $value;
            }]
        ];
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
    
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
    
    /**
     * @inheritDoc
     */
    public function beforeSave($insert) {
        $this->date = date('U', strtotime($this->date));
        return parent::beforeSave($insert);
    }
}