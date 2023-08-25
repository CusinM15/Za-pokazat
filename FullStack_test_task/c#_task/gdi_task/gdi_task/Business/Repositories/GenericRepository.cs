using System.Data.SQLite;
using gdi_task.Business.Model;
using System;
using Z.Dapper.Plus;
using System.Collections.ObjectModel;

namespace gdi_task.Business.Repositories
{
    public class GenericRepository
    {
        private string connectionString = @"Data Source=.\dursDB.sqlite;Version=3;";

        public GenericRepository()
        {

        }

        public void UpdateNameInVehicle(ObservableCollection<SeznamDavcnihZavezancev> data)
        {
            try
            {
                CreatTheTable();
                using (var connection = new SQLiteConnection(connectionString))
                {
                    connection.BulkInsert(data);
                }
            }
            catch (Exception exc)
            {
            }
        }

        public void ClearTable()
        {
            try
            {

                using (SQLiteConnection connection = new SQLiteConnection(connectionString))
                {
                    string query = $"DROP TABLE SeznamDavcnihZavezancev;";
                    connection.Open();
                    using (SQLiteCommand command = new SQLiteCommand(query, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }

            }
            catch (Exception exc)
            {
            }
        }

        public void CreatTheTable()
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = "CREATE TABLE SeznamDavcnihZavezancev (" +
                                        "Id INTEGER PRIMARY KEY AUTOINCREMENT," +
                                        "Znak TEXT," +
                                        "PrvoCeloStevilo  TEXT, " +
                                        "DrugoCeloStevilo TEXT," +
                                        "Datum            TEXT," +
                                        "RealnoStevilo TEXT," +
                                        "Ime              TEXT," +
                                        "Naslov TEXT," +
                                        "Oznaka           TEXT ); ";
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}