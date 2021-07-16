
Imports System.Data.SqlClient

Partial Class formTambah
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter
    Dim id_kategori As Integer
    Dim path As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If (FileUpload1.HasFile) Then
            FileUpload1.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath & "img/" & FileUpload1.FileName)
        End If
        path = FileUpload1.FileName

        con.Open()
        cmd.CommandText = "insert into barang (gambar, nama, deskripsi, harga, id_pengguna, id_kategori ) values('" & path & "','" & nama.Text & "','" & deskripsi.Text & "'," & Integer.Parse(harga.Text) & "," & Integer.Parse(Session("id_pengguna").ToString) & "," & DropDownList1.SelectedValue & ")"
        cmd.Connection = con
        cmd.ExecuteNonQuery()

        con.Close()
        Response.Redirect("Toko.aspx")
    End Sub

End Class
