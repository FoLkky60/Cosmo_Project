Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail
Imports System.IO

Public Class SendEmailFrom
    Inherits System.Web.UI.Page

    Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' ถ้ามี GridView ให้ Bind ที่นี่
            ' BindMailFormatGrid()
        End If
    End Sub

    Private Sub BindMailFormatGrid()
        Dim dt As New DataTable()
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("INSERT INTO PSR_M_MailFormat (Type_Mail, Year, Subject, Body, Status, CreatedDate, CreatedBy) VALUES (@Type_Mail, @Year, @Subject, @Body, @Status, GETDATE(), @CreatedBy); SELECT SCOPE_IDENTITY();", conn)
            cmd.Parameters.AddWithValue("@Type_Mail", 1)
            cmd.Parameters.AddWithValue("@Year", DateTime.Now.Year)
            cmd.Parameters.AddWithValue("@Subject", "Sample Subject")  ' Adjust as per your need
            cmd.Parameters.AddWithValue("@Body", "Sample Body")  ' Adjust as per your need
            cmd.Parameters.AddWithValue("@Status", "Pending")
            cmd.Parameters.AddWithValue("@CreatedBy", "admin")

            ' Get the MailID generated
            Dim mailID As Integer = Convert.ToInt32(cmd.ExecuteScalar())
            ' You can use the returned mailID to use in your attachments insert statement
        End Using
    End Sub

    Protected Sub btnSend_Click(sender As Object, e As EventArgs)
        Dim subject As String = txtSubject.Text.Trim()
        Dim body As String = txtBody.Text

        ' Insert ข้อมูลอีเมลและรับ MailID
        Dim mailID As Integer = 0
        Try
            Using conn As New SqlConnection(connStr)
                conn.Open()
                Dim cmd As New SqlCommand("
            INSERT INTO PSR_M_MailFormat
            (Type_Mail, Year, Subject, Body, Status, CreatedDate, CreatedBy)
            VALUES (@Type_Mail, @Year, @Subject, @Body, @Status, GETDATE(), @CreatedBy);
            SELECT SCOPE_IDENTITY();", conn)
                cmd.Parameters.AddWithValue("@Type_Mail", 1)
                cmd.Parameters.AddWithValue("@Year", DateTime.Now.Year)
                cmd.Parameters.AddWithValue("@Subject", subject)
                cmd.Parameters.AddWithValue("@Body", body)
                cmd.Parameters.AddWithValue("@Status", "Pending")
                cmd.Parameters.AddWithValue("@CreatedBy", "admin")
                mailID = Convert.ToInt32(cmd.ExecuteScalar())
            End Using

            ' วนบันทึกไฟล์ทั้งหมด
            For Each postedFile As HttpPostedFile In fuFiles.PostedFiles
                Dim fileName As String = Path.GetFileName(postedFile.FileName)
                Dim savePath As String = Server.MapPath("../FileUpload/" & fileName)
                postedFile.SaveAs(savePath)

                Using conn As New SqlConnection(connStr)
                    conn.Open()
                    Dim cmd As New SqlCommand("
                INSERT INTO PSR_M_MailAttachments
                (MailID, Folder_name, File_name, Files_link, CreatedDate, CreatedBy, UpdatedDate, UpdatedBy)
                VALUES (@MailID, @Folder_name, @File_name, @Files_link, GETDATE(), @CreatedBy, GETDATE(), @UpdatedBy)", conn)
                    cmd.Parameters.AddWithValue("@MailID", mailID)
                    cmd.Parameters.AddWithValue("@Folder_name", "SampleFolder")
                    cmd.Parameters.AddWithValue("@File_name", fileName)
                    cmd.Parameters.AddWithValue("@Files_link", "../FileUpload/" & fileName)
                    cmd.Parameters.AddWithValue("@CreatedBy", "admin")
                    cmd.Parameters.AddWithValue("@UpdatedBy", "admin")
                    cmd.ExecuteNonQuery()
                End Using
            Next

            ' ล้างฟอร์ม
            txtRecipient.Text = ""
            txtSubject.Text = ""
            txtBody.Text = ""

            ' แสดง alert เมื่อส่งอีเมลสำเร็จ
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showSuccessAlert();", True)

        Catch ex As Exception
            ' หากเกิดข้อผิดพลาด, คุณสามารถแสดงข้อความแสดงข้อผิดพลาดที่นี่
            ' เช่น ใช้ alert หรือข้อความ error บนหน้า
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showErrorAlert", "alert('ไม่สามารถส่งอีเมลได้: " & ex.Message & "');", True)
        End Try
    End Sub


End Class
