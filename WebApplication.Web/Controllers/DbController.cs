using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication.Web.Models;

namespace WebApplication.Web.Controllers
{
    public class DbController : ApiController
    {
        [HttpGet]
        public IHttpActionResult getData(string commandStr)
        {
            if (commandStr == null || commandStr == "") return Ok("error");
            List<testPersonDTO> list = new List<testPersonDTO>();
            using (SqlConnection con = new SqlConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User ID=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand(commandStr, con))
                {
                    using (SqlDataReader reader = com.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            testPersonDTO tmp = new testPersonDTO();
                            tmp.ID = reader.GetInt32(0);
                            tmp.login = reader.GetString(1);
                            tmp.email = reader.GetString(2);
                            tmp.password = reader.GetString(3);
                            list.Add(tmp);
                        }
                    }
                }
                con.Close();
            }
            return Ok(list);
        }
        
        [HttpPut]
        public IHttpActionResult PutData(testPersonDTO person)
        {
            using (SqlConnection con = new SqlConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User ID=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("insert into TestPersons (Login,email,Password) " +
                    " values('" + person.login + "','" + person.email + "','" + person.password + "' );", con))
                {
                    com.ExecuteNonQuery();
                }
                con.Close();
            }
            return Ok("Inserted");

        }
        [HttpDelete]
        public IHttpActionResult DeleteData(string deleteFrom, string dWhere)
        {
            using (SqlConnection con = new SqlConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User ID=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("DELETE FROM " + deleteFrom + " where ID=" + dWhere, con))
                {
                    com.ExecuteNonQuery();
                }
                con.Close();
            }
            return Ok("deleted");
        }
        
        [HttpPost]
        public IHttpActionResult UpdateData(DbDTO cmd)
        {
            using (SqlConnection con = new SqlConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User ID=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("Update "+ cmd.Db + " set " + cmd.Set + " where " + cmd.Where, con))
                {
                    com.ExecuteNonQuery();
                }
                con.Close();
            }
            return Ok();
        }


        public IHttpActionResult CreateTable()
        {
            using (SqlConnection con = new SqlConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User ID=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("CREATE TABLE TestPersons (" +
                    "ID int IDENTITY(1,1) PRIMARY KEY, " +
                    "Login varchar(64) NOT NULL, " +
                    "email varchar(64) NOT NULL, " +
                    "Password varchar(255) NOT NULL )"
                    ,con))
                {
                    com.ExecuteNonQuery();
                }
                con.Close();
            }
            return Ok("sukces");
        }
    }
}
