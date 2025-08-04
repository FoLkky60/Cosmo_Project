
Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Public Class SendEmailFrom
    Inherits System.Web.UI.Page

    Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' ถ้ามี GridView ให้ Bind ที่นี่
            ' BindMailFormatGrid()
        End If
    End Sub

    ' ตัวอย่างฟังก์ชันสำหรับ Bind GridView (ถ้ามี)
    Private Sub BindMailFormatGrid()
        Dim dt As New DataTable()
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("INSERT INTO PSR_M_MailFormat (Type_Mail, Year, Subject, Body, Status, CreatedDate, CreatedBy) VALUES (@Type_Mail, @Year, @Subject, @Body, @Status, GETDATE(), @CreatedBy)", conn)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
        End Using
        ' GridViewMailFormat.DataSource = dt
        ' GridViewMailFormat.DataBind()
    End Sub

    Protected Sub btnSend_Click(sender As Object, e As EventArgs)
        Dim recipient As String = txtRecipient.Text.Trim()
        Dim subject As String = txtSubject.Text.Trim()
        Dim body As String = txtBody.Text.Trim()

        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("INSERT INTO PSR_M_MailFormat (Type_Mail, Year, Subject, Body, Status, CreatedDate, CreatedBy) VALUES (@Type_Mail, @Year, @Subject, @Body, @Status, GETDATE(), @CreatedBy)", conn)
            cmd.Parameters.AddWithValue("@Type_Mail", 1)
            cmd.Parameters.AddWithValue("@Year", DateTime.Now.Year)
            cmd.Parameters.AddWithValue("@Subject", subject)
            cmd.Parameters.AddWithValue("@Body", body)
            cmd.Parameters.AddWithValue("@Status", "Pending")
            cmd.Parameters.AddWithValue("@CreatedBy", "admin")
            cmd.ExecuteNonQuery()
        End Using

        ' ถ้ามี GridView ให้รีเฟรช
        ' BindMailFormatGrid()
        txtRecipient.Text = ""
        txtSubject.Text = ""
        txtBody.Text = ""

        ' แสดง popup สำเร็จ (ใช้ JS หรือ ASP.NET Popup ตามที่คุณมี)
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showPopup", "showSuccessPopup();", True)
    End Sub
End Class