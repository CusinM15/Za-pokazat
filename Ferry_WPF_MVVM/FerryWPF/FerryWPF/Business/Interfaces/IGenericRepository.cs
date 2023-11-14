namespace FerryWPF.Business.Repositories
{
    public interface IGenericRepository
    {
        double GetWorkerSalary();
        double GetWorkerSalary_ThisMonth();
        int Insert<T>(T data);
        int NumberVehicleTypes();
        void OppeningClosingTheDoors(int id, bool door);
        void UpdateFuel(int id);
        void UpdateNameInVehicle(int id, string name);
        string WhichType(int id);
    }
}