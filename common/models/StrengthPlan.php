<?php
namespace common\models;

use common\models\StrengthWeek;
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
class StrengthPlan extends ActiveRecord
{
    
    const CATEGORIES = [
        'Gain strength',
        'Shape muscles',
        'Tone muscles',
        'Muscles endurance'
    ];
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%strength_plan}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'plan_name',
                    'description',
                    'details',
                    'recheck'
                ],
                'trim'
            ],
            [['plan_name'], 'required'],
            ['category', 'default', 'value' => self::CATEGORIES[0]],
            ['category', 'in', 'range' => self::CATEGORIES],
        ];
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
    
    public function getWeeks()
    {
        return $this->hasMany(StrengthWeek::className(), ['plan_id' => 'id']);
    }
}