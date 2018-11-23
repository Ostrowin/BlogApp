using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApplication.Model.DbModel;

namespace WebApplication.Repository
{
    public abstract class BaseRepository : IDisposable
    {
        private testEntities _dataContext;

        protected internal testEntities DataContext
        {
            get
            {
                if(_dataContext == null)
                {
                    _dataContext = new testEntities();
                }
                return _dataContext;
            }
        }

        public void Dispose()
        {
            if (_dataContext != null)
            {
                _dataContext.Dispose();
                _dataContext = null;
            }
        }
    }
}
