using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using home.insurance.cn.Data;

namespace home.insurance.cn.FormUI._04Order
{
    public partial class EditOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region 页面数据构造对象

            ////获取当前登录者ID
            //int memberID = 5;
            //var orderCode = "OR" + DateTime.Now.ToString("yyyyMMddHmmss");//渠道订单号

            //var beneficiary = new Order_Beneficiary();
            //#region beneficiary
            //beneficiary.Age = 20;
            //beneficiary.BeneficiaryName = "受益人";
            //beneficiary.BenefitRate = 1;//如果一个被保险人有多个受益人，则多个受益人的受益份额之和应该等于1
            //beneficiary.Birthday = "1990-1-1";
            //beneficiary.EName = "syr";
            //beneficiary.Email = "guoqiangs@163.com";
            //beneficiary.IdentifyNumber = "410423198611127350";
            //beneficiary.IdentifyType = "01";
            //beneficiary.Mobile = "15210087900";
            //beneficiary.Sex = "1";
            //beneficiary.TelPhone = "01060900000";
            //#endregion

            //var insuredInfo = new Order_InsuredPerson();
            //#region InsuredInfo 
            //insuredInfo.InsuredName = "被保险人";
            //insuredInfo.IdentifyType = "01";
            //insuredInfo.IdentifyNumber = "410423198611127350";
            //insuredInfo.Address = "北京市";
            //insuredInfo.TelPhone = "01060908889";
            //insuredInfo.EName = "bbxr";
            //insuredInfo.Mobile = "15210087919";
            //insuredInfo.Email = "guoqiangs@163.com";
            //insuredInfo.Sex = "1";
            //insuredInfo.Birthday = "1986-11-12";
            //insuredInfo.Bank = "中国招商银行";
            //insuredInfo.AccountName = "被保险人";
            //insuredInfo.Age = 20;
            //insuredInfo.Order_Beneficiary = new List<Order_Beneficiary>() { beneficiary };
            //#endregion

            //var policyHolder = new Order_PolicyHolder();
            //#region policyHolder
            //policyHolder.DomainOrderId = orderCode;
            //policyHolder.PolicyType = 1;//保单类型
            //policyHolder.ProductId = "10067";
            //policyHolder.PlanId = "EJP001";
            //policyHolder.OperateDate = DateTime.Now;
            //policyHolder.StartDate = DateTime.Now.AddDays(1);
            //policyHolder.EndDate = DateTime.Now.AddDays(100);
            //policyHolder.ProposalNum = 1;//投保人数
            //policyHolder.RationCount = 1;//投保分数
            //policyHolder.PersonalAmount = 1000M;//每人每份保额
            //policyHolder.PersonalPremium = 19.9M;//每人每份保费
            //policyHolder.SumAmount = 1000M;
            //policyHolder.SumPremium = 19.9M;
            //policyHolder.PolicyholderName = "投保人";
            //policyHolder.IdentifyType = "01";
            //policyHolder.IdentifyNumber = "410423198611127350";
            //policyHolder.Sex = "1";
            //policyHolder.TelPhone = "01060908880";
            //policyHolder.SendSMS = "Y";
            //policyHolder.Mobile = "15210087900";
            //policyHolder.Order_InsuredPerson = new List<Order_InsuredPerson>() { insuredInfo };
            //#endregion

            //var orderitem = new Order_ItemInfo();
            //orderitem.ProductId = "10067";

            //var order = new Order_BaseInfo();
            //order.Code = orderCode;
            //order.CreateMemberID = memberID;
            //order.Channel = 52;
            //order.AmountPayable = 0.01M;
            //order.CreateTime = DateTime.Now;
            //order.Order_ItemInfo = new List<Order_ItemInfo>() { orderitem };
            //order.Order_PolicyHolder = new List<Order_PolicyHolder>() { policyHolder };

            #endregion

            #region 静态数据对象

            //获取当前登录者ID TODO by guoqiangs
            int memberID = 5;

            //TODO by guoqiangs 获取产品Id
            string productId = "10067";
            string productName = "E保交通工具综合保险（贴心保）";

            var orderCode = "OR" + DateTime.Now.ToString("yyyyMMddHmmss");//渠道订单号

            var beneficiary = new Order_Beneficiary();
            #region beneficiary
            beneficiary.Age = 20;
            beneficiary.BeneficiaryName = "受益人";
            beneficiary.BenefitRate = 1;//如果一个被保险人有多个受益人，则多个受益人的受益份额之和应该等于1
            beneficiary.Birthday = "1990-1-1";
            beneficiary.EName = "syr";
            beneficiary.Email = "guoqiangs@163.com";
            beneficiary.IdentifyNumber = "410423198611127350";
            beneficiary.IdentifyType = "01";
            beneficiary.Mobile = "15210087900";
            beneficiary.Sex = "1";
            beneficiary.TelPhone = "01060900000";
            #endregion

            var insuredInfo = new Order_InsuredPerson();
            #region InsuredInfo 
            insuredInfo.InsuredName = "被保险人";
            insuredInfo.IdentifyType = "01";
            insuredInfo.IdentifyNumber = "410423198611127350";
            insuredInfo.Address = "北京市";
            insuredInfo.TelPhone = "01060908889";
            insuredInfo.EName = "bbxr";
            insuredInfo.Mobile = "15210087919";
            insuredInfo.Email = "guoqiangs@163.com";
            insuredInfo.Sex = "1";
            insuredInfo.Birthday = "1986-11-12";
            insuredInfo.Bank = "中国招商银行";
            insuredInfo.AccountName = "被保险人";
            insuredInfo.Age = 20;
            insuredInfo.Order_Beneficiary = new List<Order_Beneficiary>() { beneficiary };
            #endregion

            var policyHolder = new Order_PolicyHolder();
            #region policyHolder
            policyHolder.DomainOrderId = orderCode;
            policyHolder.PolicyType = 1;//保单类型
            policyHolder.ProductId = "10067";
            policyHolder.PlanId = "EJP001";
            policyHolder.OperateDate = DateTime.Now;
            policyHolder.StartDate = DateTime.Now.AddDays(1);
            policyHolder.EndDate = DateTime.Now.AddDays(100);
            policyHolder.ProposalNum = 1;//投保人数
            policyHolder.RationCount = 1;//投保分数
            policyHolder.PersonalAmount = 1000M;//每人每份保额
            policyHolder.PersonalPremium = 19.9M;//每人每份保费
            policyHolder.SumAmount = 1000M;
            policyHolder.SumPremium = 19.9M;
            policyHolder.PolicyholderName = "投保人";
            policyHolder.IdentifyType = "01";
            policyHolder.IdentifyNumber = "410423198611127350";
            policyHolder.Sex = "1";
            policyHolder.TelPhone = "01060908880";
            policyHolder.SendSMS = "Y";
            policyHolder.Mobile = "15210087900";
            policyHolder.Order_InsuredPerson = new List<Order_InsuredPerson>() { insuredInfo };
            #endregion

            var orderitem = new Order_ItemInfo();
            orderitem.ProductId = productId;
            orderitem.ProductName = productName;
            orderitem.AmountPayable = 0.01M;
            orderitem.CreateTime = DateTime.Now;
            orderitem.Order_PolicyHolder = new List<Order_PolicyHolder>() { policyHolder };

            var order = new Order_BaseInfo();
            order.Code = orderCode;
            order.CreateMemberID = memberID;
            order.Channel = 52;
            order.AmountPayable = 0.01M;
            order.CreateTime = DateTime.Now;
            order.Order_ItemInfo = new List<Order_ItemInfo>() { orderitem };           

            #endregion

            try
            {
                var orderId = new Repository().AddOrder(order);

                Response.Redirect("confirm.aspx?ordercode=" + order.Code);
            }
            catch
            {

            }
        }
    }
}