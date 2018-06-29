<?php
namespace common\models;

use common\models\User;
use yii\db\ActiveRecord;

/**
 * UserMeta model
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $date
 * @property string $body_weight
 * @property string $body_fat
 * @property string $lean_bodymass
 * @property string $blood_presure_systolic
 * @property string $blood_presure_diastolic
 * @property string $heart_rate
 */
class BiometricsLog extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%biometrics_log}}';
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
                    'body_weight',
                    'body_fat',
                    'lean_bodymass',
                    'blood_presure_systolic',
                    'blood_presure_diastolic',
                    'heart_rate'
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