using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.ServiceModel;
using SensorMonitoringSystemTestingApp.SensorMonitoringSystemServiceReference;

namespace SensorMonitoringSystemTestingApp
{
    class Program
    {
        static void Main(string[] args)
        {
            SensorMonitoringSystemServiceClient client = new SensorMonitoringSystemServiceClient();
            client.Open();
            var allCompanies = client.FindAllCompanies();
            Console.WriteLine(allCompanies.ToString());
            client.Close();
        }
    }
}
