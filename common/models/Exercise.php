<?php
namespace common\models;

use yii\db\ActiveRecord;

/**
 * CardioPlan model
 *
 * @property integer $id
 * @property string $exercise_name
 * @property string $muscle_group
 * @property string $type
 * @property string $video_url
 * @property serialized array $alternate
 */
class Exercise extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%exercise}}';
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'exercise_name',
                    'muscle_group',
                    'type',
                    'video_url',
                    'description',
                ],
                'trim'
            ],
            [['exercise_name'], 'required'],
            ['alternate', function ($attribute, $params) {
                if( is_array($this->$attribute) ) {
                    $this->$attribute = array_filter($this->$attribute, function($element) {
                        return (int)$element !== 0;
                    });
                }
                if( !empty($this->$attribute) ){
                    $this->$attribute = serialize($this->$attribute);
                } else {
                    $this->$attribute = null;
                }
            }]
        ];
    }
    
    public function getAlternate()
    {
        if( $this->alternate ){
            return unserialize($this->alternate);
        } else {
            return [''];
        }
    }
    
    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
}