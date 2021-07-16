
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("nama_pengguna") IsNot Nothing Then
            labelNama.Text = Session("nama_pengguna").ToString
        End If
    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Session.Abandon()
        Response.Redirect("Login.aspx")
    End Sub
    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Session("kategori") = "Makanan"
        Response.Redirect("Barang.aspx")
    End Sub


    Protected Sub Button5_Click(sender As Object, e As EventArgs)
        Session("kategori") = "Elektronik"
        Response.Redirect("Barang.aspx")
    End Sub

    Protected Sub Unnamed_Click(sender As Object, e As EventArgs)
        Session("nama_barang") = txtSearch.Text
        Response.Redirect("CariBarang.aspx")
    End Sub
End Class

