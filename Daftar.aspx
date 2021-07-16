<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Daftar.aspx.vb" Inherits="Daftar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
        <div class="container">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Buat Akun Baru</h1>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="nama" class="form-control form-control-user" placeholder="Nama" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="no_hp" class="form-control form-control-user" placeholder="No. HP" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="password" class="form-control form-control-user" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                <asp:Button ID="Button1" class="btn btn-primary btn-user btn-block" runat="server" Text="Daftar Akun" />
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="Login.aspx">Sudah Punya Akun? Masuk</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

