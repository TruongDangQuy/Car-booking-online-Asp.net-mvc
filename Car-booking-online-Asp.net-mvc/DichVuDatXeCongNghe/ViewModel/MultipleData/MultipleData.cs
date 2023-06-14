using DichVuDatXeCongNghe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DichVuDatXeCongNghe.ViewModel.MultipleData
{
    public class MultipleData
    {
        public IEnumerable<KhachHang> khachHangs { get; set; }
        public IEnumerable<ThongTinDatXe> thongTinDatXes { get; set; }
        public IEnumerable<TaiKhoan> taiKhoans { get; set; }
        public IEnumerable<TaiXe> taiXes { get; set; }
        public IEnumerable<DanhGia> danhGias { get; set; }
    }
}