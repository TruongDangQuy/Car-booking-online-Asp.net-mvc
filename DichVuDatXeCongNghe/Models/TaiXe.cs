//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DichVuDatXeCongNghe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TaiXe
    {
        public int MaTX { get; set; }
        public string SoDienThoai { get; set; }
        public string Ten { get; set; }
        public Nullable<System.DateTime> NgayThangNamSinh { get; set; }
        public string Email { get; set; }
        public string BienSo { get; set; }
        public string CCCD { get; set; }
        public Nullable<System.DateTime> NgayDangKy { get; set; }
        public string HinhAnh { get; set; }
    
        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
