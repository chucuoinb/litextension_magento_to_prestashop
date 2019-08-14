<div id="app">
    <input type="hidden" value="{$link->getAdminLink('AdminLitextension')}" id="admin-url">
    <div class="container">
        <div class="row">
            <div class="lit-header">
                <img src="{$controller->getImage('logo.svg')}"/>
            </div>
            <div class="cart-logos">
                <div class="col-xs-5">
                    <div class="list-cart-type">

                        <img src="{$cart_image}">
                    </div>
                </div>
                <div class="center col-xs-2"><img style="width: 20px;margin-top: 10px;"
                                                  src="{$controller->getImage('play-arrow.svg')}"></div>
                <div class="col-xs-5">
                    <div class="list-cart-type text-left"><img src="{$controller->getImage('carts/prestashop.png')}">
                    </div>
                </div>
            </div>
            <div style="    font-size: 18px;    margin: 20px;    text-align: center;">Follow these steps to migrate data
                from {$source_type|ucfirst} to Prestashop
            </div>
            <div class="lit-dialog display-none" style="display: none">
                <span id="msg"></span>
                <div id="button-close"></div>
            </div>
            <div class="lit-dialog-user {if not $lit.login } {l s = 'display-none'} {/if} ">
                <span id="user-msg">You are logged in LitExtension as {$lit.email}.</span>
                <div id="user-button-logout">Logout</div>
            </div>
            <div class="lit-signin">
                <div class="lit-panel lit-panel-default {if $lit.login }{l s = 'done'}{/if}" id="lit-signin">
                    <h1 class="lit-panel-heading" id="header-signin">
                        <span class="step-number" id="step-1"><i>1</i></span>
                        <span class="step-name">Log In</span>
                        <span class="step-done"></span>
                    </h1>
                    <div class="lit-panel-body {if $lit.login }{l s = 'display-none'}{/if}" id="body-signin">
                        <div class="row">
                            <div class="login-panel">
                                <form class="form-horizontal" id="signin">
                                    <input id="url" type="hidden" class="lit-form-control" value="{$app_url.login}">
                                    <div class="form-group email-panel">
                                        <label for="email" class="control-label">Email</label>
                                        <div>
                                            <input id="email" type="email" class="form-control" name="email" value=""
                                                   required>
                                        </div>
                                    </div>
                                    <div class="form-group password-panel">
                                        <label for="password" class="control-label">Password</label>
                                        <div>
                                            <input id="password" type="password" class="form-control" name="password"
                                                   required>
                                        </div>
                                    </div>
                                    <div class="form-group button-panel">
                                        <div>
                                            <button type="submit" class="lit-btn lit-btn-green signin">Log In</button>
                                        </div>
                                        <div class="forgot">
                                            <a href="{$app_url.forgot}" target="_blank">Forgot Password?</a>
                                        </div>
                                    </div>
                                    <div class="form-group button-panel">
                                        <div class="create-acc">
                                            <span>New to LitExtension? <a href="{$app_url.register}" target="_blank">Sign Up</a></span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="lit-panel lit-panel-default {if not $lit.login }{l s = 'hidden-panel'}{/if} "
                     id="lit-connect">
                    <h1 class="lit-panel-heading" id="header-connect">
                        <span class="step-number" id="step-2"><i>2</i></span>
                        <span class="step-name">Connect {$source_type|ucfirst} Store</span>
                        <span class="step-done"></span>
                    </h1>
                    <div class="lit-panel-body {if not $lit.login }{l s = 'display-none'}{/if}" id="body-connect">
                        <div class="row">
                            <div class="login-panel">
                                <form class="form-horizontal" id="connect">
                                    <input id="connect-url" type="hidden" value="{$app_url.connect_url}">
                                    <div class="form-group email-panel">
                                        <label for="src-type" class="control-label">Source Cart Type</label>
                                        <div>
                                            <input id="src-type" class="form-control" name="src_type" value="{$source_type}" type="hidden">
                                            <img src="{$cart_image}"/>
                                        </div>
                                    </div>
                                    <div class="form-group email-panel">
                                        <label for="src-url" class="control-label">Source Cart Url</label>
                                        <div>
                                            <input id="src-url" type="url" class="form-control" name="src_url"
                                                   placeholder="https://your-source-site.com" required
                                                   style="width: 400px;" value="{$lit.src_url}">
                                        </div>
                                    </div>
                                    <div class="form-group button-panel">
                                        <div>
                                            <input type="hidden" id="security_token" name="security_token"
                                                   value="{$lit.token}">
                                            <div type="submit" class="btn btn-green signin" id="btn-connect">Connect</div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-blocks">
                <div class="block-left lit-block">
                    <h3 class="block-header block-free modal-title">Included in this Free Migration</h3>

                    <div class="block-ct">
                        <p>The following features are supported:</p>
                        <ul>
                            <li>Magento Community 1.x - 2.x</li>
                            <li>Migrate Product categories</li>
                            <li>Migrate Product categories images</li>
                            <li>Migrate Products</li>
                            <li>Migrate Product thumbnails</li>
                            <li>Migrate Product images galleries</li>
                            <li>Migrate Product stocks</li>
                            <li>Unlimited migration</li>
                            <li>Community Support</li>
                        </ul>
                    </div>
                </div>
                <div class="block-center lit-block">
                    <h3 class="block-header block-preminum modal-title">Buy Premium Migration</h3>

                    <div class="multicol block-ct">
                        <p>Gain all Free version features including the following extra features with Premium Migration:</p>
                        <ul>
                            <li>Magento Community 1.x - 2.x</li>
                            <li>Magento Enterprise</li>
                            <li>Migrate Product attributes</li>
                            <li>Migrate Product variations</li>
                            <li>Migrate Grouped products</li>
                            <li>Migrate Products Up Sell and Cross Sell</li>
                            <li>Migrate Users</li>
                            <li>Migrate Customers</li>
                            <li>Migrate Orders</li>
                        </ul>
                        <ul>
                            <li>Migrate Ratings and reviews</li>
                            <li>Migrate Discount coupons</li>
                            <li>Migrate SEO meta data</li>
                            <li>Migrate Tax classes</li>
                            <li>Migrate SEO: redirects the source store URLs</li>
                            <li>Unlimited migration</li>
                            <li>High Priority Support</li>
                        </ul>
                        <br style="clear:both" />
                        <p>You can buy Premium Migration before or after Free Migration. <a target="_blank" href="https://litextension.com/woocommerce-migration-tool/magento-to-woocommerce.html">Check details</a></p>
                    </div>
                </div>

                <br style="clear:both" />
            </div>

            <div class="lit-footer lit-plugin position-m-block">
                <a href="https://litextension.com/how-litextension-works/migrate-from-{$source_type}-to-prestashop.html">How It Works</a>
                <a href="https://litextension.com/faq/">FAQs</a>
                <a href="https://blog.litextension.com/">Blog</a>
                <a href="https://litextension.com/terms-conditions/">Terms and Conditions</a>
                <a href="https://litextension.zendesk.com">Submit a Support Ticket</a>
            </div>
        </div>
    </div>
</div>
