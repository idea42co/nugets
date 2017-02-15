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
                         "~/Scripts/angular-animate/angular-animate.js",
                        "~/Scripts/angular-aria/angular-aria.js", 
						"~/Scripts/angular-material/angular-material.js",
                        "~/App/angular-app.js",
                        "~/App/dal.js")
                        .IncludeDirectory("~/App/Services/", "*.js", true)
                        .IncludeDirectory("~/App/Controllers/", "*.js", true));

             bundles.Add(
              new StyleBundle("~/Content/css")
				.IncludeDirectory("~/Content", "*.css")
                .IncludeDirectory("~/Content/Styles/", "*.css"));

        }
	}
}