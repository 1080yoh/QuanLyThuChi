﻿using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyThuChi
{
    public class ChartData
    {
        public List<string> Labels { get; set; }
        public List<int> Data { get; set; }
        public string name { get; set; }
    }
    public partial class ThongKe : System.Web.UI.Page
    {
        static ThongKeKhoanChi thongKeKhoanChi = new ThongKeKhoanChi();
        public long tong = 0;
        public DateTime lastTime;
        public string lastUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            tong = thongKeKhoanChi.tongThang(DateTime.Now.Month, DateTime.Now.Year);
            lastTime = thongKeKhoanChi.LastTime();
            lastUser = thongKeKhoanChi.LastUser();
        }

        [WebMethod]
        public static ChartData ThongKeTong()
        {
            SqlDataReader data = thongKeKhoanChi.ThongKeTong(DateTime.Now.Month, DateTime.Now.Year);
            List<string> label = new List<string>();
            List<int> dt = new List<int>();
            if (data.HasRows)
            {
                while (data.Read())
                {
                    label.Add(data["ngay"].ToString());
                    dt.Add(Convert.ToInt32(data["sotien"]));
                }
            }
            return new ChartData
            {
                Data = dt,
                Labels = label,
                name = "Thống kê khoản chi tháng này"
            };
        }
        [WebMethod]
        public static ChartData ThongKeTheoLoaiChi()
        {
            SqlDataReader data = thongKeKhoanChi.ThongKeTheoLoaiChi(DateTime.Now.Month, DateTime.Now.Year);
            List<string> label = new List<string>();
            List<int> dt = new List<int>();
            if (data.HasRows)
            {
                while (data.Read())
                {
                    label.Add(data["tenkhoanchi"].ToString());
                    dt.Add(Convert.ToInt32(data["tongtien"]));
                }
            }
            return new ChartData
            {
                Data = dt,
                Labels = label,
                name = "Thống kê khoản chi tháng này"
            };
        }
    }
}