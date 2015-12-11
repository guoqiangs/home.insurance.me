<%@ Page Title="" Language="C#" MasterPageFile="~/FormUI/Shared/Main.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="home.insurance.cn.FormUI._04Order.EditOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../Scripts/jquery-ui-1.8.11.min.js"></script>
    <link href="../../Content/jquery.ui.all.css" rel="stylesheet" />
    <script src="../../Scripts/jquery.datepicker.zh-cn.js"></script>

    <script>

        $(function () {
            $('.datepicker').datepicker();
        })

        //只允许输入数字与小数点
        function checkkey(value, e) {
            var key = window.event ? e.keyCode : e.which;
            if ((key > 95 && key < 106) ||
                (key > 47 && key < 60) ||
                (key == 110 && value.indexOf(".") < 0) ||
                (key == 190 && value.indexOf(".") < 0)) {
            } else if (key != 8) {
                if (window.event) //IE
                {
                    e.returnValue = false;   //event.returnValue=false 效果相同.
                }
                else //Firefox
                {
                    e.preventDefault();
                }
            }
        }
    </script>
    <div class="f-wrap01">
        <div class="j-step-wrap">
            <div class="j-step">
                <div class="j-step-dot j-step-dot-01 j-step-current">填写投保信息</div>
                <div class="j-step-dot j-step-dot-02">确认投保信息</div>
                <div class="j-step-dot j-step-dot-03">支付并完成投保</div>
            </div>
        </div>
        <form id="form1" runat="server">
            <div class="f-form-title">投保计划</div>
            <div class="f-form">
                <label class="f-form-label">保险时间：</label>
                <span class="f-form-content" cid="checkspan">                    
                    <asp:TextBox ID="txtStartDate" runat="server" class="datepicker" Width="200px" data-flag='startDate'></asp:TextBox>
                    <i class="ico ico-timeQuan"></i>至
                    
                    <asp:TextBox ID="txtEndDate" runat="server" class="datepicker" Width="200px" data-flag='endDate'></asp:TextBox>
                     <span class="f-form-tips" style="display: none" id="date-tip">请输入保险起始结束日期</span>
                </span>
            </div>


            <div class="f-form-title">投保人信息</div>
            <%--<div class="f-form">
                <label class="f-form-label">保单类型（PolicyType）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtPolicyType" runat="server" Width="250px" data-flag='policyType'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="policyType-tip">请输入保单类型</span>
                </span>
            </div>--%>
            <%--<div class="f-form">
                <label class="f-form-label">投保人数（ProposalNum）：</label>
                <span class="f-form-content">
                    <asp:TextBox ID="txtProposalNum" runat="server" Width="250px"
                        onkeydown="checkkey(this.value,event)"         
                        data-flag='proposalNum'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="proposalNum-tip">请输入投保人数</span>
                </span>
            </div>--%>
            
           <%-- <div class="f-form">
                <label class="f-form-label">每人每份保额（PersonalAmount）：</label>
                <span class="f-form-content">
                    <asp:TextBox ID="txtPersonalAmount" runat="server" Width="250px"
                        onkeydown="checkkey(this.value,event)"
                        data-flag='personalAmount'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="personalAmount-tip">请输入每人每份保额</span>
                </span>
            </div>--%>
            <%-- <div class="f-form">
                <label class="f-form-label">每人每份保费（PersonalPremium）：</label>
                <span class="f-form-content">
                    <asp:TextBox ID="txtPersonalPremium" runat="server" Width="250px"
                        onkeydown="checkkey(this.value,event)"                         
                        data-flag='personalPremium'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="personalPremium-tip">请输入每人每份保费</span>
                </span>
            </div>--%>
            <div class="f-form">
                <label class="f-form-label">投保人姓名：</label>
                <span class="f-form-content" cid="checkspan">
                    <%--<input type="text" style="width: 250px;" value="" />--%>
                    <asp:TextBox ID="txtPolicyholderName" runat="server" Width="250px" data-flag='policyholderName'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="policyholderName-tip">请输入投保人姓名</span>
                </span>
            </div>
            <%--<div class="f-form">
                <label class="f-form-label">投保人证件类型（PolicyholderIdentifyType）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtPolicyholderIdentifyType" runat="server" Width="250px" data-flag='PolicyholderIdentifyType'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="PolicyholderIdentifyType-tip">请输入投保人证件类型</span>
                </span>
            </div>--%>
            <div class="f-form">
                <label class="f-form-label">投保人身份证号码：</label>
                <span class="f-form-content" cid="checkspan">
                    <%--<input type="text" style="width: 250px;" value="" />--%>
                    <asp:TextBox ID="txtPolicyholderIdentifyNumber" runat="server" Width="250px" data-flag='PolicyholderIdentifyNumber'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="PolicyholderIdentifyNumber-tip">请输入投保人身份证号码</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">投保人性别：</label>
                <span class="f-form-content" cid="checkspan">
                    <asp:RadioButton ID="radioPolicyholderSexMan" Text="男" Checked="True"
                        GroupName="radioPolicyholderSex" runat="server" />
                    <asp:RadioButton ID="radioPolicyholderSexFemale" Text="女"
                        GroupName="radioPolicyholderSex" runat="server" />                    
                    <span class="f-form-tips" style="display: none" id="Policyholdersex-tip">请输入投保人性别</span>
                </span>
            </div>
            <%--<div class="f-form">
                <label class="f-form-label">投保人联系电话（PolicyholderTelPhone）：</label>
                <span class="f-form-content">                  
                    <asp:TextBox ID="txtPolicyholderTelPhone" runat="server" Width="250px" data-flag='PolicyholderTelPhone'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="PolicyholderTelPhone-tip">请输入投保人联系电话</span>
                </span>
            </div>--%>
           <%-- <div class="f-form">
                <label class="f-form-label">是否给投保人发短信（SendSMS）：</label>
                <span class="f-form-content">
                    <asp:RadioButton ID="radioSendSMSYes" Text="Y" Checked="True"
                        GroupName="radioSendSMS" runat="server" />
                    <asp:RadioButton ID="radioSendSMSNo" Text="N"
                        GroupName="radioSendSMS" runat="server" />
                    <span class="f-form-tips" style="display: none" id="sendSMS-tip">请选择是否给投保人发短信</span>
                </span>
            </div>--%>
            <div class="f-form">
                <label class="f-form-label">手机号码：</label>
                <span class="f-form-content" cid="checkspan">                    
                    <asp:TextBox ID="txtPolicyholderMobile" runat="server" Width="250px" MaxLength="11" data-flag='PolicyholderMobile'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="PolicyholderMobile-tip">请输入正确手机号</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">投保份数：</label>
                <span class="f-form-content" cid="checkspan">
                    <asp:TextBox ID="txtRationCount" runat="server" Width="250px"
                        onkeydown="checkkey(this.value,event)"
                        data-flag='rationCount'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="rationCount-tip">请输入投保份数</span>
                </span>
            </div>

            <div class="f-form-title">被保险人信息</div>
            <div class="f-form">
                <label class="f-form-label">被保险人姓名：</label>
                <span class="f-form-content" cid="checkspan">
                    <%--<input type="text" style="width: 250px;" value="" />--%>
                    <asp:TextBox ID="txtInsuredName" runat="server" Width="250px" data-flag='InsuredName'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredName-tip">请输入被保险人姓名</span>
                </span>
            </div>
            <%--<div class="f-form">
                <label class="f-form-label">证件类型（InsuredIdentifyType）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtInsuredIdentifyType" runat="server" Width="250px" data-flag='InsuredIdentifyType'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredIdentifyType-tip">请输入证件类型</span>
                </span>
            </div>--%>
            <div class="f-form">
                <label class="f-form-label">身份证号码：</label>
                <span class="f-form-content" cid="checkspan">                    
                    <asp:TextBox ID="txtInsuredIdentifyNumber" runat="server" Width="250px" data-flag='InsuredIdentifyNumber'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredIdentifyNumber-tip">请输入证件号码</span>
                </span>
            </div>
           <%-- <div class="f-form">
                <label class="f-form-label">被保险人地址（InsuredAddress）：</label>
                <span class="f-form-content">                   
                    <asp:TextBox ID="txtInsuredAddress" runat="server" Width="250px" data-flag='InsuredAddress'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredAddress-tip">请输入被保险人地址</span>
                </span>
            </div>--%>
            <%--<div class="f-form">
                <label class="f-form-label">被保险人联系电话（InsuredTelPhone）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtInsuredTelPhone" runat="server" Width="250px" data-flag='InsuredTelPhone'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredTelPhone-tip">请输入被保险人联系电话</span>
                </span>
            </div>--%>
            <%--<div class="f-form">
                <label class="f-form-label">英文名/拼音（InsuredEName）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtInsuredEName" runat="server" Width="250px" data-flag='InsuredEName'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredEName-tip">请输入英文名/拼音</span>
                </span>
            </div>--%>
            <div class="f-form">
                <label class="f-form-label">被保险人手机号：</label>
                <span class="f-form-content" cid="checkspan">
                    <%--<input type="text" style="width: 250px;" value="" />--%>
                    <asp:TextBox ID="txtInsuredMobile" runat="server" Width="250px" data-flag='InsuredMobile'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredMobile-tip">请输入被保险人手机号</span>
                </span>
            </div>
            <%--<div class="f-form">
                <label class="f-form-label">被保险人邮箱（InsuredEmail）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtInsuredEmail" runat="server" Width="250px" data-flag='InsuredEmail'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredEmail-tip">请输入被保险人邮箱</span>
                </span>
            </div>--%>
            <%--<div class="f-form">
                <label class="f-form-label">被保险人性别（InsuredSex）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtInsuredSex" runat="server" Width="250px" data-flag='InsuredSex'></asp:TextBox>
                    <span class="f-form-tips" style="display:none" id="InsuredSex-tip">请输入被保险人性别</span>
                </span>
            </div>--%>
           <%-- <div class="f-form">
                <label class="f-form-label">被保险人生日（InsuredBirthday）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtInsuredBirthday" runat="server" Width="250px" data-flag='InsuredBirthday'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredBirthday-tip">请输入被保险人生日</span>
                </span>
            </div>--%>
            <%--<div class="f-form">
                <label class="f-form-label">开户银行名称（InsuredBank）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtInsuredBank" runat="server" Width="250px" data-flag='InsuredBank'></asp:TextBox>
                    <span class="f-form-tips" style="display:none" id="InsuredBank-tip">请输入开户银行名称</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">银行账户（InsuredAccountName）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtInsuredAccountName" runat="server" Width="250px" data-flag='InsuredAccountName'></asp:TextBox>
                    <span class="f-form-tips" style="display:none" id="InsuredAccountName-tip">请输入银行账户</span>
                </span>
            </div>--%>
           <%-- <div class="f-form">
                <label class="f-form-label">被保险人年龄（InsuredAge）：</label>
                <span class="f-form-content">
                    <asp:TextBox ID="txtInsuredAge" runat="server" Width="250px"
                        onkeypress="if (event.keyCode < 48 || event.keyCode >57) event.returnValue = false;"
                        data-flag='InsuredAge'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="InsuredAge-tip">请输入被保险人年龄</span>
                </span>
            </div>--%>

            <%--<div class="f-form-title">受益人信息 Beneficiary</div>
            <div class="f-form">
                <label class="f-form-label">受益人姓名（BeneficiaryName）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryName" runat="server" Width="250px" data-flag='BeneficiaryName'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryName-tip">请输入受益人姓名</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">受益人证件类型（BeneficiaryIdentifyType）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryIdentifyType" runat="server" Width="250px" data-flag='BeneficiaryIdentifyType'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryIdentifyType-tip">请输入受益人证件类型</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">受益人证件号码（BeneficiaryIdentifyNumber）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryIdentifyNumber" runat="server" Width="250px" data-flag='BeneficiaryIdentifyNumber'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryIdentifyNumber-tip">请输入受益人证件号码</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">受益人联系电话（BeneficiaryTelPhone）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryTelPhone" runat="server" Width="250px" data-flag='BeneficiaryTelPhone'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryTelPhone-tip">请输入受益人联系电话</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">受益人英文名/拼音（BeneficiaryEName）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryEName" runat="server" Width="250px" data-flag='BeneficiaryEName'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryEName-tip">请输入受益人英文名/拼音</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">受益人手机号（BeneficiaryMobile）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryMobile" runat="server" Width="250px" data-flag='BeneficiaryMobile'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryMobile-tip">请输入受益人手机号</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">受益人邮箱（BeneficiaryEmail）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryEmail" runat="server" Width="250px" data-flag='BeneficiaryEmail'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryEmail-tip">请输入受益人邮箱</span>
                </span>
            </div>           
            <div class="f-form">
                <label class="f-form-label">受益人生日（BeneficiaryBirthday）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryBirthday" runat="server" Width="250px" data-flag='BeneficiaryBirthday'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryBirthday-tip">请输入受益人生日</span>
                </span>
            </div>
            <div class="f-form">
                <label class="f-form-label">受益人年龄（BeneficiaryAge）：</label>
                <span class="f-form-content">                    
                    <asp:TextBox ID="txtBeneficiaryAge" runat="server" Width="250px"
                        onkeypress="if (event.keyCode < 48 || event.keyCode >57) event.returnValue = false;"
                        data-flag='BeneficiaryAge'></asp:TextBox>
                    <span class="f-form-tips" style="display: none" id="BeneficiaryAge-tip">请输入受益人年龄</span>
                </span>
            </div>--%>
            
            <div class="f-form">
                <label class="f-form-label">&nbsp;</label>
                <span class="f-form-content">                    
                    <asp:Button ID="btnSave" runat="server" Text="下一步" CssClass="f-form-submit" OnClientClick="return checkInput();"  OnClick="btnSave_Click" />
                </span>
            </div>
        </form>
    </div>

    <script type="text/javascript">


        $(function () {
            $("span[cid='checkspan']").each(function () {
                var input = $(this).find("input").on("keyup", function () {
                    if ($(this).val() == "") {
                        $(this).parent().find("span").show();
                    }
                    else {
                        $(this).parent().find("span").hide();
                    }
                })
                
            })
        });

        function checkInput() {
            var result = true;
            $("span[cid='checkspan']").each(function () {                
                var input = $(this).find("input").val();                
                if (input == "") {
                    $(this).find("span").show();
                    result = false;
                    return false;
                }
            })
            return result;
        };
    </script>

    <script type="text/javascript">
        //check page
        function checkPage() {
            var name = $("input[data-flag='name']").val().trim();
            var mobile = $("input[data-flag='phone']").val().trim();
            var password = $("input[data-flag='password']").val().trim();

            if (mobile.length != 11 || name.length == 0 || password.length < 6) {
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

    </script>
</asp:Content>
