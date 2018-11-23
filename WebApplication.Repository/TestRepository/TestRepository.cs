using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApplication.Model.DbModel;

namespace WebApplication.Repository
{
    public class TestRepository : BaseRepository, ITestRepository
    {

        #region Customer

        public List<Customer> GetCustomers()
        {
            return DataContext.Customer.Take(20).ToList();
        }

        public Customer GetCustomer(int? id)
        {
            return DataContext.Customer.SingleOrDefault(x => x.CustomerID == id);
        }

        public bool DeleteCustomer(int id)
        {
            bool result = false;
            Customer entity = DataContext.Customer.SingleOrDefault(x => x.CustomerID == id);
            if (entity != null)
            {
                DataContext.Customer.Remove(entity);
                DataContext.SaveChanges();
                result = true;
            }
            return result;
        }

        #endregion

        #region Person

        public List<TestPersons> GetPersons()
        {
            return DataContext.TestPersons.Take(20).ToList();
        }

        public TestPersons GetPerson(int? id)
        {
            return DataContext.TestPersons.SingleOrDefault(x => x.ID == id);
        }

        public bool DeletePerson(int id)
        {
            bool result = false;
            TestPersons entity = DataContext.TestPersons.SingleOrDefault(x => x.ID == id);
            if (entity != null)
            {
                DataContext.TestPersons.Remove(entity);
                DataContext.SaveChanges();
                result = true;
            }
            return result;
        }
        public bool AddOrUpdatePerson(TestPersons person)
        {
            throw new NotImplementedException();
        }

        #endregion

        #region Product

        public List<Product> GetProducts()
        {
            return DataContext.Product.Take(10).ToList();
        }

        public Product GetProduct(int? id)
        {
            return DataContext.Product.SingleOrDefault(x => x.ProductID == id);
        }

        public bool DeleteProduct(int id)
        {
            bool result = false;
            Product entity = DataContext.Product.SingleOrDefault(x => x.ProductID == id);
            if (entity != null)
            {
                DataContext.Product.Remove(entity);
                DataContext.SaveChanges();
                result = true;
            }
            return result;
        }

        #endregion
    }
}
