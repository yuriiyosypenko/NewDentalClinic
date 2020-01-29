using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataBaseFirst;
using Microsoft.AspNet.Identity;
using System.Globalization;
using System.Security.Claims;


namespace NewDentalClinic.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Admin()
        {
            return View();
        }

        [Authorize(Roles = "User")]
        public ActionResult Cabinet()
        {
            return View();
        }

        //Сохраняем записи текущего пользователя
        [Authorize(Roles = "User")]
        [HttpPost]
        public void SaveUserEvent(string title, string start, string procedureId)
        {
            var d = new NewDentalClinicEntities();
            var r = new Registration();
            r.Id = Guid.NewGuid();
            r.Title = title;
            r.Start = DateTime.ParseExact(start, "yyyy-MM-ddTHH:mm:ss", CultureInfo.InvariantCulture);
            r.UserId = Guid.Parse(User.Identity.GetUserId());
            r.ProcedureId = Guid.Parse(procedureId);

            d.Registration.Add(r);
            d.SaveChanges();
        }

        //Отображаем записи текущего пользователя
        [Authorize(Roles = "User")]
        public JsonResult GetUserEvents()
        {
            var d = new NewDentalClinicEntities();
            var r = d.Registration.ToList().Where(t => t.UserId == Guid.Parse(User.Identity.GetUserId()));
            return Json(r.Select(e => new {title = e.Title, start = e.Start }), JsonRequestBehavior.AllowGet);
        }
    }
}