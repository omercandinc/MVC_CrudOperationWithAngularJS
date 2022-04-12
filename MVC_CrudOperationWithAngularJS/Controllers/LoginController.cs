using MVC_CrudOperationWithAngularJS.Database_Acces_Layer;
using MVC_CrudOperationWithAngularJS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_CrudOperationWithAngularJS.Controllers
{
    public class LoginController : Controller
    {
        db dblayer = new db();
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UserProfile userProfile)
        {
            if (ModelState.IsValid)
            {

                var obj = dblayer.LoginControl(userProfile.UserName, userProfile.Password);
                if (obj != null)
                {
                    Session["UserID"] = obj.UserId.ToString();
                    Session["UserName"] = obj.UserName.ToString();
                    return RedirectToAction("Index","Product");
                }

            }
            return View(userProfile);
        }
    }
}