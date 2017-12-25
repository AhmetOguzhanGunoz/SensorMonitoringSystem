using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ActivationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Activationbtn_Click(object sender, EventArgs e)
    {
        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        if (UsernameRgstxt.Text == "")
        {
            Activationlbl.Text = "Please enter proper username.";
        }
        else
        {
            var UserNameControlClient = new WebClient();
            var JsonUsernameExistOrNot = UserNameControlClient.DownloadString(wsUrl + "/rest/usernamecontrol/" + UsernameRgstxt.Text);
            var UsernameExistOrNot = JsonHelper.Deserialize<bool>(JsonUsernameExistOrNot);

            if (!UsernameExistOrNot)
            {
                Activationlbl.Text = "Username does not exist.";
            }
            else
            {
                var GetUserClient = new WebClient();
                var JsonFoundUser = GetUserClient.DownloadString(wsUrl + "/rest/finduser/" + UsernameRgstxt.Text);
                var FoundUser = JsonHelper.Deserialize<Users>(JsonFoundUser);

                if (FoundUser.IsActivated)
                {
                    Activationlbl.Text = "Account is activated already.";
                }
                else if (Codetxt.Text != FoundUser.RegistrationCode.ToString())
                {
                    Activationlbl.Text = "Activation code is wrong. Please try again.";
                }
                else
                {
                    var SendActivatedUserClient = new WebClient();
                    SendActivatedUserClient.Headers["Content-type"] = "application/json";
                    SendActivatedUserClient.UploadString(wsUrl + "/rest/activation", JsonFoundUser);

                    var GetActivatedUserClient = new WebClient();
                    var JsonActivatedUser = GetActivatedUserClient.DownloadString(wsUrl + "/rest/finduser/" + UsernameRgstxt.Text);
                    var ActivatedUser = JsonHelper.Deserialize<Users>(JsonActivatedUser);

                    if (ActivatedUser.IsActivated)
                    {
                        Activationlbl.Text = "Account is activated successfully";
                    }
                    else
                    {
                        Activationlbl.Text = "Account is not activated. Please try again.";
                    }
                }
            }
        }
    }

    protected void Resendbtn_Click1(object sender, EventArgs e)
    {
        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        if (UsernameRgstxt.Text == "")
        {
            Activationlbl.Text = "Please enter proper username.";
        }
        else
        {
            var UserNameControlClient = new WebClient();
            var JsonUsernameExistOrNot = UserNameControlClient.DownloadString(wsUrl + "/rest/usernamecontrol/" + UsernameRgstxt.Text);
            var UsernameExistOrNot = JsonHelper.Deserialize<bool>(JsonUsernameExistOrNot);

            if (!UsernameExistOrNot)
            {
                Activationlbl.Text = "Username does not exist.";
            }
            else
            {
                var GetUserClient = new WebClient();
                var JsonFoundUser = GetUserClient.DownloadString(wsUrl + "/rest/finduser/" + UsernameRgstxt.Text);
                var FoundUser = JsonHelper.Deserialize<Users>(JsonFoundUser);

                var GetUserDetailClient = new WebClient();
                var JsonFoundUserDetail = GetUserClient.DownloadString(wsUrl + "/rest/finduserdetail/" + FoundUser.UserID.ToString());

                var SendUserCodeClient = new WebClient();
                SendUserCodeClient.Headers["Content-type"] = "application/json";
                SendUserCodeClient.UploadString(wsUrl + "/rest/sendmail", JsonFoundUserDetail);

                Activationlbl.Text = "Code has been sent to your specified e-mail address successfully.";
            }
        }
    }
}