<?php
namespace common\models;

use common\models\User;
use yii\db\ActiveRecord;

/**
 * UserMeta model
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $date
 * @property string $leg_extension
 * @property string $leg_curls
 * @property string $incline_bench_press
 * @property string $lat_pulldown
 * @property string $seated_shoulder_press
 * @property string $triceps_pushdown
 * @property string $biceps_curl
 * @property string $leg_extension_rep
 * @property string $leg_curls_rep
 * @property string $incline_bench_press_rep
 * @property string $lat_pulldown_rep
 * @property string $seated_shoulder_press_rep
 * @property string $triceps_pushdown_rep
 * @property string $biceps_curl_rep
 */
class StrengthLog extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%strength_log}}';
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
                    'leg_extension',
                    'leg_curls',
                    'incline_bench_press',
                    'lat_pulldown',
                    'seated_shoulder_press',
                    'triceps_pushdown',
                    'biceps_curl',
                    'leg_extension_rep',
                    'leg_curls_rep',
                    'incline_bench_press_rep',
                    'lat_pulldown_rep',
                    'seated_shoulder_press_rep',
                    'triceps_pushdown_rep',
                    'biceps_curl_rep'
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
        $this->date = (int) date('U', strtotime($this->date));
        return parent::beforeSave($insert);
    }
}