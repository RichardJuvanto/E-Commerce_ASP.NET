
Imports System.Data
Imports System.Data.SqlClient

Partial Class Keranjang
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim sda As New SqlDataAdapter

    Dim ttl As Integer = 0
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.ConnectionString = "Data Source=LAPTOP-0QOUFGPT\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;Pooling=False"
        If Session("id_pengguna") IsNot Nothing Then
            fill()
        Else
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Private Sub fill()
        cmd = New SqlCommand("select b.gambar, b.Id, b.nama, b.deskripsi, b.harga, k.jumlah from barang b, keranjang k where b.Id = k.id_barang and k.id_user=" & Integer.Parse(Session("id_pengguna").ToString) & "", con)
        sda = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        Dim dt As DataTable = New DataTable()
        sda.Fill(dt)
        sda.Fill(ds)
        DataList1.DataSource = ds
        DataList1.DataBind()

        Dim size As Integer = dt.Rows.Count
        For i = 0 To size - 1
            ttl += (dt.Rows(i).Item(4) * dt.Rows(i).Item(5))
        Next
        total.Text = "Rp. " & ttl
    End Sub

    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs)
        Dim l As Label = e.Item.FindControl("id_barang")
        If e.CommandName = "kurang" Then
            Dim label1 As Label = e.Item.FindControl("Label1")
            con.Open()
            cmd.CommandText = "update keranjang set jumlah=" & Integer.Parse(label1.Text) - 1 & " where id_barang=" & l.Text & " and id_user = " & Integer.Parse(Session("id_pengguna").ToString)
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("Keranjang.aspx")
        ElseIf e.CommandName = "tambah" Then
            Dim label1 As Label = e.Item.FindControl("Label1")
            con.Open()
            cmd.CommandText = "update keranjang set jumlah=" & Integer.Parse(label1.Text) + 1 & " where id_barang=" & l.Text & " and id_user = " & Integer.Parse(Session("id_pengguna").ToString)
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("Keranjang.aspx")
        Else
            con.Open()
            cmd.CommandText = "delete from keranjang where id_barang=" & l.Text & " and id_user = " & Integer.Parse(Session("id_pengguna").ToString)
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("Keranjang.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        con.Open()
        cmd.CommandText = "insert into histori (id_user, total) values(" & Integer.Parse(Session("id_pengguna").ToString) & "," & ttl & ")"
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        cmd.CommandText = "delete from keranjang where id_user=" & Integer.Parse(Session("id_pengguna").ToString)
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        con.Close()

        Response.Write("<script>alert('Transaksi Anda Berhasil')</script>")
    End Sub
End Class
