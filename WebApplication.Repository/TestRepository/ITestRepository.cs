using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApplication.Model.DbModel;

namespace WebApplication.Repository
{
    public interface ITestRepository
    {
        List<TestPersons> GetPersons();
        TestPersons GetPerson(int? id);
        bool DeletePerson(int id);

        List<Customer> GetCustomers();
        Customer GetCustomer(int? id);
        bool deleteCustomer(int id);

        List<Product> GetProducts();
        Product GetProduct(int? id);
        bool deleteProduct(int id);
    }
}
