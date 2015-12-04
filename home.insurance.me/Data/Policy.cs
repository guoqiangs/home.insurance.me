using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;
namespace home.insurance.cn.Data
{
    /// <summary>
    /// 被保险人信息
    /// </summary>
    public class InsuredInfo
    {
        public string AccountName { get; set; }
        public string Address { get; set; }
        public int Age { get; set; }
        public string Bank { get; set; }
        public List<Beneficiary> Beneficiarys { get; set; }
        public string Birthday { get; set; }        
        public string CreditLevel { get; set; }
        public string EName { get; set; }
        public string Email { get; set; }         
        public string IdentifyNumber { get; set; }
        public string IdentifyType { get; set; }
        public string InsuredName { get; set; }
        public string LicenseNo { get; set; }
        public string LinkerName { get; set; }
        public string LinkerTel { get; set; }       
        public string LocalPolicStation { get; set; }
        public string Mobile { get; set; }
        public string OccupationCode { get; set; }
        public string School { get; set; }
        public string Sex { get; set; }
        public string TelPhone { get; set; }       
               
    }
    /// <summary>
    /// 受益人信息
    /// </summary>
    public class Beneficiary
    {
        public int Age { get; set; }
        public string BeneficiaryName { get; set; }
        public string BenefitRate { get; set; }
        public string Birthday { get; set; }
        public string EName { get; set; }
        public string Email { get; set; }
        public string IdentifyNumber { get; set; }
        public string IdentifyType { get; set; }
        public string Mobile { get; set; }
        public string Sex { get; set; }
        public string TelPhone { get; set; }
         
    }

    /// <summary>
    /// 投保认订单信息
    /// </summary>
    public class PolicyOrder
    {
        public string DomainOrderId { get; set; }
        public string EndDate { get; set; }
        public string EndTime { get; set; }
        public string IdentifyNumber { get; set; }
        public string IdentifyType { get; set; }
        public List<InsuredInfo> InsuredInfos { get; set; }
        public string Mobile { get; set; }
        public string OperateDate { get; set; }
        public decimal PersonalAmount { get; set; }
        public decimal PersonalPremium { get; set; }
        public string PlanId { get; set; }
        public int PolicyType { get; set; }
        public string PolicyholderName { get; set; }
        public string ProductId { get; set; }
        public int ProposalNum { get; set; }
        public int RationCount { get; set; }
        public string SendSMS { get; set; }
        public string Sex { get; set; }
        public string StartDate { get; set; }
        public string StartTime { get; set; }
        public decimal SumAmount { get; set; }
        public decimal SumPremium { get; set; }
        public string TelPhone { get; set; }
     
    

       
    }

    /// <summary>
    /// 投保业务类
    /// </summary>
    public static class Policy
    {
        public static string Do()
        {
            PolicyOrder order = new PolicyOrder();


            order.DomainOrderId = "OR" + DateTime.Now.ToString("yyyyMMddHmmss");//渠道订单号
            order.PolicyType = 1;//保单类型
            order.ProductId = "10067";
            order.PlanId = "EJP001";
            order.OperateDate = DateTime.Now.ToString("yyyy-MM-dd H:mm:ss");
            order.StartDate = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            order.StartTime = DateTime.Now.AddDays(1).ToString("HH:mm");
            order.EndDate = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            order.EndTime = DateTime.Now.AddDays(1).ToString("HH:mm");
            order.ProposalNum = 1;//投保人数
            order.RationCount = 1;//投保分数
            order.PersonalAmount = 1000M;//每人每份保额
            order.PersonalPremium = 19.9M;//每人每份保费
            order.SumAmount = 1000M;
            order.SumPremium = 19.9M;
            order.PolicyholderName = "投保人";
            order.IdentifyType = "01";
            order.IdentifyNumber = "410423198611127350";
            order.Sex = "1";
            order.TelPhone = "01060908880";
            order.SendSMS = "Y";
            order.Mobile = "15210087900";
           

            InsuredInfo _insuredInfo = new InsuredInfo();

            #region InsuredInfo 
            _insuredInfo.InsuredName = "被保险人";
            _insuredInfo.IdentifyType = "01";
            _insuredInfo.IdentifyNumber = "410423198611127350";
            _insuredInfo.Address = "北京市";
            _insuredInfo.TelPhone = "01060908889";
            _insuredInfo.EName = "bbxr";
            _insuredInfo.Mobile = "15210087919";
            _insuredInfo.Email = "guoqiangs@163.com";
            _insuredInfo.Sex = "1";
            _insuredInfo.Birthday = "1986-11-12";
            _insuredInfo.Bank = "中国招商银行";
            _insuredInfo.AccountName = "被保险人";
            _insuredInfo.Age = 20 ;
            _insuredInfo.LinkerName = "";
            _insuredInfo.LinkerTel = "";
            _insuredInfo.LicenseNo = "";
            _insuredInfo.School = "";
            _insuredInfo.LocalPolicStation = "";
            _insuredInfo.OccupationCode = "";
            _insuredInfo.CreditLevel = "";            

            Beneficiary _beneficiary = new Beneficiary();
            _beneficiary.Age = 20;
            _beneficiary.BeneficiaryName = "受益人";
            _beneficiary.BenefitRate = "1";//如果一个被保险人有多个受益人，则多个受益人的受益份额之和应该等于1
            _beneficiary.Birthday = "1990-1-1";
            _beneficiary.EName = "syr";
            _beneficiary.Email = "guoqiangs@163.com";
            _beneficiary.IdentifyNumber = "410423198611127350";
            _beneficiary.IdentifyType = "01";
            _beneficiary.Mobile = "15210087900";
            _beneficiary.Sex = "1";
            _beneficiary.TelPhone = "01060900000";

            _insuredInfo.Beneficiarys = new List<Beneficiary> { _beneficiary };
            
            #endregion

            order.InsuredInfos = new List<InsuredInfo>() { _insuredInfo };

            var result = new PolicyApi().insuredHAInsurance(order);           

            return result;
        }
        /// <summary>
        /// 投保
        /// </summary>
        /// <param name="ordercode"></param>
        /// <returns></returns>
        public static ResultData Do(string ordercode)
        {
            ResultData resultData = new ResultData();

            var service = new Repository();
            Order_BaseInfo baseOrder = service.GetOrderByCode(ordercode);

            if (baseOrder.Status == (int)EnumOrderStatus.Success)
            {
                resultData.Status = 1;
                return resultData;
            }

            if (baseOrder.Status != (int)EnumOrderStatus.Paid)
            {
                resultData.Status = 0;
                resultData.Data = baseOrder.Status;
                resultData.Error = "未支付";
                return resultData;
            }

            var policyOrder = baseOrder.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault();

            PolicyOrder order = new PolicyOrder();

            #region PolicyOrder
            order.DomainOrderId = baseOrder.Code;
            order.PolicyType = policyOrder.PolicyType.Value;
            order.ProductId = policyOrder.ProductId;
            order.PlanId = policyOrder.PlanId;
            order.OperateDate = policyOrder.OperateDate.Value.ToString("yyyy-MM-dd H:mm:ss");
            order.StartDate = policyOrder.StartDate.Value.ToString("yyyy-MM-dd");
            order.StartTime = policyOrder.StartDate.Value.ToString("HH:mm");
            order.EndDate = policyOrder.EndDate.Value.ToString("yyyy-MM-dd");
            order.EndTime = policyOrder.EndDate.Value.ToString("HH:mm");
            order.ProposalNum = policyOrder.ProposalNum.Value;//投保人数
            order.RationCount = policyOrder.RationCount.Value;//投保分数
            order.PersonalAmount = policyOrder.PersonalAmount.Value;//每人每份保额
            order.PersonalPremium = policyOrder.PersonalPremium.Value;//每人每份保费
            order.SumAmount = policyOrder.SumAmount.Value ;
            order.SumPremium = policyOrder.SumPremium.Value;
            order.PolicyholderName = policyOrder.PolicyholderName;
            order.IdentifyType = policyOrder.IdentifyType;
            order.IdentifyNumber = policyOrder.IdentifyNumber;
            order.Sex = policyOrder.Sex;
            order.TelPhone = policyOrder.TelPhone;
            order.SendSMS = policyOrder.SendSMS;
            order.Mobile = policyOrder.Mobile;


            var insuredInfoListFromSource = policyOrder.Order_InsuredPerson.ToList();
            var insuredInfoList = new List<InsuredInfo>();

            foreach (var item in insuredInfoListFromSource)
            {
                InsuredInfo _insuredInfo = new InsuredInfo();

                #region InsuredInfo 

                _insuredInfo.InsuredName = item.InsuredName;
                _insuredInfo.IdentifyType = item.IdentifyType;
                _insuredInfo.IdentifyNumber = item.IdentifyNumber;
                _insuredInfo.Address = item.Address;
                _insuredInfo.TelPhone = item.TelPhone;
                _insuredInfo.EName = item.EName;
                _insuredInfo.Mobile = item.Mobile;
                _insuredInfo.Email = item.Email;
                _insuredInfo.Sex = item.Sex;
                _insuredInfo.Birthday = item.Birthday;
                _insuredInfo.Bank = item.Bank;
                _insuredInfo.AccountName = item.AccountName;
                _insuredInfo.Age = item.Age.Value;
                _insuredInfo.LinkerName = "";
                _insuredInfo.LinkerTel = "";
                _insuredInfo.LicenseNo = "";
                _insuredInfo.School = "";
                _insuredInfo.LocalPolicStation = "";
                _insuredInfo.OccupationCode = "";
                _insuredInfo.CreditLevel = "";

                var beneficiaryListFromSource = item.Order_Beneficiary.ToList();
                var beneficiaryList = new List<Beneficiary>();
               

                foreach (var info in beneficiaryListFromSource)
                {
                    Beneficiary _beneficiary = new Beneficiary();

                    #region Beneficiary
                    _beneficiary.Age = info.Age.Value;
                    _beneficiary.BeneficiaryName = info.BeneficiaryName;
                    _beneficiary.BenefitRate = info.BenefitRate.ToString();//如果一个被保险人有多个受益人，则多个受益人的受益份额之和应该等于1
                    _beneficiary.Birthday = info.Birthday;
                    _beneficiary.EName = info.EName;
                    _beneficiary.Email = info.Email;
                    _beneficiary.IdentifyNumber = info.IdentifyNumber;
                    _beneficiary.IdentifyType = info.IdentifyType;
                    _beneficiary.Mobile = info.Mobile;
                    _beneficiary.Sex = info.Sex;
                    _beneficiary.TelPhone = info.TelPhone;
                    #endregion

                    beneficiaryList.Add(_beneficiary);
                }
                                
                _insuredInfo.Beneficiarys = beneficiaryList;

                #endregion

                insuredInfoList.Add(_insuredInfo);
            }

            order.InsuredInfos = insuredInfoList;

            #endregion

            var result = new PolicyApi().insuredHAInsurance(order);


            JObject json = (JObject)JsonConvert.DeserializeObject(result);
          
            var responseCode = json["RESPONSECODE"].ToString();
            var responseContent = json["RESPONSECONTENT"].ToString();

            if (responseCode == "000000")
            {
                resultData.Status = 1;
            }
            else
            {
                resultData.Status = 0;
                resultData.Error = responseContent;
            }

            return resultData;
        }
    }
}