using System;

namespace FerryWPF.Business.Models
{
    public class Transport
    {
        public int idFerry { get; set; }
        public DateTime DateEntered{ get; set; }
        public string FromText { get; set; }
        public string ToText { get; set; }
        public Transport(int fer)
        {
            idFerry = fer;
            FromText = "Brestovo";
            ToText = "Porozina";
            DateEntered = DateTime.Now; ;
        }
    }
}
