<?php


namespace app\api\validate;


class UserValidate extends BaseValidate
{
        protected $rule=[
          'user_hobby'=>'require',
            'user_job'=>'require',
            'user_phone'=>'require|number',
            'user_name'=>'require'
        ];
}