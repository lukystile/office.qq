<?php
namespace common\helpers;
use Yii;
/**
 *
 */
class Role
{
    public static function hasPermission($roleName, $rolePermission){
        $has_permission = false;


        foreach (Yii::$app->authManager->getPermissionsByRole($roleName) as $permission) {
            if( $rolePermission ===  $permission->name) {
                $has_permission = true;
            }
        }

        return $has_permission;
    }

    public function getRolesList(){
        foreach (Yii::$app->authManager->getRoles() as $role) {
            $roleList[$role->name]=$role->name;
        }
        return $roleList;
    }

    public function getAllowedPermission(){
        $auth = Yii::$app->authManager;
        $currentpermission=$auth->getPermissionsByUser(Yii::$app->user->getId());
        array_filter($currentpermission,'manage')
    }
}
