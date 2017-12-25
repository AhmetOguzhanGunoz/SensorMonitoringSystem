<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="ClientStyle.css" rel="stylesheet" />
    <title>Retrieve Password From Sensor Monitoring System Site</title>
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
                    <asp:Button ID="Checkbtn" CssClass="buttonclass" Width="20%" runat="server" Text="Check" OnClick="Checkbtn_Click"/>
                    <br />
                    <br />
                    <asp:Label ID="Checklbl" Width="100%" runat="server" Text=""></asp:Label>
                </div>

                <div id="Infoarea" runat="server">
                    <asp:Table Width="70%" CellPadding="0" CellSpacing="10" ID="NewInfoTable" runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="20%"><asp:Label ID="NewPasswordlbl" Width="100%" runat="server" Text="New Password:"></asp:Label></asp:TableCell>
                            <asp:TableCell Width="30%"><asp:TextBox ID="NewPasswordtxt" TextMode="Password" CssClass="inputclass"  runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell Width="20%"><asp:Label ID="NewPasswordConfirmlbl" Width="100%" runat="server" Text="Confirm New Password:"></asp:Label></asp:TableCell>
                            <asp:TableCell Width="30%"><asp:TextBox ID="NewPasswordConfirmtxt" TextMode="Password" CssClass="inputclass" runat="server"></asp:TextBox></asp:TableCell>                            
                        </asp:TableRow>
                    </asp:Table>
                    <div id="regexarea">
                        <asp:Table CssClass="regextable" CellPadding="0" CellSpacing="10" ID="PasswordRegexTable" runat="server">                     
                            <asp:TableRow>
                                <asp:TableCell Width="33%" CssClass="regexborder"><asp:RequiredFieldValidator ID="PasswordRFV" runat="server" ErrorMessage="Password is required" ControlToValidate="NewPasswordtxt"></asp:RequiredFieldValidator></asp:TableCell>
                                <asp:TableCell Width="33%" CssClass="regexborder"><asp:RegularExpressionValidator ID="PasswordREV1" runat="server" ErrorMessage="Password allows english letters and numbers only" ControlToValidate="NewPasswordtxt" ValidationExpression="^[a-zA-Z0-9]+$"></asp:RegularExpressionValidator></asp:TableCell>
                                <asp:TableCell Width="33%" CssClass="regexborder"><asp:RegularExpressionValidator ID="PasswordREV2" runat="server" ErrorMessage="Password requires letters between 5-30 long" ControlToValidate="NewPasswordtxt" ValidationExpression="^.{5,30}$"></asp:RegularExpressionValidator></asp:TableCell>
                            </asp:TableRow>
                        
                        </asp:Table>
                    </div>
                    <br />
                    <asp:Button ID="Submitbtn" CssClass="buttonclass" Width="20%" runat="server" Text="Submit" OnClick="Submitbtn_Click"/>
                    <br />
                    <br />
                    <asp:Label ID="Successlbl" Width="100%" runat="server" Text=""></asp:Label>
                    
                </div>                                                                                                                                                                           
            </div>
            <div id="footer">
                <p>TechExpert Information Technologies and Automation Engineering Trade Limited Company <br/> 
                    This site was made by Ahmet Oğuzhan Günöz - Copyright © 2017 - All Rights Reserved</p>
            </div>
    </form>
</body>
</html>