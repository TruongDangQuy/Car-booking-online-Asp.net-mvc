using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DichVuDatXeCongNghe.Models;

namespace DichVuDatXeCongNghe.Controllers
{
    public class DanhGiaController : Controller
    {
        // GET: DanhGia
        DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1();
        public ActionResult DanhGia()
        {
            //List<DanhGia> list = new List<DanhGia>();
            //string query = "select kh.Ten,kh.HinhAnh,dg.NgayDanhGia,dg.MucDo,dg.NoiDung from KhachHang kh join DanhGia dg on kh.MaKH=dg.MaKH";
            //var list = db.DanhGias.SqlQuery<DanhGia>(query);
            var list = db.DanhGias.Include("KhachHang").ToList();
            return View(list);
        }
    }
}