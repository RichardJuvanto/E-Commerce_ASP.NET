<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="d-flex justify-content-center" style="width: 100%">
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="width: 50%; height: 45px;">
            <div class="navbar-nav" style="width: 100%; justify-content: space-evenly; align-items: center;">

                <asp:Button ID="Button1" runat="server" Text="Beranda" CssClass="border-bottom-primary" Style="width: 100%; text-align: center; background-color: transparent; border: none" />
                <div class="topbar-divider d-none d-sm-block "></div>
                <% If Session("nama_pengguna") IsNot Nothing Then  %>
                <asp:Button ID="Button2" runat="server" Text="Toko Saya" Style="width: 100%; text-align: center; background-color: transparent; border: none" PostBackUrl="~/Toko.aspx" />
                <%else %>
                <asp:Button ID="Button3" runat="server" Text="Toko Saya" Style="width: 100%; text-align: center; background-color: transparent; border: none" PostBackUrl="~/Login.aspx" />
                <%End If %>
            </div>

        </nav>
    </div>
    <div class="d-flex justify-content-center" style="width: 100%">
        <div class="slider">
            <div class="slides">
                <input type="radio" name="radio-btn" id="radio1" checked />
                <input type="radio" name="radio-btn" id="radio2" />

                <div class="slide first">
                    <img src="img/pict1.jpg" />
                </div>
                <div class="slide">
                    <img src="img/pict2.jpg" />
                </div>

                <div class="navigation-auto">
                    <div class="auto-btn1"></div>
                    <div class="auto-btn2"></div>
                </div>
            </div>
            <div class="navigation-manual">
                <label for="radio1" class="manual-btn"></label>
                <label for="radio2" class="manual-btn"></label>
            </div>
        </div>
    </div>

    <div class="row" style="padding-top: 30px; justify-content:center;">
        <div class="card shadow mb-4" style="min-width: 70%">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Barang Terbaru</h6>
            </div>
            <div class="card-body">
                <div class="row">
                     <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" RepeatColumns="4">
                        <itemtemplate>
                            <asp:LinkButton class="btn card mb-4" CommandName="Detail" style="width: 250px; margin: 0 10px 0 10px;" runat="server">
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
                            
                        </itemtemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

