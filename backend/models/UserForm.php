<?php
namespace backend\models;

use Yii;
use yii\base\Model;
use common\helpers\Role;
use common\models\User;

class UserForm extends Model {

    public $name;
    public $email;
    public $password;
    public $role;

    public function rules()
    {
        return [
            [[ 'name', 'email', 'password', 'role'], 'trim'],
            [[ 'name', 'email', 'password', 'role'],'required'],
        ];
    }

    static function save(){
    }
}
