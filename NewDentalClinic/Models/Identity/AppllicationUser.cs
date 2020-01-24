using System;
using Microsoft.AspNet.Identity.EntityFramework;

namespace NewDentalClinic.Models.Identity
{
    public class ApplicationUser : IdentityUser<Guid, UserLogin, UserRole, UserClaim>
    {
        public ApplicationUser()
        {
        }

        public override Guid Id { get; set; } = Guid.NewGuid();

        public string FirstName { get; set; }

        public string LastName { get; set; }
    }
}