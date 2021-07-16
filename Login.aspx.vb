Imports System.Data
Imports System.Data.SqlClient
Imports System
Partial Class Login
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        con.Open()
        cmd = New SqlCommand("select * from pengguna where no_hp= '" & no_hp.Text & "' and password='" & password.Text & "'", con)
        sda = New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        sda.Fill(dt)

        If (dt.Rows.Count > 0) Then
            Dim nama As String = dt.Rows(0).Item(1)
            Session("nama_pengguna") = nama
            Session("nama_toko") = dt.Rows(0).Item(2)
            Session("id_pengguna") = dt.Rows(0).Item(0)
            Response.Redirect("Index.aspx")
        End If
        con.Close()

    End Sub
End Class
