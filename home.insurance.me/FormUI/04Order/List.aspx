<%@ Page Title="" Language="C#" MasterPageFile="~/FormUI/Shared/Main.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="home.insurance.cn.FormUI._04Order.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="f-wrap02">
        <ul class="f-tab clearfix">
            <li class="current"><a href="List.aspx?status=1">全部订单</a><asp:Literal ID="Literal1" runat="server"></asp:Literal></li>
            <li><a href="List.aspx?status=2">未支付</a></li>
            <li><a href="List.aspx?status=3">已支付</a></li>
        </ul>
        <div class="B-ui-table-ext01">
            <table class="B-ui-table B-ui-table-thead-center B-ui-table-tbody-center B-ui-table-ext01-thead-fef8f2">
                <thead>
                    <tr>
                        <th>
                            <div class="B-ui-table-ext">创建时间</div>
                        </th>
                        <th>
                            <div class="B-ui-table-ext">订单号</div>
                        </th>
                        <th>
                            <div class="B-ui-table-ext">险种</div>
                        </th>
                        <th>
                            <div class="B-ui-table-ext">状态</div>
                        </th>
                        <th>
                            <div class="B-ui-table-ext">金额(元)</div>
                        </th>
                    </tr>
                </thead>
                <tbody>

                    <asp:Repeater ID="rpOrderList" runat="server">

                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="B-ui-table-ext"><%# Eval("CreateTime") %></div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext"><%# Eval("Code") %></div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">待定</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext"><%# Eval("Status") %></div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext"><%# Eval("PaidAmount") %></div>
                                </td>
                            </tr>
                        </ItemTemplate>

                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>


</asp:Content>
