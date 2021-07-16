
Imports System.Data
Imports System.Data.SqlClient

Partial Class Toko
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
        If Session("id_pengguna") IsNot Nothing Then
            fill()
        Else
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Private Sub fill()
        cmd = New SqlCommand("select * from barang where id_pengguna=" & Integer.Parse(Session("id_pengguna").ToString) & "", con)
        sda = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()

        sda.Fill(ds)
        DataList1.DataSource = ds
        DataList1.DataBind()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        con.Open()
        cmd.CommandText = "update pengguna set nama_toko = '" & nama.Text & "' where nama_user = '" & Session("nama_pengguna") & "'"
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        con.Close()
        Session("nama_toko") = nama.Text
        Response.Redirect("Toko.aspx")
    End Sub


    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs)
        Dim l As Label = e.Item.FindControl("id_barang")
        Session("id_barang") = l.Text
        If e.CommandName = "Detail" Then
            Response.Redirect("DetailBarang.aspx")
        ElseIf e.CommandName = "Delete" Then
            con.Open()
            cmd.CommandText = "delete from barang where id=" & l.Text
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("Toko.aspx")
        Else
            Response.Redirect("formEdit.aspx")
        End If
    End Sub
End Class
