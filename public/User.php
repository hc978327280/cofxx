<?php


namespace app\api\controller\v1;


use app\api\validate\UserValidate;
use think\Request;

class User
{
    public function getUser($id){
        (new UserValidate())->goCheck();
    }
}