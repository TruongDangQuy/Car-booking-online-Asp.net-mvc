using DichVuDatXeCongNghe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DichVuDatXeCongNghe.Controllers
{
    public class DatXeController : Controller
    {
        DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1();
        // GET: DatXe
        public ActionResult ThongTinDatXe(ThongTinDatXe dx)
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from d in db.ThongTinDatXes
                         join t in db.TaiKhoans on d.SoDienThoai equals t.SoDienThoai
                         where (d.SoDienThoai == a)
                         select d).ToList();
            return View(query);
        }
        public ActionResult GoogleMap()
        {
            if (Session["SoDienThoai"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("DangNhap");
            }
        }
        [HttpPost]
        public ActionResult GoogleMap(string distance,string duration,string totalFare,string location1,string location2,string type,string phone,string payment,string DateTime)
        {
            ThongTinDatXe dx = new ThongTinDatXe();
            dx.SoKm = distance;
            dx.ThoiGian = duration;
            dx.ThanhTien = totalFare;
            dx.DiemDon = location1;
            dx.DiemDen = location2;
            dx.LoaiXe = type;
            dx.SoDienThoai = phone;
            dx.ThanhToan = payment;
            dx.NgayGioDat = DateTime;
            db.ThongTinDatXes.Add(dx);
            db.SaveChanges();
            return View();
        }
        public ActionResult GoogleMap2()
        {
            if (Session["SoDienThoai"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("DangNhap");
            }
        }
        [HttpPost]
        public ActionResult GoogleMap2(ThongTinDatXe dx)
        {           
            db.ThongTinDatXes.Add(dx);
            db.SaveChanges();
            return View();
        }
        [HttpPost]
        public JsonResult XoaThongTinDatXe(int MaDatXe)
        {
            bool result = false;
            ThongTinDatXe dx=db.ThongTinDatXes.SingleOrDefault(x=> x.MaDatXe == MaDatXe);
            if (dx != null)
            {
                db.ThongTinDatXes.Remove(dx);
                db.SaveChanges();
                result = true;
            }                       
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}