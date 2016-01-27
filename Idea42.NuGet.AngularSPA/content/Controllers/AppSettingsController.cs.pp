using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace $rootnamespace$.Controllers
{
    public class AppSettingsController : ApiController
    {
        public HttpResponseMessage Get()
        {
            var appSettings = ConfigurationManager.AppSettings.AllKeys.Select(key => new { Key = key, Value = ConfigurationManager.AppSettings[key].ToString() }).ToDictionary(t => t.Key, t => t.Value);
            return Request.CreateResponse(HttpStatusCode.OK, appSettings);
        }
    }
}
