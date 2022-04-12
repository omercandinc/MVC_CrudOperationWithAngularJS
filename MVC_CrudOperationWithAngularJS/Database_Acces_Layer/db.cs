using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MVC_CrudOperationWithAngularJS.Models;

namespace MVC_CrudOperationWithAngularJS.Database_Acces_Layer
{
    public class db
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        // Add Record
        public void AddRecord(Product product)
        {
            SqlCommand com = new SqlCommand("Sp_AddRecord", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@PNAME", product.PName);
            com.Parameters.AddWithValue("@Price", product.Price);
            com.Parameters.AddWithValue("@Category", product.Category);
            com.Parameters.AddWithValue("@Manufacturer", product.Manufacturer);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        //Display all record
        public List<Product> GetAllRecord()
        {
            List<Product> productList = new List<Product>();
            SqlCommand com = new SqlCommand("Sp_GetAll", con);
            com.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                Product product = new Product();

                product.ID = dr.Field<int>("ID");
                product.PName = dr.Field<string>("PName");
                product.Price = dr.Field<decimal>("Price");
                product.Category = dr.Field<string>("Category");
                product.Manufacturer = dr.Field<string>("Manufacturer");

                productList.Add(product);
            }

            return productList;
        }
        // Update all record
        public void UpdateRecord(Product product)
        {
            SqlCommand com = new SqlCommand("Sp_Product_Update", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ID", product.ID);
            com.Parameters.AddWithValue("@PNAME", product.PName);
            com.Parameters.AddWithValue("@Price", product.Price);
            com.Parameters.AddWithValue("@Category", product.Category);
            com.Parameters.AddWithValue("@Manufacturer", product.Manufacturer);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        // Get Record by name
        public DataSet GetRecordByName(string PName)
        {
            SqlCommand com = new SqlCommand("Sp_GetRecordByName", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@PName", PName);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        // Delete record
        public void DeleteRecord(int id)
        {
            SqlCommand com = new SqlCommand("Sp_Product_delete", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ID", id);

            con.Open();
            com.ExecuteNonQuery();
            con.Close();

        }

        // Login control
        public UserProfile LoginControl(string userName, string password)
        {
            UserProfile userProfile = new UserProfile();
            SqlCommand com = new SqlCommand("Sp_LoginControl", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@Username", userName);
            com.Parameters.AddWithValue("@Password", password);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];

                userProfile.UserId = dr.Field<int>("UserId");
                userProfile.UserName = dr.Field<string>("UserName");
                userProfile.Password = dr.Field<string>("Password");
                userProfile.IsActive = dr.Field<bool>("IsActive");

                return userProfile;
            }
            else
            {
                return null;

            }
        }
    }
}