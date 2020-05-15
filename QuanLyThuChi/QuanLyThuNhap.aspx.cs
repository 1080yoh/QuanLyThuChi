using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using BLL;


namespace QuanLyThuChi
{
    public partial class QuanLyThuNhap : System.Web.UI.Page
    {
        ThongKeKhoanThu thongke = new ThongKeKhoanThu();
        public bool daThem;
        public bool isLoadDropdownThoiGian = false;
        protected void Page_Load(object sender, EventArgs e)
        {

            InitDropdownListThongKeThoiGian();

            CapNhatGridView();
            daThem = thongke.ThongKeHomNay().Rows.Count > 0;
        }

        private void InitDropdownListThongKeThoiGian()
        {
            SqlDataReader data = thongke.GetListThoiGian();
            if (chonNgay.Items.FindByValue("homNay") != null)
                return;
            chonNgay.Items.Add(new ListItem("Hôm nay", "homNay"));
            chonNgay.Items.Add(new ListItem("Tháng này", "thangNay"));
            if (data.HasRows)
            {
                while (data.Read())
                {
                    // 8/11/2019 12:00:00 AM
                    string thang = data["thang"].ToString();
                    chonNgay.Items.Add(new ListItem("Tháng " + thang + "-2019", "2019-" + thang));
                    // chonNgay.Items.Add(new ListItem(data["ngay"].ToString(), "123"));
                }
            }

        }

        protected void BtnThemKhoanThu_Click(object sender, EventArgs e)
        {
            try
            {
                int sotien = int.Parse(txtSoTien.Text);
                int loaikhoanthu = int.Parse(dropdownLoaiKhoanThu.SelectedValue);
                string nguoithem = Session["username"].ToString();
                thongke.ThemKhoanThu(sotien, loaikhoanthu, nguoithem, chitiet.Text.ToString());
                Response.Write("<script>window.onload = ()=>alert('Thêm thành công!')</script>");
                txtSoTien.Text = "";
                chitiet.Text = "";
                dropdownLoaiKhoanThu.SelectedIndex = 0;
                CapNhatGridView();
            }
            catch
            {
                Response.Write("<script>window.onload = function(){alert('Số tiền không được trống')}</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CapNhatGridView();
        }

        private void CapNhatGridView()
        {
            switch (chonNgay.SelectedValue)
            {
                case "homNay":
                    gridViewKhoanThu.DataSource = thongke.ThongKeHomNay();
                    break;
                case "thangNay":
                    gridViewKhoanThu.DataSource = thongke.XemTungKhoanThu(DateTime.Now.Month, DateTime.Now.Year);
                    break;
                default:
                    string[] tg = chonNgay.SelectedValue.Split('-');
                    gridViewKhoanThu.DataSource = thongke.XemTungKhoanThu(Convert.ToInt32(tg[1]), Convert.ToInt32(tg[0]));
                    break;
            }
            gridViewKhoanThu.DataBind();
            gridViewKhoanThu.Dispose();
            if (gridViewKhoanThu.HeaderRow != null)
                gridViewKhoanThu.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}