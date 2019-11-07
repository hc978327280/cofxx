<?php


namespace app\api\model;


class User  extends BaseModel
{
    //查询User表返回数据
    protected $table='talk_user';
    public static function getByOpenID($openid){
        $user=self::where('openid',$openid)->find();
        return $user;
    }
}