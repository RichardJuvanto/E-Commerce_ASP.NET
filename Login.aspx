<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Masuk ke Akunmu</h1>
                                    </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="no_hp" class="form-control form-control-user" placeholder="No. HP" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="password" class="form-control form-control-user" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        </div>
                                    <asp:Button ID="Button1" class="btn btn-primary btn-user btn-block" runat="server" Text="Masuk" />
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="Daftar.aspx">Buat Akun Baru!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
</asp:Content>

