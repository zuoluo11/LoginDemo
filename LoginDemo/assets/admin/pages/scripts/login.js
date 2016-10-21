var Login = function () {

    var handleLogin = function () {
       
        $('.login-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                },
                remember: {
                    required: false
                }
            },

            messages: {
                username: {
                    required: "�û�������."
                },
                password: {
                    required: "�������."
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit   
                $('.alert-danger', $('.login-form')).show();
            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function (form) {
                //form.submit(); // form validation success, call ajax form submit
                login();
            }
        });

        var login = function () {
            var userName = $("input[name='username']").val();
            var passWord = $("input[name='password']").val();
            $.post("/Login/Login", { userName: userName, passWord: passWord }, function (data) {
                if (data == "0") {
                    alert("����");
                } else {
                    //��ס��ɾ������
                    setCookie(userName,passWord);
                    window.location.href = "/Home/Index";
                }

            });
        }

        //��ס����
        var setCookie = function (loginCode, pwd) { //����cookie
            if ($("input[name='remember']").parent().hasClass("checked")) { //�ж��Ƿ�ѡ���ˡ���ס���롱��ѡ��
                $.cookie("txtaccount", loginCode, { expires: 7 });//����jquery.cookie.js�еķ�������cookie�е��û���
                //$.cookie("pwd", base64Encode(pwd), { expires: 7 });//����jquery.cookie.js�еķ�������cookie�еĵ�½���룬��ʹ��base64���м���
                $.cookie("pwd", pwd, { expires: 7 });
               
            } else {
                $.cookie("pwd", pwd, { expires: -1});
               
            }
        }
        var getCookie = function () { //��ȡcookie
            var loginCode = $.cookie("txtaccount"); //��ȡcookie�е��û���
            var pwd = $.cookie("pwd"); //��ȡcookie�еĵ�½����
            if (pwd) {//������ڵĻ��ѡ���ס�û��������롱��ѡ��ѡס
                //$("input[name='remember']").attr("checked", "true");
                $("input[name='remember']").parent().addClass("checked");
                
            }
            if (loginCode) {//�û������ڵĻ����û�����䵽�û����ı���
                $("input[name='username']").val(loginCode);
            }
            if (pwd) {//������ڵĻ���������䵽�����ı���
                //����ȫ
                //$("#txtpassword").val(base64Decode(pwd));
                $("input[name='password']").val(pwd);
            }
        }

        $('.login-form input').keypress(function (e) {
            if (e.which == 13) {
                if ($('.login-form').validate().form()) {
                   //form validation success, call ajax form submit
                    login();
                }
                return false;
            }
        });
        getCookie();//��ס����
    }

    var handleForgetPassword = function () {
        $('.forget-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                email: {
                    required: true,
                    email: true
                }
            },

            messages: {
                email: {
                    required: "Email �Ǳ����ֶ�."
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit   

            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function (form) {
                //form.submit();
                $('.forget-form .btn-success').trigger(onclick);
            }
        });
      

        $('.forget-form .btn-success').click(function () {
            if ($(".forget-form").valid()) {
                $.ajax({
                    url: "Login/SendEmail",
                    type: "post",
                    data: $(".forget-form").serialize(),
                    success: function (result) {
                        alert(result);
                        //window.location = "Login/Index";
                    },
                    error: function (result) {
                        alert(result);
                    }
                });
            }
            return false;
        });

        $('.forget-form input').keypress(function (e) {
            if (e.which == 13) {
                if ($('.forget-form').validate().form()) {
                    //$('.forget-form').submit();
                    $('.forget-form .btn-success').trigger(onclick);
                }
                return false;
            }
        });

        jQuery('#forget-password').click(function () {
            jQuery('.login-form').hide();
            jQuery('.forget-form').show();
        });

        jQuery('#back-btn').click(function () {
            jQuery('.login-form').show();
            jQuery('.forget-form').hide();
        });

    }

    var handleRegister = function () {

        function format(state) {
            if (!state.id) return state.text; // optgroup
            return "<img class='flag' src='../../assets/global/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
        }

        if (jQuery().select2) {
            $("#select2_sample4").select2({
                placeholder: '<i class="fa fa-map-marker"></i>&nbsp;Select a Country',
                allowClear: true,
                formatResult: format,
                formatSelection: format,
                escapeMarkup: function (m) {
                    return m;
                }
            });


            $('#select2_sample4').change(function () {
                $('.register-form').validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
            });
        }

        $(".register-form").attr("action", "Login/Register").attr("method", "post");

        $('.register-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {

                fullname: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                address: {
                    required: true
                },
                country: {
                    required: true
                },

                username: {
                    required: true
                },
                password: {
                    required: true
                },
                rpassword: {
                    equalTo: "#register_password"
                },

                tnc: {
                    required: true
                }
            },

            messages: { // custom messages for radio buttons and checkboxes
                tnc: {
                    required: "����շ�������"
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit   

            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
                    error.insertAfter($('#register_tnc_error'));
                } else if (element.closest('.input-icon').size() === 1) {
                    error.insertAfter(element.closest('.input-icon'));
                } else {
                    error.insertAfter(element);
                }
            },

            submitHandler: function (form) {
                form.submit();
            }
        });

        $('.register-form input').keypress(function (e) {
            if (e.which == 13) {
                if ($('.register-form').validate().form()) {
                    $('.register-form').submit();
                }
                return false;
            }
        });

        jQuery('#register-btn').click(function () {
            jQuery('.login-form').hide();
            jQuery('.register-form').show();
        });

        jQuery('#register-back-btn').click(function () {
            jQuery('.login-form').show();
            jQuery('.register-form').hide();
        });
    }

    return {
        //main function to initiate the module
        init: function () {

            handleLogin();
            handleForgetPassword();
            handleRegister();

        }

    };

}();