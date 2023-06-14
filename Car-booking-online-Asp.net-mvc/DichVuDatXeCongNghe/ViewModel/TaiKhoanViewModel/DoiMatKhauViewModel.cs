using DichVuDatXeCongNghe.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DichVuDatXeCongNghe.ViewModel
{
    public class DoiMatKhauViewModel: DichVuDatXeWebsiteEntities1
	{
		[Required(ErrorMessage = "Yêu cầu nhập mật khẩu hiện tại")]
		[DataType(DataType.Password)]
		public string MatKhauHienTai { get; set; }

		[Required(ErrorMessage = "Yêu cầu nhập mật khẩu mới")]
		//[StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
		[DataType(DataType.Password)]
		[Display(Name = "New password")]
		public string MatKhauMoi { get; set; }

		[DataType(DataType.Password)]
		[Display(Name = "Confirm new password")]
		[Compare("MatKhauMoi", ErrorMessage = "The new password and confirmation password do not match.")]
		public string NhapLaiMatKhauMoi { get; set; }
	}
}