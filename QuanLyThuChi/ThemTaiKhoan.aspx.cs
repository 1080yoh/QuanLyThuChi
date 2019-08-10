using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyThuChi
{
    public partial class ThemTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        QuanLyTaiKhoan tk = new QuanLyTaiKhoan();
        protected void ThemTaiKhoanBtn_Click(object sender, EventArgs e)
        {
            if (tk.CheckTK(username.Text))
            {
                invalidUsername.Text = "";
                if (password.Text.Equals(confirmPassword.Text))
                {
                    invalidConfirm.Text = "";
                    tk.ThemTaiKhoan(username.Text, password.Text);
                    Response.Write("<script>alert('Thêm thành công tài khoản \"" + username.Text + "\"')</script>");
                }
                else
                {
                    invalidConfirm.Text = "Mật khẩu không trùng khớp";
                }
            }
            else
            {
                invalidUsername.Text = "Tài khoản đã tồn tại";
            }
            
        }
    }
}