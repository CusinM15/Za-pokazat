using FerryWPF.Business.Repositories;

namespace FerryWPF.Business.Services
{
    public class PortService : IPortService
    {
        private readonly IGenericRepository _genericRepository;

        public PortService(GenericRepository genericRepository)
        {
            _genericRepository = genericRepository;
        }

        public int Insert<T>(T el)
        {
            return _genericRepository.Insert(el);
        }

        public double GetWorkerSalary()
        {
            return _genericRepository.GetWorkerSalary();
        }

        public double GetWorkerSalary_ThisMonth()
        {
            return _genericRepository.GetWorkerSalary_ThisMonth();
        }

        public void UpdateNameInVehicle(int id, string name)
        {
            _genericRepository.UpdateNameInVehicle(id, name);
        }

        public void OppeningClosingTheDoors(int id, bool door)
        {
            _genericRepository.OppeningClosingTheDoors(id, door);
        }

        public void UpdateFuel(int id)
        {
            _genericRepository.UpdateFuel(id);
        }

        public int NumberVehicleTypes()
        {
            return _genericRepository.NumberVehicleTypes();
        }

        public string WhichType(int id)
        {
            return _genericRepository.WhichType(id);
        }
    }
}
