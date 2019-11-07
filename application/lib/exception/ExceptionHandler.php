<?php


namespace app\lib\exception;


use Exception;
use think\exception\Handle;
use think\Log;
use think\Request;

class ExceptionHandler extends Handle
{
    private $code;
    private $msg;
    private $errorCode;
    //需要返回客户端当前请求的URL路径
    public function render(Exception $e){
        if ($e instanceof BaseException){
            //如果是自定义的异常
            $this->code=$e->code;
            $this->msg=$e->msg;
            $this->errorCode=$e->errorCode;
        }else{
            //进行判断返回给服务端JSON错误 客户端显示TP自带的报错页面
            if (config('app_debug')){
                //调用异常类的render方法
                return parent::render($e);
            }else{
                $this->code=500;
                $this->msg='服务器内部错误，不告诉你';
                $this->errorCode=999;
                //获取错误信息 传递给日志记录
                $this->recordErrorLog($e);
            }

        }
        $request=Request::instance();//调用获取数据
        $result=[
            'msg'=>$this->msg,
            'error_code'=>$this->errorCode,
            'request_url'=>$request->url()//客户端当前请求的URL路径
        ];
        return json($result,$this->code);
    }
    //存储日志
    private function recordErrorLog(Exception $e){
        //初始化日志
        Log::init([
            'type'=>'File',
            'path'=>LOG_PATH,
            'level'=>['error']
        ]);
        //调用日志类  存储
        Log::record($e->getMessage(),'error');
    }
}