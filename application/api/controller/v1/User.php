<?php


namespace app\api\controller\v1;



use app\api\validate\UserValidate;
use app\lib\exception\UserException;

class User
{
    public function getUser(){

        (new UserValidate())->goCheck();
        $id=session('xx')['user_id'];
        $user=UserModel::getUserInfo($id);
//        if (!$user){
//            throw new UserException();
//        }
//        return json($user);
    }
}