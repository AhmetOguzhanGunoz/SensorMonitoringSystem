using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WelcomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Activationbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("ActivationPage.aspx");
    }

    protected void Forgotpassbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgotPassword.aspx");
    }

    protected void Registerbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterPage.aspx");
    }

    protected void Loginbtn_Click(object sender, EventArgs e)
    {
        string wsUrl = "http://localhost:63420/SensorMonitoringSystemService.svc";

        if (Usernametxt.Text == "")
        {
            Checklbl.Text = "Please enter proper username.";
        }
        else
        {
            var UserNameControlClient = new WebClient();
            var JsonUsernameExistOrNot = UserNameControlClient.DownloadString(wsUrl + "/rest/usernamecontrol/" + Usernametxt.Text);
            var UsernameExistOrNot = JsonHelper.Deserialize<bool>(JsonUsernameExistOrNot);

            if (!UsernameExistOrNot)
            {
                Checklbl.Text = "Username does not exist.";
            }
            else
            {
                var GetUserClient = new WebClient();
                var JsonFoundUser = GetUserClient.DownloadString(wsUrl + "/rest/finduser/" + Usernametxt.Text);
                var FoundUser = JsonHelper.Deserialize<Users>(JsonFoundUser);

                if (Passwordtxt.Text != FoundUser.Password)
                {
                    Checklbl.Text = "Password is wrong. Please try again.";
                }
                else if(!FoundUser.IsActivated)
                {
                    Checklbl.Text = "Your account is not activated. Please activate it through activation page.";
                }
                else
                {
                    Session["username"] = FoundUser.Username;
                    Response.Redirect("ProfilePage.aspx");
                }
            }
        }
    }
}