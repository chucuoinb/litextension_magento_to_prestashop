jQuery(document).ready(function($) {
    $('#signin').on('submit', function(e) {
        e.preventDefault();
        var email = $('#email').val();
        var password = $('#password').val();
        var url = $('#url').val();

        $.ajax({
            type:"POST",
            url: url,
            dataType : 'json',
            data: {
                email: email,
                password: password
            },
            success: function(response) {
                if (response['status'] == 'error'){
                    $('#msg').text(response['msg']);
                    if ( $('.lit-dialog').hasClass('display-none') ){
                        $('.lit-dialog').removeClass('display-none');
                    }
                    $('.lit-dialog').css('display', 'block');
                } else {

                    $("#security_token").val(response['security_token']);
                    addClassDisplay($('.lit-dialog'));
                    $('#user-msg').text('You are logged in LitExtension as ' + email + '.');
                    if ( $('.lit-dialog-user').hasClass('display-none') ){
                        $('.lit-dialog-user').removeClass('display-none');
                    }
                    $('.lit-dialog-user').css('display', 'block');
                    $('#lit-signin').addClass('done');
                    addClassDisplay($('#body-signin'));
                    if ( $('#lit-connect').hasClass('hidden-panel') ){
                        $('#lit-connect').removeClass('hidden-panel');
                    }
                    var data = {
                        'email': email,
                        'security_token': response['security_token'],
                        'action': 'login',
                        'ajax': 1,
                    }
                    $('#body-connect').show();
                    $.ajax({
                        type:"POST",
                        url: $('#admin-url').val(),
                        dataType : 'json',
                        data: data,
                        success: function(response) {
                            // console.log(response);
                        }
                    });
                }
            }
        });
    });

    $('#button-close').click(function (e) {
        addClassDisplay($('.lit-dialog'));
    });

    $('#user-button-logout').click(function (e) {
        var data = {
            'action': 'logout',
            'ajax': 1,
        }
        $.ajax({
            type:"POST",
            url: $('#admin-url').val(),
            data: data,
            dataType : 'json',
            success: function(response) {
                console.log(response)
                if(response.result == 'success'){
                    addClassDisplay($('.lit-dialog-user'));
                    if ( $('#lit-signin').hasClass('done') ){
                        $('#lit-signin').removeClass('done');
                    }
                    removeClassDisplay($('#body-signin'));
                    if (!$('#lit-connect').hasClass('hidden-panel') ){
                        $('#lit-connect').addClass('hidden-panel');
                    }
                    $('#body-connect').css('display', 'none');
                }
            }
        });
    });

    $('#btn-connect').on('click', function(e) {
        e.preventDefault();

        var src_url = $('#src-url').val();
        var url = $('#connect-url').val();
        var security_token = $('#security_token').val();
        url = url + '&src_url=' + src_url + "&security_token=" + security_token;
        var data = {
            'action': 'connect',
            'src_url': src_url,
            'ajax': 1,
        }
        $.ajax({
            type:"POST",
            url: $('#admin-url').val(),
            data: data,
            dataType : 'json',
            success: function(response) {
            }
        });
        window.open(url, '_blank');
    });

    function addClassDisplay(child) {
        if (!child.hasClass('display-none')){
            child.addClass('display-none');
            setTimeout(function (e) {child.css('display', 'none');}, 500)
        }
    }

    function removeClassDisplay(child) {
        if (child.hasClass('display-none')){
            child.removeClass('display-none');
            setTimeout(function (e) {child.css('display', 'block');}, 500)
        }
    }
});