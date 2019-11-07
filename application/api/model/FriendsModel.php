<?php


namespace app\api\model;


use app\lib\exception\FriendException;
use think\Db;

class FriendsModel extends BaseModel
{
    public static function getFr($user_id){
        //查询职业，爱好相关的数据
        $map=[];
        $user=Db::name('user')->find($user_id);
        if (!$user){
            throw new FriendException();
        }else{
            if (!empty($user['user_hobby'])) {
                $map['user_hobby'] = ['like','%'.$user['user_hobby'].'%'];
            }
            if (!empty($user['user_job'])) {
                $map['user_job'] = ['like','%'.$user['user_job'].'%'];
            }
            $result=Db::name('user')
                ->whereOr($map)
                ->limit(10)
                ->select();
            return $result;
        }
    }
}