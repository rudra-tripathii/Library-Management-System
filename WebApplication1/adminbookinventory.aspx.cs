using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock,global_current_stock,global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
            GridView1.DataBind();
        }
        //Go Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            getBookById();
        }
        //Add Button
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if(checkIfBookExists())
            {
                Response.Write("<script>alert('Book Already Exist,try some other Book ID');</script>");
            }
            else
            {
                addNewBooks();
            }
        }
        //Update Button
        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            updateBookById();
        }
        //Delete Button
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            deleteBookByID();
        }
        //user define function
        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id='" + TextBox2.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Book Deleted Successfully.');</script>");
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }
        void updateBookById()
        { 
            if(checkIfBookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TextBoxActualStock.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBoxCurrentStock.Text.Trim());
                    if(global_actual_stock==actual_stock)
                    {

                    }
                    else
                    {
                        if(actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock Value Cannot be less than the Issued Books');</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBoxCurrentStock.Text = "" + current_stock;
                        }
                    }
                    string genres = "";
                    foreach(int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);
                    string filepath = "~/book_inventory/Java";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }


                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name,genre=@genre,author_name=@author_name,publisher_name=@publisher_name,publish_date=@publish_date,language=@language,edition=@edition,book_cost=@book_cost,no_of_pages=@no_of_pages,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link WHERE book_id='" + TextBox2.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", TextBoxBookName.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name",DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name",DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@language",DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBoxEdition.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBoxBookCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TextBoxPages.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBoxDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());

                    cmd.Parameters.AddWithValue("@book_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book Updated Successfully');</script>");

                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }

            }
            else
            {

            }
        }
        void getBookById() 
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id='" + TextBox2.Text.Trim() + "'", con);
                SqlDataAdapter da=new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count>=1)
                {
                   
                        TextBoxBookName.Text = dt.Rows[0]["book_name"].ToString();
                        TextBoxEdition.Text = dt.Rows[0]["edition"].ToString();
                        TextBoxBookCost.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                        TextBoxPages.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                        TextBoxActualStock.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                        TextBoxCurrentStock.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                        TextBoxDescription.Text = dt.Rows[0]["book_description"].ToString();

                    TextBoxIssuedBooks.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));
                        TextBox1.Text = dt.Rows[0]["publish_date"].ToString();
                        DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                        DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                        DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i<genre.Length;i++)
                    {
                        for(int j = 0; j<ListBox1.Items.Count;j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                        }
                    }
                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock= Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books=global_actual_stock -global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT publisher_name from publisher_master_table;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                return false;
            }

        }
        void addNewBooks()
        {
            try
            {
                string genres = "";
                foreach(int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                //genres =Adventures,Self Help
                genres=genres.Remove(genres.Length - 1);
                string filepath = "~/book_inventory/Java.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "/book_inventory/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if(con.State==ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link)" +
                    "values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages," +
                    "@book_description,@actual_stock,@current_stock,@book_img_link);", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBoxBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name",DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBoxEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBoxBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBoxPages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBoxDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBoxActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBoxActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link",filepath);
                
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added Successfully.');</script>");
                GridView1.DataBind();

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

        }
    }
}