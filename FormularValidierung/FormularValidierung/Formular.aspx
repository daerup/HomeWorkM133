<%@ Page Inherits="FormularValidierung.Formular" Language="C#" AutoEventWireup="true" CodeBehind="Formular.aspx.cs" UnobtrusiveValidationMode="None"%>
<%@ Import Namespace="System.Web.DynamicData" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Web.UI.WebControls.Expressions" %>
<%@ Import Namespace="System.Web.UI.WebControls.WebParts" %>

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
        <table width="80%">
        <tr>
            <td style="width: 20%">Benutzername:</td>
            <td style="width: 80%">
                 <asp:TextBox
                     ID="username" runat="server"/>
                <asp:CustomValidator 
                    ValidateEmptyText="True"
                    ID="validateUsername" 
                    ControlToValidate="username" 
                    OnServerValidate="ValidateUsername" runat="server" 
                    ErrorMessage="Der Benutzername muss 5 Zeichen lang sein!"/>
                <asp:RequiredFieldValidator 
                    ControlToValidate="username" 
                    ErrorMessage="Bitte füllen Sie das Feld aus!" runat="server"/>
            </td> 
        </tr>

        <tr>
            <td style="width: 20%">Passwort:</td>
            <td style="width: 80%"><asp:TextBox 
            ID="password" 
            TextMode="Password" runat="server"/></td>
        </tr>

        <tr>
            <td style="width: 20%">Passwort wiederholen:</td>
            <td style="width: 80%">
                <asp:TextBox 
                    ID="passwordRepetition" 
                    TextMode="Password" runat="server"/>
            <asp:CompareValidator
                ControlToValidate="password" 
                ControlToCompare="passwordRepetition"
                Operator="Equal" 
                Type="String" runat="server" 
                ErrorMessage="Die Passwörter stimmen nicht überein"/>
            </td>
        </tr>

        <tr>
            <td style="width: 20%">IP-Adresse:</td>
            <td>
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
            </td>
        </tr>
        <tr> 
            <td style="width: 20%">Erreichte Punktzahl: </td>
            <td>
            <asp:TextBox 
                ID="score" runat="server"/>
            <asp:CompareValidator
                ID="validateScore" 
                ControlToValidate="score"
                ControlToCompare="highscore"
                Operator="LessThanEqual" 
                Type="Integer"
                ErrorMessage="Die Rekordpunktzahl muss grösser sein als die erreichte Punktzahl!" runat="server"/>
            </td>        
        </tr>

        <tr>
            <td style="width: 20%">Rekordpunktzahl:</td>
            <td>
                <asp:TextBox
                    ID="highscore" runat="server"/>
                <asp:RangeValidator 
                    ID="validateHighscore" 
                    ControlToValidate="highscore" 
                    Type="Integer" 
                    MinimumValue="1" 
                    MaximumValue="5000" 
                    ErrorMessage="Die Punktzahl muss zwischen 1 und 5000 liegen" runat="server"/>
            </td>
        </tr>

        <tr>
            <td style="width: 20%">Primmzahl:</td>
            <td>
                <asp:TextBox 
                    ID="primeNumber" runat="server"/>
                <asp:CustomValidator
                    ID="validatePrimenumber" 
                    ControlToValidate="primenumber" 
                    OnServerValidate="ValidatePrimeNumber" runat="server" 
                    ErrorMessage="Geben sie eine Primzahl ein!"/>
            </td>
        </tr>
        </table>
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
    </form>
</body>
</html>
<%-- ReSharper restore MarkupAttributeTypo --%>
<%-- ReSharper restore MarkupTextTypo --%>

