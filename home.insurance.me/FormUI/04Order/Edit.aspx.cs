using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

using home.insurance.cn.Data;

namespace home.insurance.cn.FormUI._04Order
{
    public partial class EditOrder : PageBase
    {
        public string id = "";
        public string planId = "";
        public string productId = "";
        public string productName = "";
        public decimal PersonalPremium = 0;
        public decimal PersonalAmount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.CurrentUser == null)
            //    Response.Redirect(ConfigurationManager.AppSettings["SiteUrl"] + "FormUI/Home");

            id = this.Request.QueryString["id"];
            switch (id)
            {
                case "1": {
                        productId = "10067";
                        planId = "EJP001";
                        productName = "E保众筹综合意外保险A";
                        PersonalPremium = 19.90M;
                        PersonalAmount = 500000 + 300000 + 300000 + 500000;
                    }
                    break;
                case "2": {
                        productId = "10067";
                        planId = "EJP002";
                        productName = "E保众筹综合意外保险B";
                        PersonalPremium = 66.00M;
                        PersonalAmount = 100000 + 500000 + 500000 + 500000 + 500000;
                    }
                    break;
                case "3": {
                        productId = "10067";
                        planId = "EJP003";
                        productName = "E保众筹综合意外保险C";
                        PersonalPremium = 99.00M;
                        PersonalAmount = 200000 + 500000 + 600000 + 600000 + 500000;
                    }
                    break;                    
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region 页面数据构造对象

            int memberID = CurrentUser.ID;

            //int memberID = 5;

            byte channel = 52;
            
            int PolicyType = 1;//保单类型

            var orderCode = "OR" + planId + DateTime.Now.ToString("yyyyMMddHmmss");//渠道订单号

            var beneficiary = new Order_Beneficiary();
            #region beneficiary
            //beneficiary.Age = int.Parse(this.txtBeneficiaryAge.Text);
            //beneficiary.BeneficiaryName = this.txtBeneficiaryName.Text;
            //beneficiary.BenefitRate = 1;//如果一个被保险人有多个受益人，则多个受益人的受益份额之和应该等于1
            //beneficiary.Birthday = this.txtBeneficiaryBirthday.Text;
            //beneficiary.EName = this.txtBeneficiaryEName.Text;
            //beneficiary.Email = this.txtBeneficiaryEmail.Text;
            //beneficiary.IdentifyNumber = this.txtBeneficiaryIdentifyNumber.Text;
            //beneficiary.IdentifyType = this.txtBeneficiaryIdentifyType.Text;
            //beneficiary.Mobile = this.txtBeneficiaryMobile.Text;
            //beneficiary.Sex = "";
            //beneficiary.TelPhone = this.txtBeneficiaryTelPhone.Text;
            #endregion

            var insuredInfo = new Order_InsuredPerson();
            #region InsuredInfo 
            insuredInfo.InsuredName = this.txtInsuredName.Text;
            insuredInfo.IdentifyType = "01";
            insuredInfo.IdentifyNumber = this.txtInsuredIdentifyNumber.Text;
            insuredInfo.Address = "";
            insuredInfo.TelPhone = "";
            insuredInfo.EName = "";
            insuredInfo.Mobile = this.txtInsuredMobile.Text;
            insuredInfo.Email = "";
            insuredInfo.Sex = "";
            insuredInfo.Birthday = "";
            insuredInfo.Bank = "";
            insuredInfo.AccountName = "";
            insuredInfo.Age = null;
            insuredInfo.Order_Beneficiary = null;
            #endregion

            var policyHolder = new Order_PolicyHolder();
            #region policyHolder
            policyHolder.DomainOrderId = orderCode;
            policyHolder.PolicyType = PolicyType;//保单类型
            policyHolder.ProductId = productId;
            policyHolder.PlanId = planId;
            policyHolder.OperateDate = DateTime.Now;
            policyHolder.StartDate = DateTime.Parse(this.txtStartDate.Text);
            policyHolder.EndDate = DateTime.Parse(this.txtEndDate.Text);
            policyHolder.ProposalNum = 1;//投保人数
            policyHolder.RationCount = int.Parse(this.txtRationCount.Text);//投保分数
            policyHolder.PersonalAmount = PersonalAmount;//每人每份保额
            policyHolder.PersonalPremium = PersonalPremium;//每人每份保费
            policyHolder.SumAmount = policyHolder.ProposalNum * policyHolder.RationCount * policyHolder.PersonalAmount;
            policyHolder.SumPremium = policyHolder.ProposalNum * policyHolder.RationCount * policyHolder.PersonalPremium;
            policyHolder.PolicyholderName =this.txtPolicyholderName.Text;
            policyHolder.IdentifyType = "01";
            policyHolder.IdentifyNumber = this.txtInsuredIdentifyNumber.Text;

            if (this.radioPolicyholderSexMan.Checked)
                policyHolder.Sex = "1";
            if (this.radioPolicyholderSexFemale.Checked)
                policyHolder.Sex = "2";

            policyHolder.TelPhone = "";
            policyHolder.SendSMS = "N";
            policyHolder.Mobile = this.txtPolicyholderMobile.Text;
            policyHolder.Order_InsuredPerson = new List<Order_InsuredPerson>() { insuredInfo };
            #endregion

            var orderitem = new Order_ItemInfo();
            orderitem.Channel = channel;
            orderitem.PlanId = planId;
            orderitem.ProductId = productId;
            orderitem.ProductName = productName;
            orderitem.AmountPayable = policyHolder.SumPremium;
            orderitem.CreateTime = DateTime.Now;
            orderitem.Order_PolicyHolder = new List<Order_PolicyHolder>() { policyHolder };

            var order = new Order_BaseInfo();
            order.Status = (int)EnumOrderStatus.UnPay;
            order.Code = orderCode;
            order.CreateMemberID = memberID;
            order.Channel = channel;
            order.AmountPayable = policyHolder.SumPremium;
            order.CreateTime = DateTime.Now;
            order.Order_ItemInfo = new List<Order_ItemInfo>() { orderitem };

            #endregion

            #region 静态数据对象

            ////获取当前登录者ID TODO by guoqiangs
            //int memberID = 5;

            ////TODO by guoqiangs 获取产品Id
            //byte channel = 52;
            //string planId = "EJP001";
            //string productId = "10067";
            //string productName = "E保交通工具综合保险（贴心保）";


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
            //policyHolder.ProductId =productId;
            //policyHolder.PlanId = planId;
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
            //orderitem.Channel = channel;
            //orderitem.PlanId = planId;
            //orderitem.ProductId = productId;
            //orderitem.ProductName = productName;
            //orderitem.AmountPayable = 0.01M;
            //orderitem.CreateTime = DateTime.Now;
            //orderitem.Order_PolicyHolder = new List<Order_PolicyHolder>() { policyHolder };

            //var order = new Order_BaseInfo();
            //order.Status = (int)EnumOrderStatus.UnPay;
            //order.Code = orderCode;
            //order.CreateMemberID = memberID;
            //order.Channel = channel;
            //order.AmountPayable = 0.01M;
            //order.CreateTime = DateTime.Now;
            //order.Order_ItemInfo = new List<Order_ItemInfo>() { orderitem };           

            #endregion

            int result = 0;
            try
            {
                result = new Repository().AddOrder(order);                              
            }
            catch(Exception ex)
            {
                I.Utility.Helper.LogHelper.AppError(string.Format("[下单失败]->orderCode={0}&error={1}", order.Code, ex.Message));
                Response.Write("<script>alert('下单失败');</script>");
            }

            if (result > 0)
            {

                Response.Redirect("confirm.aspx?ordercode=" + order.Code);
            }
            else
            {
                Response.Write("<script>alert('下单失败');</script>");
            }
        }
    }
}