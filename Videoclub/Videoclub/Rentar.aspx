<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rentar.aspx.cs" Inherits="Videoclub.Rentar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="description" content="Selectores de clase en CSS">
    <script src="js/jquery-2.1.4.js"></script>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link href="css/roboto.min.css" rel="stylesheet">
        <link href="css/material.min.css" rel="stylesheet">
        <link href="css/ripples.min.css" rel="stylesheet">    
    <title>Administrador de videoclub</title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
            border-style: solid;
            border-width: 7px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>  
            <a class="navbar-brand" href="Index.aspx">Videoclub </a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                    <li>
                        <a href="Titulos.aspx">Titulos</a>
                    </li>
                    <li>
                        <a href="Rentar.aspx">Rentar pelicula</a>
                    </li>
                    <li>
                        <a href="Recibir.aspx">Recibir pelicula</a>
                    </li>
                    <li>
                        <a href="Adeudos.aspx">Adeudos de clientes</a>
                    </li>
                    <li>
                        <a href="Clientes.aspx">Agregar Clientes</a>
                    </li>
                </ul>
        </div><!--/.nav-collapse -->

      </div>
    </nav>

    <br>
    <br>
    <br>
    <br>        
 
        <h2 align="center">Renta de titulos.</h2>
        <script src="js/ripples.min.js"></script>
        <script src="js/material.min.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <table align="center" class="auto-style1">
        <tr>
            <td class="modal-body">
                <asp:Label ID="Label1" runat="server" Text="Titulos"></asp:Label>
            </td>
            <td class="modal-body">
<!--                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:videoclubConnectionString %>" SelectCommand="SELECT [Titulo] FROM [Peliculas]"></asp:SqlDataSource> -->
                <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="153px">
                </asp:DropDownList>
                <asp:TextBox ID="txtTitulosRenta" runat="server" CssClass="form-control" AutoCompleteType="Enabled"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-body">
                <asp:Label ID="Label2" runat="server" Text="Categorias"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCategorias" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-body">
                <asp:Label ID="Label3" runat="server" Text="id cliente"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCliente" runat="server" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-body">
                <asp:Label ID="Label4" runat="server" Text="Recargos"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRecargos" runat="server" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-body">
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnRentar" runat="server" Text="Rentar Titulo" type="submit" CssClass="btn btn-default" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
    </form>    
    </body>
</html>
