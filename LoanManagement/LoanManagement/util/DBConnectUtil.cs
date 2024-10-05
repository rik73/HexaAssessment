using System;
using System.Data.SqlClient;
using System.IO;

namespace LoanManagement.util
{
    public static class DBConnectUtil
    {
        public static SqlConnection GetConnection()
        {
            string connectionString = GetConnectionString();
            return new SqlConnection(connectionString);
        }

        private static string GetConnectionString()
        {

            string path = "appsettings.json";
            if (File.Exists(path))
            {
                var json = File.ReadAllText(path);
                var config = Newtonsoft.Json.JsonConvert.DeserializeObject<ConnectionConfig>(json);
                return config.ConnectionString;
            }
            else
            {
                throw new FileNotFoundException("Configuration file not found.");
            }
        }

        private class ConnectionConfig
        {
            public string ConnectionString { get; set; }
        }
    }
}
