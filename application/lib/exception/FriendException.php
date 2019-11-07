<?php


namespace app\lib\exception;


class FriendException   extends BaseException
{
    public  $code=404;
    public $msg='请求的用户不存在';
    public $errorCode=40000;
}