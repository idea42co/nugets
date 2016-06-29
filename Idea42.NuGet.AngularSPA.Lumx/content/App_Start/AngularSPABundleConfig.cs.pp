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
                        "~/App/angular-app.js",
                        "~/App/dal.js",
                        "~/App/angular-app-run.js")
                        .IncludeDirectory("~/App/Services/", "*.js", true)
                        .IncludeDirectory("~/App/Models/", "*.js", true)
                        .IncludeDirectory("~/App/Directives/", "*.js", true)
                        .IncludeDirectory("~/App/Controllers/", "*.js", true));

            bundles.Add(
              new StyleBundle("~/Content/css")
                .IncludeDirectory("~/Content/Styles/", "*.css"));
        }
    }
}