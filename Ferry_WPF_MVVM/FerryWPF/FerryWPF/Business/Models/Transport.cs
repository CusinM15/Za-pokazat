using System;

namespace FerryWPF.Business.Models
{
    public class Transport
    {
        public int IdFerry { get; set; }
        public DateTime DateEntered { get; set; }
        public string FromText { get; set; }
        public string ToText { get; set; }
        public Transport(int fer)
        {
            IdFerry = fer;
            FromText = "Brestovo";
            ToText = "Porozina";
            DateEntered = DateTime.Now; ;
        }
    }
}
