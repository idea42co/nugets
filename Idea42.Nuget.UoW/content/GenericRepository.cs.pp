using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Linq.Expressions;
using $rootnamespace$.Interfaces;

namespace $rootnamespace$
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        protected DbContext DbContext { get; set; }
        protected DbSet<T> DbSet { get; set; }

        // Constructor, repository context setup
        public GenericRepository(DbContext dbContext)
        {
            if (dbContext == null)
                throw new ArgumentNullException("dbContext");
            DbContext = dbContext;
            DbSet = DbContext.Set<T>();
        }

        public IQueryable<T> GetAll()
        {
            return DbSet;
        }

        public T GetById(int id)
        {
            //return DbSet.FirstOrDefault(PredicateBuilder.GetByIdPredicate<T>(id));
            return DbSet.Find(id);
        }

        public void Add(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State != EntityState.Detached)
            {
                dbEntityEntry.State = EntityState.Added;
            }
            else
            {
                DbSet.Add(entity);
            }
        }

        public void Update(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State == EntityState.Detached)
            {
                DbSet.Attach(entity);
            }

            dbEntityEntry.State = EntityState.Modified;
        }

        public void UpdateNoAttach(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);

            dbEntityEntry.State = EntityState.Modified;
        }

        public void Delete(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State != EntityState.Deleted)
            {
                dbEntityEntry.State = EntityState.Deleted;
            }
            else
            {
                DbSet.Attach(entity);
                DbSet.Remove(entity);
            }
        }

        public void Delete(List<T> entities)
        {
            DbSet.RemoveRange(entities); ;
        }

        public void Delete(int id)
        {
            var entity = GetById(id);
            if (entity == null)
                return; // not found; assume already deleted.
            Delete(entity);
        }

        public IQueryable<T> Query(Expression<Func<T, bool>> filter)
        {
            return DbSet.Where(filter);
        }

        public IQueryable<T> Include(IQueryable<T> query, Expression<Func<T, object>> path)
        {
            return query.Include(path);
        }

        public IQueryable<T> QueryNoTracking(Expression<Func<T, bool>> filter)
        {
            return DbSet.AsNoTracking().Where(filter);
        }
    }
}
