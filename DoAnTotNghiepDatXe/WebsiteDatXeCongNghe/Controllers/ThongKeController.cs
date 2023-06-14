using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteDatXeCongNghe.Models;

namespace WebsiteDatXeCongNghe.Controllers
{
    public class ThongKeController : Controller
    {
        private DichVuDatXeWebsite3Entities db = new DichVuDatXeWebsite3Entities();
        // GET: ThongKe
        public ActionResult ThongKeDoanhThu()
        {
            return View();
        }
        public ActionResult ThongKeDoanhThu2()
        {
            return View();
        }
        public ActionResult GetRevenueData(string period, string selectedDate)
        {
            List<dynamic> revenueData = new List<dynamic>();

            DateTime? date = null;
            if (!string.IsNullOrEmpty(selectedDate))
            {
                date = DateTime.ParseExact(selectedDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
            }

            if (period == "day")
            {
                revenueData = db.ThongTinDatXes
                    .Where(x => date == null || DbFunctions.TruncateTime(x.NgayGioDat) == date)
                    .GroupBy(x => DbFunctions.TruncateTime(x.NgayGioDat))
                    .ToList()
                    .Select(g => new
                    {
                        NgayGioDat = g.Key,
                        ThanhTien = g.Sum(x => decimal.Parse(x.ThanhTien.Replace(" VND", "").Replace(".", "")))
                    })
                    .ToList<dynamic>();
            }
            else if (period == "week")
            {
                revenueData = db.ThongTinDatXes
                    .Where(x => date == null || (x.NgayGioDat.Year == date.Value.Year && SqlFunctions.DatePart("wk", x.NgayGioDat) == SqlFunctions.DatePart("wk", date.Value)))
                    .GroupBy(x => new { Year = x.NgayGioDat.Year, Week = SqlFunctions.DatePart("wk", x.NgayGioDat) })
                    .ToList()
                    .Select(g => new
                    {
                        NgayGioDat = g.Select(x => x.NgayGioDat).FirstOrDefault(),
                        ThanhTien = g.Sum(x => decimal.Parse(x.ThanhTien.Replace(" VND", "").Replace(".", "")))
                    })
                    .ToList<dynamic>();
            }
            else if (period == "month")
            {
                revenueData = db.ThongTinDatXes
                    .Where(x => date == null || (x.NgayGioDat.Year == date.Value.Year && x.NgayGioDat.Month == date.Value.Month))
                    .GroupBy(x => new { Year = x.NgayGioDat.Year, Month = x.NgayGioDat.Month })
                    .ToList()
                    .Select(g => new
                    {
                        NgayGioDat = g.Select(x => x.NgayGioDat).FirstOrDefault(),
                        ThanhTien = g.Sum(x => decimal.Parse(x.ThanhTien.Replace(" VND", "").Replace(".", "")))
                    })
                    .ToList<dynamic>();
            }
            else if (period == "year")
            {
                revenueData = db.ThongTinDatXes
                    .Where(x => date == null || x.NgayGioDat.Year == date.Value.Year)
                    .GroupBy(x => x.NgayGioDat.Year)
                    .ToList()
                    .Select(g => new
                    {
                        NgayGioDat = g.Select(x => x.NgayGioDat).FirstOrDefault(),
                        ThanhTien = g.Sum(x => decimal.Parse(x.ThanhTien.Replace(" VND", "").Replace(".", "")))
                    })
                    .ToList<dynamic>();
            }

            return Json(revenueData, JsonRequestBehavior.AllowGet);
        }




        //public ActionResult GetRevenueData(string period)
        //{
        //    List<ThongTinDatXe> revenueData = new List<ThongTinDatXe>();

        //    if (period == "day")
        //    {
        //        revenueData = db.ThongTinDatXes
        //            .GroupBy(x => x.NgayGioDat.Date)
        //            .Select(g => new ThongTinDatXe
        //            {
        //                NgayGioDat = g.Key,
        //                ThanhTien = g.Sum(x => x.ThanhTien),
        //                Period = "day"
        //            })
        //            .ToList();
        //    }
        //    else if (period == "week")
        //    {
        //        revenueData = db.ThongTinDatXes
        //            .GroupBy(x => new { Year = GetIso8601WeekOfYear(x.NgayGioDat), Week = x.NgayGioDat.Year })
        //            .Select(g => new ThongTinDatXe
        //            {
        //                NgayGioDat = g.Select(x => x.NgayGioDat).FirstOrDefault(),
        //                ThanhTien = g.Sum(x => x.ThanhTien),
        //                Period = "week"
        //            })
        //            .ToList();
        //    }
        //    else if (period == "month")
        //    {
        //        revenueData = db.ThongTinDatXes
        //            .GroupBy(x => new { Year = x.NgayGioDat.Year, Month = x.NgayGioDat.Month })
        //            .Select(g => new ThongTinDatXe
        //            {
        //                NgayGioDat = g.Select(x => x.NgayGioDat).FirstOrDefault(),
        //                ThanhTien = g.Sum(x => x.ThanhTien),
        //                Period = "month"
        //            })
        //            .ToList();
        //    }
        //    else if (period == "year")
        //    {
        //        revenueData = db.ThongTinDatXes
        //            .GroupBy(x => x.NgayGioDat.Year)
        //            .Select(g => new ThongTinDatXe
        //            {
        //                NgayGioDat = g.Select(x => x.NgayGioDat).FirstOrDefault(),
        //                ThanhTien = g.Sum(x => x.ThanhTien),
        //                Period = "year"
        //            })
        //            .ToList();
        //    }

        //    return Json(revenueData, JsonRequestBehavior.AllowGet);
        //}

        // GET: ThongKe/GetRevenueData
        public ActionResult GetRevenueData2(string period, string selectedDate, string month, string year)
        {
            List<dynamic> revenueData = new List<dynamic>();

            DateTime? date = null;
            if (!string.IsNullOrEmpty(selectedDate))
            {
                date = DateTime.ParseExact(selectedDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
            }

            if (period == "day")
            {
                revenueData = db.ThongTinDatXes
                    .Where(x => date == null || DbFunctions.TruncateTime(x.NgayGioDat) == date)
                    .GroupBy(x => DbFunctions.TruncateTime(x.NgayGioDat))
                    .Select(g => new
                    {
                        Date = g.Key,
                        RevenueList = g.Select(x => x.ThanhTien)
                    })
                    .AsEnumerable()
                    .Select(x => new
                    {
                        Label = x.Date, // Store the date as-is without formatting
                        TotalRevenue = x.RevenueList.Sum(ParseTotalRevenue)
                    })
                    .ToList<dynamic>();

                // Perform date formatting after retrieving the data
                revenueData = revenueData.Select(x => new
                {
                    Label = x.Label.ToString("dd/MM/yyyy"), // Format the date here
                    TotalRevenue = x.TotalRevenue
                }).ToList<dynamic>();
            }


            else if (period == "week")
            {
                int parsedYear = int.Parse(year);
                int parsedMonth = int.Parse(month);

                var data = db.ThongTinDatXes
                    .Where(x => date == null || (x.NgayGioDat.Year == parsedYear && x.NgayGioDat.Month == parsedMonth))
                    .AsEnumerable()
                    .GroupBy(x => new { Year = x.NgayGioDat.Year, Month = x.NgayGioDat.Month, Week = GetWeekOfMonth(x.NgayGioDat) })
                    .Select(g => new
                    {
                        Year = g.Key.Year,
                        Month = g.Key.Month,
                        Week = g.Key.Week,
                        RevenueList = g.Select(x => x.ThanhTien)
                    })
                    .ToList();

                revenueData = data
                    .Select(x => new
                    {
                        Label = $"Week {x.Week} ({x.Month}/{x.Year})",
                        TotalRevenue = x.RevenueList.Sum(ParseTotalRevenue)
                    })
                    .ToList<dynamic>();
            }

            else if (period == "month")
            {
                int parsedYear = int.Parse(year);
                int parsedMonth = int.Parse(month);

                revenueData = db.ThongTinDatXes
                    .Where(x => date == null || (x.NgayGioDat.Year == parsedYear && x.NgayGioDat.Month == parsedMonth))
                    .GroupBy(x => new { Year = x.NgayGioDat.Year, Month = x.NgayGioDat.Month })
                    .Select(g => new
                    {
                        Year = g.Key.Year,
                        Month = g.Key.Month,
                        RevenueList = g.Select(x => x.ThanhTien)
                    })
                    .AsEnumerable()
                    .Select(x => new
                    {
                        Label = $"{x.Month}/{x.Year}",
                        TotalRevenue = x.RevenueList.Sum(ParseTotalRevenue)
                    })
                    .ToList<dynamic>();
            }
            else if (period == "year")
            {
                int parsedYear = int.Parse(year);

                revenueData = db.ThongTinDatXes
                    .Where(x => date == null || x.NgayGioDat.Year == parsedYear)
                    .GroupBy(x => x.NgayGioDat.Year)
                    .Select(g => new
                    {
                        Year = g.Key,
                        RevenueList = g.Select(x => x.ThanhTien)
                    })
                    .AsEnumerable()
                    .Select(x => new
                    {
                        Label = x.Year.ToString(),
                        TotalRevenue = x.RevenueList.Sum(ParseTotalRevenue)
                    })
                    .ToList<dynamic>();
            }

            return Json(revenueData, JsonRequestBehavior.AllowGet);
        }

        private decimal ParseTotalRevenue(string totalRevenue)
        {
            totalRevenue = totalRevenue.Replace(" VND", "").Replace(".", "");
            return decimal.Parse(totalRevenue, CultureInfo.InvariantCulture);
        }

        private int GetWeekOfMonth(DateTime date)
        {
            DateTime firstDayOfMonth = new DateTime(date.Year, date.Month, 1);
            int daysOffset = (int)firstDayOfMonth.DayOfWeek - 1;
            DateTime firstDayOfWeek = firstDayOfMonth.AddDays(-daysOffset);

            int weekNumber = (date.Day + firstDayOfWeek.Day - 1) / 7 + 1;
            return weekNumber;
        }



    }
    public class RevenueData
    {
        public string NgayGioDat { get; set; }
        public int ThanhTien { get; set; }
    }
}