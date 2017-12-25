<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfilePage.aspx.cs" Inherits="ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="ClientStyle.css" rel="stylesheet" />
    <title>Choose Sensor to Analyze over Sensor Monitoring System Site</title>   
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
                <div id="Profilearea1">
                    <asp:Label ID="Dearlbl" CssClass="dearlblclass" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                    <br />
                    <asp:Table CellPadding="0" CellSpacing="10" ID="ProfileTable1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="70%"><asp:Label ID="Infolbl" Width="70%" runat="server" Text="You can change your account activation code by clicking change activation code button."></asp:Label></asp:TableCell>
                            <asp:TableCell Width="30%"><asp:Button ID="Changecodebtn" CssClass="buttonclass" Width="100%" runat="server" Text="Change activation code" OnClick="Changecodebtn_Click"/></asp:TableCell>                          
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                    <asp:Label ID="Changelbl" runat="server" Text=""></asp:Label>                    
                </div>

                <div id="Profilearea2">
                    <asp:Label ID="Chooselbl" CssClass="dearlblclass" runat="server" Text="Choose Sensor to Analyze Sensor Datas"></asp:Label>
                    <br />
                    <br />
                    <asp:Table Width="100%" CellPadding="0" CellSpacing="10" ID="Table1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="70%"><asp:DropDownList ID="Sensorsddl" Width="100%" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Sensorsddl_SelectedIndexChanged"></asp:DropDownList></asp:TableCell>
                            <asp:TableCell Width="30%"><asp:Button ID="Analyzebtn" CssClass="buttonclass" Width="100%" runat="server" Text="Analyze" OnClick="Analyzebtn_Click"/></asp:TableCell>                          
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                    <asp:Label ID="SensorAddresslbl" runat="server" Text=""></asp:Label> 
                </div>
            </div>
            <div id="footer">
                <p>TechExpert Information Technologies and Automation Engineering Trade Limited Company <br/> 
                    This site was made by Ahmet Oğuzhan Günöz - Copyright © 2017 - All Rights Reserved</p>
            </div>
    </form>
</body>
</html>
