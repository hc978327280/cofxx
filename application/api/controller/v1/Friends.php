<?php


namespace app\api\controller\v1;


use app\api\model\FriendsModel;
use app\lib\exception\FriendException;
use think\Request;

class Friends
{
    public function getFriends(){
        $request=Request::instance();
        $data=$request->param();
        $user=FriendsModel::getFr($data['user_id']);
        if (!$user){
            throw new FriendException();
        }
        return $user;

    }
}