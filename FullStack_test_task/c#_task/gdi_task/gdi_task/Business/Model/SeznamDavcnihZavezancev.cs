using Dapper.Contrib.Extensions;

namespace gdi_task.Business.Model
{
    [Table("SeznamDavcnihZavezancev")]
    public class SeznamDavcnihZavezancev
    {
        [ExplicitKey]
        public int Id { get; set;  }
        public string Znak { get; set; }
        public string PrvoCeloStevilo { get; set; }
        public string DrugoCeloStevilo { get; set; }
        public string Datum { get; set; }
        public string RealnoStevilo { get; set; }
        public string Ime { get; set; }
        public string Naslov { get; set; }
        public string Oznaka { get; set; }
    }
}
