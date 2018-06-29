<?php

use yii\db\Migration;
/**
 * add 'manager' role.
 *
 * php yii migrate/to m170929_190758_add_manager_role
 *
 */


class m170929_190758_add_manager_role extends Migration
{

    public function up()
    {
        $auth = Yii::$app->authManager;
        $manager = $auth->createRole('manager');
        $auth->add($manager);
        $auth->assign($manager, 3);
    }

    public function down()
    {
        $auth = Yii::$app->authManager;
        echo "m170929_190758_add_manager_role was reverted.\n";
        $manager= $auth->remove($manager);
        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m170929_190758_add_manager_role cannot be reverted.\n";

        return false;
    }
    */
}
