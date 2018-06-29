<?php
/* @var $this yii\web\View */
/* @var $query common\models\User */
use yii\grid\GridView;
use yii\data\ActiveDataProvider;
use yii\data\BaseDataProvider;
use yii\base\UserException;
use common\models\User;
use backend\assets\AppAsset;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Pjax;
use yii\grid\CheckboxColumn;

$this->title = 'Users';
$model= User::find()
?>
<?php Pjax::begin(['id' => 'user']); ?>
<div class="page-title">
    <h3>Users</h3>
    <div class="page-breadcrumb">
        <ol class="breadcrumb">
            <li><a href="<?= yii\helpers\Url::to(['/']); ?>">Home</a>
            </li>
            <li class="active">Users</li>
        </ol>
    </div>
</div>
<div id="main-wrapper">
    <div class="row">
        <div class="col-md-12">
            <div class="title-row">
                        <div class="panel-body">
                            <a class='btn btn-info' href='<?= yii\helpers\Url::to(['user-form/index']); ?>'>Add user</a>
                            <div class="title-page float-left"><span><?= $this->title; ?></span><?php if( Yii::$app->request->get('s') ): ?><br>
                                <div class="search-title name">Search results for: <?= Yii::$app->request->get('s'); ?></div><?php endif; ?></div>

                                <div class="float-right search">
                                    <?php $form = ActiveForm::begin([
                                        'options' => [ 'class' => 'search-area'],
                                        'action' => Url::current(['s'=>NULL], true),
                                        'method' => 'GET'
                                    ]); ?>
                                    <?= Html::textInput('s', Yii::$app->request->get('s'), ['class' => 'search-input']) ?>
                                    <?php ActiveForm::end(); ?>
                                    <a class="btn btn-primary btn-sm" href="#">Search</a>
                                </div>
                            </div>
            <div class="panel panel-white">

                    <div class="table-responsive">
                        <?= Html::beginForm(['user/index']) ?>
                        <?php
                        $dataProvider = new ActiveDataProvider([
                            'query' => $query,
                            'pagination' => [
                                'pageSize' =>10,
                                ],
                            'sort' => [
                                'attributes' => [
                                    'Display_name' => [
                                        'asc' => ['first_name' => SORT_ASC, 'last_name' => SORT_ASC],
                                        'desc' => ['first_name' => SORT_DESC, 'last_name' => SORT_DESC],
                                        'label' => 'Name',
                                        'default' => SORT_ASC
                                    ],
                                    'created_at' => [
                                        'asc' => ['created_at' => SORT_ASC],
                                        'desc' => ['created_at' => SORT_DESC],
                                        'label' => 'Registered',
                                        'default' => SORT_ASC
                                    ],
                                    'last_login' => [
                                        'asc' => ['last_login' => SORT_ASC],
                                        'desc' => ['last_login' => SORT_DESC],
                                        'label' => 'Last Login',
                                        'default' => SORT_ASC
                                    ],
                                    'defaultOrder' => [
                                        'Display_name' => SORT_ASC,
                                    ],
                                ],
                            ],
                        ]);
                        echo GridView::widget([
                            'dataProvider'=> $dataProvider,
                            'columns' => [
                                [
                                    'class' => 'yii\grid\CheckboxColumn',
                                ],
                                [
                                    'attribute' => 'Display_name',
                                    'format' => 'text',

                                ],
                                [
                                    'attribute' => 'email',
                                    'format' => 'text',
                                ],
                                [
                                    'attribute' => 'last_login',
                                    'format' => ['date', 'php:d-m-Y'],
                                ],
                                [
                                    'attribute' => 'created_at',
                                    'format' => ['date', 'php:d-m-Y'] ,
                                ],
                                [
                                    'attribute' => 'status',
                                    'format' => 'text',
                                ],
                                [
                                    'attribute' => 'id',
                                    'format' => 'text'
                                ],
                            ],
                        ]);
                        ?>
                        <div class='savebutton'>
                            <?php
                            echo Html::submitButton('delete', [
                                'data' => ['confirm-submit' => '1'],
                                'name' => 'delete',
                                'class' => 'btn btn-primary btn-sm']);
                                ?>
                            </div>
                        <?= Html::endForm() ?>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Row -->
</div>
<?php Pjax::end(); ?>
