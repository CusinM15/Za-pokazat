namespace FerryWPF.Business.Models
{
    public class FerryVehicle
    {
        private int _idVehicle;
        private int _idFerry;
        public FerryVehicle(int idVeh, int idFer)
        {
            this.idVehicle = idVeh;
            this.idFerry = idFer;
        }
        public int idVehicle
        {
            get => _idVehicle;
            set => _idVehicle = value;
        }
        public int idFerry
        {
            get => _idFerry;
            set => _idFerry = value;
        }
    }
}
