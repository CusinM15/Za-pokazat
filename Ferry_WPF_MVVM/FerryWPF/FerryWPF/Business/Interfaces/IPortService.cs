namespace FerryWPF.Business.Services
{
    public interface IPortService
    {
        double GetWorkerSalary();
        double GetWorkerSalary_ThisMonth();
        int Insert<T>(T el);
        int NumberVehicleTypes();
        void OppeningClosingTheDoors(int id, bool door);
        void UpdateFuel(int id);
        void UpdateNameInVehicle(int id, string name);
        string WhichType(int id);
    }
}