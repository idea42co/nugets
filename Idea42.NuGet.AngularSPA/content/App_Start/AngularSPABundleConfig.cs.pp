using System;
using System.Web.Optimization;

namespace $rootnamespace$ 
{
	public class AngularSPABundleConfig
	{
		public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.IgnoreList.Clear();

            bundles.Add(new ScriptBundle("~/bundles/angular/spa/core").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/modernizr-*",
                        "~/Scripts/angular.js",
                        "~/Scripts/angular-route.js",
						"~/Scripts/angular-local-storage.js",
                        "~/App/angular-app.js",
                        "~/App/dal.js")
                        .IncludeDirectory("~/App/Services/", "*.js", true)
                        .IncludeDirectory("~/App/Controllers/", "*.js", true));

             bundles.Add(
              new StyleBundle("~/Content/css")
                .Include("~/Content/bootstrap.css")
                .IncludeDirectory("~/Content/Styles/", "*.css"));

        }
	}
}