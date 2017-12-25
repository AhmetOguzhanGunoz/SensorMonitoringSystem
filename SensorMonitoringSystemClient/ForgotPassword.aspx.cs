using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Infoarea.Visible = false;
    }

    protected void Checkbtn_Click(object sender, EventArgs e)
    {
        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        if (UsernameRgstxt.Text == "")
        {
            Checklbl.Text = "Please enter proper username.";
        }
        else
        {
            var UserNameControlClient = new WebClient();
            var JsonUsernameExistOrNot = UserNameControlClient.DownloadString(wsUrl + "/rest/usernamecontrol/" + UsernameRgstxt.Text);
            var UsernameExistOrNot = JsonHelper.Deserialize<bool>(JsonUsernameExistOrNot);

            if (!UsernameExistOrNot)
            {
                Checklbl.Text = "Username does not exist.";
            }
            else
            {
                var GetUserClient = new WebClient();
                var JsonFoundUser = GetUserClient.DownloadString(wsUrl + "/rest/finduser/" + UsernameRgstxt.Text);
                var FoundUser = JsonHelper.Deserialize<Users>(JsonFoundUser);

                if (Codetxt.Text != FoundUser.RegistrationCode.ToString())
                {
                    Checklbl.Text = "Activation code is wrong. Please try again.";
                }
                else
                {
                    Checklbl.Text = "User is found.";
                    Infoarea.Visible = true;
                }
            }
        }
    }

    protected void Submitbtn_Click(object sender, EventArgs e)
    {
        Infoarea.Visible = true;
        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        var GetUserClient = new WebClient();
        var JsonFoundUser = GetUserClient.DownloadString(wsUrl + "/rest/finduser/" + UsernameRgstxt.Text);
        var FoundUser = JsonHelper.Deserialize<Users>(JsonFoundUser);

        if(NewPasswordtxt.Text != NewPasswordConfirmtxt.Text)
        {
            Successlbl.Text = "New password and its confirmation are not same.";
        }
        else
        {
            FoundUser.Password = NewPasswordtxt.Text;

            var ChangedPasswordUserClient = new WebClient();
            var JsonChangedPasswordUser = JsonHelper.Serialize(FoundUser);

            ChangedPasswordUserClient.Headers["Content-type"] = "application/json";
            ChangedPasswordUserClient.UploadString(wsUrl + "/rest/changepassword", JsonChangedPasswordUser);

            var GetNewPasswordUserClient = new WebClient();
            var JsonNewPasswordUserClient = GetNewPasswordUserClient.DownloadString(wsUrl + "/rest/finduser/" + UsernameRgstxt.Text);
            var NewPasswordUser = JsonHelper.Deserialize<Users>(JsonNewPasswordUserClient);

            if(NewPasswordUser.Password == NewPasswordtxt.Text)
            {
                Successlbl.Text = "Password has been changed successfully.";
            }
            else
            {
                Successlbl.Text = "Password does not changed. Please try again.";
            }
        }
    }
}