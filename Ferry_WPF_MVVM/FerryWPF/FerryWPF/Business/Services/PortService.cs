using FerryWPF.Business.Models;
using FerryWPF.Business.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FerryWPF.Business.Services
{
    public class PortService
    {
        private GenericRepository _genericRepository;

        public PortService()
        {
            _genericRepository = new GenericRepository();
        }

        public int Insert<T>(T el)   
        {
            return _genericRepository.Insert(el);
        }

        public double GetWorkerSalary()
        {
            return _genericRepository.GetWorkerSalary();
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
