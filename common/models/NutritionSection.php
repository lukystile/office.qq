<?php
namespace common\models;
use yii\db\ActiveRecord;

/**
 * NutritionSection model
 *
 * @property integer $id
 * @property string $section_name
 * @property string $description
 */
class NutritionSection extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%nutrition_section}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [ [ 'section_name', 'description' ], 'trim' ],
            [ ['section_name'], 'required' ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
    
}