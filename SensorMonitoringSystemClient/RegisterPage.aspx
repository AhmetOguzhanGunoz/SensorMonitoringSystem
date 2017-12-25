<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterPage.aspx.cs" Inherits="RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="ClientStyle.css" rel="stylesheet" />
    <title>Register to Sensor Monitoring System</title>   
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
                    <div id="signuparea">
                        <asp:Table CellPadding="0" CellSpacing="10" ID="RegisterTable" runat="server">
                            <asp:TableRow>
                                <asp:TableCell Width="10%"><asp:Label ID="Namelbl"  Width="100%" runat="server" Text="Name:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="Nametxt" CssClass="inputclass" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell Width="10%"><asp:Label ID="Surnamelbl" Width="100%" runat="server" Text="Surname:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="Surnametxt" CssClass ="inputclass" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>                            
                            <asp:TableRow>
                                <asp:TableCell Width="10%"><asp:Label ID="UsernameRgslbl" Width="100%" runat="server" Text="Username:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="UsernameRgstxt" CssClass="inputclass"  runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell Width="10%"><asp:Label ID="PasswordRgslbl" Width="100%" runat="server" Text="Password:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="PasswordRgstxt" CssClass="inputclass" TextMode="Password" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Width="10%"><asp:Label ID="Phonelbl" Width="100%" runat="server" Text="Phone Number:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="Phonetxt" CssClass="inputclass" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell Width="10%"><asp:Label ID="Emaillbl" Width="100%" runat="server" Text="E-mail:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="Emailtxt" CssClass="inputclass" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Width="10%"><asp:Label ID="Citylbl" Width="100%" runat="server" Text="City:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="Citytxt" CssClass="inputclass" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell Width="10%"><asp:Label ID="Adresslbl" Width="100%" runat="server" Text="Adress:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="Adresstxt" TextMode="MultiLine" Style="resize:none" CssClass="inputclass" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Width="10%"><asp:Label ID="DOBlbl" Width="100%" runat="server" Text="Date of Birth:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:TextBox ID="DOBtxt" TextMode="Date" CssClass="inputclass" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell Width="10%"><asp:Label ID="Companylbl" Width="100%" runat="server" Text="Company:"></asp:Label></asp:TableCell>
                                <asp:TableCell Width="40%"><asp:DropDownList ID="Companyddl" CssClass="inputclass" runat="server"></asp:DropDownList></asp:TableCell>
                            </asp:TableRow>
                                           
                        </asp:Table>
                        <br />
                        <asp:Label ID="Successlbl" Width="100%" runat="server" Text=""></asp:Label>
                        <br />                       
                        
                    </div>
                <div id="regexarea">
                    <asp:Table CssClass="regextable" CellPadding="0" CellSpacing="10" ID="RegexTable1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="10%" CssClass="regexborder"><asp:RequiredFieldValidator ID="NameRFV" runat="server" ErrorMessage="Name is required" ControlToValidate="Nametxt"></asp:RequiredFieldValidator></asp:TableCell>
                            <asp:TableCell Width="15%" CssClass="regexborder"><asp:RegularExpressionValidator ID="NameREV1" runat="server" ErrorMessage="Name allows english letters only" ControlToValidate="Nametxt" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="25%" CssClass="regexborder"><asp:RegularExpressionValidator ID="NameREV2" runat="server" ErrorMessage="Name requires letters between 5-30 long" ControlToValidate="Nametxt" ValidationExpression="^.{5,30}$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="10%" CssClass="regexborder"><asp:RequiredFieldValidator ID="SurnameRFV" runat="server" ErrorMessage="Surname is required" ControlToValidate="Surnametxt"></asp:RequiredFieldValidator></asp:TableCell>
                            <asp:TableCell Width="15%" CssClass="regexborder"><asp:RegularExpressionValidator ID="SurnameREV1" runat="server" ErrorMessage="Surname allows english letters only" ControlToValidate="Surnametxt" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="25%" CssClass="regexborder"><asp:RegularExpressionValidator ID="SurnameREV2" runat="server" ErrorMessage="Surname requires letters between 5-30 long" ControlToValidate="Surnametxt" ValidationExpression="^.{5,30}$"></asp:RegularExpressionValidator></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="10%" CssClass="regexborder"><asp:RequiredFieldValidator ID="UsernameRFV" runat="server" ErrorMessage="Username is required" ControlToValidate="UsernameRgstxt"></asp:RequiredFieldValidator></asp:TableCell>
                            <asp:TableCell Width="15%" CssClass="regexborder"><asp:RegularExpressionValidator ID="UsernameREV1" runat="server" ErrorMessage="Username allows english letters and numbers only" ControlToValidate="UsernameRgstxt" ValidationExpression="^[a-zA-Z0-9]+$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="25%" CssClass="regexborder"><asp:RegularExpressionValidator ID="UsernameREV2" runat="server" ErrorMessage="Username requires letters between 5-30 long" ControlToValidate="UsernameRgstxt" ValidationExpression="^.{5,30}$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="10%" CssClass="regexborder"><asp:RequiredFieldValidator ID="PasswordRFV" runat="server" ErrorMessage="Password is required" ControlToValidate="PasswordRgstxt"></asp:RequiredFieldValidator></asp:TableCell>
                            <asp:TableCell Width="15%" CssClass="regexborder"><asp:RegularExpressionValidator ID="PasswordREV1" runat="server" ErrorMessage="Password allows english letters and numbers only" ControlToValidate="PasswordRgstxt" ValidationExpression="^[a-zA-Z0-9]+$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="25%" CssClass="regexborder"><asp:RegularExpressionValidator ID="PasswordREV2" runat="server" ErrorMessage="Password requires letters between 5-30 long" ControlToValidate="PasswordRgstxt" ValidationExpression="^.{5,30}$"></asp:RegularExpressionValidator></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="10%" CssClass="regexborder"><asp:RequiredFieldValidator ID="PhoneRFV" runat="server" ErrorMessage="Phone Number is required" ControlToValidate="Phonetxt"></asp:RequiredFieldValidator></asp:TableCell>
                            <asp:TableCell Width="15%" CssClass="regexborder"><asp:RegularExpressionValidator ID="PhoneREV1" runat="server" ErrorMessage="Phone Number allows numbers only" ControlToValidate="Phonetxt" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="25%" CssClass="regexborder"><asp:RegularExpressionValidator ID="PhoneREV2" runat="server" ErrorMessage="Phone Number requires numbers in length 10" ControlToValidate="Phonetxt" ValidationExpression="^.{10,10}$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="10%" CssClass="regexborder"><asp:RequiredFieldValidator ID="EmailRFV" runat="server" ErrorMessage="E-mail is required" ControlToValidate="Emailtxt"></asp:RequiredFieldValidator></asp:TableCell>
                            <asp:TableCell Width="15%" CssClass="regexborder"><asp:RegularExpressionValidator ID="EmailREV1" runat="server" ErrorMessage="E-mail is not proper" ControlToValidate="Emailtxt" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="25%" CssClass="regexborder"><asp:RegularExpressionValidator ID="EmailREV2" runat="server" ErrorMessage="E-mail requires characters between 5-30 long" ControlToValidate="Emailtxt" ValidationExpression="^.{5,30}$"></asp:RegularExpressionValidator></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="10%" CssClass="regexborder"><asp:RequiredFieldValidator ID="CityRFV" runat="server" ErrorMessage="City is required" ControlToValidate="Citytxt"></asp:RequiredFieldValidator></asp:TableCell>
                            <asp:TableCell Width="15%" CssClass="regexborder"><asp:RegularExpressionValidator ID="CityREV1" runat="server" ErrorMessage="City allows english letters only" ControlToValidate="Citytxt" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="25%" CssClass="regexborder"><asp:RegularExpressionValidator ID="CityREV2" runat="server" ErrorMessage="City requires letters between 5-20 long" ControlToValidate="Citytxt" ValidationExpression="^.{5,20}$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="10%" CssClass="regexborder"><asp:RequiredFieldValidator ID="AdressRFV" runat="server" ErrorMessage="Adress is required" ControlToValidate="Adresstxt"></asp:RequiredFieldValidator></asp:TableCell>
                            <asp:TableCell Width="15%" CssClass="regexborder"><asp:RegularExpressionValidator ID="AdressREV1" runat="server" ErrorMessage="Adress is not proper" ControlToValidate="Adresstxt" ValidationExpression="^[a-zA-Z][0-9a-zA-Z.:\-\\\s]*$"></asp:RegularExpressionValidator></asp:TableCell>
                            <asp:TableCell Width="25%" CssClass="regexborder"><asp:RegularExpressionValidator ID="AdressREV2" runat="server" ErrorMessage="Adress requires letters between 20-200 long" ControlToValidate="Adresstxt" ValidationExpression="^.{20,200}$"></asp:RegularExpressionValidator></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table CssClass="regextable" CellPadding="0" CellSpacing="10" ID="RegexTable2" runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="50%" CssClass="regexborder"><asp:RequiredFieldValidator ID="DOBRFV" runat="server" ErrorMessage="Date of Birth is required" ControlToValidate="DOBtxt"></asp:RequiredFieldValidator></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                    <asp:Button ID="Submitbtn" Width="20%" CssClass="buttonclass" runat="server" Text="Register" OnClick="Submitbtn_Click"/>
                </div>
            </div>
            <div id="footer">
                <p>TechExpert Information Technologies and Automation Engineering Trade Limited Company <br/> 
                    This site was made by Ahmet Oğuzhan Günöz - Copyright © 2017 - All Rights Reserved</p>
            </div>
    </form>
</body>
</html>
