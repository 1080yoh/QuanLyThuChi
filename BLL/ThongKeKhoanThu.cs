using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DAL;

namespace BLL
{
    public class ThongKeKhoanThu
    {
        Data data = new Data();

        public SqlDataReader ThongKeTong(int thang, int nam)
        {
            return data.ExcuteQueryReader(String.Format("select sum(sotien) as 'sotien', CAST(ngay AS DATE) as'ngay' " +
                "from khoanthu  WHERE ngay >= '{0}-{1}-1' group by CAST(ngay AS DATE)", nam, thang));
        }

        public SqlDataReader GetListThoiGian()
        {
            return data.ExcuteQueryReader("select distinct Month(ngay) as 'thang' from KHOANTHU");
        }

        public long tongThang(int thang, int nam)
        {
            long tong = 0;
            SqlDataReader rd = data.ExcuteQueryReader(String.Format("select sum(sotien) as 'tong'" +
                "from khoanthu  WHERE ngay >= '{0}-{1}-1'", thang, nam));
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
            SqlDataReader rd = data.ExcuteQueryReader("select max(ngay) as 'lastTime' from khoanthu");
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
            string sql = "select * from KHOANTHU inner join " +
                " LOAIKHOANTHU on KHOANTHU.loaikhoanthu=loaikhoanthu.ID " +
                "where CAST(ngay as date) = CAST(GETDATE() as date) order by ngay desc";
            return data.ExcuteQuery(sql);
        }

        public string LastUser()
        {
            SqlDataReader rd = data.ExcuteQueryReader("select nguoithem as 'lastUser' from khoanthu where ngay= (select max(ngay) from KHOANTHU)");
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    return Convert.ToString(rd["lastUser"]);
                }
            }
            return "";
        }

        public SqlDataReader ThongKeTheoLoaiThu(int thang, int nam)
        {
            return data.ExcuteQueryReader(String.Format("select sum(sotien) as " +
                "'tongtien',tenkhoanthu from KHOANTHU inner join LOAIKHOANTHU " +
                "on KHOANTHU.loaikhoanthu = loaikhoanthu.ID " +
                "where ngay >= '{0}-{1}-1' and ngay < '{0}-{2}-1'  group by tenkhoanthu order by 'tongtien' desc", nam, thang, thang+1));
        }

        public DataTable XemTungKhoanThu(int thang, int nam)
        {
            string sql = String.Format("select * from khoanthu inner join" +
                " LOAIKHOANTHU on KHOANTHU.loaikhoanthu = loaikhoanthu.ID  " +
                "where ngay >= '{0}-{1}-1' and ngay < '{0}-{2}-1' order by ngay desc", nam, thang, thang+1);
            return data.ExcuteQuery(sql);
        }

        public void ThemKhoanThu(int sotien, int loaikhoanthu, string nguoithem, string chitiet)
        {
            string sql = String.Format("insert  into KHOANTHU(sotien,loaikhoanthu,nguoithem,chitiet)" +
                " values({0},{1},'{2}',N'{3}')", sotien, loaikhoanthu, nguoithem, chitiet);
            data.ExcuteQuery(sql);
        }
    }
}
