using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

        public ActionResult Cabinet()
        {
            return View();
        }
    }
}