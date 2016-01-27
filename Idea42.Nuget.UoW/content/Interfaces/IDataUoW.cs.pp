using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using $rootnamespace$.Samples;

namespace $rootnamespace$.Interfaces
{
    public interface IDataUoW
    {
        object GetDBContext();
        void Commit();
        void Dispose();

        // Because we will be using a generic repository pattern, 
        // Everything we want access to in the DbContext will get declared here.
        // Keep the names the same as in the DbContext to reduce confusion.
        IGenericRepository<SampleModel> Samples { get; }
    }
}
