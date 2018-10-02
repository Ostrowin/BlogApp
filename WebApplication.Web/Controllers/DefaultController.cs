using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SQLite;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication.Web.Models;

namespace WebApplication.Web.Controllers
{
    public class DefaultController : ApiController
    {
        [HttpGet]

        public IHttpActionResult Index()
        {
            return Ok("Api Works");
        }

        [HttpGet]
        public IHttpActionResult GetNumbers(int length)
        {
            if (length <= 0) length = 10;
            int[] numbers = new int[length];
            Random randNum = new Random();
            for (int i=0;i < numbers.Length;i++)
            {
                numbers[i] = randNum.Next(0, 100);
            }

            List<string> results = new List<string>();

            using (SqlConnection conn = new SqlConnection("Data Source = tcp:rezija2roj.database.windows.net,1433; Initial Catalog = test; User Id = demo; Password = zaq1@WSX;"))
            {

                using (SqlCommand command = new SqlCommand("SELECT * FROM [SalesLT].[Address]", conn))
                {
                    command.Parameters.AddWithValue("@tPatSName", "Your-Parm-Value");
                    conn.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    try
                    {
                        return Ok(reader);
                    }
                    finally
                    {
                        // Always call Close when done reading.
                        reader.Close();
                        conn.Close();
                    }

                }
            }
        }
        [HttpGet]
        public IHttpActionResult getDbValues()
        {
            List<object> list = new List<object>();
            using (SqlConnection con = new SqlConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User ID=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("Select * FROM [SalesLT].[Address] where AddressID<30", con))
                {
                    using (SqlDataReader reader = com.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var myString = reader.GetString(1);
                            list.Add(myString);
                        }
                    }
                }
                con.Close();
            }
            return Ok(list);
        }

        [HttpPost]
        public IHttpActionResult PostNumbers(Person model) {
            Random randNum = new Random();
            model.Age = randNum.Next(0, 100);
            model.Street = "Elm Street 123";

            return Ok(model);
        }

        [HttpDelete]
        public IHttpActionResult DeleteSomething(int[] array)
        {
            
            return Ok(array);
        }

        [HttpPut]
        public IHttpActionResult PutSomething(int[] array)
        {
            Random x = new Random();
            List<int> list = new List<int>(array);
            list.Add(x.Next(0, 100));
            list.Add(x.Next(0, 100));
            array = list.ToArray();
            return Ok(array);
        }



    }
}
