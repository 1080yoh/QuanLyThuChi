using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Data
    {
        string conStr = "Data Source=DELL-ALTER\\SQLEXPRESS;" +
            "Initial Catalog=QLTHUCHI;Integrated Security=True";
        public SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            return con;
        }

        public DataTable ExcuteQuery(string sql)
        {
            SqlConnection con = GetConnection();
            DataTable table = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(sql,con);
            adapter.Fill(table);
            con.Close();
            return table;
        }
        public SqlDataReader ExcuteQueryReader(string sql)
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            return cmd.ExecuteReader();
        }
        public void ExcuteNonQuery(string sql)
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
    }
}
