using System;
using System.Web.Optimization;

[assembly: WebActivator.PostApplicationStartMethod(
    typeof($rootnamespace$.App_Start.AngularSPAConfig), "PreStart")]

namespace $rootnamespace$
{
    public static class AngularSPAConfig
    {
        public static void PreStart()
        {
            // Add your start logic here
            AngularSPABundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}