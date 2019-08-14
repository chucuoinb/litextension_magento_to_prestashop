<?php

if (!defined('_PS_VERSION_')) {
    exit;
}
//define('APP_URL', 'http://localhost/cartmigration_ui_ver3/public');
define('APP_URL', 'https://cm.litextension.com');
define('APP_URL_LOGIN', APP_URL.'/app-login');
define('APP_URL_FORGOT', APP_URL.'/password/reset');
define('APP_URL_REGISTER', APP_URL.'/register');
define('SOURCE_CART', 'magento');
class Litextension_Magento_To_Prestashop extends Module
{
    protected $config_form = false;
    public function __construct()
    {
        $this->name = 'litextension_magento_to_prestashop';
        $this->tab = 'administration';
        $this->version = '1.0.0';
        $this->author = 'LitExtension';
        $this->need_instance = 1;

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Magento To Prestashop');
        $this->description = $this->l('Migrate data from Magento to Prestashop');

    }

    public function install()
    {
        if (parent::install() == false || !$this->registerHook('displayBackOfficeHeader') || !$this->_installAdminTab()){
            return false;
        }
        return true;
    }

    public function uninstall()
    {

        return parent::uninstall();
    }

    protected function _installAdminTab() {
        $id_parent = Tab::getIdFromClassName('AdminLitextensionParent');
        $languages = Language::getLanguages(false);

        if (!$id_parent) {
            @copy(_PS_MODULE_DIR_ . $this->name . '/logo.png', _PS_IMG_DIR_ . 't/AdminLitextensionParent.png');
            $tab_parent = new Tab();
            foreach($languages as $lang){
                $tab_parent->name[$lang['id_lang']] = 'LitExtension';
            }
            $tab_parent->class_name = 'AdminLitextensionParent';
            $tab_parent->module = $this->name;
            $tab_parent->id_parent = 0;
            $tab_parent->active = true;
            if (!$tab_parent->save()) {
                return false;
            }
            $id_parent = Tab::getIdFromClassName('AdminLitextensionParent');
        }
        $tab = new Tab();
        foreach($languages as $lang){
            $tab->name[$lang['id_lang']] = Tools::ucfirst(SOURCE_CART) . ' To Prestashop';
        }
        $tab->id_parent = $id_parent;
        $tab->class_name = 'AdminLitextension';
        $tab->module = $this->name;
        $tab->position = 1;
        $tab->active = true;
        if (!$tab->save()) {
            return false;
        }
        return true;
    }

    protected function _uninstallAdminTab() {
        @unlink(_PS_IMG_DIR . "t/CartMigration.png");
        $tab_class = array('AdminLecm');
        foreach ($tab_class as $class) {
            $id = Tab::getIdFromClassName($class);
            if (!$id) {
                continue;
            }
            $tab = new Tab($id);
            if (!$tab->delete()) {
                return false;
            }
        }
        return true;
    }







    /**
     * Add the CSS on the BO.
     */
    public function hookDisplayBackOfficeHeader($params) {
        $this->context->controller->addCSS($this->_path . 'views/css/litextension.css', 'all');
        $this->context->controller->addJS($this->_path . 'views/js/jquery.min.js', 'all');
        $this->context->controller->addJS($this->_path . 'views/js/litextension.js', 'all');
    }
}
