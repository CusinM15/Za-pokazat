namespace FerryWPF.Business.Models
{
    public class FerryVehicle
    {
        public FerryVehicle(int idVeh, int idFer)
        {
            IdVehicle = idVeh;
            IdFerry = idFer;
        }
        public int IdVehicle { get; set; }
        public int IdFerry { get; set; }
    }
}
