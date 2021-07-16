<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DetailBarang.aspx.vb" Inherits="DetailBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="card" style="margin: 30px; width: 70%">
            <div class="card-header">
                Detail Barang
            </div>
            <div class="card-body">
                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="row">
                            <image src="img/<%# Eval("gambar") %>" style="width: 450px; height: 450px;"></image>
                            <div class="card-body">
                                <div class="card-body" style="height: 200px; display: grid; align-items: center; border-bottom: 1px solid">
                                    <div class="text-lg font-weight-bold text-primary text-uppercase mb-1" style="font-size: 30px;">
                                        <%# Eval("nama") %>
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">Rp. <%# Eval("harga") %></div>
                                </div>
                                <div class="text-lg font-weight-bold text-uppercase mb-1"">Deskripsi Barang</div>
                                <div class="card-body" style="height: 200px; height: 200px;">
                                    <div class="h6 mb-0 font-weight-bold text-gray-800" style="width: 350px;">
                                        <ul>
                                            <li><%# Eval("Deskripsi") %></li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div class="card mb-4" style="margin: 30px 15px 0 0; width: 23%; height: 300px;">
            <div class="card-header">
                Tambah ke Keranjang
            </div>
            <div class="card-body">
                        <div class="card-body" style="    padding: 0 0 0 1.25rem;">
                            <div class="text-md font-weight-bold text-primary text-uppercase mb-1">
                                Jumlah
                                <asp:TextBox ID="TextBox2" class="form-control form-control-user" runat="server" Style="width: 60px;text-align: right; display: inline-block;" OnTextChanged="TextBox2_TextChanged" TextMode="Number" Text="1"></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="text-md font-weight-bold text-primary text-uppercase mb-1">
                                Total Harga
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <asp:Label ID="Label1" runat="server" Text="Total"></asp:Label></div>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Tambahkan ke Keranjang" class="d-none d-sm-inline-block btn btn-md btn-primary shadow-sm" Style="width: 100%" OnClick="Button1_Click"/>
                    
            </div>
        </div>
    </div>
</asp:Content>

