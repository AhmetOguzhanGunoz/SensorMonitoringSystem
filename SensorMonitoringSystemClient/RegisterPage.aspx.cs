using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterPage : System.Web.UI.Page
{
    List<Companies> AllCompanies = new List<Companies>();

    protected void Page_Load(object sender, EventArgs e)
    {
        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        var client = new WebClient();
        var SerializedJsonAllCompanies = client.DownloadString(wsUrl + "/rest/findallcompanies");
        var DeserializedJsonAllCompanies = JsonHelper.Deserialize<List<Companies>>(SerializedJsonAllCompanies);

        foreach (Companies Company in DeserializedJsonAllCompanies)
        {
            if(!IsPostBack)
            {
                Companyddl.Items.Add(Company.CompanyName);
            }
            AllCompanies.Add(Company);
        }
    }

    protected void Submitbtn_Click(object sender, EventArgs e)
    {
        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        var client = new WebClient();
        var JsonUsernameExistOrNot = client.DownloadString(wsUrl + "/rest/usernamecontrol/" + UsernameRgstxt.Text);
        var UsernameExistOrNot = JsonHelper.Deserialize<bool>(JsonUsernameExistOrNot);

        if (UsernameExistOrNot)
        {
            Successlbl.Text = "Username already exist";
        }
        else
        {
            Users NewUser = new Users()
            {
                Name = Nametxt.Text,
                Surname = Surnametxt.Text,
                PhoneNumber = Phonetxt.Text,
                Username = UsernameRgstxt.Text,
                Password = PasswordRgstxt.Text,
            };

            foreach (Companies Company in AllCompanies)
            {
                if (Company.CompanyName == Companyddl.SelectedValue)
                {
                    NewUser.CompanyID = Company.CompanyID;
                }
            }

            var NewUserJson = JsonHelper.Serialize(NewUser);
            var RegisterUserClient = new WebClient();

            RegisterUserClient.Headers["Content-type"] = "application/json";
            RegisterUserClient.UploadString(wsUrl + "/rest/registeruser", NewUserJson);

            var GetRegisteredUserClient = new WebClient();
            var JsonGetRegisteredUser = GetRegisteredUserClient.DownloadString(wsUrl + "/rest/finduser/" + UsernameRgstxt.Text);
            var GetRegisteredUser = JsonHelper.Deserialize<Users>(JsonGetRegisteredUser);

            UsersDetails NewUserDetail = new UsersDetails()
            {
                UserID = GetRegisteredUser.UserID,
                City = Citytxt.Text,
                Address = Adresstxt.Text,
                DateOfBirth = DateTime.Parse(DOBtxt.Text),
                Email = Emailtxt.Text
            };

            var NewUserDetailJson = JsonHelper.Serialize(NewUserDetail);
            var RegisterUserDetailClient = new WebClient();
            RegisterUserDetailClient.Headers["Content-type"] = "application/json";
            RegisterUserDetailClient.UploadString(wsUrl + "/rest/registeruserdetail", NewUserDetailJson);

            var GetRegisteredUserDetailClient = new WebClient();
            var JsonRegisteredUserDetailExistOrNot = GetRegisteredUserDetailClient.DownloadString(wsUrl + "/rest/userdetailcontrol/" + GetRegisteredUser.UserID.ToString());
            var RegisteredUserDetailExistOrNot = JsonHelper.Deserialize<bool>(JsonRegisteredUserDetailExistOrNot);

            if (RegisteredUserDetailExistOrNot)
            {
                var SendInfoMailClient = new WebClient();
                SendInfoMailClient.Headers["Content-type"] = "application/json";
                SendInfoMailClient.UploadString(wsUrl + "/rest/sendmail", NewUserDetailJson);
                Successlbl.Text = "Registration success. Check specified e-mail address for obtainment of activation code. Activate your account through activation page."
                    + "If any problem occurred with your code please contact with techexpertmonitoringsystem@gmail.com";                
            }
            else
            {
                Successlbl.Text = "Registration failed. Please try again or contact with techexpertmonitoringsystem@gmail.com";
            }

        }
    }
}