<?php


namespace app\lib\exception;


class UserException extends BaseException
{
    public  $code=404;
    public $msg='用户数据错误';
    public $errorCode=40000;
}