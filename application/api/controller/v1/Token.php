<?php


namespace app\api\controller\v1;






class Token
{
        public function getToken($code=''){
//            dump($code);
//           $url="https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx455c7dc24f43ed0e&secret=0f2b8a0edbf3f957463c49ef830f42c3&code=".$code."&grant_type=authorization_code";
//            $access_token = $this->https_request($url);
//            dump($access_token);
            $wchat = new \app\api\model\WechatOauth();
            $code = request()->param('code',"");
            $user = $wchat->getUserAccessUserInfo($code);
        }
    public function https_request($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $AjaxReturn = curl_exec($curl);
        //获取access_token和openid,转换为数组
        $data = json_decode($AjaxReturn,true);
        curl_close($curl);
        return $data;
    }
}