using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace domacaKnjiznica
{
    public partial class izposojanje : Form
    {
        public Label naslovNapix;
        public Label avtorNapis;
        public Label zalozbaNapis;
        public Label letoNapis;
        public Label napisZaIzposojo;
        public TextBox komu;
        public TextBox naslovPolje;
        public TextBox avtorPolje;
        public TextBox zalozbaPolje;
        public TextBox letoPolje;
        public Button posodi;
        public Button popravi;
        public Button vrni;
        int knjigaID = -1;
        knjiznica knjiga = null; 
        public izposojanje(int id, knjiznica izbrana)
        {
            naslovNapix = new Label();
            naslovNapix.Location = new Point(5, 5);
            naslovNapix.Size = new Size(200, 30);
            naslovNapix.Text = "Naslov:";
            this.Controls.Add(naslovNapix);
            naslovPolje = new TextBox();
            naslovPolje.Location = new Point(5, 35);
            naslovPolje.Size = new Size(200, 30);
            naslovPolje.BorderStyle = BorderStyle.None;
            this.Controls.Add(naslovPolje);
            avtorNapis = new Label();
            avtorNapis.Location = new Point(5, 65);
            avtorNapis.Size = new Size(200, 30);
            avtorNapis.Text = "Avtor:";
            this.Controls.Add(avtorNapis);
            avtorPolje = new TextBox();
            avtorPolje.Location = new Point(5, 95);
            avtorPolje.Size = new Size(200, 30);
            avtorPolje.BorderStyle = BorderStyle.None;
            this.Controls.Add(avtorPolje);
            zalozbaNapis = new Label();
            zalozbaNapis.Location = new Point(5, 125);
            zalozbaNapis.Size = new Size(200, 30);
            zalozbaNapis.Text = "Založba:";
            this.Controls.Add(zalozbaNapis);
            zalozbaPolje = new TextBox();
            zalozbaPolje.Location = new Point(5, 155);
            zalozbaPolje.Size = new Size(200, 30);
            zalozbaPolje.BorderStyle = BorderStyle.None;
            this.Controls.Add(zalozbaPolje);
            letoNapis = new Label();
            letoNapis.Location = new Point(5, 185);
            letoNapis.Size = new Size(200, 30);
            letoNapis.Text = "Leto:";
            this.Controls.Add(letoNapis);
            letoPolje = new TextBox();
            letoPolje.Location = new Point(5, 215);
            letoPolje.Size = new Size(200, 30);
            letoPolje.BorderStyle = BorderStyle.None;
            this.Controls.Add(letoPolje);
            napisZaIzposojo = new Label();
            napisZaIzposojo.Location = new Point(220, 5);
            napisZaIzposojo.Size = new Size(100, 30);
            napisZaIzposojo.Text = "Posodil bom";
            this.Controls.Add(napisZaIzposojo);
            popravi = new Button();
            popravi.Location = new Point(5, 245);
            popravi.Size = new Size(100, 50);
            popravi.Text = "Popravi";
            this.Controls.Add(popravi);
            popravi.Click += new System.EventHandler(this.popravi_Click);
            komu = new TextBox();
            komu.Location = new Point(220, 35);
            komu.Size = new Size(100, 30);
            komu.BorderStyle = BorderStyle.None;
            this.Controls.Add(komu);
            posodi = new Button();
            posodi.Location = new Point(220, 65);
            posodi.Size = new Size(100, 30);
            posodi.Text = "Posodil";
            this.Controls.Add(posodi);
            posodi.Click += new System.EventHandler(this.posodi_Click);
            vrni = new Button();
            vrni.Location = new Point(220, 95);
            vrni.Size = new Size(100, 30);
            vrni.Text = "Vrnjeno";
            this.Controls.Add(vrni);
            vrni.Click += new System.EventHandler(this.vrni_Click);
            InitializeComponent();
            knjigaID = id;
            knjiga = izbrana;
        }

        private void izposojanje_Load(object sender, EventArgs e)
        {
            DataTable podatki = SQLukazi.knjigaNaId(knjigaID);
            naslovPolje.Text = podatki.Rows[0]["Naslov"].ToString();
            avtorPolje.Text = podatki.Rows[0]["Avtor"].ToString();
            zalozbaPolje.Text = podatki.Rows[0]["Založba"].ToString();
            letoPolje.Text = podatki.Rows[0]["Leto"].ToString();
            komu.Text = podatki.Rows[0]["Izposoja"].ToString();
            
        }
        private void posodi_Click(object sender, EventArgs e)
        {
            SQLukazi.izposoja(knjigaID, komu.Text);
            knjiga.naloziDataGrid();
            this.Close();
        }
        private void vrni_Click(object sender, EventArgs e)
        {
            SQLukazi.izposoja(knjigaID, "");
            knjiga.naloziDataGrid();
            this.Close();
        }
        private void popravi_Click(object sender, EventArgs e)
        {
            string nas = naslovPolje.Text;
            string avt = avtorPolje.Text;
            string zal = zalozbaPolje.Text;
            string let = letoPolje.Text;
            SQLukazi.popravi(knjigaID, nas, avt, zal, let);
            knjiga.naloziDataGrid();
        }
    }
}
