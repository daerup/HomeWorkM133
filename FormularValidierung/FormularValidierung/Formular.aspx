<%@ Page Inherits="FormularValidierung.Formular" Language="C#" AutoEventWireup="true" CodeBehind="Formular.aspx.cs" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>
<%-- ReSharper disable MarkupTextTypo --%>
<%-- ReSharper disable MarkupAttributeTypo --%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Erfassung</title>
</head>
<body>
    <h1>Erfassung</h1>
    <form id="form" DefaultButton="send" runat="server">
    <div>
        <div>Benutzername: 
        <asp:TextBox 
            ID="username" runat="server"/>
        <asp:CustomValidator 
            ID="validateUsername" 
            ControlToValidate="username" 
            OnServerValidate="ValidateUsername" runat="server" 
            ErrorMessage="Der Benutzername muss 5 Zeichen lang sein!"/>
        <asp:RequiredFieldValidator 
            ControlToValidate="username" 
            ErrorMessage="Bitte füllen Sie das Feld aus!" runat="server"/>

        <div>Passwort:
        <asp:TextBox 
            ID="password" 
            TextMode="Password" runat="server"/>
        </div>

        <div>Passwort wiederholen:  
        <asp:TextBox 
            ID="passwordRepetition" 
            TextMode="Password" runat="server"/>
        <asp:CompareValidator
            ControlToValidate="password" 
            ControlToCompare="passwordRepetition"
            Operator="Equal" 
            Type="String" runat="server" 
            ErrorMessage="Die Passwörter stimmen nicht überein"/>
        </div>

        <div>IP-Adresse: 
        <asp:TextBox 
            ID="ipAddress" runat="server"/>

        <asp:RegularExpressionValidator 
            ID="validateIPAddress" 
            ControlToValidate="ipAddress" 
            EnableClientScript="true" 
            ValidationExpression="^(192\.168(\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|\d{1,2})){2})$" runat="server"
            ErrorMessage="Ungültige IP-Addresse"/>
            <asp:RequiredFieldValidator 
                ControlToValidate="ipAddress" 
                ErrorMessage="Bitte füllen Sie das Feld aus!" runat="server"/>
        </div>

        <div>Erreichte Punktzahl:  
        <asp:TextBox 
            ID="score" runat="server"/>
        <asp:CompareValidator
            ID="validateScore" 
            ControlToValidate="score"
            ControlToCompare="highscore"
            Operator="LessThanEqual" 
            Type="Integer"
            ErrorMessage="Die Rekordpunktzahl muss grösser sein als die erreichte Punktzahl!" runat="server"/>
        </div>

        <div>
            <div>Rekordpunktzahl:
            <asp:TextBox
                ID="highscore" runat="server"/>
            <asp:RangeValidator 
                ID="validateHighscore" 
                ControlToValidate="highscore" 
                Type="Integer" 
                MinimumValue="1" 
                MaximumValue="5000" 
                ErrorMessage="Die Punktzahl muss zwischen 1 und 5000 liegen" runat="server"/>
        </div>

        <div>Primmzahl:
            <asp:TextBox 
                ID="primeNumber" runat="server"/>
            <asp:CustomValidator 
                ID="validatePrimenumber" 
                ControlToValidate="primenumber" 
                OnServerValidate="ValidatePrimeNumber" runat="server" 
                ErrorMessage="Geben sie eine Primzahl ein!"/>
        </div>

        <div>
        <asp:Button 
            ID="discard"
            Text="Verwerfen"
            CausesValidation="False"
            OnClick="DiscardEntries" runat="server"/>
        <asp:Button 
            ID="send"
            Text="Übermitteln" runat="server"/>
        </div>
    </div>
    </div>
    </div>
    </form>
</body>
</html>
<%-- ReSharper restore MarkupAttributeTypo --%>
<%-- ReSharper restore MarkupTextTypo --%>

