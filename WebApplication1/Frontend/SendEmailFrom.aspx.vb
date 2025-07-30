Imports System.Net
Imports System.Net.Mail

Public Class SendEmailFrom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' คุณสามารถใส่โค้ดเพิ่มเติมที่ต้องการให้ทำงานในหน้าเว็บเมื่อโหลด
    End Sub

    ' ฟังก์ชันส่งอีเมล
    Public Function SendEmail(ByVal recipient As String, ByVal subject As String, ByVal message As String) As Boolean
        Try
            ' กำหนดอีเมลผู้ส่งเป็นของคุณ
            Dim senderEmail As String = "your-email@example.com"

            ' สร้าง MailMessage
            Dim mail As New MailMessage()
            mail.From = New MailAddress(senderEmail) ' อีเมลผู้ส่งที่ฟิกไว้
            mail.To.Add(recipient) ' รับอีเมลผู้รับจากฟอร์ม
            mail.Subject = subject
            mail.Body = message

            ' ตั้งค่า SMTP Server
            Dim smtpServer As New SmtpClient("smtp.example.com")
            smtpServer.Port = 587
            smtpServer.Credentials = New NetworkCredential(senderEmail, "your-email-password") ' ใช้อีเมลผู้ส่งและรหัสผ่านของคุณ
            smtpServer.EnableSsl = True

            ' ส่งอีเมล
            smtpServer.Send(mail)
            Return True
        Catch ex As Exception
            ' บันทึกข้อผิดพลาด
            Console.WriteLine("Error: " & ex.Message)
            Return False
        End Try
    End Function

    ' ฟังก์ชันคลิกปุ่มส่งอีเมล
    Protected Sub SendEmailButton_Click(sender As Object, e As EventArgs)
        ' รับค่าจากฟอร์ม
        Dim recipient As String = recipient.Value
        Dim subject As String = subject.Value
        Dim message As String = message.Value

        ' เรียกฟังก์ชันส่งอีเมล
        Dim emailSender As New SendEmailFrom()
        Dim result As Boolean = emailSender.SendEmail(recipient, subject, message)

        ' แสดงผลลัพธ์
        If result Then
            Response.Write("Email sent successfully!")
        Else
            Response.Write("Error sending email.")
        End If
    End Sub
End Class
