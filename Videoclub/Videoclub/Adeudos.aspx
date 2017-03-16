<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adeudos.aspx.cs" Inherits="Videoclub.Adeudos" %>

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
        .auto-style2 {
            width: 280px
        }
        .auto-style3 {
            width: 213px;
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
    <br />
    <br />
    <br />     

        <script src="js/ripples.min.js"></script>
        <script src="js/material.min.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>    
             <div class="page">
        <div class="content">            
                      <table class="table table-cover" align="center"><br><br><br>

           <tr>
            <td>
                <asp:GridView ID="gvAdeudos" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="969px">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
          </table>
            </div>
             </div>

    </form>

        </body>
</html>