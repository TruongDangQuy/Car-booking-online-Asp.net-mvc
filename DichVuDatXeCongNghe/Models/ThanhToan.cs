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
    
    public partial class ThanhToan
    {
        public int MaThanhToan { get; set; }
        public string SoDienThoai { get; set; }
        public string SoThe { get; set; }
        public string ChuThe { get; set; }
        public int ThoiHanThang { get; set; }
        public int ThoiHanNam { get; set; }
        public Nullable<int> CVV { get; set; }
    
        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
