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

        ' TODO: ตรงนี้สามารถวน items แล้ว INSERT/UPDATE ลง DB ได้ด้วย connStr เดียวกัน

        Return New With {
            .ok = True,
            .count = items.Count,
            .data = results
        }
    End Function

    <WebMethod(EnableSession:=True)>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function SaveOne(item As AnswerItem) As Object

        If item Is Nothing Then
            Return New With {.ok = False, .message = "ไม่มีข้อมูล"}
        End If

        Dim userName As String = TryCast(HttpContext.Current.Session("pousr"), String)
        If String.IsNullOrEmpty(userName) Then
            ' กลับ 200 + ok=false แทนการ throw
            Return New With {.ok = False, .message = "Session expired"}
        End If

        Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"

        Using conn As New SqlConnection(connStr)
            conn.Open()

            Dim sql As String
            Dim isUpdate As Boolean = item.id.HasValue AndAlso item.id.Value > 0

            If isUpdate Then
                sql = "
                UPDATE PSR_T_TlsQuestionnaire
                SET AnsYes=@yes, AnsNo=@no, AnsInApposit=@na, Remark=@remark, AA=@user
                WHERE ID=@id"
            Else
                sql = "
                INSERT INTO PSR_T_TlsQuestionnaire
                (SupplierId, HeadId, DetailId, TlsID, AnsYes, AnsNo, AnsInApposit, Remark, AA)
                VALUES
                (@supId, @headId, @detailId, @tlsId, @yes, @no, @na, @remark, @user)"
            End If

            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@yes", If(item.answer = "ใช่", 1, 0))
                cmd.Parameters.AddWithValue("@no", If(item.answer = "ไม่ใช่", 1, 0))
                cmd.Parameters.AddWithValue("@na", If(item.answer = "ไม่เกี่ยวข้อง", 1, 0))
                cmd.Parameters.AddWithValue("@remark", If(item.note, CType(DBNull.Value, Object)))
                cmd.Parameters.AddWithValue("@user", userName)

                If isUpdate Then
                    cmd.Parameters.AddWithValue("@id", item.id.Value)
                Else
                    ' *** ต้องแมปค่าพวกนี้มาจากฟรอนต์เอนด์ หรือดึงจากระบบ ***
                    cmd.Parameters.AddWithValue("@supId", item.supplierId)
                    cmd.Parameters.AddWithValue("@headId", item.headId)
                    cmd.Parameters.AddWithValue("@detailId", item.detailId)
                    cmd.Parameters.AddWithValue("@tlsId", item.tlsId)
                End If

                cmd.ExecuteNonQuery()
            End Using
        End Using

        Return New With {.ok = True}
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
