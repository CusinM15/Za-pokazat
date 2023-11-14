namespace FerryWPF.Business.Models
{
    public class VehicleLocation
    {
        private int Id { get; set; }
        public int IdVehicle { get; set; }
        public int IdLocation { get; set; }
        public VehicleLocation(int veh, int loc)
        {
            IdLocation = loc;
            IdVehicle = veh;
        }
    }
}
