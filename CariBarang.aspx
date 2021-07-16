<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CariBarang.aspx.vb" Inherits="CariBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row" style="padding-top: 30px; justify-content:center;">
        <div class="card shadow mb-4" style="min-width: 70%">
            <div class="card-header py-3">
                <asp:Label ID="judul" runat="server" class="h6 m-0 font-weight-bold text-primary"></asp:Label>
            </div>
            <div class="card-body">
                <div class="row">
                    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
                        <itemtemplate>
                            <asp:LinkButton class="btn card mb-4" CommandName="Detail" style="width: 250px; margin: 0 10px 0 10px;" runat="server">
                                <div class="card-header" style="background-color: white">
                                    <img src="img/<%# Eval("gambar") %>" style="width: 200px; height: 200px;"/>
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

