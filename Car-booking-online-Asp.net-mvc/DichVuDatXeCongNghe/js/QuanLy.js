var tabs = document.querySelectorAll(".tabs_wrap ul li");
var KhachHang = document.querySelectorAll(".KhachHang");
var ThongTinDatXe = document.querySelectorAll(".ThongTinDatXe");
var TaiKhoan = document.querySelectorAll(".TaiKhoan");
var TaiXe = document.querySelectorAll(".TaiXe");
var DanhGia = document.querySelectorAll(".DanhGia");
var all = document.querySelectorAll(".item_wrap");
const btnadd = document.querySelector(".js-hidden");

tabs.forEach((tab) => {
	tab.addEventListener("click", () => {
		tabs.forEach((tab) => {
			tab.classList.remove("active");
		})
		tab.classList.add("active");
		var tabval = tab.getAttribute("data-tabs");

		all.forEach((item) => {
			item.style.display = "none";
		})

		if (tabval == "KhachHang") {
			KhachHang.forEach((KhachHang) => {
				KhachHang.style.display = "block";
				btnadd.style.display = "none";
			})
		}
		else if (tabval == "ThongTinDatXe") {
			ThongTinDatXe.forEach((ThongTinDatXe) => {
				ThongTinDatXe.style.display = "block";
				btnadd.style.display = "none";
			})
		}
		else if (tabval == "TaiKhoan") {
			TaiKhoan.forEach((TaiKhoan) => {
				TaiKhoan.style.display = "block";
				btnadd.style.display = "block";
			})
		}
		else if (tabval == "TaiXe") {
			TaiXe.forEach((TaiXe) => {
				TaiXe.style.display = "block";
				btnadd.style.display = "none";
			})
		}
		else if (tabval == "DanhGia") {
			DanhGia.forEach((DanhGia) => {
				DanhGia.style.display = "block";
				btnadd.style.display = "none";
			})
		}
		else {
			all.forEach((item) => {
				item.style.display = "block";
			})
		}

	})
})