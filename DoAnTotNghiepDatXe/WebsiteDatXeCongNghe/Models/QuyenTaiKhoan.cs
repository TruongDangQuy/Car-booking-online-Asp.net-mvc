//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebsiteDatXeCongNghe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class QuyenTaiKhoan
    {
        public int MaQuyenTK { get; set; }
        public string SoDienThoai { get; set; }
        public int MaQuyen { get; set; }
    
        public virtual PhanQuyen PhanQuyen { get; set; }
        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
