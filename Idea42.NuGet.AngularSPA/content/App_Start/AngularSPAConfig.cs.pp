using System;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

[assembly: WebActivatorEx.PreApplicationStartMethod(
    typeof($rootnamespace$.AngularSPAConfig), "PreStart")]

namespace $rootnamespace$
{
    public static class AngularSPAConfig
    {
        public static void PreStart()
        {
			// Since Angular and MVC will conflict, we need to set up some routes to ignore MVC.
            RouteTable.Routes.Clear();
            AngularSPARouteConfig.RegisterRoutes(RouteTable.Routes);
            AngularSPABundleConfig.RegisterBundles(BundleTable.Bundles);
            GlobalConfiguration.Configure(AngularSPAWebApiConfig.Register);
        }
    }
}