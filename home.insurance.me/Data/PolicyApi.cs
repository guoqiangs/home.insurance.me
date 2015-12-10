using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
using System.Configuration;
using X3;
namespace home.insurance.cn.Data
{
    public class proxyInfo
    {       
        public int ProductId { get; set; }
        public string PlanId { get; set; }
        public string ProposalNum { get; set; }
        public string RationCount { get; set; }
    }

   /// <summary>
   /// 投保接口
   /// </summary>
    public class PolicyApi
    {
        public readonly string postUrl = ConfigurationManager.AppSettings["ApiUrl"];
        public readonly string SIGNKEY = ConfigurationManager.AppSettings["ApiKey"];
        /// <summary>
        /// 接口签名调试
        /// </summary>
        /// <returns></returns>
        public string ApiSignTest()
        {
            //input
            proxyInfo _proxyInfo = new proxyInfo()
            {
                ProductId = 10067,
                PlanId = "EJP001",
                ProposalNum = "1",
                RationCount = "1"
            };
            var input = SortASCToJson(_proxyInfo);

            Dictionary<string, string> param = new Dictionary<string, string>();
            param.Add("METHOD", "priceHAInsurance");
            param.Add("CHANNELID", "522");
            param.Add("INPUT", input);
            param.Add("SIGNTYPE", "1");

            //input = input.Replace("\"[", "[").Replace("]\"", "]").Replace("'", "\"");
            string sign = X3.UtilX3.Md5(input + SIGNKEY);
            param.Add("SIGN", sign);

            var result = X3.WebUtilX3.DoPost(postUrl, param);

           
            return result;
        }

        /// <summary>
        /// 标准投保接口
        /// </summary>
        /// <returns></returns>
        public string insuredHAInsurance(PolicyOrder policyOrder)
        {
            //input                    
            //var input = SortASCToJson(policyOrder);

            var input = policyOrder.ToJsonItem();
            Dictionary<string, string> param = new Dictionary<string, string>();
            param.Add("METHOD", "insuredHAInsurance");
            param.Add("CHANNELID", "522");
            param.Add("INPUT", input);
            param.Add("SIGNTYPE", "1");

            input = input.Replace("\"[", "[").Replace("]\"", "]").Replace("'", "\"");
            string sign = X3.UtilX3.Md5(input + SIGNKEY);
            param.Add("SIGN", sign);

            var result = X3.WebUtilX3.DoPost(postUrl, param);            
            return result;            
        }
        /// <summary>
        /// 有问题，暂时废弃
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="model"></param>
        /// <returns></returns>
        public string SortASCToJson<T>(T model)
        {
            //ArrayList list = new ArrayList();
            //Hashtable ht = new Hashtable();
            //Hashtable ht2 = new Hashtable();

            //Type _type = model.GetType();
            //foreach (PropertyInfo _property in _type.GetProperties())
            //{
            //    object value = _property.GetValue(model, null);
            //    string name = _property.Name;
            //    list.Add(name);
            //    ht.Add(name, value);
            //}

            //list.Sort();

            //foreach (var key in list)
            //{
            //    ht2.Add(key, ht[key]);
            //}

            //return ht2.ToJsonItem();

            ArrayList list = new ArrayList();
            Dictionary<string, object> dictionary = new Dictionary<string, object>();
            Dictionary<string, object> dictionary2 = new Dictionary<string, object>();
            Dictionary<string, object> dictionary3 = new Dictionary<string, object>();
            Type _type = model.GetType();
            foreach (PropertyInfo _property in _type.GetProperties())
            {
                object value = _property.GetValue(model, null);
                string name = _property.Name;
                dictionary2.Add(name, value);                

                byte[] array = System.Text.Encoding.ASCII.GetBytes(name);
                string str = null;
                for (int i = 0; i < array.Length; i++)
                {
                    int asciicode = (int)(array[i]);
                    str += Convert.ToString(asciicode);
                }

                dictionary3.Add(name, str);
            }

            var sortDic = dictionary3.OrderBy(c => c.Value);


            foreach (KeyValuePair<string,object> pair in sortDic)
            {
                dictionary.Add(pair.Key, dictionary2[pair.Key]);
            }

            return dictionary.ToJsonItem();
        }

    }
}
