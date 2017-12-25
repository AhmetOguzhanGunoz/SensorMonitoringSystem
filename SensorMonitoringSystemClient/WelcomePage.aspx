<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WelcomePage.aspx.cs" Inherits="WelcomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="ClientStyle.css" rel="stylesheet" />
    <title>Welcome to Sensor Monitoring System Site</title>   
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
                <div id="contentmiddle">
                        <asp:Table Width="100%" CellPadding="0" CellSpacing="10" ID="InputTable" runat="server">
                            <asp:TableRow>
                                <asp:TableCell Width="30%"><asp:Label ID="Usernamelbl" Width="100%" runat="server" Text="Username:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="70%"><asp:TextBox ID="Usernametxt" CssClass="inputclass" Width="100%" runat="server"></asp:TextBox></asp:TableCell>

                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableCell Width="30%"><asp:Label ID="Passwordlbl" Width="100%" runat="server" Text="Password:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="70%"><asp:TextBox ID="Passwordtxt" CssClass="inputclass" Width="100%" Textmode="Password" runat="server"></asp:TextBox></asp:TableCell>
                           
                            </asp:TableRow>  
                         </asp:Table>
                    
                        <asp:Table CssClass="contentmargin" Width ="100%" CellPadding="0" CellSpacing="5" ID="ButtonTable" runat="server">
                            <asp:TableRow>
                                <asp:TableCell Width="50%"><asp:Button ID="Forgotpassbtn" CssClass="buttonclass" Width="100%" runat="server" Text="Forgot Password" OnClick="Forgotpassbtn_Click" /></asp:TableCell>

                                <asp:TableCell Width="50%"><asp:Button ID="Registerbtn" CssClass="buttonclass"  Width="100%" runat="server" Text="Register" OnClick="Registerbtn_Click"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Width="50%"><asp:Button ID="Activationbtn" CssClass="buttonclass" Width="100%"  runat="server" Text="Activate Account" OnClick="Activationbtn_Click"/></asp:TableCell>

                                <asp:TableCell Width="50%"><asp:Button ID="Loginbtn" CssClass="buttonclass" Width="100%" runat="server" Text="Login" OnClick="Loginbtn_Click" /></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                        
                    <br />
                    <br />
                    <asp:Label ID="Checklbl" Width="100%" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div id="footer">
                <p>TechExpert Information Technologies and Automation Engineering Trade Limited Company <br/> 
                    This site was made by Ahmet Oğuzhan Günöz - Copyright © 2017 - All Rights Reserved</p>
            </div>
    </form>
</body>
</html>
