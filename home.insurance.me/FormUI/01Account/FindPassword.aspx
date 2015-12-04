<%@ Page Title="" Language="C#" MasterPageFile="~/FormUI/Shared/Main.Master" AutoEventWireup="true" CodeBehind="FindPassword.aspx.cs" Inherits="home.insurance.cn.FormUI._01Account.FindPasword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="f-wrap01">
        <form action="#">
            <div class="f-form-title f-form-title-01">
                <div class="f-form-register-tips">已有账号？<a href="http://local.testxdf.cn/insurance.me/FormUI/Home">立即登录</a></div>
                注册云之保
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>手机号码：</label>
                <span class="f-form-content">
                    <input type="text" style="width: 250px;" value="" />
                    <span class="f-form-tips-gray">11位手机号</span>
                    <span class="f-form-tips">请输入正确手机号</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>验证码：</label>
                <span class="f-form-content">
                    <input type="text" style="width: 120px;" value="" />
                    <span class="f-form-tips-gray">获取短信验证码</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>密码：</label>
                <span class="f-form-content">
                    <input type="text" style="width: 250px;" value="" />
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>姓名：</label>
                <span class="f-form-content">
                    <input type="text" style="width: 250px;" value="" />
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label"><i>*</i>所在地区：</label>
                <span class="f-form-content">
                    <select>
                        <option>请选择</option>
                    </select>
                    <select>
                        <option>请选择</option>
                    </select>
                    <select>
                        <option>请选择</option>
                    </select>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">&nbsp;</label>
                <span class="f-form-content">
                    <input type="checkbox">
                    <a href="#">同意云之保网协议</a>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">&nbsp;</label>
                <span class="f-form-content">
                    <input type="submit" value="立即注册" class="f-form-submit">
                </span>
            </div>
        </form>
    </div>


</asp:Content>
