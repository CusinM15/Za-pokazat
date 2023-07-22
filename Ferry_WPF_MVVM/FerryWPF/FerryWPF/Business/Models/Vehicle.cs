using System;
using System.Collections.Generic;

namespace FerryWPF.Business.Models
{
    public class Vehicle
    {
        /// <summary>
        /// Create new Vehicle object
        /// </summary>
        public Vehicle(int fuel, int type)
        {
            Fuel = fuel;
            idType = type;
            DoorOppend = false; //all types of vehicle have closed door (even if they dont had it we say they are closed)
            DateEntered = DateTime.Now;
        }
        public int id { get; set; }
        public string Name { get; set; }
        public int Fuel { get; set; }
        public int idType { get; set; }
        public bool DoorOppend { get; set; }
        public DateTime? DateEntered { get; set; }
        /// <summary>
        /// returns the price of ferry card, for the vehicle tipe
        /// </summary>
        public int CardPrice
        {
            get {
                switch (idType)
                {
                    case 1:
                        return 3;
                    case 2:
                        return 4;
                    case 3:
                        return 5;
                    default:
                        return 6;
                }
            }
            set {}
        }
    }
}
