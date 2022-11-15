using DichVuDatXeCongNghe.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;


namespace DichVuDatXeCongNghe.Controllers
{
    public class KhachHangController : Controller
    {
        // GET: KhachHang
        DichVuDatXeWebsiteEntities1 db = new DichVuDatXeWebsiteEntities1();
        public ActionResult ThongTinKH(KhachHang kh)
        {
            string a = Session["SoDienThoai"].ToString();
            var query = (from k in db.KhachHangs
                         join t in db.TaiKhoans on k.SoDienThoai equals t.SoDienThoai
                         where (k.SoDienThoai == a)
                         select k).ToList();
            return View(query);


        }
        public ActionResult ThemMoiKH()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ThemMoiKH(KhachHang kh,HttpPostedFileBase HinhAnhUpload)
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
                String _path=Path.Combine(Server.MapPath("~/image/KhachHang"),_FileName);
                HinhAnhUpload.SaveAs(_path);

                KhachHang k = db.KhachHangs.FirstOrDefault(x => x.MaKH == id);
                k.HinhAnh = _FileName;
                db.SaveChanges();
            }
            ViewBag.Message = kh.Ten + kh.SoDienThoai + " Đăng ký thành công ";
            return RedirectToAction("ThemMoiKH");
            
        }
        public ActionResult SuaDoiKH(int id)
        {
            
            KhachHang Khach = db.KhachHangs.Find(id);
            //var Khach = db.KhachHangs.Find(id);            
            return View(Khach);
        }
        [HttpPost]
        public ActionResult SuaDoiKH(KhachHang kh,HttpPostedFileBase HinhAnhUpload)
        {
            string path = uploadimage(HinhAnhUpload);

            // move this here, so it has value before ModelState.IsValid
            kh.HinhAnh = path;

            if (ModelState.IsValid)
            {
                db.Entry(kh).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ThongTinKH");
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
    }   
}