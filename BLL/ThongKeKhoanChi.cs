using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ThongKeKhoanChi
    {
        Data data = new Data();
        
        public SqlDataReader ThongKeTong(int thang, int nam)
        {
            return data.ExcuteQueryReader(String.Format("select sum(sotien) as 'sotien', CAST(ngay AS DATE) as'ngay' " +
                "from khoanchi  WHERE ngay >= '{0}-{1}-1' group by CAST(ngay AS DATE)", nam, thang));
        }

        public long tongThang(int thang, int nam)
        {
            long tong = 0;
            SqlDataReader rd = data.ExcuteQueryReader(String.Format("select sum(sotien) as 'tong'" +
                "from khoanchi  WHERE ngay >= '{0}-{1}-1'",thang,nam));
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    tong += (long)Math.Floor(float.Parse(rd["tong"].ToString()));
                }
            }
            return tong;
        }

        public DateTime LastTime()
        {
            SqlDataReader rd = data.ExcuteQueryReader("select max(ngay) as 'lastTime' from KHOANCHI");
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    return (DateTime)rd["lastTime"];
                }
            }
            return DateTime.Now;
        }

        public DataTable ThongKeHomNay()
        {
            string sql = "select*from KHOANCHI inner join " +
                "LOAIKHOANCHI on KHOANCHI.loaikhoanchi=loaikhoanchi.ID " +
                "where CAST(ngay as date) = CAST(GETDATE() as date) order by ngay desc";
            return data.ExcuteQuery(sql);
        }

        public string LastUser()
        {
            SqlDataReader rd = data.ExcuteQueryReader("select nguoithem as 'lastUser' from khoanchi where ngay= (select max(ngay) from KHOANCHI)");
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    return Convert.ToString(rd["lastUser"]);
                }
            }
            return "";
        }

        public SqlDataReader ThongKeTheoLoaiChi(int thang, int nam)
        {
            return data.ExcuteQueryReader(String.Format("select sum(sotien) as " +
                "'tongtien',tenkhoanchi from KHOANCHI inner join LOAIKHOANCHI " +
                "on KHOANCHI.loaikhoanchi = loaikhoanchi.ID " +
                "where ngay >= '{0}-{1}-1' group by tenkhoanchi order by 'tongtien' desc", nam,thang));
        }

        public DataTable XemTungKhoanChi(int thang, int nam)
        {
            string sql = String.Format("select * from khoanchi inner join" +
                " LOAIKHOANCHI on KHOANCHI.loaikhoanchi = loaikhoanchi.ID  " +
                "where ngay >= '{0}-{1}-1' order by ngay desc", nam,thang);
            return data.ExcuteQuery(sql);
        }

        public void ThemKhoanChi(int sotien, int loaikhoanchi, string nguoithem,string chitiet)
        {
            string sql = String.Format("insert  into KHOANCHI(sotien,loaikhoanchi,nguoithem,chitiet)" +
                " values({0},{1},'{2}',N'{3}')",sotien,loaikhoanchi,nguoithem,chitiet);
            data.ExcuteQuery(sql);
        }
    }
}
