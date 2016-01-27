﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace $rootnamespace$
{
    public class AngularSPARouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{*.}",
                defaults: new { controller = "AngularSPA", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}