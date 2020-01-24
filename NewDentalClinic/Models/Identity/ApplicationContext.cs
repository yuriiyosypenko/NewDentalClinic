using System;
using Microsoft.AspNet.Identity.EntityFramework;

namespace NewDentalClinic.Models.Identity
{
    public class ApplicationContext : IdentityDbContext<ApplicationUser, Role, Guid, UserLogin, UserRole, UserClaim>
    {
        public ApplicationContext() : base("DefaultConnection") { }

        public static ApplicationContext Create()
        {
            return new ApplicationContext();
        }
    }
}