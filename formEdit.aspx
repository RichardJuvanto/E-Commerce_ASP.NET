<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="formEdit.aspx.vb" Inherits="formEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <div class="container">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Edit Barang Toko</h1>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="nama" class="form-control form-control-user" placeholder="Nama" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="harga" class="form-control form-control-user" placeholder="Harga" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="deskripsi" class="form-control form-control-user" placeholder="Deskripsi" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control form-control-user" AutoPostBack="True">
                                    <asp:ListItem Value="1">Makanan</asp:ListItem>
                                    <asp:ListItem Value="2">Elektronik</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:Button ID="Button1" class="btn btn-primary btn-user btn-block" runat="server" Text="Update Barang" />
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>

