using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteDatXeCongNghe
{
    public class BookingHub : Hub
    {
        public void SendBookingData(string distance, string duration, string totalFare, string location1, string location2, string type, string phone, string payment, string DateTime, string PassengerImage, string PassengerName)
        {
            
            Clients.All.displayBookingData(distance, duration, totalFare, location1, location2, type, phone, payment, DateTime, PassengerImage, PassengerName);
           
        }
        public void driverAcceptsRide(string driverLocation)
        {
            Clients.All.updateBookingStatus("accepted", driverLocation);
        }


        public void DriverCancelsRide()
        {
            Clients.All.updateBookingStatus("cancelled");
        }
        public void SendDriverData2(string PhoneNumber, string PhoneNumbers, string DriverLocation, string DriverName, string DriverLicense, string txtLocationPickup, string txtLocationDrop, string distance, string duration, string type, string dated, string result, string totalFare, string DriverRated, string DriverImages)
        {

            Clients.All.displaySendDriverData2(PhoneNumber, PhoneNumbers, DriverLocation, DriverName, DriverLicense, txtLocationPickup, txtLocationDrop, distance, duration, type, dated, result, totalFare, DriverRated, DriverImages);

        }
        public void SendAnnounce()
        {
            // Send the announcement to NhanChuyenXe.cshtml using SignalR
            Clients.All.showSweetAlert();
        }
        public void AcceptPickupRequest()
        {
            Clients.All.updateRequestStatus("accepted");
        }

        public void CancelPickupRequest()
        {
            Clients.All.updateRequestStatus("cancelled");
        }
        public void SendPaymentCash(string passengerName, string originalPrice, string surchargePrice, string totalPrice)
        {
            // Call the ShowPaymentPopUp method on the client-side
            Clients.All.showPaymentPopUp(passengerName, originalPrice, surchargePrice, totalPrice);
        }
        public void ConfirmPayment()
        {
            // Call the ShowPaymentSuccess method on the client-side
            Clients.All.showPaymentSuccess();
        }

        public void CancelPayment()
        {
            // Call the ShowPaymentCancelled method on the client-side
            Clients.All.showPaymentCancelled();
        }

    }
}