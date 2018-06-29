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
class CardioPlan extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cardio_plan}}';
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
            [['plan_name'], 'required']
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
        return $this->hasMany(CardioWeek::className(), ['plan_id' => 'id']);
    }
}