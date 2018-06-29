<?php
namespace backend\controllers;

use Yii;
use yii\data\Pagination;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
use yii\web\NotFoundHttpException;
use phpDocumentor\Reflection\Types\Integer;
use yii\web\Controller;


use common\models\User;
use common\models\Options;
use common\models\Exercise;
use common\web\BaseController;


/**
 * Site controller
 */
class UserController extends BaseController
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
                            'index', 'new-client', 'edit-client',
                            'edit-nutrition-plan', 'create-nutrition-plan',
                            'edit-cardio-plan', 'create-cardio-plan',
                            'log-strength', 'create-strength-plan', 'edit-strength-plan',
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
        $current_user = Yii::$app->user;

        $query = User::find()->where(['!=', 'id', $current_user->id]);
        $search = Yii::$app->request->get('s');
        $checked = Yii::$app->request->post('selection') ?? [];

        if( Yii::$app->request->post('delete') === '' && $checked) {
            $this->_deleteUsers( $checked );

            if( Yii::$app->request->get('page') ) {
                return $this->redirect(Yii::$app->request->referrer);
            } else {
                return $this->redirect(Yii::$app->request->referrer);
            }
        }

        if( $search ) {
            $search = explode(' ', $search);
            $filter = ['or'];

            foreach( $search as $search_word ) {
                $filter[] = ['like', 'first_name', $search_word];
                $filter[] = ['like', 'last_name', $search_word];
                $filter[] = ['like', 'email', $search_word];
            }

            $query->andFilterWhere( $filter );
        }

        return $this->render('index', [
            'query' => $query
        ]);
    }

    /**
     * Displays Add client page.
     *
     * @return string
     */
    public function actionNewClient()
    {
        $model = new User();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['user/index']);
        }
        return $this->render('new-client', [
            'model' => $model
        ]);
    }

    /**
     * Delete selected users
     */
    private function _deleteUsers($delete){

        Yii::$app->getSession()->setFlash('message', 'Users has been deleted.');
    }
}
