using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;

namespace SensorMonitoringSystem
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class SensorMonitoringSystemService : ISensorMonitoringSystemService
    {
        public List<Companies> FindAllCompanies()
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            List<Companies> results = new List<Companies>();

            foreach (CompaniesEntity Companies in SMSE.Companies)
            {
                results.Add(new Companies()
                {
                    CompanyID = Companies.CompanyID,
                    CompanyName = Companies.CompanyName,
                });
            }

            return results;
        }

        public bool UsernameControl(string username)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();

            var UserEntity = (from p in SMSE.Users where p.Username == username select p).FirstOrDefault();

            if(UserEntity != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void RegisterUser(Users RegisteredUser)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();

            bool Activation = false;
            Random rnd = new Random();
            long RandomCodeNumber = rnd.Next(111111, 999999);

            SMSE.Users.Add(new UsersEntity
            {
                CompanyID = RegisteredUser.CompanyID,
                Name = RegisteredUser.Name,
                Surname = RegisteredUser.Surname,
                PhoneNumber = RegisteredUser.PhoneNumber,
                Username = RegisteredUser.Username,
                Password = RegisteredUser.Password,
                IsActivated = Activation,
                RegistrationCode = RandomCodeNumber
            });

            SMSE.SaveChanges();
        }

        public Users FindUser(string username)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();

            var UserEntity = (from p in SMSE.Users where p.Username == username select p).FirstOrDefault();

            if (UserEntity != null)
            {
                return new Users
                {
                    UserID = UserEntity.UserID,
                    CompanyID = UserEntity.CompanyID,
                    Name = UserEntity.Name,
                    Surname = UserEntity.Surname,
                    PhoneNumber = UserEntity.PhoneNumber,
                    Username = UserEntity.Username,
                    Password = UserEntity.Password,
                    IsActivated = UserEntity.IsActivated,
                    RegistrationCode = UserEntity.RegistrationCode
                };
            }
            else
                return null;

        }

        public void RegisterUserDetail(UsersDetails RegisteredUserDetail)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();

            SMSE.UsersDetails.Add(new UsersDetailsEntity
            {
                UserID = RegisteredUserDetail.UserID,
                City = RegisteredUserDetail.City,
                Adress = RegisteredUserDetail.Address,
                DateOfBirth = RegisteredUserDetail.DateOfBirth,
                Email = RegisteredUserDetail.Email,
            });

            SMSE.SaveChanges();
        }

        public bool UserDetailControl(string userid)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            int IntID = int.Parse(userid);

            var UserDetailEntity = (from p in SMSE.UsersDetails where p.UserID == IntID select p).FirstOrDefault();

            if (UserDetailEntity != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void SendInfoMail(UsersDetails RegisteredUserDetail)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();

            var UserEntity = (from p in SMSE.Users where p.UserID == RegisteredUserDetail.UserID select p).FirstOrDefault();
            var UserDetailEntity = (from p in SMSE.UsersDetails where p.UserID == RegisteredUserDetail.UserID select p).FirstOrDefault();

            var fromAddress = new MailAddress("techexpertmonitoringsystem@gmail.com", "TechExpert Officer");
            var toAddress = new MailAddress(UserDetailEntity.Email, UserEntity.Name + " " + UserEntity.Surname);
            const string fromPassword = "techexpertmail";
            const string subject = "Sensor Monitoring System Registration";

            string body = "Your username is " + UserEntity.Username +
                          " and your password is " + UserEntity.Password + 
                          " and your activation code is " + UserEntity.RegistrationCode;

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                Timeout = 20000
            };

            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }

        public void ChangePassword(Users ChangedPasswordUser)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();

            var UserEntity = (from p in SMSE.Users where p.UserID == ChangedPasswordUser.UserID select p).FirstOrDefault();

            SMSE.Entry(UserEntity).CurrentValues.SetValues(new UsersEntity()
            {
                UserID = UserEntity.UserID,
                CompanyID = UserEntity.CompanyID,
                Name = UserEntity.Name,
                Surname = UserEntity.Surname,
                PhoneNumber = UserEntity.PhoneNumber,
                Username = UserEntity.Username,
                Password = ChangedPasswordUser.Password,
                IsActivated = UserEntity.IsActivated,
                RegistrationCode = UserEntity.RegistrationCode
            });

            SMSE.SaveChanges();
        }

        public void Activation(Users ActivatedUser)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();

            var UserEntity = (from p in SMSE.Users where p.UserID == ActivatedUser.UserID select p).FirstOrDefault();

            SMSE.Entry(UserEntity).CurrentValues.SetValues(new UsersEntity()
            {
                UserID = UserEntity.UserID,
                CompanyID = UserEntity.CompanyID,
                Name = UserEntity.Name,
                Surname = UserEntity.Surname,
                PhoneNumber = UserEntity.PhoneNumber,
                Username = UserEntity.Username,
                Password = UserEntity.Password,
                IsActivated = true,
                RegistrationCode = UserEntity.RegistrationCode
            });

            SMSE.SaveChanges();
        }

        public UsersDetails FindUserDetail(string userid)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            int ID = int.Parse(userid);

            var UserDetailEntity = (from p in SMSE.UsersDetails where p.UserID == ID select p).FirstOrDefault();

            if (UserDetailEntity != null)
            {
                return new UsersDetails
                {
                    DetailID = UserDetailEntity.DetailID,
                    UserID = UserDetailEntity.UserID,
                    City = UserDetailEntity.City,
                    Address = UserDetailEntity.Adress,
                    DateOfBirth = UserDetailEntity.DateOfBirth,
                    Email = UserDetailEntity.Email
                };
            }
            else
                return null;

        }

        public void ChangeCode(Users ChangedCodeUser)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            Random rnd = new Random();
            long RandomCodeNumber = rnd.Next(111111, 999999);

            var UserEntity = (from p in SMSE.Users where p.UserID == ChangedCodeUser.UserID select p).FirstOrDefault();

            SMSE.Entry(UserEntity).CurrentValues.SetValues(new UsersEntity()
            {
                UserID = UserEntity.UserID,
                CompanyID = UserEntity.CompanyID,
                Name = UserEntity.Name,
                Surname = UserEntity.Surname,
                PhoneNumber = UserEntity.PhoneNumber,
                Username = UserEntity.Username,
                Password = UserEntity.Password,
                IsActivated = UserEntity.IsActivated,
                RegistrationCode = RandomCodeNumber
            });

            SMSE.SaveChanges();
        }

        public List<Sensors> FindCompaniesAllSensors(string companyid)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            List<Sensors> results = new List<Sensors>();
            int IntID = Int32.Parse(companyid);

            var SensorsEntity = (from p in SMSE.Sensors where p.CompanyID == IntID select p);

            if (SensorsEntity != null)
            {

                foreach (SensorsEntity Sensors in SensorsEntity)
                {
                    results.Add(new Sensors()
                    {
                        SensorID = Sensors.SensorID,
                        CompanyID = Sensors.CompanyID,
                        SensorDescription = Sensors.SensorDescription,
                        SensorAddress = Sensors.SensorAddress,
                        GraphicalMinValue = Sensors.GraphicalMinValue,
                        GraphicalMaxValue = Sensors.GraphicalMaxValue,
                        LowestCriticalValue = Sensors.LowestCriticalValue,
                        HighestCriticalValue = Sensors.HighestCriticalValue,
                        SensorUnit = Sensors.SensorUnit
                    });
                }

                return results;
            }
            else
                return null;
        }

        public bool SensorDataControl(string sensorid)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            int IntID = Int32.Parse(sensorid);

            var SensorDataEntity = (from p in SMSE.SensorsDatas where p.SensorID == IntID select p).FirstOrDefault();

            if (SensorDataEntity != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Sensors FindSensor(string sensorid)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            int IntID = Int32.Parse(sensorid);

            var SensorEntity = (from p in SMSE.Sensors where p.SensorID == IntID select p).FirstOrDefault();

            if (SensorEntity != null)
            {
                return new Sensors()
                {
                    SensorID = SensorEntity.SensorID,
                    CompanyID = SensorEntity.CompanyID,
                    SensorDescription = SensorEntity.SensorDescription,
                    SensorAddress = SensorEntity.SensorAddress,
                    GraphicalMinValue = SensorEntity.GraphicalMinValue,
                    GraphicalMaxValue = SensorEntity.GraphicalMaxValue,
                    LowestCriticalValue = SensorEntity.LowestCriticalValue,
                    HighestCriticalValue = SensorEntity.HighestCriticalValue,
                    SensorUnit = SensorEntity.SensorUnit
                };
            }
            else
                return null;
        }

        public List<SensorsDatas> FindAllSensorDatas(string sensorid)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            List<SensorsDatas> results = new List<SensorsDatas>();
            int IntID = Int32.Parse(sensorid);

            var SensorDatasEntity = (from p in SMSE.SensorsDatas where p.SensorID == IntID select p);

            if (SensorDatasEntity != null)
            {
                foreach (SensorsDatasEntity SensorDatas in SensorDatasEntity)
                {
                    results.Add(new SensorsDatas()
                    {
                        DataID = SensorDatas.DataID,
                        SensorID = SensorDatas.SensorID,
                        ReadValue = SensorDatas.ReadValue,
                        ReadValueTime = SensorDatas.ReadValueTime
                    });
                }

                return results;
            }
            else
                return null;
        }

        public List<SensorsDatas> FindDatasBetweenDates(string sensorid, string startdate, string enddate)
        {
            SensorMonitoringSystemEntities SMSE = new SensorMonitoringSystemEntities();
            List<SensorsDatas> results = new List<SensorsDatas>();

            int SensorID = Int32.Parse(sensorid);
            DateTime StartDate = DateTime.Parse(startdate);
            DateTime EndDate = DateTime.Parse(enddate);

            var SensorDatasEntity = (from p in SMSE.DatasBetweenDates(SensorID, StartDate, EndDate) select p);

            if (SensorDatasEntity != null)
            {
                foreach (var datas in SensorDatasEntity)
                {
                    results.Add(new SensorsDatas()
                    {
                        DataID = datas.DataID,
                        SensorID = datas.SensorID,
                        ReadValue = datas.ReadValue,
                        ReadValueTime = datas.ReadValueTime
                    });
                }

                return results;
            }
            else
                return null;
        }
    }
}
