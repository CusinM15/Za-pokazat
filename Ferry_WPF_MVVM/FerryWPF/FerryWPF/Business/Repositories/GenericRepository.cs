using System;
using System.Collections.Generic;
//using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Data.SQLite;
using System.Data;
using Dapper;
using FerryWPF.Business.Models;
using System.Data.SqlClient;
using System.Reflection;

namespace FerryWPF.Business.Repositories
{
    public class GenericRepository
    {
        private string connectionString = @"Data Source=.\FerryDB.sqlite; Version=3;";

        public GenericRepository()
        {

        }

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
                string query = $"INSERT INTO {tableName} ({string.Join(", ", properties.Where(p => p.Name != "id").Select(p => p.Name))}) " +
                               $"VALUES ({string.Join(", ", properties.Where(p => p.Name != "id").Select(p => $"@{p.Name}"))});" +
                               $"SELECT last_insert_rowid();";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    // Add parameters and set their values from the class object
                    foreach (PropertyInfo property in properties)
                    {
                        command.Parameters.AddWithValue($"@{property.Name}", property.GetValue(data));
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
                    command.ExecuteNonQuery();
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
                    command.ExecuteNonQuery();
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

        public void UpdateFuel(int id)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                string query = $"UPDATE Vehicle SET Fuel = 100 WHERE id = {id}";
                connection.Open();
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    command.ExecuteNonQuery();
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