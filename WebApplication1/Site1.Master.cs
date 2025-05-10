using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"]== null)
                {
                    LinkButton1.Visible = true; //user login link button
                    LinkButton2.Visible = true; //signup link button
                    LinkButton3.Visible = false;  //LOGOUT link button
                    LinkButton5.Visible = false;  //hello user link button

                    LinkButton6.Visible = true;  //admin login link button
                    LinkButton7.Visible = false; //author management link button
                    LinkButton8.Visible = false; //publisher management link button

                    LinkButton9.Visible = false; //book inventory link button
                    LinkButton10.Visible = false; //book issuing link button
                    LinkButton11.Visible = false; //member management link button
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; //user login link button
                    LinkButton2.Visible = false; //signup link button
                    LinkButton3.Visible = true;  //LOGOUT link button

                    LinkButton5.Visible = true;  //hello user link button
                    LinkButton5.Text = "Hello" + Session["username"].ToString();


                    LinkButton6.Visible = true;  //admin login link button
                    LinkButton7.Visible = false; //author management link button
                    LinkButton8.Visible = false; //publisher management link button

                    LinkButton9.Visible = false; //book inventory link button
                    LinkButton10.Visible = false; //book issuing link button
                    LinkButton11.Visible = false; //member management link button
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = true; //user login link button
                    LinkButton2.Visible = false; //signup link button
                    LinkButton3.Visible = true;  //LOGOUT link button

                    LinkButton5.Visible = true;  //hello user link button
                    LinkButton5.Text = "Hello Admin";


                    LinkButton6.Visible = false;  //admin login link button
                    LinkButton7.Visible = true; //author management link button
                    LinkButton8.Visible = true; //publisher management link button

                    LinkButton9.Visible = true; //book inventory link button
                    LinkButton10.Visible = true; //book issuing link button
                    LinkButton11.Visible = true; //member management link button
                }
            }
            catch(Exception)
            {
            }
        }
        //Admin Login
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }
        //Author Management
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }
        //Publisher management
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }
        //Book Inventory
        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }
        //Book issue
        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }
        //member Management
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("adminmembermanagement.aspx");
        }
        //View Books
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }
        //User Login
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
           // Session["username"] = dr.GetValue(8).ToString();
            //Session["full_name"] = dr.GetValue(0).ToString();
           // Session["role"] = "user";
        }
        
        //signup button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }
        //logout button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["full_name"] = null;
            Session["role"] = null;
            Session["status"] = null;
            LinkButton1.Visible = true; //user login link button
            LinkButton2.Visible = true; //signup link button
            LinkButton3.Visible = false;  //LOGOUT link button
            LinkButton5.Visible = false;  //hello user link button

            LinkButton6.Visible = true;  //admin login link button
            LinkButton7.Visible = false; //author management link button
            LinkButton8.Visible = false; //publisher management link button

            LinkButton9.Visible = false; //book inventory link button
            LinkButton10.Visible = false; //book issuing link button
            LinkButton11.Visible = false; //member management link button
            Response.Redirect("homepage.aspx");
        }
       
        //About Us
        protected void AboutUS1_Click(object sender, EventArgs e)
        {
            Response.Redirect("aboutUS.aspx");
        }
        //Hello User 
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
        //Home Page
        protected void LinkButtonHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");

        }
    }
}