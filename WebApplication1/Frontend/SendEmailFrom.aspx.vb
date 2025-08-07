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
        Dim filePath As String = "../FileUpload/" & fuFile.FileName

        ' Save the file
        fuFile.SaveAs(Server.MapPath(filePath))

        ' Insert into PSR_M_MailFormat table and get the MailID
        Dim mailID As Integer = 0
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("INSERT INTO PSR_M_MailFormat (Type_Mail, Year, Subject, Body, Status, CreatedDate, CreatedBy) VALUES (@Type_Mail, @Year, @Subject, @Body, @Status, GETDATE(), @CreatedBy); SELECT SCOPE_IDENTITY();", conn)
            cmd.Parameters.AddWithValue("@Type_Mail", 1)
            cmd.Parameters.AddWithValue("@Year", DateTime.Now.Year)
            cmd.Parameters.AddWithValue("@Subject", subject)
            cmd.Parameters.AddWithValue("@Body", body)
            cmd.Parameters.AddWithValue("@Status", "Pending")
            cmd.Parameters.AddWithValue("@CreatedBy", "admin")

            mailID = Convert.ToInt32(cmd.ExecuteScalar())  ' Retrieve the generated MailID
        End Using

        ' Insert the attachment with the MailID
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("INSERT INTO PSR_M_MailAttachments (MailID, Folder_name, File_name, Files_link, CreatedDate, CreatedBy, UpdatedDate, UpdatedBy) VALUES (@MailID, @Folder_name, @File_name, @Files_link, GETDATE(), @CreatedBy, GETDATE(), @UpdatedBy)", conn)
            cmd.Parameters.AddWithValue("@MailID", mailID)
            cmd.Parameters.AddWithValue("@Folder_name", "SampleFolder")  ' You can set folder name as per your requirements
            cmd.Parameters.AddWithValue("@File_name", fuFile.FileName)
            cmd.Parameters.AddWithValue("@Files_link", filePath)
            cmd.Parameters.AddWithValue("@CreatedBy", "admin")
            cmd.Parameters.AddWithValue("@UpdatedBy", "admin")
            cmd.ExecuteNonQuery()
        End Using

        ' Clear the fields after sending the email
        txtRecipient.Text = ""
        txtSubject.Text = ""
        txtBody.Text = ""

        ' Trigger success message popup
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showPopup", "showSuccessPopup();resetForm();", True)
    End Sub
End Class
