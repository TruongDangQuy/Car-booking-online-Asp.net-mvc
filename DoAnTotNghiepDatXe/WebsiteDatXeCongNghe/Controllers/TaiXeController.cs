using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using WebsiteDatXeCongNghe.Models;

namespace WebsiteDatXeCongNghe.Controllers
{
    public class TaiXeController : Controller
    {
        private DichVuDatXeWebsite3Entities db = new DichVuDatXeWebsite3Entities();
        // GET: TaiXe
        public ActionResult ThongTinTaiXe()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.TaiXes
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        public ActionResult ThongTinCaNhanTaiXe()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.TaiXes
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        public ActionResult SuaDoiTX(int? id)
        {
            if (id == null)
            {
                // Handle the case when 'id' is null
                return RedirectToAction("ThongTinCaNhanTaiXe");
            }

            var TaiXe = db.TaiXes.FirstOrDefault(k => k.MaTX == id);
            if (TaiXe == null)
            {
                // Handle the case when 'TaiXe' is null
                return RedirectToAction("ThongTinCaNhanTaiXe");
            }

            var TaiXeDTO = new TaiXeDTO
            {
                MaTX = TaiXe.MaTX,
                SoDienThoai = TaiXe.SoDienThoai,
                Ten = TaiXe.Ten,
                NgayThangNamSinh = TaiXe.NgayThangNamSinh,
                Email = TaiXe.Email,
                BienSo = TaiXe.BienSo,
                CCCD = TaiXe.CCCD,
                HinhAnh = TaiXe.HinhAnh
            };

            return Json(TaiXeDTO, JsonRequestBehavior.AllowGet);
        }



        [HttpPost]
        public ActionResult SuaDoiTX(TaiXe tx, HttpPostedFileBase HinhAnhUpload)
        {
            if (HinhAnhUpload != null)
            {
                string path = uploadimage(HinhAnhUpload);
                tx.HinhAnh = path;
            }

            if (ModelState.IsValid)
            {
                db.Entry(tx).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ThongTinCaNhanTaiXe");
            }

            return View(tx);
        }

        public string uploadimage(HttpPostedFileBase file)
        {
            Random r = new Random();
            string path = "-1";
            int random = r.Next();
            if (file != null && file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg") || extension.ToLower().Equals(".png"))
                {
                    try
                    {
                        path = Path.Combine(Server.MapPath("~/image/TaiXe"), random + Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        path = "" + random + Path.GetFileName(file.FileName);
                    }
                    catch (Exception ex)
                    {
                        path = "-1";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Only jpg, jpeg, or png formats are acceptable....');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please select a file');</script>");
                path = "-1";
            }
            return path;
        }
        public ActionResult ThongTinNhanChuyen()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.TaiXeNhanChuyenXes
                         join t in db.TaiXes on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        [HttpPost]
        public ActionResult XoaThongTinNhanChuyen(int id)
        {
            TaiXeNhanChuyenXe txnc = db.TaiXeNhanChuyenXes.Find(id);
            db.TaiXeNhanChuyenXes.Remove(txnc);
            db.SaveChanges();
            return RedirectToAction("ThongTinNhanChuyen");
        }

        //public ActionResult SuaDoiViTri(int id)
        //{

        //    KhachHang Khach = db.KhachHangs.Find(id);
        //    //var Khach = db.KhachHangs.Find(id);            
        //    return View(Khach);
        //}
        [HttpPost]
        public ActionResult SuaDoiViTri(string location, string phoneNumber)
        {
            TaiXe tx = db.TaiXes.SingleOrDefault(x => x.SoDienThoai == phoneNumber);
            if (tx != null)
            {
                tx.ViTri = location;
                db.Entry(tx).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }
        public ActionResult TaiXeDonKhach()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.TaiXes
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        [HttpPost]
        public ActionResult SendDriverData(string PhoneNumber, string DriverLocations, string DriverName, string DriverLicense, string txtLocationPickup, string txtLocationDrop, string result, string totalFare, string PassengerPhone, string distance, string duration, string type, string dated, string DriverRate, string DriverImage, string PassengerImages, string PassengerName)
        {
            Session["PhoneNumber"] = PhoneNumber;
            Session["DriverLocations"] = DriverLocations;
            Session["DriverName"] = DriverName;
            Session["DriverLicense"] = DriverLicense;
            Session["txtLocationPickup"] = txtLocationPickup;
            Session["txtLocationDrop"] = txtLocationDrop;
            Session["result"] = result;
            Session["totalFare"] = totalFare;
            Session["PassengerPhone"] = PassengerPhone;
            Session["distance"] = distance;
            Session["duration"]=duration;
            Session["type"] = type;
            Session["dated"]=dated;
            Session["DriverRate"] = DriverRate;
            Session["DriverImage"] = DriverImage;
            Session["PassengerImages"]= PassengerImages;
            Session["PassengerName"] = PassengerName;
            return Json(new { success = true }); // Return a JSON response with the driver's image and rating
        }
        [HttpPost]
        public ActionResult SendOTP()
        {
            return Json(new { success = true });
        }
        public ActionResult DonKhach()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.TaiXes
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
        public ActionResult TraKhach()
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.TaiXes
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);
        }
    }
}