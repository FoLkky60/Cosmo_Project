Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services
Imports System.Web.Script.Services


Public Class FromQeations
    Inherits System.Web.UI.Page

    Private Shared ReadOnly connStr As String =
        "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"

    Public Class AnswerItem
        Public Property id As Integer?
        Public Property [section] As String
        Public Property [group] As String
        Public Property question As String
        Public Property answer As String
        Public Property note As String
        Public Property supplierId As Integer
        Public Property headId As Integer
        Public Property detailId As Integer
        Public Property tlsId As Integer

    End Class

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("pousr") IsNot Nothing Then
                hfUid.Value = Session("pousr").ToString()
            Else
                ' ถ้าไม่มี session ให้ redirect กลับไปหน้า login
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub


    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function SaveAll(items As List(Of AnswerItem)) As Object
        If items Is Nothing OrElse items.Count = 0 Then
            Return New With {.ok = False, .message = "ไม่พบข้อมูลส่งมา"}
        End If

        ' ตัวอย่าง: ดึงข้อมูลจากตาราง
        Dim results As New List(Of Dictionary(Of String, Object))()
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim sql As String = "SELECT TOP (1000) [ID],[SupplierId],[HeadId],[DetailId],[TlsID],[AnsYes],[AnsNo],[AnsInApposit],[Remark],[AA] " &
                                "FROM [SupplyChain].[dbo].[PSR_T_TlsQuestionnaire]"
            Using cmd As New SqlCommand(sql, conn)
                Using rdr As SqlDataReader = cmd.ExecuteReader()
                    While rdr.Read()
                        Dim row As New Dictionary(Of String, Object)()
                        For i As Integer = 0 To rdr.FieldCount - 1
                            row(rdr.GetName(i)) = rdr(i)
                        Next
                        results.Add(row)
                    End While
                End Using
            End Using
        End Using


        Return New With {
            .ok = True,
            .count = items.Count,
            .data = results
        }
    End Function


    <WebMethod(EnableSession:=True)>
    Public Shared Function Ping() As Object
        Return New With {
        .isAuth = HttpContext.Current.User.Identity.IsAuthenticated,
        .user = HttpContext.Current.User.Identity.Name,
        .sess = TryCast(HttpContext.Current.Session("pousr"), String)
    }
    End Function

End Class
