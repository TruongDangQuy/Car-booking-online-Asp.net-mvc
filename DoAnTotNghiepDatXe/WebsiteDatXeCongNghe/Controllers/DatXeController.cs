using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Twilio.Types;
using WebsiteDatXeCongNghe.Models;

namespace WebsiteDatXeCongNghe.Controllers
{
    public class DatXeController : Controller
    {
        private DichVuDatXeWebsite3Entities db = new DichVuDatXeWebsite3Entities();
        // GET: DatXe
        public ActionResult ThongTinDatXe(ThongTinDatXe dx)
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from d in db.ThongTinDatXes
                         join t in db.KhachHangs on d.SoDienThoai equals t.SoDienThoai
                         where (d.SoDienThoai == a)
                         select d).ToList();
            return View(query);
        }
        public ActionResult GoogleMap()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.KhachHangs
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        [HttpPost]
        public ActionResult GoogleMap(string distance, string duration, string totalFare, string location1, string location2, string type, string phone, string payment, DateTime DateTime)
        {
            ThongTinDatXe dx = new ThongTinDatXe();
            dx.SoKm = distance;
            dx.ThoiGian = duration;
            dx.ThanhTien = totalFare;
            dx.DiemDon = location1;
            dx.DiemDen = location2;
            dx.LoaiXe = type;
            dx.SoDienThoai = phone;
            dx.HinhThucThanhToan = payment;
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
        public ActionResult GoogleMap2(string distance, string duration, string totalFare, string location1, string location2, string type, string phone, string payment, DateTime DateTime)
        {
            ThongTinDatXe dx = new ThongTinDatXe();
            dx.SoKm = distance;
            dx.ThoiGian = duration;
            dx.ThanhTien = totalFare;
            dx.DiemDon = location1;
            dx.DiemDen = location2;
            dx.LoaiXe = type;
            dx.SoDienThoai = phone;
            dx.HinhThucThanhToan = payment;
            dx.NgayGioDat = DateTime;
            db.ThongTinDatXes.Add(dx);
            db.SaveChanges();
            return View();
        }
        //[HttpPost]
        //public JsonResult XoaThongTinDatXe(int MaDatXe)
        //{
        //    bool result = false;
        //    ThongTinDatXe dx = db.ThongTinDatXes.SingleOrDefault(x => x.MaDatXe == MaDatXe);
        //    if (dx != null)
        //    {
        //        db.ThongTinDatXes.Remove(dx);
        //        db.SaveChanges();
        //        result = true;
        //    }
        //    return Json(result, JsonRequestBehavior.AllowGet);
        //}
        [HttpPost]
        public ActionResult XoaThongTinDatXe(int id)
        {
            ThongTinDatXe txdx = db.ThongTinDatXes.Find(id);
            db.ThongTinDatXes.Remove(txdx);
            db.SaveChanges();
            return RedirectToAction("ThongTinDatXe");
        }
        public ActionResult NhanChuyenXe()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.KhachHangs
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        public ActionResult KhachDuocDon()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.KhachHangs
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        public ActionResult KhachDuocTra()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.KhachHangs
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        public ActionResult DanhGiaTaiXe()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.KhachHangs
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        [HttpPost]
        public ActionResult DanhGiaTaiXe(string PassengerPhone, string DriverPhone, int value_rate, string content, DateTime date_rate)
        {
            DanhGiaTaiXe dgtx = new DanhGiaTaiXe();
            dgtx.KHDanhGia = PassengerPhone;
            dgtx.TKTaiXe = DriverPhone;
            dgtx.MucDo = value_rate;
            dgtx.BinhLuan = content;
            dgtx.NgayDanhGia = DateTime.Now;
            db.DanhGiaTaiXes.Add(dgtx);
            db.SaveChanges();
            return RedirectToAction("GoogleMap");
        }
        [HttpPost]
        public ActionResult SendPassData(string PhoneNumber, string DriverLocations, string DriverName, string DriverLicense, string txtLocationPickup, string txtLocationDrop, string result, string totalFare, string phoneNumberr, string distance, string duration, string type, string dated, /*string DriverRate,*/ string DriverImage, string PassImager, string PassNamer)
        {
            Session["PhoneNumber"] = PhoneNumber;
            Session["DriverLocations"] = DriverLocations;
            Session["DriverName"] = DriverName;
            Session["DriverLicense"] = DriverLicense;
            Session["txtLocationPickup"] = txtLocationPickup;
            Session["txtLocationDrop"] = txtLocationDrop;
            Session["result"] = result;
            Session["totalFare"] = totalFare;
            Session["phoneNumberr"] = phoneNumberr;
            Session["distance"] = distance;
            Session["duration"] = duration;
            Session["type"] = type;
            Session["dated"] = dated;
            //Session["DriverRate"] = DriverRate;
            Session["DriverImage"] = DriverImage;
            Session["PassImager"] = PassImager;
            Session["PassNamer"] = PassNamer;
            return Json(new { success = true }); // Return a JSON response with the driver's image and rating
        }
    }
}