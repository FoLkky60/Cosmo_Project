Public Class FromMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As EventArgs)

        Session.Abandon()

        Response.Redirect("/loginPage.aspx")
        Console.WriteLine("clear session")

    End Sub
End Class