using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class userlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State==System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_table where member_id='" + TextBox1.Text.Trim() + "' AND password='" + TextBox2.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Response.Write("<script>alert('" + dr.GetValue(8).ToString() + "');</script>");
                        Session["username"] = dr.GetValue(8).ToString();
                        Session["full_name"] = dr.GetValue(0).ToString();
                        Session["role"] ="user";
                        Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials')</script>");
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        ////    string memberId = TextBox1.Text.Trim();
        ////    string password = TextBox2.Text.Trim();

        ////    string connStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        ////    using (SqlConnection con = new SqlConnection(connStr))
        ////    {
        ////        string query = "SELECT COUNT(*) FROM member_master_table WHERE member_id = @MemberID AND password = @Password";

        ////        using (SqlCommand cmd = new SqlCommand(query, con))
        ////        {
        ////            cmd.Parameters.AddWithValue("@MemberID", memberId);
        ////            cmd.Parameters.AddWithValue("@Password", password);

        ////            con.Open();
        ////            int count = (int)cmd.ExecuteScalar();

        ////            if (count == 1)
        ////            {
        ////                // Successful login
        ////                Response.Redirect("homepage.aspx"); // Replace with your actual page
        ////            }
        ////            else
        ////            {
        ////                // Check if user exists with just MemberID (to suggest registration)
        ////                string checkUserQuery = "SELECT COUNT(*) FROM member_master_table WHERE member_id = @MemberID";
        ////                using (SqlCommand checkCmd = new SqlCommand(checkUserQuery, con))
        ////                {
        ////                    checkCmd.Parameters.AddWithValue("@MemberID", memberId);
        ////                    int userExists = (int)checkCmd.ExecuteScalar();

        ////                    if (userExists == 0)
        ////                    {
        ////                        // User not registered
        ////                        string script = "alert('Member ID not found. Please register here.');";
        ////                        ClientScript.RegisterStartupScript(this.GetType(), "RegisterAlert", script, true);
        ////                    }
        ////                    else
        ////                    {
        ////                        // Wrong password
        ////                        string script = "alert('Incorrect password. Please try again.');";
        ////                        ClientScript.RegisterStartupScript(this.GetType(), "LoginAlert", script, true);
        ////                    }
        ////                }
        ////            }
        ////        }
        ////    }
        ////    //Response.Write("<script>alert('Login Button Clicked')</script>");
        //    //string memberId = TextBox1.Text.Trim();
        //    //string password = TextBox2.Text.Trim();

        //    //// Dummy credentials for demonstration
        //    //string validMemberId = "user123";
        //    //string validPassword = "pass123";

        //    //if (memberId == validMemberId && password == validPassword)
        //    //{
        //    //    // Successful login (redirect or session logic here)
        //    //    Response.Write("<script>alert('Login Is Successfull')</script>"); // change to your actual page
        //    //}
        //    //else
        //    //{
        //    //    // Invalid login, show alert
        //    //    string script = "alert('Invalid Member ID or Password. Please try again.');";
        //    //    ClientScript.RegisterStartupScript(this.GetType(), "LoginAlert", script, true);
        //    //}
        //}

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

      
    }
}