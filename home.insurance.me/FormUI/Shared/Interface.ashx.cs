using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Caching;

using X3;
using I.Utility.Helper;
using home.insurance.cn.Data;


namespace home.insurance.cn.FormUI.Shared
{
    /// <summary>
    /// Interface 的摘要说明
    /// </summary>
    public class Interface : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            var action = context.Request["action"];

            var service = new Repository();
            var content = string.Empty;
            var logInfo = string.Empty;
            var mobile = string.Empty;

            switch (action)
            {
                case "GetUserByMobile":
                    mobile = context.Request["mobile"];

                    var num = service.GetUserInfoByMobile(mobile, UtilX3.GetRealIP());
                    content = num.ToString();
                    logInfo = "interface GetUserByMobile --- mobile : {0} , Time : {1}, result : {2}";

                    LogHelper.Info(string.Format(content, mobile, DateTime.Now, num));

                    break;
                case "checkSMS":
                    mobile = context.Request["mobile"];
                    var sms = context.Request["sms"];

                    var result = false;
                    var _key = "SendSMS-Mobile-" + mobile;
                    try
                    {
                        var sendMessage = context.Cache.Get(_key);
                        if (sendMessage != null)
                        {
                            result = sms.ToString() == sendMessage.ToString();
                        }
                    }
                    catch(Exception error)
                    {
                        LogHelper.AppError(error.Message);
                    }

                    content = result ? "1" : "0";
                    logInfo = "interface checkSMS --- mobile : {0} ,sms ： {1}, Time : {2}, result : {3}";

                    LogHelper.Info(string.Format(logInfo, mobile, sms, DateTime.Now, content));

                    break;
                case "sendSMS":
                    mobile = context.Request["mobile"];

                    var random = new Random();
                    var _num = random.Next(1000, 9999);
                    var _sms = _num.ToString();

                    try
                    {
                        //new Util().SendRegisteSMS(mobile, new string[] { _sms, "5" });

                        content = "1";
                        var key = "SendSMS-Mobile-" + mobile;
                        context.Cache.Insert(key, _sms, null, DateTime.Now.AddMinutes(5), new TimeSpan(0), CacheItemPriority.Normal, null);
                    }
                    catch (Exception error)
                    {
                        content = "0";
                        LogHelper.AppError(error.Message);
                    }

                    logInfo = "interface sendSMS --- mobile : {0} ,sms ： {1}, Time : {2}, result : {3}";

                    LogHelper.Info(string.Format(logInfo, mobile, _sms, DateTime.Now, 0));

                    break;
                case "createOrder":
                    mobile = context.Request["mobile"];


                    logInfo = "interface createOrder --- mobile : {0} ,sms ： {1}, Time : {2}, result : {3}";

                    //LogHelper.Info(string.Format(logInfo, mobile, _sms, DateTime.Now, 0));

                    break;
                default:
                    break;
            }

            context.Response.ContentType = "text/json;charset=UTF-8;";
            context.Response.Write(content);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}