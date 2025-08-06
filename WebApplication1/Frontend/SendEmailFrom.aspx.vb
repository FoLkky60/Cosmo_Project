Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Public Class SendEmailFrom
    Inherits System.Web.UI.Page

    ' กำหนดค่าการเชื่อมต่อกับฐานข้อมูล
    Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"

    ' เมื่อโหลดหน้าแรกจะทำการตรวจสอบว่าเป็นการโหลดครั้งแรกหรือไม่
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' ถ้ามี GridView ให้ Bind ที่นี่
            ' BindMailFormatGrid()
        End If
    End Sub

    ' ฟังก์ชันสำหรับ Bind GridView (ถ้ามี) ที่นี่จะไม่ได้ใช้
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

    ' ฟังก์ชันเมื่อกดปุ่มส่งอีเมล
    Protected Sub btnSend_Click(sender As Object, e As EventArgs)
        ' อ่านค่าจากฟอร์ม
        Dim subject As String = txtSubject.Text.Trim()  ' หัวข้อ
        Dim body As String = txtBody.Text  ' เนื้อหาข้อความที่ได้จาก CKEditor
        Dim filePath As String = "~/FileUpload/" & fuFile.FileName  ' เส้นทางที่เก็บไฟล์ที่อัพโหลด

        ' บันทึกไฟล์ที่อัพโหลดไปยังโฟลเดอร์ FileUpload
        fuFile.SaveAs(Server.MapPath(filePath))

        ' บันทึกข้อมูลอีเมลลงในฐานข้อมูล
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("INSERT INTO PSR_M_MailFormat (Type_Mail, Year, Subject, Body, Status, CreatedDate, CreatedBy) VALUES (@Type_Mail, @Year, @Subject, @Body, @Status, GETDATE(), @CreatedBy)", conn)
            cmd.Parameters.AddWithValue("@Type_Mail", 1)  ' กำหนดประเภทอีเมล
            cmd.Parameters.AddWithValue("@Year", DateTime.Now.Year)  ' ปีปัจจุบัน
            cmd.Parameters.AddWithValue("@Subject", subject)  ' หัวข้อของอีเมล
            cmd.Parameters.AddWithValue("@Body", body)  ' เนื้อหาของอีเมล
            cmd.Parameters.AddWithValue("@Status", "Pending")  ' สถานะเริ่มต้นเป็น Pending
            cmd.Parameters.AddWithValue("@CreatedBy", "admin")  ' ผู้ที่สร้างข้อมูล (ในกรณีนี้คือ admin)
            cmd.Parameters.AddWithValue("@FilePath", filePath)  ' เส้นทางของไฟล์ที่อัพโหลด
            cmd.Parameters.AddWithValue("@FileName", fuFile.FileName)  ' ชื่อไฟล์ที่อัพโหลด
            cmd.ExecuteNonQuery()  ' รันคำสั่ง SQL เพื่อบันทึกข้อมูล
        End Using

        ' ล้างฟอร์มหลังจากส่งข้อมูลเสร็จ
        txtRecipient.Text = ""  ' รีเซ็ตช่องผู้รับ
        txtSubject.Text = ""  ' รีเซ็ตช่องหัวข้อ
        txtBody.Text = ""  ' รีเซ็ตช่องเนื้อหา

        ' แสดงข้อความสำเร็จในการส่ง
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showPopup", "showSuccessPopup();resetForm();", True)
    End Sub
End Class
