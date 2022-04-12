using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_CrudOperationWithAngularJS.Models
{
    public class Product
    {
        public int ID { get; set; }
        public string PName { get; set; }
        public decimal Price { get; set; }
        public string Category { get; set; }
        public string Manufacturer { get; set; }
    }
}