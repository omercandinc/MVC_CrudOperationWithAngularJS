﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_CrudOperationWithAngularJS.Models
{
    public class UserProfile
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }

    }
}