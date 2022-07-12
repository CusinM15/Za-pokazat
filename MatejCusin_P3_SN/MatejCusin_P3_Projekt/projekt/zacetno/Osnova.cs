using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;


namespace ZacetnoOkno
{
    public partial class glavnoOkno : Form
    {
        private TextBox[,] matrikaPolj;
        private int[,] matrikaStevil;
        private TextBox[] imenaStolpcev;
        private TextBox[] imenaVrstic;
        private Label[,] poljaVobdelavi;
        private Button reducirajGumb;
        private Button naslednjiKorak;
        private int koliko;
        public int[] popPrirejanje;
        public Dictionary<int, int> slovarDela;
        public Dictionary<int, int> slovarDelavec;
        public List<int> S;
        public Dictionary<int, int> T;
        private int cena;
        private Label opisPolozaja;
        private Label epsilonNapis;
        private Button madzarskaGumb;
        private int epsilon;
        private int[] polozajEpsilon;
        private List<int> minPokritje;
        private List<int[]> katerePopraviti; // v tej taveli bom hranil indeksa, barva (0 bela, 1 vijolična) in novo vrednost
        private int naVrsti;
        private Button madzHitro;
        private Label razlaga;
        public glavnoOkno()
        {
            InitializeComponent();
            ToolTip ustvari = new ToolTip();
            ustvari.SetToolTip(gumbUstvariTabelo, "Ustvari n X n tabelo, v katero vnesete števila in določite imena vrstic (delavcev) in stolpcev (delo).");
        }

        /// <summary>
        /// Usrvari ustrezno število TextBox-ov, da lahko uporabnik poimenuje
        /// stolpce in vrstice in le tem dodeli številsko vrednost.
        /// </summary>
        private void gumbUstvariTabelo_Click(object sender, EventArgs e)
        {
            kolikoBesedilo.Visible = false;
            gumbUstvariTabelo.Visible = false;
            kolikoBeri.Visible = false;
            // ustvarimo tabelo ustrezne velikosti
            koliko = (int)kolikoBeri.Value;
            imenaVrstic = new TextBox[koliko];
            imenaStolpcev = new TextBox[koliko];
            for (int k = 0; k < koliko; k++)
            {
                imenaVrstic[k] = new TextBox();  // dodajmo imena za procesorje
                imenaVrstic[k].Text = $"delavec {k + 1}";
                imenaVrstic[k].Location = new Point(51, 82 + (k + 1) * 25);
                imenaVrstic[k].Size = new Size(52, 25);
                imenaVrstic[k].Visible = true;
                this.Controls.Add(imenaVrstic[k]);
            }
            for (int k = 0; k < koliko; k++)
            {
                imenaStolpcev[k] = new TextBox();  // dodajmo imena za delo
                imenaStolpcev[k].Text = "počiva";
                imenaStolpcev[k].Location = new Point(61 + (k + 1) * 42, 82);
                imenaStolpcev[k].Size = new Size(42, 25);
                imenaStolpcev[k].Visible = true;
                this.Controls.Add(imenaStolpcev[k]);
            }
            // sedaj pa še prostor za številka
            matrikaPolj = new TextBox[koliko, koliko];
            matrikaStevil = new int[koliko, koliko];
            //tabelo v katere bo lahko uporabnik vnesel
            for (int i = 0; i < koliko; i++)
            {
                for (int j = 0; j < koliko; j++)
                {
                    matrikaPolj[i, j] = new TextBox();  // dodajmo imena za del
                    matrikaPolj[i, j].Text = "0";
                    matrikaPolj[i, j].Location = new Point(61 + (i + 1) * 42, 82 + (j + 1) * 25);
                    matrikaPolj[i, j].Size = new Size(42, 25);
                    matrikaPolj[i, j].Visible = true;
                    this.Controls.Add(matrikaPolj[i, j]);
                }
            }
            reducirajGumb = new Button();
            reducirajGumb.Location = new Point(41 + koliko * 42, 82 + (koliko + 1) * 25);
            reducirajGumb.Text = "Reduciraj";
            reducirajGumb.Size = new Size(62, 25);
            reducirajGumb.Visible = true;
            ToolTip red = new ToolTip();
            red.SetToolTip(reducirajGumb, "Podano matriko reducira, najprej po vrsticah, nato še po stolpcih.");
            this.Controls.Add(reducirajGumb);
            reducirajGumb.Click += new System.EventHandler(this.reducirajGumb_Pritisnjeno);
            razlaga = new Label();
            razlaga.Location = new Point(51, 82 + (koliko + 3) * 25);
            razlaga.Size = new Size(koliko * 62, koliko * 25);
            razlaga.Text = "Poimenujte delavce (vrstice) in dela (stolpci). Nato pa v matriko vnesite 'ceno', koliko zaračuna posamezen delavec" +
                            " za določeno delo. Nato program s pomočjo madžarske metode izračuna 'najcenejšo' rešitev.";
            razlaga.Visible = true;
            this.Controls.Add(razlaga);
        }

        /// <summary>
        /// Zažene se ob kliku na gumb reduciraj.
        /// Če v tabeli kjer naj bi bila števila kaj drugega, program avtomatsko nastavi na vrednost 0.
        /// Ko izvede redukcijo matrike, preveri, če že obstaja popolno prirejanje, če to še ne obstaja ponudi gumb
        /// s pomočjo katere izvedemo madžarsko metodo.
        /// </summary>
        private void reducirajGumb_Pritisnjeno(object sender, EventArgs e)
        {
            // najprej prebere vsa polja iz matrikePolj in števila premakne v matrikaStevil kot števila
            for (int i = 0; i < koliko; i++)
            {
                int minVrstice = int.MaxValue;
                try
                {
                    minVrstice = int.Parse(matrikaPolj[0, i].Text);
                    matrikaStevil[0, i] = minVrstice;
                }
                catch
                {
                    matrikaPolj[0, i].Text = "0";
                    MessageBox.Show("Vnesti bi morali cela števila!");
                }
                for (int j = 1; j < koliko; j++)
                {
                    try
                    {
                        int vrednost = int.Parse(matrikaPolj[j, i].Text);
                        matrikaStevil[j, i] = vrednost;
                        if (vrednost < minVrstice)
                        {
                            minVrstice = vrednost;
                        }
                    }
                    catch
                    {
                        matrikaPolj[j, i].Text = "0";
                        MessageBox.Show("Vnesti bi morali cela števila!");
                    }
                }
                // redukcijo po vrsticah naredimo "takoj"
                for (int k = 0; k < koliko; k++)
                {
                    matrikaStevil[k, i] -= minVrstice;
                }
            }
            for (int j = 0; j < koliko; j++)
            {
                int minStolpec = matrikaStevil[j, 0];
                for (int i = 0; i < koliko; i++)
                {
                    if (matrikaStevil[j, i] < minStolpec)
                    {
                        minStolpec = matrikaStevil[j, i];
                    }
                }
                // reduciramo še povrsticah
                for (int k = 0; k < koliko; k++)
                {
                    matrikaStevil[j, k] -= minStolpec;
                }
            }
            // poskrbi še za izpis delavne matrike
            Label besediloDelovnaMatrika = new Label();
            besediloDelovnaMatrika.Text = "To je matrika v obdelavi.";
            besediloDelovnaMatrika.Location = new Point(61 + (koliko + 3) * 42, 72);
            poljaVobdelavi = new Label[koliko, koliko];
            for (int i = 0; i < koliko; i++)
            {
                for (int j = 0; j < koliko; j++)
                {
                    poljaVobdelavi[i, j] = new Label();
                    poljaVobdelavi[i, j].Text = "" + matrikaStevil[i, j];
                    poljaVobdelavi[i, j].Location =
                                   new Point(61 + (koliko + 4 + i) * 52, 82 + (j + 1) * 25);
                    poljaVobdelavi[i, j].Size = new Size(52, 25);
                    poljaVobdelavi[i, j].Visible = true;
                    this.Controls.Add(poljaVobdelavi[i, j]);
                }
            }
            naslednjiKorak = new Button();
            naslednjiKorak.Location = new Point(61 + (koliko + 4) * 52, 82 + (koliko + 1) * 25);
            naslednjiKorak.Text = "Naslednji korak";
            naslednjiKorak.Size = new Size(82, 25);
            naslednjiKorak.Visible = true;

            this.Controls.Add(naslednjiKorak);
            naslednjiKorak.Click += new System.EventHandler(this.naslednjiKorak_Pritisnjeno);
            ToolTip nasl = new ToolTip();
            nasl.SetToolTip(naslednjiKorak, "V ozadju izvede madžarsko metodo brez uteži, če le ta najde popolno prirejanje.\nDrugače pa poskrbi za minimalno pokritje.");
            reducirajGumb.Visible = false;
            opisPolozaja = new Label();
            opisPolozaja.Location = new Point(61 + (koliko + 4) * 52, 82 + (koliko + 3) * 25);
            opisPolozaja.Text = "";
            opisPolozaja.Size = new Size(200, 400);
            this.Controls.Add(opisPolozaja);

            epsilonNapis = new Label();
            epsilonNapis.Location = new Point(61 + (koliko + 2) * 52, 82);
            epsilonNapis.Text = "";
            epsilonNapis.Size = new Size(61, 25);
            this.Controls.Add(epsilonNapis);
            razlaga.Visible = false;

        }

        /// <summary>
        /// Ta funkcija pa izpiše rezultat oz poišče najmanjše pokritje in potem omogoči izvedbo madžarske metode.
        /// </summary>
        private void naslednjiKorak_Pritisnjeno(object sender, EventArgs e)
        {
            bool preveri = MadzarskaBrezUtezi(matrikaStevil, koliko, out slovarDelavec, out slovarDela, out S, out T);
            if (preveri) // pomeni, da smo našli rešitev
            {
                cena = 0;
                // recimo preberimo iz slovarDelo
                foreach (KeyValuePair<int, int> polje in slovarDela)
                {
                    poljaVobdelavi[polje.Key, polje.Value - koliko].ForeColor = Color.Red;
                    matrikaPolj[polje.Key, polje.Value - koliko].ForeColor = Color.Red;
                    cena += int.Parse(matrikaPolj[polje.Key, polje.Value - koliko].Text);
                }
                // Pobarvamo rešitev  in izračunamo ceno rešitve
                naslednjiKorak.Visible = false;
                opisPolozaja.ForeColor = Color.Red;
                opisPolozaja.Text = $"Našli smo popolno prirejanje!";
                Rezultat okno = new Rezultat();
                okno.Show();
                okno.slovarDela = slovarDela;
                okno.imenaStolpcev = imenaStolpcev;
                okno.imenaVrstic = imenaVrstic;
                okno.koliko = koliko;
                okno.matrikaPolj = matrikaPolj;
            }
            else
            {
                minPokritje = new List<int>(); // dodati moramo X / S U T
                foreach (KeyValuePair<int, int> polje in T)    // pokrijemo elemente iz T
                {
                    for (int i = 0; i < koliko; i++)
                    {
                        minPokritje.Add(polje.Key);
                        poljaVobdelavi[polje.Key, i].BackColor = Color.LightPink;
                    }
                }
                for (int i = koliko; i < koliko * 2; i++)    // pokrijemo še X/S
                {
                    if (!S.Contains(i))
                    {
                        for (int j = 0; j < koliko; j++)
                        {
                            minPokritje.Add(i);
                            poljaVobdelavi[j, i - koliko].BackColor = Color.LightPink;
                        }
                    }
                }
                epsilon = int.MaxValue;
                polozajEpsilon = new int[2];
                // potrebujemo poiskati epsilon med nepokritimi elementi
                for (int i = 0; i < koliko; i++)
                {
                    if (!minPokritje.Contains(i))
                    {
                        for (int j = 0; j < koliko; j++)
                        {
                            if (!minPokritje.Contains(j + koliko))
                            {
                                if (matrikaStevil[i, j] < epsilon)
                                {
                                    epsilon = matrikaStevil[i, j];
                                    polozajEpsilon[0] = i;
                                    polozajEpsilon[1] = j;
                                }
                            }
                        }
                    }
                }
                opisPolozaja.ForeColor = Color.Black;
                opisPolozaja.Text = "Po madžarski metodi brez uteži smo našli minimalno pokritje.\n" +
                                       "Potrebujemo poiskati epsilon (najmanjši nepokrit element)." +
                                        "\nLe tega odštejemo vsem nikoli pokritim elementom, tistim, ki so dvakrat pokriti, pa ga prištejemo.\n" +
                                        "Za lažje razumevanje vsaj nekajkrat pritisnite gumb 'Madžarska metoda en korak' nato pa lahko uporabite tudi hitrejšo izvedbo.";
                poljaVobdelavi[polozajEpsilon[0], polozajEpsilon[1]].BackColor = Color.LightGreen;
                epsilonNapis.ForeColor = Color.Green;
                epsilonNapis.Text = $"Epsilon je {epsilon}";
                epsilonNapis.Size = new Size(80, 25);
                epsilonNapis.Visible = true;
                madzarskaGumb = new Button();
                madzHitro = new Button();
                madzarskaGumb.Location = new Point(61 + (koliko + 6) * 52, 82 + (koliko + 1) * 25);
                madzHitro.Location = new Point(61 + (koliko + 6) * 52, 82 + (koliko + 2) * 25);
                madzarskaGumb.Text = "Madžarska metoda en korak";
                madzHitro.Text = "Madžarska metoda hitro";
                madzarskaGumb.Size = new Size(200, 25);
                madzHitro.Size = new Size(200, 25);
                madzarskaGumb.Visible = true;
                this.Controls.Add(madzarskaGumb);
                this.Controls.Add(madzHitro);
                ToolTip madPocasi = new ToolTip();
                madPocasi.SetToolTip(madzarskaGumb, "Izvede zgolj en korak ob kliku.");
                ToolTip madHitr = new ToolTip();
                madHitr.SetToolTip(madzHitro, "Hitro izračuna celotno matriko, brez kakršnihkoli animacij.");
                madzarskaGumb.Click += new System.EventHandler(this.madzarskaGumb_Pritisnjeno);
                madzHitro.Click += new System.EventHandler(this.madzHitro_Pritisnjeno);
                naslednjiKorak.Visible = false;
                // sestavi še tabelo elementov, ki jim bo treba spremeniti
                katerePopraviti = new List<int[]>();
                for (int i = 0; i < koliko; i++)
                {
                    if (!minPokritje.Contains(i))
                    {
                        for (int j = 0; j < koliko; j++)
                        {
                            if (!minPokritje.Contains(j + koliko))
                            {
                                int[] polje = new int[4];
                                polje[0] = i;
                                polje[1] = j;
                                polje[2] = 0; // tu so polja bele barve
                                polje[3] = int.Parse(poljaVobdelavi[i, j].Text) - epsilon;
                                katerePopraviti.Add(polje);
                            }
                        }
                    }
                    else     // pomeni, da smo v vrstici ki je pokrita, torej le preverimo ali je dvakrat pokrit
                    {
                        for (int j = 0; j < koliko; j++)
                        {
                            if (minPokritje.Contains(j + koliko))
                            {
                                int[] polje = new int[4];
                                polje[0] = i;
                                polje[1] = j;
                                polje[2] = 1; // tu so polja dvakrat pokrito torej vijolične barve
                                polje[3] = int.Parse(poljaVobdelavi[i, j].Text) + epsilon;
                                katerePopraviti.Add(polje);
                            }
                        }
                    }
                }
                naVrsti = 0;
            }
        }

        /// <summary>
        /// Napravi zgolj en korak madžarske metode.
        /// </summary>
        private void madzarskaGumb_Pritisnjeno(object sender, EventArgs e)
        {
            if (naVrsti != 0)
            {
                if (katerePopraviti[naVrsti - 1][2] == 0)
                {
                    poljaVobdelavi[katerePopraviti[naVrsti - 1][0], katerePopraviti[naVrsti - 1][1]].Text = $"{katerePopraviti[naVrsti - 1][3]}";
                    poljaVobdelavi[katerePopraviti[naVrsti - 1][0], katerePopraviti[naVrsti - 1][1]].BackColor = Color.White;
                    matrikaStevil[katerePopraviti[naVrsti - 1][0], katerePopraviti[naVrsti - 1][1]] = katerePopraviti[naVrsti - 1][3];
                }
                else
                {
                    poljaVobdelavi[katerePopraviti[naVrsti - 1][0], katerePopraviti[naVrsti - 1][1]].Text = $"{katerePopraviti[naVrsti - 1][3]}";
                    poljaVobdelavi[katerePopraviti[naVrsti - 1][0], katerePopraviti[naVrsti - 1][1]].BackColor = Color.LightPink;
                    matrikaStevil[katerePopraviti[naVrsti - 1][0], katerePopraviti[naVrsti - 1][1]] = katerePopraviti[naVrsti - 1][3];
                }
            }
            if (naVrsti == katerePopraviti.Count)     // samo zadnjega potrebujemo še popraviti
            {
                for (int i = 0; i < koliko; i++)
                {
                    for (int j = 0; j < koliko; j++)
                    {
                        if (minPokritje.Contains(j + koliko) || minPokritje.Contains(i))
                        {
                            poljaVobdelavi[i, j].BackColor = Color.White;
                        }
                    }

                }
                poljaVobdelavi[polozajEpsilon[0], polozajEpsilon[1]].BackColor = Color.White;
                epsilonNapis.Visible = false;
                madzarskaGumb.Visible = false;
                madzHitro.Visible = false;
                naslednjiKorak.Visible = true;
            }
            else    // nismo v robnem primeru, torej naVrsti obarvamo modro in naVrsti povečamo za ena
            {
                if (katerePopraviti[naVrsti][2] == 1)
                {
                    poljaVobdelavi[katerePopraviti[naVrsti][0], katerePopraviti[naVrsti][1]].Text += $" + {epsilon}";
                    poljaVobdelavi[katerePopraviti[naVrsti][0], katerePopraviti[naVrsti][1]].BackColor = Color.LightBlue;
                    naVrsti += 1;
                }
                else
                {
                    poljaVobdelavi[katerePopraviti[naVrsti][0], katerePopraviti[naVrsti][1]].Text += $" - {epsilon}";
                    poljaVobdelavi[katerePopraviti[naVrsti][0], katerePopraviti[naVrsti][1]].BackColor = Color.LightBlue;
                    naVrsti += 1;
                }
                
            }
            
        }

        /// <summary>
        /// Popravi celotno matriko hitro, bodisi od začetka bodisi od tam do amor smo prišli z animacijo.
        /// </summary>
        private void madzHitro_Pritisnjeno(object sender, EventArgs e)
        {
            if (naVrsti != 0)
            {
                poljaVobdelavi[katerePopraviti[naVrsti - 1][0], katerePopraviti[naVrsti - 1][1]].Text = $"{katerePopraviti[naVrsti - 1][3]}";
                matrikaStevil[katerePopraviti[naVrsti - 1][0], katerePopraviti[naVrsti - 1][1]] = katerePopraviti[naVrsti - 1][3];
            }
            for (int i = naVrsti; i < katerePopraviti.Count; i++)
            {
                poljaVobdelavi[katerePopraviti[i][0], katerePopraviti[i][1]].Text = $"{katerePopraviti[i][3]}";
                matrikaStevil[katerePopraviti[i][0], katerePopraviti[i][1]] = katerePopraviti[i][3];
            }

            for (int i = 0; i < koliko; i++)
            {
                for (int j = 0; j < koliko; j++)
                {
                        poljaVobdelavi[i, j].BackColor = Color.White;
                }

            }
            poljaVobdelavi[polozajEpsilon[0], polozajEpsilon[1]].ForeColor = Color.Black;
            epsilonNapis.Visible = false;
            madzarskaGumb.Visible = false;
            madzHitro.Visible = false;
            naslednjiKorak.Visible = true;
        }

        /// <summary>
        /// Primerja dva slovarja
        /// </summary>
        /// <returns>Vrne true oz false.</returns>
        public static bool PrimSlovarjev(Dictionary<int, int> T, Dictionary<int, int> pomozenT)
        {
            bool odgovor = false;
            if (T.Count == pomozenT.Count)
            {
                odgovor = true;
                foreach (var pair in T)
                {
                    int elt;
                    if (pomozenT.TryGetValue(pair.Key, out elt))
                    {
                        if (elt != pair.Value)
                        {
                            odgovor = false;
                            break;
                        }
                    }
                    else
                    {
                        odgovor = false;
                        break;
                    }
                }
                return odgovor;
            }
            return odgovor;
        }

        /// <summary>
        /// Poišče popolno prirejanje in če ga najde vrne true in v slovarjih, ki jih posodobi nastavi to prirejanje.
        /// Drugače vrne false toda z pomočjo S in T poišče minimalno pokritje.
        /// </summary>
        /// <param name="matrikaStevil">Reducirana matrika.</param>
        /// <param name="koliko">Velikost matrike.</param>
        /// <param name="slovarDelavec">Slovar, ki stolpcu priredi vrstico.</param>
        /// <param name="slovarDelo">Inverz slovarDelavec.</param>
        /// <param name="S">Prosta vozlišča v stolpcih oz dosegljiva iz T po vezanih povezavah.</param>
        /// <param name="T">Vozlišča dosežena is S po prostih povezavah.</param>
        /// <returns>Vrne true v primeru ko najde popolno prirejanje, drugače pa false.</returns>
        public static bool MadzarskaBrezUtezi(int[,] matrikaStevil, int koliko,
                            out Dictionary<int, int> slovarDelavec, out Dictionary<int, int> slovarDelo,
                            out List<int> S, out Dictionary<int, int> T)
        {
            S = new List<int>(); // zato, da ne javlja napake
            T = new Dictionary<int, int>();
            Dictionary<int, List<int>> povezave = new Dictionary<int, List<int>>();
            for (int i = 0; i < koliko; i++)
            {
                List<int> vrstica = new List<int>();
                for (int j = 0; j < koliko; j++)
                {
                    if (matrikaStevil[j, i] == 0)
                    {
                        vrstica.Add(j);
                    }
                }
                povezave.Add(i + koliko, vrstica);   // vrstice povečamo za koliko, tako da ločimo med vrsticami in stolpci
            }
            slovarDelavec = new Dictionary<int, int>();
            slovarDelo = new Dictionary<int, int>();
            List<int> prosti = new List<int>();

            foreach (KeyValuePair<int, List<int>> par in povezave)
            {
                bool je = true;
                foreach (int delo in par.Value)
                {
                    if (!slovarDelo.ContainsKey(delo))
                    {
                        par.Value.Remove(delo);
                        slovarDelo[delo] = par.Key;
                        slovarDelavec[par.Key] = delo;
                        je = false;
                        break;
                    }
                }
                if (je) // pomeni, da nismo našli prostega dela zato delavca vstavimo v proste
                {
                    prosti.Add(par.Key);
                }
            }
            for (int i = 0; i < koliko; i++)
            {
                if (!slovarDelo.ContainsKey(i))
                {
                    prosti.Add(i);
                }
            }
            // sedaj moramo pa poiskati povečujočo pot, če ta obstaja
            if (prosti.Count != 0)   //pomeni da vsaj enega delavca nismo dodelili
            {
                while (true)
                {
                    S = new List<int>();
                    for (int i = 0; i < prosti.Count; i++)
                    {
                        // v S dodamo zgolj proste vrstice
                        if (prosti[i] < 2 * koliko && prosti[i] >= koliko)
                        {
                            S.Add(prosti[i]);
                        }
                    }
                    T = new Dictionary<int, int>();
                    List<int> pomozenS = S.GetRange(0, S.Count);
                    Dictionary<int, int> pomozenT = T.ToDictionary(elt => elt.Key, elt => elt.Value);
                    bool prvi = true;
                    while ((prosti.Intersect(T.Keys).ToArray().Length == 0 && !PrimSlovarjev(T, pomozenT)) || prvi)
                    {
                        bool kaj = !pomozenT.Equals(T);
                        prvi = false;
                        pomozenS = S.GetRange(0, S.Count);
                        pomozenT = T.ToDictionary(elt => elt.Key, elt => elt.Value);
                        foreach (KeyValuePair<int, int> izT in T)
                        {
                            // v S vstavimo povezave po vezanih povezavah
                            S.Add(slovarDelo[izT.Key]);
                        }
                        foreach (int izS in S)
                        {
                            // v t dodamo vozlišča dosegiljiva iz S po prostih povezavah
                            foreach (int drDelo in povezave[izS])
                            {
                                if (!T.ContainsKey(drDelo))
                                {
                                    T[drDelo] = izS;
                                }
                            }
                        }
                    }
                    if (prosti.Intersect(T.Keys).ToArray().Length != 0) // pomeni našli smo povečujočo pot
                    {
                        IEnumerable<int> vozl = prosti.AsQueryable().Intersect(T.Keys);
                        int kateri = 0;
                        foreach (int prostiVT in vozl)
                        {
                            kateri = prostiVT;
                            break;
                        }
                        // Sedaj je dopustno pokritje nahaja v slovarDelo
                        prosti.Remove(kateri);
                        int prejsni = slovarDelavec[T[kateri]];
                        slovarDelo[kateri] = T[kateri];
                        slovarDelavec[T[kateri]] = kateri;
                        povezave[T[kateri]].Remove(kateri);
                        slovarDelo.Remove(prejsni);
                        while (true)
                        {
                            kateri = prejsni;
                            if (slovarDelavec.ContainsKey(T[kateri]))    // pomeni, da to ni zadnje vozlišče
                            {
                                prejsni = slovarDelavec[T[kateri]]; ;
                                slovarDelavec[T[kateri]] = kateri;
                                slovarDelo[kateri] = T[kateri];
                                povezave[T[kateri]].Remove(kateri);
                                slovarDelo.Remove(prejsni);

                            }
                            else
                            {
                                // pomeni, da smo na koncu poti
                                slovarDelavec[T[kateri]] = kateri;
                                slovarDelo[kateri] = T[kateri];
                                povezave[T[kateri]].Remove(kateri);
                                prosti.Remove(T[kateri]);
                                break;
                            }
                        }
                    }
                    else      // ni povečujočih poti
                    {
                        return false;
                    }
                    if (slovarDelo.Count == koliko)
                    {
                        return true;
                    }
                }
            }
            return true;
        }

        public class Rezultat : Form           
        {
            public int koliko;
            public Dictionary<int, int> slovarDela;
            public TextBox[] imenaStolpcev;
            public TextBox[,] matrikaPolj;
            public TextBox[] imenaVrstic;

            /// <summary>
            /// Konstruktor novega okna.
            /// </summary>
            public Rezultat()
            {
                this.Paint += new System.Windows.Forms.PaintEventHandler(this.DrawLinePoint);
                FormBorderStyle = FormBorderStyle.SizableToolWindow;
                WindowState = FormWindowState.Maximized;
                BackColor = Color.LightBlue;
                Text = "Rezultat";
            }

            /// <summary>
            /// Poskrbi, da se rezultat izpiše in izriše. 
            /// </summary>
            public void DrawLinePoint(object sender, PaintEventArgs e)
            {
                int vodoravniPremik = (Size.Width - 40) / koliko;
                List<Label> rezVrstice = new List<Label>();
                List<Label> rezStolpci = new List<Label>();
                for (int i = 0; i < koliko; i++)
                {
                    Label sto = new Label();
                    sto.Location = new Point(20 + (i * vodoravniPremik), 20);
                    sto.Size = new Size(62, 30);
                    sto.Visible = true;
                    sto.Text = imenaStolpcev[i].Text;
                    this.Controls.Add(sto);
                    rezVrstice.Add(sto);

                    Label vrst = new Label();
                    vrst.Location = new Point(20 + (i * vodoravniPremik), Size.Height - 100);
                    vrst.Size = new Size(62, 30);
                    vrst.Visible = true;
                    vrst.Text = imenaVrstic[i].Text;
                    this.Controls.Add(vrst);
                    rezStolpci.Add(vrst);
                }
                Graphics pisalo = CreateGraphics();
                Pen daljica = new Pen(Color.Red, 3);
                foreach (KeyValuePair<int, int> povezava in slovarDela)
                {
                    pisalo.DrawLine(daljica, rezVrstice[povezava.Key].Location, rezStolpci[povezava.Value - koliko].Location);
                }
                Label delavecNaslov = new Label();
                Label deloNaslov = new Label();
                delavecNaslov.Text = "Delavec";
                delavecNaslov.Location = new Point(45, 82);
                delavecNaslov.Size = new Size(58, 25);
                delavecNaslov.Visible = true;
                this.Controls.Add(delavecNaslov);

                deloNaslov.Text = "Dela";
                deloNaslov.Location = new Point(104, 82);
                deloNaslov.Size = new Size(42, 25);
                deloNaslov.Visible = true;
                this.Controls.Add(deloNaslov);

                Label cena = new Label();
                cena.Text = "Cena";
                cena.Location = new Point(165, 82);
                cena.Size = new Size(58, 25);
                cena.Visible = true;
                this.Controls.Add(cena);
                int k = 0;
                int minCena = 0;
                foreach (KeyValuePair<int, int> povezava in slovarDela)
                {
                    Label delo = new Label();
                    delo.Text = $"{rezVrstice[povezava.Key].Text}";
                    delo.Location = new Point(104, 82 + (k + 1) * 25);
                    delo.Size = new Size(42, 25);
                    delo.Visible = true;
                    this.Controls.Add(delo);

                    Label delavec = new Label();
                    delavec.Text = $"{rezStolpci[povezava.Value - koliko].Text}";
                    delavec.Location = new Point(45, 82 + (k + 1) * 25);
                    delavec.Size = new Size(58, 25);
                    delavec.Visible = true;
                    this.Controls.Add(delavec);

                    Label cenaOperacije = new Label();
                    minCena += int.Parse(matrikaPolj[povezava.Key, povezava.Value - koliko].Text);
                    cenaOperacije.Text = $"{int.Parse(matrikaPolj[povezava.Key, povezava.Value - koliko].Text)}";
                    cenaOperacije.Location = new Point(165, 82 + (k + 1) * 25);
                    cenaOperacije.Size = new Size(58, 25);
                    cenaOperacije.Visible = true;
                    this.Controls.Add(cenaOperacije);
                    k += 1;
                }
                Label skuCeba = new Label();
                skuCeba.Text = "Skupna cena";
                skuCeba.Location = new Point(68, 82 + (koliko + 1) * 25);
                skuCeba.Size = new Size(80, 25);
                skuCeba.Visible = true;
                this.Controls.Add(skuCeba);

                Label rez = new Label();
                rez.Text = $"{minCena}";
                rez.Location = new Point(165, 82 + (koliko + 1) * 25);
                rez.Size = new Size(58, 25);
                rez.Visible = true;
                this.Controls.Add(rez);
            }
        }
    }

}
