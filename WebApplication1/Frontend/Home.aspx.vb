Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim uid As String = TryCast(Session("pousr"), String)
            If String.IsNullOrEmpty(uid) Then
                Response.Redirect("~/Login.aspx")
                Return
            End If
            hfUid.Value = uid
        End If
    End Sub

End Class