
Imports System.Data
Imports System.Data.SqlClient

Partial Class CariBarang
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
        If Session("nama_barang") IsNot Nothing Then
            fill()
            judul.Text = Session("nama_barang").ToString
        Else
            Response.Redirect("Index.aspx")
        End If
    End Sub

    Private Sub fill()
        cmd = New SqlCommand("select * from barang where nama LIKE '%" & Session("nama_barang").ToString & "%'", con)
        sda = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()

        sda.Fill(ds)
        DataList1.DataSource = ds
        DataList1.DataBind()
    End Sub

    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs)
        If e.CommandName = "Detail" Then
            Dim l As Label = e.Item.FindControl("id_barang")
            Session("id_barang") = l.Text
            Response.Redirect("DetailBarang.aspx")
        End If
    End Sub
End Class
