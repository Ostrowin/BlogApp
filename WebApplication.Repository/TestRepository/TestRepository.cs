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


        public List<Customer> GetCustomers()
        {
            return DataContext.Customer.ToList();
        }

        public Customer GetCustomer(int? id)
        {
            return DataContext.Customer.SingleOrDefault(x => x.CustomerID == id);
        }

        public bool deleteCustomer(int id)
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
        public List<TestPersons> GetPersons()
        {
            return DataContext.TestPersons.ToList();
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

        public List<Product> GetProducts()
        {
            return DataContext.Product.ToList();
        }

        public Product GetProduct(int? id)
        {
            return DataContext.Product.SingleOrDefault(x => x.ProductID == id);
        }

        public bool deleteProduct(int id)
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
    }
}
