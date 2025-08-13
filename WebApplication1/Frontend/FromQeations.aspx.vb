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
                Dim userName As String = Session("pousr").ToString() ' ดึงชื่อผู้ใช้จาก Session

                ' สร้างตัวแปรสำหรับ Supplierid
                Dim supplierId As String = String.Empty

                ' สร้าง SQL Query เพื่อค้นหา Supplierid
                Dim qry As String = "SELECT Supplierid FROM PSR_M_User WHERE Usrname = @username"

                ' ดึงข้อมูลจากฐานข้อมูล
                Using conn As New SqlConnection(connStr)
                    conn.Open()
                    Using cmd As New SqlCommand(qry, conn)
                        cmd.Parameters.AddWithValue("@username", userName)
                        Dim result As Object = cmd.ExecuteScalar() ' ดึงค่า Supplierid
                        If result IsNot Nothing Then
                            supplierId = result.ToString() ' เก็บค่า Supplierid ที่ได้
                        End If
                    End Using
                End Using

                ' ตรวจสอบว่า Supplierid ถูกดึงมาได้หรือไม่
                If String.IsNullOrEmpty(supplierId) Then
                    lblSupplierId.InnerText = "No Supplier ID found for this user."
                Else
                    ' เก็บ Supplierid ใน Session เพื่อใช้ในหน้าอื่น ๆ
                    Session("Supplierid") = supplierId

                    ' แสดงผล Supplierid ที่ได้จากฐานข้อมูล
                    lblSupplierId.InnerText = "Supplier ID: " & supplierId ' ใช้ Label หรือ Control อื่น ๆ เพื่อแสดงผล
                End If
            Else
                ' ถ้าไม่มี Session("pousr"), ให้ redirect ไปหน้า Login
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
