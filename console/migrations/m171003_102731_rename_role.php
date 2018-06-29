<?php

use yii\db\Migration;


class m171003_102731_rename_role extends Migration
{
    public function safeUp()
    {
        $this->update('admin','Admin');
        $this->update('user','User');
        $this->update('manager','Manager');
    }

    public function safeDown()
    {
        echo "m171003_102731_rename_role cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m171003_102731_rename_role cannot be reverted.\n";

        return false;
    }
    */
}
