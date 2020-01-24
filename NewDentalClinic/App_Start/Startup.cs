using Microsoft.Owin;
using Owin;
using NewDentalClinic.Models.Identity;
using Microsoft.Owin.Security.Cookies;
using Microsoft.AspNet.Identity;

[assembly: OwinStartup(typeof(NewDentalClinic.App_Start.Startup))]

namespace NewDentalClinic.App_Start
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // настраиваем контекст и менеджер
            app.CreatePerOwinContext<ApplicationContext>(ApplicationContext.Create);
            app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login"),
            });
        }
    }
}