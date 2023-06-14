using DichVuDatXeCongNghe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DichVuDatXeCongNghe.Controllers
{
    public class ThanhToanController : Controller
    {
        // GET: ThanhToan
        DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1();
        public ActionResult ThanhToan()
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
        public ActionResult ThanhToan(string phone,string sothe,string chuthe,int thoihanthang,int thoihannam,int cvv)
        {
            ThanhToan tt = new ThanhToan();
            tt.SoDienThoai = phone;
            tt.SoThe = sothe;
            tt.ChuThe = chuthe;
            tt.ThoiHanThang = thoihanthang;
            tt.ThoiHanNam = thoihannam;
            tt.CVV = cvv;
            db.ThanhToans.Add(tt);
            db.SaveChanges();
            return View();
        }
    }
}