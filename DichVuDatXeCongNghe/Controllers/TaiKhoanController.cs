using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DichVuDatXeCongNghe.Models;
using DichVuDatXeCongNghe.Context;
using DichVuDatXeCongNghe.ViewModel;
using System.Security.Cryptography;
using System.Text;
using System.Web.Helpers;
using System.Security.Policy;
using System.Data.Entity.Core.Metadata.Edm;

namespace DichVuDatXeCongNghe.Controllers
{
    public class TaiKhoanController : Controller
    {
        // GET: TaiKhoan
        public ActionResult Index()
        {
            return View();
        }       
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(TaiKhoan tk)
        {
            using (DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1()) {
                if (ModelState.IsValid)
                {
                    
                    var check = db.TaiKhoans.FirstOrDefault(s => s.SoDienThoai == s.SoDienThoai && s.MatKhau == s.MatKhau);
                    if (check != null)
                    {
                        
                        db.TaiKhoans.Add(tk);
                        Session["SoDienThoai"] = tk.SoDienThoai.ToString();
                        db.SaveChanges();                      
                        return RedirectToAction("ThemMoiKH", "KhachHang");
                    }
                }
                else
                {
                    ViewBag.Message = " Đăng ký không thành công! ";
                    return View();
                }
            }
            return View();
        }      
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(TaiKhoan tk)
        {
            
             using (DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1())
             {
                var usr = db.TaiKhoans.Where(a => a.SoDienThoai.Equals(tk.SoDienThoai) && a.MatKhau.Equals(tk.MatKhau)).FirstOrDefault();
                if (usr != null)
                 {
                     Session["SoDienThoai"] = tk.SoDienThoai.ToString();
                     Session["MatKhau"] = tk.MatKhau.ToString();
                     return RedirectToAction("Services");
                 }
                else
                {
                    ModelState.AddModelError("", " Tên tài khoản hoặc mật khẩu sai! ");
                }
             }
             return View();
        }
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
        public ActionResult DangXuat()
        {
            Session.Abandon();//remove session
            return RedirectToAction("DangNhap");
        }
        public ActionResult Services()
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
        public ActionResult DoiMatKhau()
        {
            return View();
        }
        [HttpPost,Authorize]
        public ActionResult DoiMatKhau(DoiMatKhauViewModel dmk)
        {
            
            using(DichVuDatXeWebsiteEntities1 db=new DichVuDatXeWebsiteEntities1())
            {
                if (ModelState.IsValid)
                {
                    
                }
            }
            return View();
        }
        
    }
}