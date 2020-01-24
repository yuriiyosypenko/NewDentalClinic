using System;
using Microsoft.AspNet.Identity.EntityFramework;

namespace NewDentalClinic.Models.Identity
{
    public class Role : IdentityRole<Guid, UserRole>
    {
    }
}