<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Toko.aspx.vb" Inherits="Toko" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="d-flex justify-content-center" style="width: 100%">
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="width: 50%; height: 45px;">
            <ul class="navbar-nav" style="width: 100%; justify-content: space-evenly; align-items: center;">

                <asp:Button ID="Button1" runat="server" Text="Beranda" CssClass="" Style="width: 100%; text-align: center; background-color: transparent; border: none" PostBackUrl="~/Index.aspx" />

                <div class="topbar-divider d-none d-sm-block "></div>
                <asp:Button ID="Button2" runat="server" Text="Toko Saya" CssClass="border-bottom-primary" Style="width: 100%; text-align: center; background-color: transparent; border: none" />
            </ul>

        </nav>
    </div>
    <div class="row" style="padding-top: 30px; justify-content:center;">
        <%If Not IsDBNull(Session("nama_toko")) Then%>
        <div class="card shadow mb-4" style="min-width: 70%">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Toko Saya</h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" RepeatColumns="4">
                        <ItemTemplate>
                            <asp:LinkButton class="btn card mb-4" CommandName="Detail" Style="width: 250px; margin: 0 10px 0 10px;" runat="server">
                                <div class="card-header" style="background-color: white">
                                    <image src="img/<%# Eval("gambar") %>" style="width: 200px; height: 200px;"></image>
                                </div>
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                <%# Eval("nama") %>
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">Rp. <%# Eval("harga") %></div>
                                        </div>
                                        <div class="col-auto">
                                        </div>
                                    </div>
                                </div>
                                <asp:Label ID="id_barang" runat="server" Text='<%# Eval("id") %>' Visible="False"></asp:Label>

                            </asp:LinkButton>
                            <div class="btn" style="width: 250px; margin: 0 0 0 10px; background: white;">
                                <asp:LinkButton ID="edit" runat="server" Text="Edit" CommandName="Edit" class="d-none d-sm-inline-block btn btn-sm btn-warning shadow-sm mr-3" Style="width: 30%;"></asp:LinkButton>
                                <asp:LinkButton ID="delete" runat="server" Text="Delete" CommandName="Delete" class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm" Style="width: 30%;"></asp:LinkButton>

                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                </div>
            </div>
        </div>
    </div>
    <a href="formTambah.aspx" class="btn btn-primary btn-circle btn-lg" style="position: fixed; right: 0; bottom: 0; margin: 75px;">
        <i class="fas fa-plus"></i>
    </a>
    <%Else %>
    <div class="container" style="width: 500px;">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4">Yuk Buat Toko Anda</h1>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="nama" class="form-control form-control-user" placeholder="Nama Toko" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="Button3" class="btn btn-primary btn-user btn-block" runat="server" Text="Daftar" />

                </div>
            </div>
        </div>
    </div>
    <%End IF %>
</asp:Content>

