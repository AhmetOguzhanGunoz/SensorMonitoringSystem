using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SensorMonitoringSystemUnitTestProject.SensorMonitoringSystemServiceReference;

namespace SensorMonitoringSystemUnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        SensorMonitoringSystemServiceClient SMSSE = new SensorMonitoringSystemServiceClient();

        [TestMethod]
        public void TestUpperCaseUsername()
        {           
            Assert.AreEqual(true, SMSSE.UsernameControl("OGUZHANGUNOZ"));
        }

        [TestMethod]
        public void TestLowerCaseUsername()
        {
            Assert.AreEqual(true, SMSSE.UsernameControl("oguzhangunoz"));
        }


    }
}
