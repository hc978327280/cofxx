<?php


namespace app\api\validate;


use app\lib\exception\ParameterException;
use think\Request;
use think\Validate;

class BaseValidate extends Validate
{
    //公共的验证方法
    public function goCheck(){
        //获取HTTP传入的数据
        //对这些参数做检验
        $request=Request::instance();
        $params=$request->param();
        $result=$this->batch()->check($params);//批量验证
        if (!$result){
            //实例化参数验证的错误类
            $e=new ParameterException([
                'msg'=>$this->error,//error 是Validate类中保存验证错误的信息
            ]);
            //获取错误信息

//            $e->msg=$this->error;
            throw $e; //将异常抛给自定义的异常类
//            $error=$this->error;//获取异常
//            throw new Exception($error);
        }else{
            return true;
        }
    }
    //正整数验证
    protected function isPositiveInteger($value,$rule='',$data='',$field=''){
        if(is_numeric($value) && is_int($value+0) && ($value+0)>0){
            return true;
        }else{
            return false;
        }
    }
    //code为空验证
    protected function isNotEmpty($value,$rule='',$data='',$field=''){
        if(empty($value)){
            return false;
        }else{
            return true;
        }
    }
}