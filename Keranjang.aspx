<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Keranjang.aspx.vb" Inherits="Keranjang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%Dim total As Integer = 0 %>

    <div class="row">

        <div class="col-lg-6" style="flex: none; max-width: 65%; margin-left: 20px;">

            <!-- Default Card Example -->
            <asp:DataList ID="DataList1" runat="server" Style="width: 100%;" OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <image src="img/<%# Eval("gambar") %>" style="width: 100px; height: 100px;"></image>
                                <div class="card-body">
                                    <div class="text-lg font-weight-bold text-primary text-uppercase mb-1">
                                        <%# Eval("nama") %>
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">Rp. <%# Eval("harga") * Eval("jumlah") %></div>
                                    <asp:Label ID="id_barang" Text='<%# Eval("id") %>' runat="server" Visible="false"></asp:Label>

                                </div>
                                <div class="card-body" style="text-align: right">
                                    <asp:LinkButton ID="Button2" CommandName="hapus" runat="server" class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm">
                                        <i class="fas fa-trash"></i>
                                    </asp:LinkButton>
                                    <div>
                                        <asp:LinkButton ID="Button3" CommandName="kurang" runat="server" class="d-none d-sm-inline-block btn btn-sm shadow-sm" Style="font-weight: bold; font-size: 20px; width: 30px;" Text="-">
                                        </asp:LinkButton>
                                        <asp:Label ID="Label1" runat="server" Style="width: 60px; display: inline-block; text-align: center;" Text='<%#Eval("jumlah") %>'></asp:Label>
                                        <asp:LinkButton ID="Button4" CommandName="tambah" runat="server" class="d-none d-sm-inline-block btn btn-sm shadow-sm" Style="font-weight: bold; font-size: 20px; width: 30px;" Text="+" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="col-lg-6" style="flex: none; width: 30%;">

            <!-- Default Card Example -->
            <div class="card mb-4">
                <div class="card-header">
                    Pembayaran
                </div>
                <div class="card-body">
                    <i class="fas fa-map-marker-alt"></i>Alamat Penerima
                    <asp:TextBox ID="TextBox1" class="form-control form-control-user" placeholder="Alamat" runat="server"></asp:TextBox>
                    <div class="card-body" style="padding-left:0;">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            Total Harga
                        </div>
                        <asp:Label ID="total" runat="server" class="h5 mb-0 font-weight-bold text-gray-800" Text="Rp. 0"></asp:Label>
                    </div>
                    <asp:LinkButton ID="Button1" runat="server" Text="Bayar" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" Style="width: 100%" OnClick="Button1_Click" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>

