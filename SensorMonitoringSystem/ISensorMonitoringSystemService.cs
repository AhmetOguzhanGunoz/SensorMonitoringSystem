using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace SensorMonitoringSystem
{
    [ServiceContract]
    public interface ISensorMonitoringSystemService
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/findallcompanies", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        List<Companies> FindAllCompanies();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/usernamecontrol/{username}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        bool UsernameControl(string username);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "/registeruser", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        void RegisterUser(Users RegisteredUser);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/finduser/{username}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        Users FindUser(string username);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "/registeruserdetail", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        void RegisterUserDetail(UsersDetails RegisteredUserDetail);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/userdetailcontrol/{userid}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        bool UserDetailControl(string userid);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "/sendmail", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        void SendInfoMail(UsersDetails RegisteredUserDetail);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "/changepassword", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        void ChangePassword(Users ChangedPasswordUser);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "/activation", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        void Activation(Users ActivatedUser);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/finduserdetail/{userid}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        UsersDetails FindUserDetail(string userid);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "/changecode", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        void ChangeCode(Users ChangedCodeUser);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/findallsensors/{companyid}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        List<Sensors> FindCompaniesAllSensors(string companyid);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/sensordatacontrol/{sensorid}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        bool SensorDataControl(string sensorid);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/findsensor/{sensorid}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        Sensors FindSensor(string sensorid);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/findallsensordatas/{sensorid}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        List<SensorsDatas> FindAllSensorDatas(string sensorid);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/finddatasbetweendates/{sensorid}/{startdate}/{enddate}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        List<SensorsDatas> FindDatasBetweenDates(string sensorid, string startdate, string enddate);
    }

    [DataContract]
    public class Companies
    {
        [DataMember]
        public int CompanyID { get; set; }
        [DataMember]
        public string CompanyName { get; set; }
    }

    [DataContract]
    public class Users
    {
        [DataMember]
        public int UserID { get; set; }
        [DataMember]
        public int CompanyID { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string Surname { get; set; }
        [DataMember]
        public string PhoneNumber { get; set; }
        [DataMember]
        public string Username { get; set; }
        [DataMember]
        public string Password { get; set; }
        [DataMember]
        public bool IsActivated { get; set; }
        [DataMember]
        public long RegistrationCode { get; set; }

    }

    [DataContract]
    public class UsersDetails
    {
        [DataMember]
        public int DetailID { get; set; }
        [DataMember]
        public int UserID { get; set; }
        [DataMember]
        public string City { get; set; }
        [DataMember]
        public string Address { get; set; }
        [DataMember]
        public DateTime DateOfBirth { get; set; }
        [DataMember]
        public string Email { get; set; }

    }

    [DataContract]
    public class Sensors
    {
        [DataMember]
        public int SensorID { get; set; }
        [DataMember]
        public int CompanyID { get; set; }
        [DataMember]
        public string SensorDescription { get; set; }
        [DataMember]
        public string SensorAddress { get; set; }
        [DataMember]
        public int GraphicalMinValue { get; set; }
        [DataMember]
        public int GraphicalMaxValue { get; set; }
        [DataMember]
        public decimal LowestCriticalValue { get; set; }
        [DataMember]
        public decimal HighestCriticalValue { get; set; }
        [DataMember]
        public string SensorUnit { get; set; }

    }

    [DataContract]
    public class SensorsDatas
    {
        [DataMember]
        public int DataID { get; set; }
        [DataMember]
        public int SensorID { get; set; }
        [DataMember]
        public decimal ReadValue { get; set; }
        [DataMember]
        public DateTime ReadValueTime { get; set; }
    }
}
