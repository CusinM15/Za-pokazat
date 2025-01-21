using System;
using System.Linq;
using System.Data.SQLite;
using System.Data;
using System.Reflection;
using System.IO;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace FerryWPF.Business.Repositories
{
    public class GenericRepository : IGenericRepository
    {
        private static readonly string configPath = Path.Combine("..", "..", "", "config.json");
        private static readonly string jsonContent = File.ReadAllText(configPath);
        private static readonly Dictionary<string, string> jsonDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(jsonContent);
        private readonly string connectionString = jsonDic["connectionString"];

        /// <summary>
        /// Add data in correct SQL tabke.
        /// </summary>
        public int Insert<T>(T data)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string tableName = typeof(T).Name; // Get the table name based on the class name
                connection.Open();
                // Get the properties of the generic type
                PropertyInfo[] properties = typeof(T).GetProperties();
                // Create a parameterized SQL insert query
                string query = $"INSERT INTO {tableName} ({string.Join(", ", properties.Where(p => p.Name != "Id").Select(p => p.Name))}) " +
                               $"VALUES ({string.Join(", ", properties.Where(p => p.Name != "Id").Select(p => $"@{p.Name}"))});" +
                               $"SELECT last_insert_rowid();";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    // Add parameters and set their values from the class object
                    foreach (PropertyInfo property in properties)
                    {
                        _ = command.Parameters.AddWithValue($"@{property.Name}", property.GetValue(data));
                    }
                    // Execute the query
                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }

        public void UpdateNameInVehicle(int id, string name)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = $"UPDATE Vehicle SET Name = '{name}' WHERE id = {id}";
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    _ = command.ExecuteNonQuery();
                }
            }
        }

        public void OppeningClosingTheDoors(int id, bool door)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = $"UPDATE Vehicle SET DoorOppend = '{door}' WHERE id = {id}";
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    _ = command.ExecuteNonQuery();
                }
            }
        }

        public double GetWorkerSalary()
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = $"SELECT SUM(CardPrice)/10 FROM Vehicle;";
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    return (double)command.ExecuteScalar();
                }
            }
        }

        public double GetWorkerSalary_ThisMonth()
        {
            string today = DateTime.Now.ToString("o");
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                // todo; use > command, remove like
                string query = $"SELECT SUM(CardPrice)/10 FROM Vehicle WHERE DateEntered LIKE'{today.Substring(0, 7)}%';";
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    
                    try { return (double)command.ExecuteScalar(); }
                    catch { return 0; }
                }
            }
        }

        public void UpdateFuel(int id)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = $"UPDATE Vehicle SET Fuel = 100 WHERE id = {id}";
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    _ = command.ExecuteNonQuery();
                }
            }
        }

        public int NumberVehicleTypes()
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = $"SELECT type FROM VehicleType;";
                connection.Open();
                SQLiteCommand command = new SQLiteCommand();
                command.CommandType = CommandType.Text;
                command.Connection = connection;
                command.CommandText = query;
                SQLiteDataReader rez = command.ExecuteReader();
                int count = 0;
                while (rez.Read())
                {
                    count++;
                }
                return count;
            }
        }

        public string WhichType(int id)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = $"SELECT type FROM VehicleType WHERE id = {id};";
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    return (string)command.ExecuteScalar();
                }

            }
        }
    }
}