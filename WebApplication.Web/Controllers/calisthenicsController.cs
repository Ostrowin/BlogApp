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
    public class calisthenicsController : ApiController
    {
        [HttpGet]
        public IHttpActionResult getPushUps()
        {
            List<calisthenicsDTO> list = new List<calisthenicsDTO>();

            using (SqlConnection con = new SqlConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User ID=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand("Select * from PushUps", con))
                {
                    using (SqlDataReader reader = com.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            calisthenicsDTO tmp = new calisthenicsDTO();
                            tmp.exercise = reader.GetString(0);
                            tmp.stepOne = reader.GetBoolean(1);
                            tmp.stepTwo = reader.GetBoolean(2);
                            tmp.stepThree = reader.GetBoolean(3);
                            list.Add(tmp);
                        }
                    }
                }
                con.Close();
            }

            return Ok(list);

        }
        [HttpPut]
        public IHttpActionResult updatePushUps(UpdateStepDTO exercise)
        {
            using (SqlConnection con = new SqlConnection("Data Source=tcp:rezija2roj.database.windows.net,1433;Initial Catalog=test;User ID=demo;Password=zaq1@WSX;"))
            {
                con.Open();
                using (SqlCommand com = new SqlCommand($"Update PushUps set {exercise.step}= 1 where Exercise = '{ exercise.exercise }'", con))
                {
                    com.ExecuteNonQuery();
                }
                con.Close();
            }
            return Ok("Done");
        }

    }
}
