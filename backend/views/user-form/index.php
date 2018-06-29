<?php
/* @var $this yii\web\View */
/* @var $model common\models\User */

use yii\helpers\Html;
use yii\widgets\Pjax;
use yii\base\UserException;
use yii\bootstrap\ActiveForm;
use common\helpers\Role;


use backend\assets\AppAsset;

$this->title = 'New User';?>
<?php Pjax::begin(['id' => 'new_user']); ?>
<div class="page-title">
    <h3>New Client</h3>
    <div class="page-breadcrumb">
        <ol class="breadcrumb">
            <li>
                <a href="<?= yii\helpers\Url::to(['/']); ?>">Home</a>
            </li>
            <li>
                <a href="<?= yii\helpers\Url::to(['/']); ?>">Users</a>
            </li>
            <li class="active">New User</li>
        </ol>
    </div>
</div>
<div id="main-wrapper">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-white">
                <div class="panel-body">
                    <div class="table-responsive">
                        <div id="example_wrapper" class="dataTables_wrapper">
                            <?php $form = ActiveForm::begin([
                                'options' => [
                                    'class' => 'col-md-8 col-md-offset-2'
                                 ]
                            ]); ?>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Name</label>
                                <?= $form->field($model, 'name')->textInput(['class' => 'form-control'])->label(false) ?>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Email</label>
                                    <?= $form->field($model, 'email')->input('email',['class' => 'form-control'])->label(false)?>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                    <?= $form->field($model, 'password')->passwordInput(['class' => 'form-control'])->label(false) ?>
                            </div>
                            <?=$form->field($model, 'role')->dropDownList(Role::getRolesList())->label(false)?>
                            <?php var_dump(Role::getAllowedPermission()) ?>
                            <?= Html::submitButton('Add', ['class' => 'btn btn-success']) ?>
                        <?php ActiveForm::end() ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php Pjax::end(); ?>
