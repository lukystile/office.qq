<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<main class="login-container">
    <div class="login-area">
        <div class="logo">
            <a href="<?= yii\helpers\Url::base(); ?>">
                <?= Html::img('/images/logo.svg') ?>
            </a>
        </div>

        <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
        <div class="white-block">
            <div class="row login-body">
                <div class="column large-12 medium-12">
                    <label>Email
                        <?= $form->field($model, 'email')->textInput(['autofocus' => true])->label(false) ?>
                    </label>
                </div>
                <div class="column large-12 medium-12">
                    <label>Password
                        <?= $form->field($model, 'password')->passwordInput()->label(false) ?>
                    </label>
                </div>
                <div class="column large-12 medium-12 text-center">
                    <?= Html::a('Forgot Password?', ['site/request-password-reset'], ['class' => 'forgot-pass']) ?>
                </div>
            </div>
            <?= Html::submitButton('Login', ['class' => 'button alert login-btn', 'name' => 'login-button']) ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>
</main>
