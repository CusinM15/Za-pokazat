using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using System.Data.SQLite;

namespace domacaKnjiznica
{
    public partial class knjiznica : Form
    {
        public string path = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.Parent.FullName;
        public Button dodajKnjigo = new Button();
        public TextBox naslovDodaj = new TextBox();
        public TextBox avtorDodaj = new TextBox();
        public TextBox letoDodaj = new TextBox();
        public TextBox zalozbaDodaj = new TextBox();
        public Label naslovDodajNapis = new Label();
        public Label avtorDodajNapis = new Label();
        public Label letoDodajNapis = new Label();
        public Label zalozbaDodajNapis = new Label();
        public Button isciGumb = new Button();
        public Label isciNaslovNapis = new Label();
        public Label isciAvtorNapis = new Label();
        public TextBox isciNaslov = new TextBox();
        public TextBox isciAvtor = new TextBox();
        public DataGridView tabelaKnjig = new DataGridView();
        public knjiznica()
        {
            naslovDodajNapis.Location = new Point(3, 160);
            naslovDodajNapis.Text = "Naslov:";
            naslovDodajNapis.Visible = false;
            this.Controls.Add(naslovDodajNapis);
            naslovDodaj.Location = new Point(3, 190);
            naslovDodaj.Size = new Size(800, 50);
            naslovDodaj.Visible = false;
            this.Controls.Add(naslovDodaj);
            avtorDodajNapis.Location = new Point(3, 240);
            avtorDodajNapis.Size = new Size(150, 30);
            avtorDodajNapis.Visible = false;
            avtorDodajNapis.Text = "Avtor (ime priimek):";
            this.Controls.Add(avtorDodajNapis);
            avtorDodaj.Location = new Point(3, 270);
            avtorDodaj.Size = new Size(800, 50);
            avtorDodaj.Visible = false;
            this.Controls.Add(avtorDodaj);
            zalozbaDodajNapis.Location = new Point(3, 320);
            zalozbaDodajNapis.Visible = false;
            zalozbaDodajNapis.Text = "Založba:";
            this.Controls.Add(zalozbaDodajNapis);
            zalozbaDodaj.Location = new Point(3, 350);
            zalozbaDodaj.Size = new Size(200, 50);
            zalozbaDodaj.Visible = false;
            this.Controls.Add(zalozbaDodaj);
            letoDodajNapis.Location = new Point(250, 320);
            letoDodajNapis.Visible = false;
            letoDodajNapis.Text = "Leto:";
            this.Controls.Add(letoDodajNapis);
            letoDodaj.Location = new Point(250, 350);
            letoDodaj.Size = new Size(50, 50);
            letoDodaj.Visible = false;
            this.Controls.Add(letoDodaj);
            dodajKnjigo.Location = new Point(350, 320);
            dodajKnjigo.Text = "Dodaj knjigo";
            dodajKnjigo.Size = new Size(150, 50);
            dodajKnjigo.Visible = false;
            dodajKnjigo.Click += new System.EventHandler(this.dodajKnjigo_Click);
            this.Controls.Add(dodajKnjigo);

            isciNaslovNapis.Location = new Point(3, 160);
            isciNaslovNapis.Size = new Size(60, 50);
            isciNaslovNapis.Text = "Naslov:";
            isciNaslovNapis.Visible = false;
            this.Controls.Add(isciNaslovNapis);
            isciNaslov.Location = new Point(63, 160);
            isciNaslov.Size = new Size(100, 50);
            isciNaslov.Visible = false;
            this.Controls.Add(isciNaslov);
            isciAvtorNapis.Location = new Point(213, 160);
            isciAvtorNapis.Size = new Size(60, 50);
            isciAvtorNapis.Text = "Avtor:";
            isciAvtorNapis.Visible = false;
            this.Controls.Add(isciAvtorNapis);
            isciAvtor.Location = new Point(273, 160);
            isciAvtor.Size = new Size(100, 50);
            isciAvtor.Visible = false;
            this.Controls.Add(isciAvtor);
            isciGumb.Location = new Point(403, 160);
            isciGumb.Text = "Išči";
            isciGumb.Size = new Size(100, 50);
            isciGumb.Click += new System.EventHandler(this.isciGumb_Click);
            isciGumb.Visible = false;
            this.Controls.Add(isciGumb);
            tabelaKnjig.Location = new Point(3, 220);
            tabelaKnjig.Size = new Size(1080, 220);
            this.tabelaKnjig.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Posodi_CellClick);
            tabelaKnjig.AlternatingRowsDefaultCellStyle.BackColor = Color.Beige;
            tabelaKnjig.Visible = false;
            tabelaKnjig.DataSource = null;
            tabelaKnjig.Columns.Clear();
            this.Controls.Add(tabelaKnjig);

            InitializeComponent();
        }

        private void dodajanjeStran_Click(object sender, EventArgs e)
        {
            iskanjeStran.UseVisualStyleBackColor = true;
            isciGumb.Visible = false;
            isciNaslovNapis.Visible = false;
            isciAvtorNapis.Visible = false;
            isciNaslov.Visible = false;
            isciAvtor.Visible = false;
            tabelaKnjig.Visible = false;

            dodajanjeStran.BackColor = Color.LightBlue;
            naslovDodajNapis.Visible = true;
            naslovDodaj.Visible = true;
            avtorDodajNapis.Visible = true;
            avtorDodaj.Visible = true;
            zalozbaDodajNapis.Visible = true;
            zalozbaDodaj.Visible = true;
            letoDodajNapis.Visible = true;
            letoDodaj.Visible = true;
            dodajKnjigo.Visible = true;
            naslovDodaj.Text = "";
            avtorDodaj.Text = "";
            zalozbaDodaj.Text = "";
            letoDodaj.Text = "";
        }
        private void dodajKnjigo_Click(object sender, EventArgs e)
        {
            string naslov = naslovDodaj.Text;
            string avtor = avtorDodaj.Text;
            string zalozba = zalozbaDodaj.Text;
            string leto = letoDodaj.Text;
            string test = naslov.Replace(" ", "");
            if (test.Length == 0)
            {
                MessageBox.Show("Naslove je obvezen!");
            }
            else
            {
                Knjiga knjiga = new Knjiga();
                knjiga.Naslov = naslov;
                knjiga.Avtor = avtor;
                knjiga.Leto = leto;
                knjiga.Zalozba = zalozba;
                SQLukazi.DodajKnjigo(knjiga);
                naslovDodaj.Text = "";
                avtorDodaj.Text = "";
                zalozbaDodaj.Text = "";
                letoDodaj.Text = "";
            }
        }

        private void iskanjeStran_Click(object sender, EventArgs e)
        {
            dodajanjeStran.UseVisualStyleBackColor = true;
            naslovDodajNapis.Visible = false;
            naslovDodaj.Visible = false;
            avtorDodajNapis.Visible = false;
            avtorDodaj.Visible = false;
            zalozbaDodajNapis.Visible = false;
            zalozbaDodaj.Visible = false;
            letoDodajNapis.Visible = false;
            letoDodaj.Visible = false;
            dodajKnjigo.Visible = false;

            iskanjeStran.BackColor = Color.LightBlue;
            isciGumb.Visible = true;
            isciNaslovNapis.Visible = true;
            isciAvtorNapis.Visible = true;
            isciNaslov.Visible = true;
            isciNaslov.Text = "";
            isciAvtor.Visible = true;
            isciAvtor.Text = "";
            tabelaKnjig.Visible = true;
            naloziDataGrid();

        }
        private void isciGumb_Click(object sender, EventArgs e)
        {
            naloziDataGrid();
        }
        public void naloziDataGrid()
        {
            tabelaKnjig.DataSource = null;
            tabelaKnjig.Columns.Clear();
            tabelaKnjig.DataSource = SQLukazi.Iskalnik(isciNaslov.Text, isciAvtor.Text);
            DataGridViewButtonColumn promet = new DataGridViewButtonColumn();
            promet.HeaderText = "Promet";
            promet.Text = "Posodi";
            promet.Name = "Posodi";
            promet.UseColumnTextForButtonValue = true;
            promet.Width = 50;
            tabelaKnjig.Columns.Add(promet);
        }
        private void Posodi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 6 && e.RowIndex >= 0)
            {
                int knjigaID = int.Parse(tabelaKnjig.Rows[e.RowIndex].Cells[0].Value.ToString());
                izposojanje novo = new izposojanje(knjigaID, this);
                novo.StartPosition = FormStartPosition.Manual;
                novo.ShowDialog();
            }
        }
    }
}
