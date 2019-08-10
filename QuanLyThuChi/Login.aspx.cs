using BLL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyThuChi
{
    public partial class Login : System.Web.UI.Page
    {
        private QuanLyTaiKhoan tk = new QuanLyTaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logon"] !=null && Session["logon"].Equals(true))
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            dangnhap();
        }

        private void dangnhap()
        {
            string txtUsername = username.Text;
            string txtpPassword = password.Text;
            if (tk.CheckLogin(txtUsername,txtpPassword))
            {
                Session.Add("logon", true);
                Session.Add("username", txtUsername);
                Response.Redirect("Default.aspx");
            }
            else
            {
                ThongBao.Text = "**sai tên đăng nhập hoặc mật khẩu!";
            }
            
        }
    }
}