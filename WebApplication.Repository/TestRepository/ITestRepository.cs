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
        bool AddOrUpdatePerson(TestPersons person);

        List<Customer> GetCustomers();
        Customer GetCustomer(int? id);
        bool DeleteCustomer(int id);

        List<Product> GetProducts();
        Product GetProduct(int? id);
        bool DeleteProduct(int id);
    }
}
