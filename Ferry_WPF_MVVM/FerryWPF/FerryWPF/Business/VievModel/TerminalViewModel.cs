using FerryWPF.Business.Infractructure;
using FerryWPF.Business.Models;
using FerryWPF.Business.Services;
using System;
using System.Windows.Input;
using System.Windows.Threading;
using System.Collections.Generic;
using FerryWPF.Business.Enums;
using System.Collections.ObjectModel;
using System.Threading.Tasks;

namespace FerryWPF.Business.VievModel
{

    public class TerminalViewModel : ViewModelBase
    {
        public bool _running;
        public ICommand GoToCommand { get; set; }
        private readonly IPortService _service;
        private string _arrivalText = "waiting";
        private string _fuelText = string.Empty;
        private string _doorOpen = string.Empty;
        private string _doorClose = string.Empty;
        private string _loadText = string.Empty;
        private double _workerSalary;
        private double _workerSalary_ThisMonth;
        public int BigFerrySize = 6;
        public int BigFerryCount = 0;
        public int SmallFerrySize = 8;
        public int SmallFerryCount = 0;
        private Vehicle vehicle;
        public int SmallFerryId;
        public int BigFerryId;
        private bool _hideBtn;
        public string wichFerryWar;
        private readonly int _shortPause = 1000; //pause in minisecunds
        private int numberOfVehicleTypes;
        private ObservableCollection<Text> _listText;
        public List<int> hadDoor = new List<int>() { (int)VehicleTypeEnum.Truck, (int)VehicleTypeEnum.Van };
        public List<int> theSmallerVehicle = new List<int>() { (int)VehicleTypeEnum.Car, (int)VehicleTypeEnum.Van };

        public TerminalViewModel(IPortService portService)
        {
            _service = portService;
            GoToCommand = new DelegateCommand(MainFunction);
            Initialize();
        }

        private void Initialize()
        {
            ListText = new ObservableCollection<Text>();
            HideBtn = true;
            numberOfVehicleTypes = _service.NumberVehicleTypes();
            WorkerSalary = WorkerSalary;
            WorkerSalary_ThisMonth = WorkerSalary_ThisMonth;
            SmallFerryId = _service.Insert(new Ferry((int)FerryTypeEnum.Small));
            BigFerryId = _service.Insert(new Ferry((int)FerryTypeEnum.Big));
        }

        public void MainFunction(object commandParamete)
        {
            HideBtn = false;
            vehicle = CreateNewVehicle();
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        private async void Timer_Tick(object sender, EventArgs e)
        {
            FuelText = DoorOpen = DoorClose = LoadText = string.Empty;
            vehicle = CreateNewVehicle();
            vehicle.Name = string.Empty;
            vehicle.Id = _service.Insert(vehicle);
            vehicle.Name = $"{_service.WhichType(vehicle.IdType)}{vehicle.Id}";
            ListText.Insert(0, new Text { TextParameter = $"{vehicle.Name} has arrived on entrance, with {vehicle.Fuel}%" });
            await Task.Delay(_shortPause);
            _service.UpdateNameInVehicle(vehicle.Id, vehicle.Name);
            _ = _service.Insert(new VehicleLocation(vehicle.Id, (int)PortLocationEnum.Entrance));
            WorkerSalary = WorkerSalary;
            WorkerSalary_ThisMonth = WorkerSalary_ThisMonth;
            if (vehicle.Fuel < 10)
            {
                ListText.Insert(0, new Text { TextParameter = $"since the vehicle has less than 10% of gasoline, we refielled {vehicle.Name}" });
                await Task.Delay(_shortPause);
                _ = _service.Insert(new VehicleLocation(vehicle.Id, (int)PortLocationEnum.GasStation));
                _service.UpdateFuel(vehicle.Id);
            }
            int wichFerry;
            if (theSmallerVehicle.Contains(vehicle.IdType))
            {
                wichFerryWar = "small";
                SmallFerryCount++;
                wichFerry = (int)FerryTypeEnum.Small;
            }
            else
            {
                wichFerryWar = "big";
                BigFerryCount++;
                wichFerry = (int)FerryTypeEnum.Big;
            }
            if (hadDoor.Contains(vehicle.IdType))
            {
                _ = _service.Insert(new VehicleLocation(vehicle.Id, (int)PortLocationEnum.CargoInspection));
                ListText.Insert(0, new Text { TextParameter = $"{vehicle.Name} was redirected on cargo inspection so we opened the cargo doors" });
                await Task.Delay(_shortPause);
                _service.OppeningClosingTheDoors(vehicle.Id, true);
                ListText.Insert(0, new Text { TextParameter = "everything is okay, so we close the door" });
                await Task.Delay(_shortPause);
                _service.OppeningClosingTheDoors(vehicle.Id, false);
            }
            ListText.Insert(0, new Text { TextParameter = $"we load {vehicle.Name} onto a {wichFerryWar} ferry" });
            await Task.Delay(_shortPause);
            _ = _service.Insert(new VehicleLocation(vehicle.Id, (int)PortLocationEnum.Ferry));
            _ = _service.Insert(new FerryVehicle(vehicle.Id, wichFerry));

            if (SmallFerryCount == SmallFerrySize) //The ferry is full it has to go
            {
                _ = _service.Insert(new Transport(SmallFerryId));
                SmallFerryCount = 0;
                ListText.Insert(0, new Text { TextParameter = "small ferry is fully loaded, so he set sail" });
                await Task.Delay(_shortPause);
                SmallFerryId = _service.Insert(new Ferry((int)FerryTypeEnum.Small));
            }
            if (BigFerryCount == BigFerrySize)
            {
                _ = _service.Insert(new Transport(BigFerryId));
                BigFerryCount = 0;
                ListText.Insert(0, new Text { TextParameter = "big ferry is fully loaded, so he set sail" });
                await Task.Delay(_shortPause);

                BigFerryId = _service.Insert(new Ferry((int)FerryTypeEnum.Big));
            }
        }

        public Vehicle CreateNewVehicle()
        {
            Random rnd = new Random();
            int vehicleType = rnd.Next(1, numberOfVehicleTypes + 1);
            int vehicleFuel = rnd.Next(1, 101);
            return new Vehicle(vehicleFuel, vehicleType);
        }

        private readonly DispatcherTimer timer = new DispatcherTimer
        {
            Interval = TimeSpan.FromSeconds(5)
        };

        #region geters/seters
        public ObservableCollection<Text> ListText
        {
            get => _listText;
            set
            {
                _listText = value;
                OnPropertyChanged(nameof(ListText));
            }
        }

        public string ArrivalText
        {
            get => _arrivalText;
            set
            {
                _arrivalText = value;
                OnPropertyChanged(nameof(ArrivalText));
            }
        }

        public string FuelText
        {
            get => _fuelText;
            set
            {
                _fuelText = value;
                OnPropertyChanged(nameof(FuelText));
            }
        }

        public string DoorOpen
        {
            get => _doorOpen;
            set
            {
                _doorOpen = value;
                OnPropertyChanged(nameof(DoorOpen));
            }
        }

        public string DoorClose
        {
            get => _doorClose;
            set
            {
                _doorClose = value;
                OnPropertyChanged(nameof(DoorClose));
            }
        }

        public string LoadText
        {
            get => _loadText;
            set
            {
                _loadText = value;
                OnPropertyChanged(nameof(LoadText));
            }
        }

        public double WorkerSalary
        {
            get => _workerSalary;
            set
            {
                _workerSalary = _service.GetWorkerSalary();
                OnPropertyChanged("WorkerSalary");
            }
        }

        public double WorkerSalary_ThisMonth
        {
            get => _workerSalary_ThisMonth;
            set
            {
                _workerSalary_ThisMonth = _service.GetWorkerSalary_ThisMonth();
                OnPropertyChanged("WorkerSalary_ThisMonth");
            }
        }

        public bool HideBtn
        {
            get => _hideBtn;
            set
            {
                _hideBtn = value;
                OnPropertyChanged("HideBtn");
            }
        }
        #endregion
    }
}
