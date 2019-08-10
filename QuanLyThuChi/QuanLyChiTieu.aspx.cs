using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyThuChi
{
    public partial class QuanLyChiTieu : System.Web.UI.Page
    {
        ThongKeKhoanChi thongke = new ThongKeKhoanChi();
        public bool daThem;
        protected void Page_Load(object sender, EventArgs e)
        {
            CapNhatGridView();
            daThem = thongke.ThongKeHomNay().Rows.Count > 0;
        }

        protected void BtnThemKhoanChi_Click(object sender, EventArgs e)
        {
            try
            {
                int sotien = int.Parse(txtSoTien.Text);
                int loaikhoanchi = int.Parse(dropdownLoaiKhoanChi.SelectedValue);
                string nguoithem = Session["username"].ToString();
                thongke.ThemKhoanChi(sotien, loaikhoanchi, nguoithem, chitiet.Text);
            }
            catch
            {
                Response.Write("<script>window.onload = function(){alert('Số tiền không được trống')}</script>");
                return;
            }
            
            Response.Write("<script>window.onload = ()=>alert('Thêm thành công!')</script>");
            txtSoTien.Text = "";
            CapNhatGridView();
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
                    gridViewKhoanChi.DataSource = thongke.ThongKeHomNay();
                    break;
                case "thangNay":
                    gridViewKhoanChi.DataSource = thongke.XemTungKhoanChi(DateTime.Now.Month, DateTime.Now.Year);
                    break;
            }
            gridViewKhoanChi.DataBind();
            gridViewKhoanChi.Dispose();
            if (gridViewKhoanChi.HeaderRow != null)
                gridViewKhoanChi.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}