using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfilePage : System.Web.UI.Page
{
    string username = "";
    static List<Sensors> AllSensors = new List<Sensors>();
    static Users LoggedUser = new Users();
    static UsersDetails LoggedUserDetail = new UsersDetails();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Session["username"] == null)
            {
                Response.Redirect("WelcomePage.aspx");
            }
            else
            {
                username = Session["username"].ToString();
                Session.RemoveAll();
            }

            string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

            var GetUserClient = new WebClient();
            var JsonFoundUser = GetUserClient.DownloadString(wsUrl + "/rest/finduser/" + username);
            var FoundUser = JsonHelper.Deserialize<Users>(JsonFoundUser);
            LoggedUser = FoundUser;

            var GetUserDetailClient = new WebClient();
            var JsonFoundUserDetail = GetUserClient.DownloadString(wsUrl + "/rest/finduserdetail/" + FoundUser.UserID.ToString());
            var FoundUserDetail = JsonHelper.Deserialize<UsersDetails>(JsonFoundUserDetail);
            LoggedUserDetail = FoundUserDetail;

            var SurnameEnglish = FoundUser.Surname.ToUpper();

            if(SurnameEnglish.Contains('İ'))
            {
                SurnameEnglish = SurnameEnglish.Replace('İ', 'I');
            }

            Dearlbl.Text = "Welcome Dear " + SurnameEnglish;

            var GetSensorsClient = new WebClient();
            var JsonFoundSensors = GetSensorsClient.DownloadString(wsUrl + "/rest/findallsensors/" + FoundUser.CompanyID.ToString());
            var FoundSensors = JsonHelper.Deserialize<List<Sensors>>(JsonFoundSensors);

            foreach (Sensors Sensor in FoundSensors)
            {
                Sensorsddl.Items.Add(Sensor.SensorDescription);
                AllSensors.Add(Sensor);                
            }

            SensorAddresslbl.Text = AllSensors[0].SensorAddress;
        }
    }

    protected void Sensorsddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (Sensors Sensor in AllSensors)
        {
            if(Sensorsddl.SelectedValue == Sensor.SensorDescription)
            {
                SensorAddresslbl.Text = Sensor.SensorAddress;
            }
        }
    }

    protected void Changecodebtn_Click(object sender, EventArgs e)
    {
        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        var JsonLoggedUser = JsonHelper.Serialize(LoggedUser);
        var ChangedCodeUserClient = new WebClient();
        ChangedCodeUserClient.Headers["Content-type"] = "application/json";
        ChangedCodeUserClient.UploadString(wsUrl + "/rest/changecode", JsonLoggedUser);

        var JsonLoggedUserDetail = JsonHelper.Serialize(LoggedUserDetail);
        var ChangedCodeUserSendInfoClient = new WebClient();
        ChangedCodeUserSendInfoClient.Headers["Content-type"] = "application/json";
        ChangedCodeUserSendInfoClient.UploadString(wsUrl + "/rest/sendmail", JsonLoggedUserDetail);

        Changelbl.Text = "Your activation code has been changed and your information sent to your specified e-mail address.";
    }

    protected void Analyzebtn_Click(object sender, EventArgs e)
    {
        int TempID = 0;

        foreach (Sensors Sensor in AllSensors)
        {
            if (Sensor.SensorDescription == Sensorsddl.SelectedValue)
            {
                TempID = Sensor.SensorID;
            }
        }

        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        var SensorDataControlClient = new WebClient();
        var JsonSensorDataExistOrNot = SensorDataControlClient.DownloadString(wsUrl + "/rest/sensordatacontrol/" + TempID.ToString());
        var SensorDataExistOrNot = JsonHelper.Deserialize<bool>(JsonSensorDataExistOrNot);

        if (!SensorDataExistOrNot)
        {
            SensorAddresslbl.Text = "Selected sensor does not have data for analyzing.";
        }
        else
        {
            foreach (Sensors Sensor in AllSensors)
            {
                if (Sensor.SensorDescription == Sensorsddl.SelectedValue)
                {
                    Session["SensorID"] = Sensor.SensorID.ToString();
                }
            }

            Response.Redirect("MonitorPage.aspx");
        }
    }
}