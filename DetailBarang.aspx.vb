
Imports System.Data
Imports System.Data.SqlClient

Partial Class DetailBarang
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter
    Dim ds As DataSet = New DataSet()
    Dim dt As DataTable = New DataTable()
    Dim i As Integer
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
        fill()
    End Sub

    Private Sub fill()
        cmd = New SqlCommand("select * from barang where id=" & Integer.Parse(Session("id_barang")).ToString & "", con)
        sda = New SqlDataAdapter(cmd)

        sda.Fill(ds)
        sda.Fill(dt)
        DataList1.DataSource = ds
        DataList1.DataBind()

        i = Integer.Parse(TextBox2.Text)

        Label1.Text = dt.Rows(0).Item(4) * i
    End Sub


    Protected Sub TextBox2_TextChanged(sender As Object, e As EventArgs)
        i = TextBox2.Text
        Label1.Text = dt.Rows(0).Item(4) * i
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        If Session("nama_pengguna") IsNot Nothing Then
            con.Open()
            cmd.CommandText = "insert into keranjang (id_user, id_barang, jumlah) values(" & Integer.Parse(Session("id_pengguna").ToString) & "," & Integer.Parse(Session("id_barang").ToString) & "," & Integer.Parse(TextBox2.Text) & ")"
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("Keranjang.aspx")
        Else
            Response.Redirect("Login.aspx")
        End If

    End Sub
End Class
