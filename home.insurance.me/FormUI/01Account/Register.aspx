<%@ Page Title="" Language="C#" MasterPageFile="~/FormUI/Shared/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="home.insurance.cn.FormUI._01Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="f-wrap01">
        <form id="form1" runat="server">
            <div class="f-form-title f-form-title-01">
                <div class="f-form-register-tips">已有账号？<a href="http://local.testxdf.cn/insurance.me/FormUI/Home">立即登录</a></div>
                注册云之保
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>手机号码：</label>
                <span class="f-form-content">
                    <asp:TextBox ID="txtPhone" runat="server" Width="250px" data-flag="phone" MaxLength="11"></asp:TextBox>
                    <span class="f-form-tips-gray">11位手机号</span>
                    <span class="f-form-tips" style="display:none" id="mobile-tips">请输入正确手机号</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>验证码：</label>
                <span class="f-form-content">
                    <asp:TextBox ID="txtSMSCode" runat="server" Width="120px" data-flag="sms" MaxLength="4"></asp:TextBox>
                    <span class="f-form-tips-gray">获取短信验证码</span>
                    <span class="f-form-tips" style="display:none" id="sms-tips">请输入正确验证码</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>密码：</label>
                <span class="f-form-content">
                    <asp:TextBox ID="txtPassword" runat="server" Width="250px" data-flag="password" MaxLength="20"></asp:TextBox>
                </span>
                <span class="f-form-tips" style="display:none" id="passowrd-tips">请输入正确密码</span>
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>姓名：</label>
                <span class="f-form-content">
                    <asp:TextBox ID="txtName" runat="server" Width="250px" data-flag="name" MaxLength="6"></asp:TextBox>
                </span>
                <span class="f-form-tips" style="display:none" id="name-tips">请输入正确姓名</span>
            </div>
            <%--        <div class="f-form">
            <label class="f-form-label"><i>*</i>所在地区：</label>
            <span class="f-form-content">
                <select><option>请选择</option></select>
                <select><option>请选择</option></select>
                <select><option>请选择</option></select>
            </span>
        </div>--%>
            <div class="f-form">
                <label class="f-form-label">&nbsp;</label>
                <span class="f-form-content">
                    <asp:CheckBox ID="ckAgree" runat="server" data-flag="agree" />
                    <a href="#">同意云之保网协议</a>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">&nbsp;</label>
                <span class="f-form-content">
                    <asp:Button ID="btnRegister" runat="server" Text="立即注册" CssClass="f-form-submit" OnClick="btnRegister_Click" OnClientClick="return checkPage ();" />
                </span>
            </div>
        </form>
    </div>



    <script type="text/javascript">
        var domain = "http://local.testxdf.cn/insurance.me";
        var url = "/FormUI/Shared/Interface.ashx";

        //check page
        function checkPage () {
            var name = $("input[data-flag='name']").val().trim();
            var mobile = $("input[data-flag='phone']").val().trim();
            var password = $("input[data-flag='password']").val().trim();
            
            if (mobile.length != 11 || name.length == 0 || password.length < 6 ) {
                $("#mobile-tips").text("请检查手机号码！");
                $("#mobile-tips").fadeIn();

                $("#passowrd-tips").text("密码长度应大于6位，请检查密码！");
                $("#passowrd-tips").fadeIn();

                $("#name-tips").text("请检查姓名！");
                $("#name-tips").fadeIn();

                return false;
            }

            $("input[data-flag='phone']").removeAttr("disabled");
            $("input[data-flag='sms']").removeAttr("disabled");

            return true;
        }

        //send sms
        $(".f-form-tips-gray").click(function () {
            $("#sms-tips").fadeOut();

            var mobile = $("input[data-flag='phone']").val().trim();
            var parameters = "?action=sendSMS&mobile=" + mobile ;

            $.getJSON(domain + url + parameters, function (json) {
                if (json > 0) {
                    $("#sms-tips").fadeIn();
                    $("#sms-tips").text("验证码已发送，请输入验证码！");
                }
            });
        });

        //check sms
        $("input[data-flag='sms']").blur(function () {
            var mobile = $("input[data-flag='phone']").val().trim();
            var sms = $("input[data-flag='sms']").val().trim();

            var parameters = "?action=checkSMS&mobile=" + mobile + "&sms=" + sms;

            $.getJSON(domain + url + parameters, function (json) {
                if (json > 0) {
                    $("#sms-tips").fadeOut();

                    $("input[data-flag='phone']").attr("disabled", "disabled");
                    $("input[data-flag='sms']").attr("disabled", "disabled");

                    $("input[data-flag='name']").removeAttr("disabled");
                    $("input[data-flag='password']").removeAttr("disabled");
                    $("input[data-flag='agree']").removeAttr("disabled");
                }
                else {
                    $("#sms-tips").fadeIn();
                    $("#sms-tips").text("验证码不正确！");
                }
            });
        });

        //check mobile
        $("input[data-flag='phone']").blur(function () {
            $("#mobile-tips").fadeOut();

            var mobile = $("input[data-flag='phone']").val().trim();
            if (mobile.length == 11) {
                var parameters = "?action=GetUserByMobile&mobile=" + mobile;

                $.getJSON(domain + url + parameters, function (json) {
                    if (json > 0) {
                        $("#mobile-tips").text("手机号码已注册，请核实手机号！");
                        $("#mobile-tips").fadeIn();
                    }
                    else{
                        $(".f-form-tips-gray").removeAttr("disabled");
                        $("input[data-flag='sms']").removeAttr("disabled");
                    }
                });
            }
            else {
                $("#mobile-tips").text("请检查手机号码！");
                $("#mobile-tips").fadeIn();
            }
        });

        //check password
        $("input[data-flag='password']").blur(function () {
            $("#passowrd-tips").fadeOut();

            var password = $("input[data-flag='password']").val().trim();

            if ( password.length < 6) {
                $("#passowrd-tips").text("密码长度应大于6位，请检查密码！");
                $("#passowrd-tips").fadeIn();
            }
        });

        //check name
        $("input[data-flag='name']").blur(function () {
            $("#name-tips").fadeOut();

            var name = $("input[data-flag='name']").val().trim();

            if (name.length == 0) {
                $("#name-tips").text("请输入名称！");
                $("#name-tips").fadeIn();
            }
        });

        $(document).ready(function () {
            $(".f-form-tips-gray").attr("disabled", "disabled");

            $("input[data-flag='sms']").attr("disabled", "disabled");
            $("input[data-flag='name']").attr("disabled", "disabled");
            $("input[data-flag='password']").attr("disabled", "disabled");
            $("input[data-flag='agree']").attr("disabled", "disabled");
        });

    </script>

</asp:Content>
