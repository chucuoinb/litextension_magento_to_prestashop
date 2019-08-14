<?php

defined('_PS_VERSION_') or die();

class AdminLitextensionController extends ModuleAdminController {

    public function __construct() {
        $this->bootstrap = true;
        parent::__construct();
    }

    public function initContent() {
        $this->context->smarty->assign('controller', $this);
        $this->context->smarty->assign('cart_image', $this->getImage('carts/'.SOURCE_CART.'.png'));
        $this->context->smarty->assign('source_type', SOURCE_CART);
        $this->template = "index.tpl";
        $lit = array(
            'login' => false,
            'email' => '',
            'token' => '',
            'src_url' => '',
        );
        $app_url = array(
            'login' => APP_URL_LOGIN,
            'forgot' => APP_URL_FORGOT,
            'register' => APP_URL_REGISTER,
            'connect_url' => APP_URL."/app-create-migration?src_type=".SOURCE_CART."&target_type=prestashop&target_url="._PS_BASE_URL_.__PS_BASE_URI__."&app_mode=true",
        );

        if (isset($_SESSION['lit_email'])){
            $lit['email'] = $_SESSION['lit_email'];
            $lit['login'] = true;
        }

        if (isset($_SESSION['lit_security_token'])){
            $lit['token'] = $_SESSION['lit_security_token'];
        }
        if (isset($_SESSION['lit_src_url'])){
            $lit['src_url'] = $_SESSION['lit_src_url'];
        }
        $this->context->smarty->assign('lit', $lit);
        $this->context->smarty->assign('app_url', $app_url);

        parent::initContent();
    }

    public function getImage($path){
        return _PS_BASE_URL_._MODULE_DIR_.$this->module->name.'/views/img/' . $path;
    }
    protected function displayAjaxLogin(){
        $email = Tools::getValue('email');
        $token = Tools::getValue('security_token');
        $this->litAddSession($email, $token);
        die(Tools::jsonEncode(array('result' => 'success')));
    }
    protected function displayAjaxLogout(){
        $this->litClearSession();
        die(Tools::jsonEncode(array('result' => 'success')));
    }
    protected function displayAjaxConnect(){
        $_SESSION['lit_src_url'] = Tools::getValue('src_url');
        die(Tools::jsonEncode(array('result' => 'success')));
    }
    public function litAddSession($email, $token){
        $_SESSION['lit_email'] = $email;
        $_SESSION['lit_security_token'] = $token;
    }

    public function litClearSession(){
        if (isset($_SESSION['lit_email'])){
            unset($_SESSION['lit_email']);
            unset($_SESSION['lit_security_token']);
        }
        if(isset($_SESSION['lit_src_url'])){
            unset($_SESSION['lit_src_url']);
        }
    }
}
