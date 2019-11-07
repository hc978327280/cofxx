<?php


namespace app\api\controller\v1;


use think\Controller;
use think\Db;
use think\Request;

class Chat  extends Controller
{
    /*
     * 存储聊天记录
     * */
    public function save_message(){
        if (Request::instance()->isAjax()){
            $message=input('post.');

            $data['fromid']=$message['fromid'];
            $data['fromname']=$this->getName($data['fromid']);
            $data['toid']=$message['toid'];
            $data['toname']=$this->getName($data['toid']);
            $data['content']=$message['data'];
            $data['time']=$message['time'];
            $data['isread']=$message['isread'];
            $data['type']=1;
//            dump($data);
            Db::name('communication')->insert($data);
        }
    }
    /*
     * 获取用户聊天记录
     * */
    public function load(){
        if (Request::instance()->isAjax()){
            $fromid=input('fromid');
            $toid=input('toid');
           $count= Db::name('communication')
                ->where('(fromid=:fromid and toid=:toid) || (fromid=:toid1 and toid=:fromid1)',['fromid'=>$fromid,'toid'=>$toid,'toid1'=>$toid,'fromid1'=>$fromid])
                ->count();
           if ($count>=10){
               $message= Db::name('communication')
                   ->where('(fromid=:fromid and toid=:toid) || (fromid=:toid1 and toid=:fromid1)',['fromid'=>$fromid,'toid'=>$toid,'toid1'=>$toid,'fromid1'=>$fromid])
                   ->limit($count-10,10)
                   ->order('id')
                   ->select();
           }else{
               $message= Db::name('communication')
                   ->where('(fromid=:fromid and toid=:toid) || (fromid=:toid1 and toid=:fromid1)',['fromid'=>$fromid,'toid'=>$toid,'toid1'=>$toid,'fromid1'=>$fromid])
                   ->order('id')
                   ->select();
           }
            return $message;
        }
    }
    /*
     * 获取用户名称
     * */
    public function get_name(){
        if (Request::instance()->isAjax()){
            $uid=input('uid');
            $info=Db::name('user')->field('nickname')->find($uid);
            return [
                'toname'=>$info['nickname']
            ];
        }
    }
    /*
     * 获取用户头像
     * */
    public function get_head(){
        if (Request::instance()->isAjax()){
            $fromid=input('fromid');
            $toid=input('toid');
            $frominfo=Db::name('user')
                ->where('user_id',$fromid)
                ->field('user_img')
                ->find();
            $toinfo=Db::name('user')
                ->where('user_id',$toid)
                ->field('user_img')
                ->find();
            return[
                'from_head'=>$frominfo['user_img'],
                'to_head'=>$toinfo['user_img']

            ];
        }
    }
    /*
     * 根据用户ID 返回用户姓名
     * */
    public function getName($uid){
        $userinfo=Db::name('user')->field('nickname')->find($uid);

        return  $userinfo['nickname'];
    }
}