using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyThuChi
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        QuanLyTaiKhoan tk = new QuanLyTaiKhoan();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DoiMatKhauBtn_Click(object sender, EventArgs e)
        {
            if (!tk.CheckLogin(Session["username"].ToString(), password.Text))
            {
                invalidPassword.Text = "Mật khẩu cũ không đúng";
            }
            else
            {
                invalidPassword.Text = "";
                if (!newPassword.Text.Equals(confirmPassword.Text))
                {
                    invalidConfirm.Text = "Mật khẩu mới phải trùng khớp";
                }
                else
                {
                    tk.ChangePassword(Session["username"].ToString(), newPassword.Text);
                    Response.Write("<script>alert('Đổi mật khẩu thành công')</script>");
                    invalidConfirm.Text = "";
                }
            }
        }
    }
}