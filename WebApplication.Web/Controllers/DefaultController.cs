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
                    }

                }

                return Ok(numbers);
            }
        }
        [HttpGet]
        public IHttpActionResult getDbValues()
        {
            using (SQLiteConnection con = new SQLiteConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User Id=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SQLiteCommand com = new SQLiteCommand(con))
                {
                    com.CommandText = "Select * FROM [SalesLT].[Address] where id<30";
                    using (SQLiteDataReader reader = com.ExecuteReader())
                    {
                        reader.Read();
                        try
                        {
                            con.Close();
                            return Ok(reader.GetValue(1).ToString());
                        }
                        catch(Exception e)
                        {
                            con.Close();
                            return Ok(e.Message);
                        }
                    }
                }
                con.Close();
            }
            return Ok("empty");
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
