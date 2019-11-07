<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;
Route::rule('api/v1/user','api/v1.user/getuser');
Route::post('api/:version/token/user','api/:version.Token/getToken');
Route::get('api/:version/friends','api/:version.Friends/getFriends');
Route::get('index/index','index/index/index');
Route::rule('api/v1/save_message','api/v1.Chat/save_message');
Route::rule('api/v1/get_head','api/v1.Chat/get_head');
Route::rule('api/v1/get_name','api/v1.Chat/get_name');
Route::rule('api/v1/load','api/v1.Chat/load');