
Imports System.Data
Imports System.Data.SqlClient

Partial Class Barang
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
        If Session("kategori") IsNot Nothing Then
            fill()
            judul.Text = Session("kategori").ToString
        Else
            Response.Redirect("Index.aspx")
        End If
    End Sub

    Private Sub fill()
        If Session("kategori") = "Makanan" Then
            cmd = New SqlCommand("select * from barang where id_kategori= 1", con)
        ElseIf Session("kategori") = "Elektronik" Then
            cmd = New SqlCommand("select * from barang where id_kategori= 2", con)
        End If
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
