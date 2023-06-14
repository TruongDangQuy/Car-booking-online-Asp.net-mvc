using DichVuDatXeCongNghe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DichVuDatXeCongNghe.ViewModel;
using DichVuDatXeCongNghe.ViewModel.MultipleData;
using System.IO;

namespace DichVuDatXeCongNghe.Controllers
{
    public class QuanLyController : Controller
    {
        // GET: QuanLy
        DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1();
        public ActionResult QuanLy()
        {
            var mymodel = new MultipleData();
            mymodel.khachHangs = db.KhachHangs.ToList();
            mymodel.thongTinDatXes = db.ThongTinDatXes.ToList();
            mymodel.taiKhoans=db.TaiKhoans.ToList();
            mymodel.taiXes = db.TaiXes.ToList();
            mymodel.danhGias=db.DanhGias.ToList();
            return View(mymodel);
        }
        public ActionResult QuanLySuaDoiKH(int id)
        {

            KhachHang Khach = db.KhachHangs.Find(id);
            //var Khach = db.KhachHangs.Find(id);            
            return View(Khach);
        }
        [HttpPost]
        public ActionResult QuanLySuaDoiKH(KhachHang kh, HttpPostedFileBase HinhAnhUpload)
        {
            string path = uploadimage(HinhAnhUpload);

            // move this here, so it has value before ModelState.IsValid
            kh.HinhAnh = path;

            if (ModelState.IsValid)
            {
                db.Entry(kh).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("QuanLy");
            }
            return View(kh);

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
                        path = Path.Combine(Server.MapPath("~/image/KhachHang"), random + Path.GetFileName(file.FileName));
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
                    Response.Write("<script>alert('Only jpg ,jpeg or png formats are acceptable....'); </script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please select a file'); </script>");
                path = "-1";
            }
            return path;
        }
        public ActionResult QuanLyThemMoiKH()
        {
            return View();
        }
        [HttpPost]
        public ActionResult QuanLyThemMoiKH(KhachHang kh, HttpPostedFileBase HinhAnhUpload)
        {
            DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1();
            //Add new
            db.KhachHangs.Add(kh);
            //Save
            db.SaveChanges();
            if (HinhAnhUpload != null && HinhAnhUpload.ContentLength > 0)
            {
                int id = int.Parse(db.KhachHangs.ToList().Last().MaKH.ToString());
                string _FileName = "";
                int index = HinhAnhUpload.FileName.IndexOf('.');
                _FileName = "kh" + id.ToString() + "." + HinhAnhUpload.FileName.Substring(index + 1);
                String _path = Path.Combine(Server.MapPath("~/image/KhachHang"), _FileName);
                HinhAnhUpload.SaveAs(_path);

                KhachHang k = db.KhachHangs.FirstOrDefault(x => x.MaKH == id);
                k.HinhAnh = _FileName;
                db.SaveChanges();
            }
            ViewBag.Message = kh.Ten + kh.SoDienThoai + " Đăng ký thành công ";
            return RedirectToAction("QuanLy");

        }
        public ActionResult QuanLyThemMoiTK()
        {
            return View();
        }
        [HttpPost]
        public ActionResult QuanLyThemMoiTK(TaiKhoan tk)
        {
            using (DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1())
            {
                if (ModelState.IsValid)
                {

                    var check = db.TaiKhoans.FirstOrDefault(s => s.SoDienThoai == s.SoDienThoai && s.MatKhau == s.MatKhau);
                    if (check != null)
                    {

                        db.TaiKhoans.Add(tk);
                        Session["SoDienThoai"] = tk.SoDienThoai.ToString();
                        db.SaveChanges();
                        return RedirectToAction("QuanLyThemMoiKH", "QuanLy");
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
    }
}