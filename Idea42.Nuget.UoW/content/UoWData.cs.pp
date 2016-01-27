using System;
using $rootnamespace$.Samples;
using $rootnamespace$.Interfaces;

namespace $rootnamespace$
{
    public class DataUoW : IDataUoW
    {
        private DataContext _dbContext;

        // Implement your interface like so.
        public IGenericRepository<SampleModel> Samples { get { return new GenericRepository<SampleModel>(_dbContext); } }

        public DataUoW()
        {
            CreateDbContext();
        }

        public void Commit()
        {
            _dbContext.SaveChanges();
        }

        public void Dispose()
        {
            if (_dbContext != null)
                _dbContext.Dispose();
            GC.SuppressFinalize(this);
        }

        public object GetDBContext()
        {
            return _dbContext;
        }

        protected void CreateDbContext()
        {
            _dbContext = new DataContext();

            // Do NOT enable proxied entities, else serialization fails
            _dbContext.Configuration.ProxyCreationEnabled = false;

            // Load navigation properties explicitly (avoid serialization trouble)
            _dbContext.Configuration.LazyLoadingEnabled = false;

            // Because Web API will perform validation, we don't need/want EF to do so
            _dbContext.Configuration.ValidateOnSaveEnabled = false;
        }
    }
}
