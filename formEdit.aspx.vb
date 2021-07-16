
Imports System.Data
Imports System.Data.SqlClient

Partial Class formEdit
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter
    Dim i As Integer = 0

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"

        If Session("id_barang") IsNot Nothing Then
            cmd = New SqlCommand("select * from barang where id=" & Integer.Parse(Session("id_barang").ToString) & "", con)
            sda = New SqlDataAdapter(cmd)
            Dim dt As DataTable = New DataTable()

            sda.Fill(dt)
            ''nama.Text = dt.Rows(0).Item(2)
            ''deskripsi.Text = dt.Rows(0).Item(3)
            ''harga.Text = dt.Rows(0).Item(4)


        Else
                Response.Redirect("Login.aspx")
        End If

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        con.Open()
        cmd.CommandText = "update barang set nama='" & nama.Text & "', deskripsi = '" & deskripsi.Text & "', harga = " & Integer.Parse(harga.Text) & ", id_kategori = " & DropDownList1.SelectedValue & " where Id = " & Integer.Parse(Session("id_barang").ToString)
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        con.Close()
        Response.Redirect("Toko.aspx")
    End Sub
End Class
