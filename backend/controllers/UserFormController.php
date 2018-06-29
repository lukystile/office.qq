<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\data\Pagination;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
use yii\web\NotFoundHttpException;
use phpDocumentor\Reflection\Types\Integer;
use backend\models\UserForm;


class UserFormController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => [
                            'index', 'new-client', 'client', 'delete', 'auto-complete',
                        ],
                        'allow' => true,
                        'roles' => ['admin'],
                    ],
                ],
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $model= new UserForm;
        var_dump(array_filter(
        Yii::$app->authManager->getPermissionsByUser(Yii::$app->user->getId()),
            Yii::$app->authManager->getRolesByUser(
                Yii::$app->user->getId()
        )));die;
        $postdata = Yii::$app->request->post();
        if ($postdata){

        }
        return $this->render('index', [
            'model' => $model
        ]);
    }
}
