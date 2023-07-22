namespace FerryWPF.Business.Models
{
    public class VehicleLocation
    {
        private int _id { get; set; }
        public int idVehicle { get; set; }
        public int idLocation { get; set; }
        public VehicleLocation(int veh, int loc)
        {
            idLocation = loc;
            idVehicle = veh;
        }
    }
}
