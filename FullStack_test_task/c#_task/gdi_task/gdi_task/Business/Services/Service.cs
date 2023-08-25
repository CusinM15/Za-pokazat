using gdi_task.Business.Model;
using gdi_task.Business.Repositories;
using System.Collections.ObjectModel;

namespace gdi_task.Business.Services
{
    public class Service
    {
        private GenericRepository _genericRepository;

        public Service()
        {
            _genericRepository = new GenericRepository();
        }

        public void UpdateNameInVehicle(ObservableCollection<SeznamDavcnihZavezancev> data)
        {
            _genericRepository.UpdateNameInVehicle(data);
        }

        public void ClearTable()
        {
            _genericRepository.ClearTable();
        }

    }
}
