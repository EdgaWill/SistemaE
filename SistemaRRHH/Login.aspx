<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaRRHH.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .login-box {
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            width: 300px;
        }

        .login-box input {
            width: 90%;
            padding: 8px;
            margin: 8px 0;
        }

        .login-box button,
        .login-box input[type="submit"] {
            width: 95%;
            padding: 10px;
            margin-top: 10px;
        }
    </style>

    <div class="login-container">
        <div class="login-box">
            <h2>Login</h2>            
            <asp:Label ID="lblUser" runat="server" Text="Usuario:" AssociatedControlID="txtUser" />
            <br />
            <asp:TextBox ID="txtUser" runat="server" />
            <br />
            <asp:Label ID="lblPass" runat="server" Text="Contraseña:" AssociatedControlID="txtPass" />
            <br />
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" />
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" />
        </div>
    </div>
</asp:Content>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
