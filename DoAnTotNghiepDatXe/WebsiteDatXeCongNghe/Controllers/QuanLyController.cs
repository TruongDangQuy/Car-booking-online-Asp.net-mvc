using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteDatXeCongNghe.Models;
using WebsiteDatXeCongNghe.ViewModel.MultipleData;

namespace WebsiteDatXeCongNghe.Controllers
{
    public class QuanLyController : Controller
    {
        private DichVuDatXeWebsite3Entities db = new DichVuDatXeWebsite3Entities();
        // GET: QuanLy
        public ActionResult QuanLy()
        {
            var mymodel = new MultipleData();
            mymodel.khachHangs = db.KhachHangs.ToList();
            mymodel.thongTinDatXes = db.ThongTinDatXes.ToList();
            mymodel.taiKhoans = db.TaiKhoans.ToList();
            mymodel.taiXes = db.TaiXes.ToList();
            mymodel.danhGias = db.DanhGiaUngDungs.ToList();
            mymodel.khuyenMais = db.KhuyenMais.ToList();
            mymodel.thanhToans = db.ThanhToans.ToList();
            mymodel.danhGiaTaiXes = db.DanhGiaTaiXes.ToList();
            mymodel.taiXeNhanChuyenXes = db.TaiXeNhanChuyenXes.ToList();
            mymodel.taiKhoanNganHangs = db.TaiKhoanNganHangs.ToList();
            mymodel.quyenTaiKhoans = db.QuyenTaiKhoans.ToList();
            mymodel.phanQuyens = db.PhanQuyens.ToList();
            return View(mymodel);
        }
    }
}