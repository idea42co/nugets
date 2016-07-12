using System;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

[assembly: WebActivatorEx.PreApplicationStartMethod(
    typeof($rootnamespace$.AngularSPAConfig), "PreStart")]
[assembly: WebActivatorEx.PostApplicationStartMethod(
    typeof($rootnamespace$.AngularSPAConfig), "PostStart")]

namespace $rootnamespace$
{
    public static class AngularSPAConfig
    {
        public static void PreStart()
        {
            AngularSPABundleConfig.RegisterBundles(BundleTable.Bundles);
        }

		public static void PostStart()
        {
            RouteTable.Routes.Clear();
			GlobalConfiguration.Configure(AngularSPAWebApiConfig.Register);
            AngularSPARouteConfig.RegisterRoutes(RouteTable.Routes);
        }
    }
}