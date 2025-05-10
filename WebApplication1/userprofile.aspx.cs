using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class userprofile : System.Web.UI.Page
    {
        string  strcon= ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || Session["username"].ToString() == "")
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else 
                {
                    getUserBookData();
                    if(!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                }

            }
            catch(Exception)  
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }

        }
        //UpDate Button
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            if (Session["username"] != null || Session["username"].ToString() != "")
            {
                updateUserPersonalDetails();
            }
            else
            {
                Response.Write("<script>alert('Session Expired! Please log in again.');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }
        //User Define Function
        void updateUserPersonalDetails()
        {
            void updateUserPersonalDetails()
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string password = txtNewPassword.Text.Trim() == "" ? txtOldPassword.Text.Trim() : txtNewPassword.Text.Trim();

                    SqlCommand cmd = new SqlCommand("UPDATE member_master_table SET full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, state=@state, city=@city, pincode=@pincode, full_address=@full_address, password=@password WHERE member_id='" + Session["username"].ToString().Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", txtBirthDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", txtContact.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", ddlState.SelectedValue);
                    cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", txtPin.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@account_status", "pending");

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Details Updated Successfully');</script>");
                        getUserPersonalDetails(); // Refresh display
                        getUserBookData();
                    }
                    else
                    {
                        Response.Write("<script>alert('Update Failed');</script>");
                    }

                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

        }
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_table where member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtFullName.Text = dt.Rows[0]["full_name"].ToString();
                txtBirthDate.Text = dt.Rows[0]["dob"].ToString();
                txtContact.Text = dt.Rows[0]["contact_no"].ToString();
                txtEmail.Text = dt.Rows[0]["email"].ToString();
                ddlState.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                txtCity.Text = dt.Rows[0]["city"].ToString();
                txtPin.Text = dt.Rows[0]["pincode"].ToString();
                txtAddress.Text = dt.Rows[0]["full_address"].ToString();
                txtUserID.Text = dt.Rows[0]["member_id"].ToString();
                txtOldPassword.Text = dt.Rows[0]["password"].ToString();// This should be hashed in real-world apps
                lblAccountStatus.Text = dt.Rows[0]["account_status"].ToString().Trim();
                if (dt.Rows[0]["account_status"].ToString().Trim()=="active")
                {
                    lblAccountStatus.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if(dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    lblAccountStatus.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                {
                    lblAccountStatus.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    lblAccountStatus.Attributes.Add("class", "badge badge-pill badge-secondary");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_issue_table where member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da=new SqlDataAdapter(cmd);
                DataTable dt=new DataTable();
                da.Fill(dt);
                
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}