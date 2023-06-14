using System;
using System.Collections.Generic;
using System.Data.Entity;
using DichVuDatXeCongNghe.Models;
using DichVuDatXeCongNghe.ViewModel;
using System.Linq;
using System.Web;

namespace DichVuDatXeCongNghe.Context
{
    public class OurDbContext: DichVuDatXeWebsiteEntities1
    {
        public DbSet<TaiKhoanViewModel> taiKhoanViews { get; set; }
       
    }
}