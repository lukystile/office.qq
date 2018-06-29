<?php
namespace common\models;
use yii\db\ActiveRecord;

/**
 * CardioSection model
 *
 * @property integer $id
 * @property string $section_name
 * @property string $description
 */
class CardioSection extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cardio_section}}';
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