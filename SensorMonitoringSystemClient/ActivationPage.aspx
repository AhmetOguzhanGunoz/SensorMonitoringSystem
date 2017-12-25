<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivationPage.aspx.cs" Inherits="ActivationPage" %>

<!DOCTYPE html>
<script runat="server">

    protected void Resendbtn_Click(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="ClientStyle.css" rel="stylesheet" />
    <title>Activate Account over Sensor Monitoring System Site</title>
</head>
<body>
    <form id="form1" runat="server">
            <div id="banner">
                <div id="bannerpart1">
                    <img src="logo.png" alt="techexpertlogo"/>
                </div>
                <div id="bannerpart2">
                    <h3>Sensor Monitoring System</h3>
                    <p>depends to trustworthy sensor datas</p>
                </div>
            </div>

            <div id="content">
                <div id="Checkarea">
                    <asp:Table Width="70%" CellPadding="0" CellSpacing="10" ID="CheckInfoTable" runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="20%"><asp:Label ID="UsernameRgslbl" Width="100%" runat="server" Text="Username:"></asp:Label></asp:TableCell>
                            <asp:TableCell Width="30%"><asp:TextBox ID="UsernameRgstxt" CssClass="inputclass"  runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell Width="20%"><asp:Label ID="Codelbl" Width="100%" runat="server" Text="Activation Code:"></asp:Label></asp:TableCell>
                            <asp:TableCell Width="30%"><asp:TextBox ID="Codetxt" CssClass="inputclass"  runat="server"></asp:TextBox></asp:TableCell>                            
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                    <asp:Button ID="Resendbtn" CssClass="buttonclass" Width="20%" runat="server" Text="Re-send Code" OnClick="Resendbtn_Click1"/>                    
                    <br />
                    <br />
                    <asp:Button ID="Activationbtn" CssClass="buttonclass" Width="20%" runat="server" Text="Activate" OnClick="Activationbtn_Click"/>
                    <br />
                    <br />
                    <asp:Label ID="Activationlbl" Width="100%" runat="server" Text=""></asp:Label>
                </div>
                                                                                                                                                                                           
            </div>
            <div id="footer">
                <p>TechExpert Information Technologies and Automation Engineering Trade Limited Company <br/> 
                    This site was made by Ahmet Oğuzhan Günöz - Copyright © 2017 - All Rights Reserved</p>
            </div>
    </form>
</body>
</html>
