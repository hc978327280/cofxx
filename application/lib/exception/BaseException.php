<?php


namespace app\lib\exception;


use think\Exception;

class BaseException extends Exception
{ public $code=400;//HTTP 状态码 404，200
    public $msg='参数错误';
    public $errorCode=10000;
    public function __construct($params=[]){
        //判断传过来的是不是一个数据 对错误信息改写
        if (!is_array($params)){
            return;
        }
        //重写错误信息 先进行判断
        if (array_key_exists('code',$params)){
            //存在改键  就对错误信息进行重写
            $this->code=$params['code'];
        }
        if (array_key_exists('msg',$params)){
            $this->msg=$params['msg'];
        }
        if (array_key_exists('errorCode',$params)){
            $this->errorCode=$params['errorCode'];
        }
        }
}