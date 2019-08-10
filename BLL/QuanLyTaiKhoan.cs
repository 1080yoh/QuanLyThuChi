using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class QuanLyTaiKhoan
    {
        private Data data = new Data();

        public bool CheckLogin(string username, string password)
        {
            string sql = String.Format("SELECT * FROM TAIKHOAN " +
                "WHERE USERNAME='{0}' and PASSWORD='{1}'", username, password);
            DataTable table = data.ExcuteQuery(sql);
            return table.Rows.Count > 0;
        }

        public bool CheckTK(string username)
        {
            string sql = String.Format("select * from taikhoan where username='{0}'", username);
            DataTable table = data.ExcuteQuery(sql);
            return table.Rows.Count == 0;
        }

        public void ThemTaiKhoan(string username, string password)
        {
            string sql = String.Format("INSERT INTO TAIKHOAN values('{0}','{1}')",
                 username, password);
            data.ExcuteNonQuery(sql);
        }

        public void ChangePassword(string username, string newPassword)
        {
            string sql = String.Format("UPDATE TAIKHOAN " +
                "SET password='{0}' WHERE username='{1}'", newPassword, username);
            data.ExcuteNonQuery(sql);
        }
    }
}
