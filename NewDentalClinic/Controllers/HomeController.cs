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
        public void SaveEvent(string title, string start, string procedureId)
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
        [Authorize(Roles = "user")]
        public JsonResult GetUserEvents()
        {
            /*            var c = new NewDentalClinicEntities();
                        var r = c.Registration.ToList().Where(t => t.UserId == User.Identity.GetUserId());
                        return Json(r.Select(e => new { e.id, e.title, e.start }), JsonRequestBehavior.AllowGet);*/
            return null;
        }




    }
}