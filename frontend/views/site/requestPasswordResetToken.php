<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Request password reset';
$this->params['breadcrumbs'][] = $this->title;
?>
<main class="login-container">
    <div class="login-area">
        <div class="logo">
            <a href="<?= yii\helpers\Url::base(); ?>">
                <?= Html::img('/images/logo.svg') ?>
            </a>
        </div>

        <?php $form = ActiveForm::begin(['id' => 'request-password-reset-form']); ?>
        <div class="white-block">
            <div class="row login-body">
                <div class="column large-12 medium-12">
                    <p>Please fill out your email. A link to reset password will be sent there.</p>
                    
                    <label>Email
                        <?= $form->field($model, 'email')->textInput(['autofocus' => true])->label(false) ?>
                    </label>
                </div>
            </div>
            <?= Html::submitButton('Send', ['class' => 'button alert login-btn', 'name' => 'login-button']) ?>
        </div>
        <?php ActiveForm::end(); ?>
        <div class="column large-12 medium-12 text-center">
            <?= Html::a('Cancel', ['site/login'], ['class' => 'forgot-pass']) ?>
        </div>
    </div>
</main>
