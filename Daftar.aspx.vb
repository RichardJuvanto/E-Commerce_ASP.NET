Imports System.Data
Imports System.Data.SqlClient
Imports System

Partial Class Daftar
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        con.Open()
        cmd.CommandText = "insert into pengguna (nama_user,no_hp,password) values('" & nama.Text & "','" & no_hp.Text & "','" & password.Text & "')"
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        con.Close()
        Response.Redirect("Login.aspx")
    End Sub
End Class
