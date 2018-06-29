<?php

/* @var $this \yii\web\View */
/* @var $content string */

use frontend\assets\AppAsset;
use yii\helpers\Html;
use common\widgets\Menu;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<nav class="main-menu">
    <a class="logo" href="<?= yii\helpers\Url::base(); ?>" title="">
      <?= Html::img('/images/logo.svg') ?>
    </a>
    <div class="main-navigation">
        <?php
        echo Menu::widget([
                'options' => ['class' => 'vertical menu client-menu'],
                'submenuTemplate' => "\n<ul class='sub-menu'>\n{items}\n</ul>\n",
                'activateParents' => true,
                'items' => [
                    ['label' => 'Dashboard', 'url' => ['/site/index'], 'options'=>['class'=>'menu-item-dashboard']],
                    ['label' => 'Profile Info', 'url' => ['/site/clients'], 'options'=>['class'=>'menu-item-clients']],
                    ['label' => 'Contact Coach', 'url' => ['/site/contact'], 'options'=>['class'=>'menu-item-contact']],
                    ['label' => 'Biometrics', 'url' => ['/site/contact'], 'options'=>['class'=>'menu-item-biometric']],
                    ['label' => 'Nutrition', 'url' => ['/site/contact'], 'options'=>['class'=>'menu-item-nutrition']],
                    ['label' => 'Cardio', 'url' => ['/site/contact'], 'options'=>['class'=>'menu-item-cardio']],
                    [
                        'label' => 'Strength', 
                        'url' => ['/site/contact'], 
                        'options'=>['class'=>'menu-item-strength'],
                        'items' => [
                            ['label' => 'Plans', 'url' => ['/site/contact']],
                            ['label' => 'Exercises', 'url' => ['/site/contact']],
                        ]
                    ],
                ],
            ]);
        ?>
        <?php
        echo Menu::widget([
                'options' => ['class' => 'vertical menu bottom'],
                'items' => [
                    ['label' => 'Sign Out', 'url' => ['/site/logout'], 'options'=>['class'=>'menu-item-signout']],
                ],
            ]);
        ?>
    </div>
    <div class="sandwich_btn mobile-only tablet-only">
      <span class="line"></span>
      <span class="line"></span>
      <span class="line"></span>
    </div>
</nav>

 <main class="container">
        <!-- <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?> -->
        <?= $content ?>
</main>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
