
Imports System.Data
Imports System.Data.SqlClient

Partial Class Index
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
        fill()
    End Sub

    Private Sub fill()
        cmd = New SqlCommand("select * from barang", con)
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
