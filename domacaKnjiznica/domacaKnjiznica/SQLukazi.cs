using System.Data;
using System.Data.SQLite;

namespace domacaKnjiznica
{
    public class SQLukazi
    {
        public static DataTable Iskalnik(string nas = "", string avt = "")
        {
            DataTable preberi = new DataTable();
            using (SQLiteConnection conn = new SQLiteConnection(VrniConnectionString()))
            {
                try
                {
                    conn.Open();
                    string sql = $@"SELECT * FROM knjige WHERE 
                                                Naslov LIKE '%{nas}%' AND Avtor LIKE '%{avt}%'";
                    SQLiteCommand cmd = new SQLiteCommand(sql, conn);
                    SQLiteDataAdapter adp = new SQLiteDataAdapter(cmd);
                    adp.Fill(preberi);
                }
                catch { }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
                return preberi;
            }
        }
        public static void DodajKnjigo(Knjiga knjiga)
        {
            using (SQLiteConnection conn = new SQLiteConnection(VrniConnectionString()))
            {
                conn.Open();
                try    //pomeni da to knjigo že imamo, zato moramo zgolj koliko povečati za 1
                {
                    string sqlInsert = $@"INSERT INTO knjige 
                                        (Naslov, Avtor, Leto, Založba, Izposoja)
                                        VALUES
                                        ('{knjiga.Naslov}' , '{knjiga.Avtor}', '{knjiga.Leto}', '{knjiga.Zalozba}', '')";
                    SQLiteCommand cmdInsert = new SQLiteCommand(sqlInsert, conn);
                    cmdInsert.ExecuteNonQuery();
                }
                catch { }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
            }
        }
        public static DataTable knjigaNaId(int id)
        {
            DataTable preberi = new DataTable();
            using (SQLiteConnection conn = new SQLiteConnection(VrniConnectionString()))
            {
                try
                {
                    conn.Open();
                    string sql = $@"SELECT * FROM knjige WHERE 
                                                Id = {id}";
                    SQLiteCommand cmd = new SQLiteCommand(sql, conn);
                    SQLiteDataAdapter adp = new SQLiteDataAdapter(cmd);
                    adp.Fill(preberi);
                }
                catch { }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
                return preberi;
            }
        }
        public static void izposoja(int id, string komu)
        {
            using (SQLiteConnection conn = new SQLiteConnection(VrniConnectionString()))
            {
                conn.Open();
                try    //pomeni da to knjigo že imamo, zato moramo zgolj koliko povečati za 1
                {
                    string sqlUpdate = $@"UPDATE knjige 
                                        SET Izposoja = '{komu}'
                                        WHERE Id = '{id}'";
                    SQLiteCommand cmdUpdate = new SQLiteCommand(sqlUpdate, conn);
                    cmdUpdate.ExecuteNonQuery();
                }
                catch { }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
            }
        }
        public static void popravi(int id, string nas, string avt, string zal, string let)
        {
            using (SQLiteConnection conn = new SQLiteConnection(VrniConnectionString()))
            {
                conn.Open();
                try    //pomeni da to knjigo že imamo, zato moramo zgolj koliko povečati za 1
                {
                    string sqlUpdate = $@"UPDATE knjige 
                                        SET Naslov = '{nas}', Avtor = '{avt}', Založba = '{zal}', Leto = '{let}'
                                        WHERE Id = '{id}'";
                    SQLiteCommand cmdUpdate = new SQLiteCommand(sqlUpdate, conn);
                    cmdUpdate.ExecuteNonQuery();
                }
                catch { }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
            }
        }
        private static string VrniConnectionString()
        {
            return @"Data Source=.\knjiznica.sqlite; Version=3;";
        }
    }
}
