using MVC_CrudOperationWithAngularJS.Database_Acces_Layer;
using MVC_CrudOperationWithAngularJS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_CrudOperationWithAngularJS.Controllers
{
    public class ProductController : Controller
    {
        db dblayer = new db();
        // GET: Product
        public ActionResult Index()
        {
            if (Session["UserID"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login","Login");
            }
        }

        public JsonResult GetAllRecord()
        {
            List<Product> products = dblayer.GetAllRecord();
            return Json(products, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public string InsertProduct(Product Product)
        {
            if (Product != null)
            {
                dblayer.AddRecord(Product);
                return "Product Added Successfully"; 
            }
            else
            {
                return "Product Not Inserted! Try Again";
            }
        }
        [HttpPost]
        public string UpdateProduct(Product Product)
        {
            if (Product != null)
            {
                try
                {
                    dblayer.UpdateRecord(Product);
                    return "Product Updated Successfully";
                }
                catch(Exception ex)
                {
                    return "Product Not Updated : " + ex.Message.ToString();
                }
               
            }
            else
            {
                return "Product Not Updated! Try Again";
            }
        }

        public string DeleteProduct(int id)
        {
            if (id != null)
            {
                try
                {
                    dblayer.DeleteRecord(id);
                    return "Product Deleted Successfully";
                }
                catch (Exception ex)
                {
                    return "Product Not Deleted : " + ex.Message.ToString();
                }

            }
            else
            {
                return "Product Not Deleted! Try Again";
            }
        }

    }
}