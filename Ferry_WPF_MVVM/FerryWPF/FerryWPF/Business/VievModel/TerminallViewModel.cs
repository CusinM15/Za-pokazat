using FerryWPF.Business.Infractructure;
using FerryWPF.Business.Models;
using FerryWPF.Business.Services;
using System;
using System.Windows.Input;
using System.Windows.Threading;
using System.Collections.Generic;
using FerryWPF.Business.Enums;

namespace FerryWPF.Business.VievModel
{

    public class TerminallViewModel : ViewModelBase
    {
        public bool _running;
        public ICommand GoToCommand { get; set; }
        private readonly PortService service;
        private string _arrivalText = "waiting";
        private string _fuelText = "";
        private string _doorOpen = "";
        private string _doorClose = "";
        private string _loadText = "";
        private string[] labels;
        private double _workerSalary;
        public int BigFerrySize = 6;
        public int BigFerryCount = 0;
        public int SmallFerrySize = 8;
        public int SmallFerryCount = 0;
        private Vehicle vehicle;
        public int SmallFerryId;
        public int BigFerryId;
        private bool _hideBtn;
        private int numberOfVehicleTypes;

        private DispatcherTimer timer = new DispatcherTimer
        {
            Interval = TimeSpan.FromSeconds(1)
        };
       
        public TerminallViewModel()
        {
            Vehicle elt = new Vehicle(2, 3);
            HideBtn = true;
            GoToCommand = new DelegateCommand(MainFunction);
            service = new PortService();
            numberOfVehicleTypes = service.NumberVehicleTypes();
            WorkerSalary = WorkerSalary;
            SmallFerryId = service.Insert(new Ferry(1));
            BigFerryId = service.Insert(new Ferry(2));
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

        public void MainFunction(object commandParamete)
        {
            HideBtn = false;
            vehicle = CreateNewVehicle();
            labels = new string[] { ArrivalText, FuelText, DoorOpen, DoorClose, LoadText };
            timer.Tick += Timer_Tick;
            timer.Start();

        }

        public double WorkerSalary
        {
            get => _workerSalary;
            set
            {
                _workerSalary = service.GetWorkerSalary();
                OnPropertyChanged("WorkerSalary");
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

        private void Timer_Tick(object sender, EventArgs e)
        {
            FuelText = "";
            DoorOpen = "";
            DoorClose = "";
            LoadText = "";
            vehicle = CreateNewVehicle();
            ArrivalText = $"{vehicle.Name} has arrived on entrance, with {vehicle.Fuel}%";
            vehicle.Name = "";
            vehicle.id = service.Insert(vehicle);
            vehicle.Name = $"{service.WhichType(vehicle.idType)}{vehicle.id}";
            service.UpdateNameInVehicle(vehicle.id, vehicle.Name);
            _ = service.Insert(new VehicleLocation(vehicle.id, (int)PortLocationEnum.Entrance));
            WorkerSalary = WorkerSalary;
            if (vehicle.Fuel < 10)
            {
                FuelText = $"Since the vehicle has less than 10% of gasoline, we refielled {vehicle.Name}.";
                _ = service.Insert(new VehicleLocation(vehicle.id, (int)PortLocationEnum.GasStation));
                service.UpdateFuel(vehicle.id);
            }
            string wchFerry;
            int wichFerry;
            List<int> theSmallerVehicle = new List<int>() { (int)VehicleTypeEnum.Car, (int)VehicleTypeEnum.Van };
            if (theSmallerVehicle.Contains(vehicle.idType))
            {
                wchFerry = "small";
                SmallFerryCount++;
                wichFerry = SmallFerryId;
            }
            else
            {
                wchFerry = "big";
                BigFerryCount++;
                wichFerry = BigFerryId;
            }
            List<int> hadCarfoDoor = new List<int>() { (int)VehicleTypeEnum.Truck, (int)VehicleTypeEnum.Van };
            if (hadCarfoDoor.Contains(vehicle.idType))
            {
                _ = service.Insert(new VehicleLocation(vehicle.id, (int)PortLocationEnum.CargoInspection));
                DoorOpen = $"{vehicle.Name} was redirected on cargo inspection so we opened the cargo doors";
                service.OppeningClosingTheDoors(vehicle.id, true);
                DoorClose = "Everything is okay, so we close the door.";
                service.OppeningClosingTheDoors(vehicle.id, false);
            }
            LoadText = $"We load {vehicle.Name} onto a {wchFerry} ferry.";
            _ = service.Insert(new VehicleLocation(vehicle.id, (int)PortLocationEnum.Ferry));
            _ = service.Insert(new FerryVehicle(vehicle.id, wichFerry));
            if (SmallFerryCount == SmallFerrySize) //The ferry is full it has to go
            {
                _ = service.Insert(new Transport(SmallFerryId));
                SmallFerryCount = 0;
                SmallFerryId = service.Insert(new Ferry(1));
            }
            if (BigFerryCount == BigFerrySize)
            {
                _ = service.Insert(new Transport(BigFerryId));
                BigFerryCount = 0;
                BigFerryId = service.Insert(new Ferry(2));
            }
        }

        public Vehicle CreateNewVehicle()
        {
            Random rnd = new Random();
            int vehicleType = rnd.Next(1, numberOfVehicleTypes + 1);
            int vehicleFuel = rnd.Next(1, 101);
            return new Vehicle(vehicleFuel, vehicleType);
        }

    }

}
