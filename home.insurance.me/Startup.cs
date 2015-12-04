using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(home.insurance.cn.Startup))]
namespace home.insurance.cn
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
