using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication.Model.DbModel;
using WebApplication.Repository;

namespace WebApplication.Web.Controllers
{
    public class TestController : ApiController
    {
        internal ITestRepository _testRepository;
        public TestController()
        {
            _testRepository = new TestRepository();
        }
        #region Person

        [HttpGet]
        public IHttpActionResult getPersons()
        {
            List<TestPersons> entities = _testRepository.GetPersons().ToList();
            return Ok(entities);
        }

        [HttpGet]
        public IHttpActionResult getPerson(int? personId)
        {
            TestPersons entity = _testRepository.GetPerson(personId);
            return Ok(entity);
        }

        [HttpDelete]
        public IHttpActionResult deletePerson(int personId)
        {
            bool result = _testRepository.DeletePerson(personId);
            return Ok(result);
        }

        #endregion

        #region Customer

        [HttpGet]
        public IHttpActionResult getCustomers()
        {
            List<Customer> entities = _testRepository.GetCustomers().ToList();
            return Ok(entities);
        }

        [HttpGet]
        public IHttpActionResult getCustomer(int? id)
        {
            Customer entity = _testRepository.GetCustomer(id);
            return Ok(entity);
        }

        #endregion

        #region Product
        [HttpGet]
        public IHttpActionResult getProducts()
        {
            List<Product> entities = _testRepository.GetProducts().ToList();
            return Ok(entities);
        }
        [HttpGet]
        public IHttpActionResult getProduct(int? id)
        {
            Product entity = _testRepository.GetProduct(id);
            return Ok(entity);
        }

        #endregion
    }
}
