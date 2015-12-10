<%@ Page Title="" Language="C#" MasterPageFile="~/FormUI/Shared/Main.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="home.insurance.cn.FormUI._04Order.List" %>
<%@ Import Namespace="I.Utility.Extensions" %>
<%@ Import Namespace="home.insurance.cn.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="f-wrap02">
        <ul class="f-tab clearfix" id="orderTab">
            <li><a href="List.aspx?status=0">全部订单</a><asp:Literal ID="Literal1" runat="server"></asp:Literal></li>
            <li><a href="List.aspx?status=1">未支付</a></li>
            <li><a href="List.aspx?status=2">已支付</a></li>
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
                                    <div class="B-ui-table-ext"><%# Eval("OrderCode") %></div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext"><%# Eval("ProductName") %></div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">                                          
                                        <%#((EnumOrderStatus)Convert.ToInt32( Eval("Status"))).GetAttachedData(EnmuRemark.Text) %>                                                                                                                                         
                                    </div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext"><%# Eval("OrderAmount") %></div>
                                </td>
                            </tr>
                        </ItemTemplate>

                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            var status = "<%= status%>";
            
            switch (status) {
                case "0": $($("#orderTab").find("li")[0]).addClass("current");break;
                case "1": $($("#orderTab").find("li")[1]).addClass("current"); break;
                case "2": $($("#orderTab").find("li")[2]).addClass("current"); break;
            }
        });
        
    </script>

</asp:Content>
