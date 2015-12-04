using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;

using I.Utility.Helper;

namespace home.insurance.cn.Data
{
    public class Util
    {

        public void SendSMS(string templateId,string mobile,string[] content)
        {
            var ret = string.Empty;
            var api = new CCPRestSDK.CCPRestSDK();
            var isInit = api.init(this.SMS_SiteUrl, this.SMS_SitePort);

            api.setAppId(this.SMS_AppID);
            api.setAccount(this.SMS_Account, this.SMS_AccountPassword);

            try
            {
                if (isInit)
                {
                    Dictionary<string, object> retData = api.SendTemplateSMS(mobile, templateId, content);
                    ret = GetDictionaryData(retData);
                }
                else
                {
                    LogHelper.Info("连接短信服务器失败！");
                }
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }
        }

        public void SendRegisteSMS(string mobile,string[] content)
        {
            this.SendSMS(this.SMS_RegisteTemplateID, mobile, content);
        }

        string GetDictionaryData(Dictionary<string, object> data)
        {
            string ret = null;
            foreach (KeyValuePair<string, object> item in data)
            {
                if (item.Value != null && item.Value.GetType() == typeof(Dictionary<string, object>))
                {
                    ret += item.Key.ToString() + "={";
                    ret += GetDictionaryData((Dictionary<string, object>)item.Value);
                    ret += "};";
                }
                else
                {
                    ret += item.Key.ToString() + "=" + (item.Value == null ? "null" : item.Value.ToString()) + ";";
                }
            }
            return ret;
        }

        string SMS_RegisteTemplateID
        {
            get
            {
                return ConfigurationManager.AppSettings["SMS_RegisteTemplateID"];
            }
        }

        string SMS_Account
        {
            get
            {
                return ConfigurationManager.AppSettings["SMS_Account"];
            }
        }

        string SMS_AccountPassword
        {
            get
            {
                return ConfigurationManager.AppSettings["SMS_AccountPassword"];
            }
        }

        string SMS_SiteUrl
        {
            get
            {
                return ConfigurationManager.AppSettings["SMS_SiteUrl"];
            }
        }

        string SMS_SitePort
        {
            get
            {
                return ConfigurationManager.AppSettings["SMS_SitePort"];
            }
        }

        string SMS_AppID
        {
            get
            {
                return ConfigurationManager.AppSettings["SMS_AppID"];
            }
        }

        public string ApiUrl
        {
            get
            {
                return ConfigurationManager.AppSettings["ApiUrl"];
            }
        }


        public string ApiKey
        {
            get
            {
                return ConfigurationManager.AppSettings["ApiKey"];
            }
        }


        public string ApiChannelId
        {
            get
            {
                return ConfigurationManager.AppSettings["ApiChannelId"];
            }
        }
    }

    

   
 
}
