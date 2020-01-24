using System;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;

namespace NewDentalClinic.Models.Identity
{
    public class ApplicationUserManager : UserManager<ApplicationUser, Guid>
    {
        public ApplicationUserManager(IUserStore<ApplicationUser, Guid> store)
                : base(store)
        {
        }
        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options,
                                                IOwinContext context)
        {
            ApplicationContext db = context.Get<ApplicationContext>();
            ApplicationUserManager manager = new ApplicationUserManager(new UserStore<ApplicationUser, Role, Guid, UserLogin, UserRole, UserClaim>(db));
            return manager;
        }
    }
}