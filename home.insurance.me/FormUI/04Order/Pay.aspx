<%@ Page Title="" Language="C#" MasterPageFile="~/FormUI/Shared/Main.Master" AutoEventWireup="true" CodeBehind="Pay.aspx.cs" Inherits="home.insurance.cn.FormUI._04Order.Pay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <div class="f-wrap01">
            <div class="j-step-wrap">
                <div class="j-step">
                    <div class="j-step-dot j-step-dot-01">填写投保信息</div>
                    <div class="j-step-dot j-step-dot-02">确认投保信息</div>
                    <div class="j-step-dot j-step-dot-03 j-step-current">支付并完成投保</div>
                </div>
            </div>
            <div class="B-ui-table-ext01" style="padding: 0;">
                <table class="B-ui-table B-ui-table-thead-center B-ui-table-tbody-center B-ui-table-ext01-thead-fef8f2">
                    <thead>
                        <tr>
                            <th>
                                <div class="B-ui-table-ext">投保人信息</div>
                            </th>
                            <th>
                                <div class="B-ui-table-ext">险种</div>
                            </th>
                            <th>
                                <div class="B-ui-table-ext">生效日期</div>
                            </th>
                            <th>
                                <div class="B-ui-table-ext">金额(元)</div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="B-ui-table-ext"><%=order.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault().PolicyholderName %></div>
                            </td>
                            <td>
                                <div class="B-ui-table-ext"><%=order.Order_ItemInfo.FirstOrDefault().ProductName %></div>
                            </td>
                            <td>
                                <div class="B-ui-table-ext"><%=order.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault().StartDate.ToString() %></div>
                            </td>
                            <td>
                                <div class="B-ui-table-ext"><%=order.AmountPayable.ToString() %></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="f-bank-title">
                选择支付方式
       
                <span>请您在24小时内完成支付，否则可能需要重新报价</span>
            </div>
            <div class="f-bank clearfix">
                <label>
                    <input type="radio" checked name="bank"><img src="../../Content/images/bank_logo2.gif" /></label>                
            </div>            
            <asp:Button Text="确认支付" CssClass="f-bank-submit" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        </div>
    </form>

</asp:Content>
