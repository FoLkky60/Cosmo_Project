Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail
Imports System.IO

Public Class MonitorTLS
    Inherits System.Web.UI.Page
    Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"


    Public Property GridViewMail As Object

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindMailFormatGrid()


            ddlSearchType.SelectedIndex = 0
            ddlSearchMailID.SelectedIndex = 0
            'ddlSearchMail.SelectedIndex = 0
            ddlSearchYear.SelectedIndex = 0

            BindDropdowns()
        End If
    End Sub

    Private Function GetRealData() As DataTable

        Dim dt As New DataTable()
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("
                SELECT MailID, Type_Mail, Year, Subject, Body, Status, 
                       ApprovedBy, ApprovedDate, CreatedDate, CreatedBy, 
                       UpdatedDate, UpdatedBy 
                FROM PSR_M_MailFormat", conn)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
        End Using
        Return dt
    End Function

    Public Sub LoadTb()
        Dim dt As DataTable = GetRealData()
        GridViewMailFormat.DataSource = dt
        GridViewMailFormat.DataBind()
    End Sub
    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridViewMailFormat.PageIndex = e.NewPageIndex
        LoadTb() ' หรือ BindMailFormatGrid()
    End Sub

    Private Sub BindMailFormatGrid()
        Dim dt As New DataTable()
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("SELECT TOP 1000 MailID, Type_Mail, Year, Subject, Body, Status, ApprovedBy, ApprovedDate, CreatedDate, CreatedBy, UpdatedDate, UpdatedBy FROM PSR_M_MailFormat", conn)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
        End Using
        GridViewMailFormat.DataSource = dt
        GridViewMailFormat.DataBind()
    End Sub




    Private Sub LoadMailDetails(mailID As Integer)
        Using conn As New SqlConnection(connStr)
            conn.Open()

            ' Load Mail content
            Dim cmdMail As New SqlCommand("SELECT Subject, Body FROM PSR_M_MailFormat WHERE MailID = @MailID", conn)
            cmdMail.Parameters.AddWithValue("@MailID", mailID)
            Dim reader = cmdMail.ExecuteReader()
            If reader.Read() Then
                txtSubject.Text = reader("Subject").ToString()
                txtBody.Text = reader("Body").ToString()
                hdnMailID.Value = mailID.ToString()
                Dim body As String = reader("Body").ToString()
                litBody.Text = Server.HtmlDecode(body)
            End If
            reader.Close()

            ' Load Attachments based on MailID
            Dim dtAttach As New DataTable()
            Dim cmdAttach As New SqlCommand("SELECT File_name AS FileName, Files_link AS FileLink FROM PSR_M_MailAttachments WHERE MailID = @MailID", conn)
            cmdAttach.Parameters.AddWithValue("@MailID", mailID)
            Dim da As New SqlDataAdapter(cmdAttach)
            da.Fill(dtAttach)

            ' Add FileSize column (mocked)
            dtAttach.Columns.Add("FileSize")
            For Each row As DataRow In dtAttach.Rows
                row("FileSize") = "2.4 MB"
            Next

            rptAttachments.DataSource = dtAttach
            rptAttachments.DataBind()
        End Using
    End Sub

    Protected Sub GridViewMailFormat_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "ViewMail" Then
            Dim mailId As Integer = Convert.ToInt32(e.CommandArgument)
            LoadMailDetails(mailId)
            pnlPopup.Visible = True
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showEditPopup", "openPopupEdit();", True)
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim mailId As Integer = Convert.ToInt32(hdnMailID.Value)
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("UPDATE PSR_M_MailFormat SET Subject=@Subject, Body=@Body, UpdatedDate=GETDATE() WHERE MailID=@MailID", conn)
            cmd.Parameters.AddWithValue("@Subject", txtSubject.Text)
            cmd.Parameters.AddWithValue("@Body", txtBody.Text)
            cmd.Parameters.AddWithValue("@MailID", mailId)
            cmd.ExecuteNonQuery()
        End Using
        pnlPopup.Visible = False
        BindMailFormatGrid()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "closeEditPopup", "closeEditPopup();", True)
    End Sub

    Protected Sub btnClose_Click(sender As Object, e As EventArgs)
        pnlPopup.Visible = False
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "closeEditPopup", "closeEditPopup();", True)
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
        Dim mailId As Integer = Convert.ToInt32(hdnMailID.Value)
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("DELETE FROM PSR_M_MailFormat WHERE MailID = @MailID", conn)
            cmd.Parameters.AddWithValue("@MailID", mailId)
            cmd.ExecuteNonQuery()
        End Using
        pnlPopup.Visible = False
        BindMailFormatGrid()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "closeEditPopup", "closeEditPopup();", True)
    End Sub

    Protected Sub btnSendMail_Click(sender As Object, e As EventArgs)
        Dim btn As Button = DirectCast(sender, Button)
        Dim mailId As Integer = Convert.ToInt32(btn.CommandArgument)
        Dim subject As String = ""
        Dim body As String = ""
        Dim attachments As New List(Of String)()
        Dim recipient As String = "sendmailt53@gmail.com"

        Using conn As New SqlConnection(connStr)
            conn.Open()

            Dim cmd As New SqlCommand("SELECT Subject, Body FROM PSR_M_MailFormat WHERE MailID = @MailID", conn)
            cmd.Parameters.AddWithValue("@MailID", mailId)

            Dim reader As SqlDataReader = cmd.ExecuteReader()
            If reader.Read() Then
                subject = reader("Subject").ToString()
                body = reader("Body").ToString()
            End If
            reader.Close()

            Dim cmdAttachments As New SqlCommand("SELECT Files_link FROM PSR_M_MailAttachments WHERE MailID = @MailID", conn)
            cmdAttachments.Parameters.AddWithValue("@MailID", mailId)
            Dim attachmentReader As SqlDataReader = cmdAttachments.ExecuteReader()

            While attachmentReader.Read()
                attachments.Add(attachmentReader("Files_link").ToString())
            End While
            attachmentReader.Close()
        End Using

        Try
            Dim mail As New MailMessage()
            mail.From = New MailAddress("phachara975@gmail.com")
            mail.To.Add(recipient)
            mail.Subject = subject
            mail.Body = body
            mail.IsBodyHtml = True

            For Each attachmentPath As String In attachments
                If File.Exists(attachmentPath) Then
                    mail.Attachments.Add(New Attachment(attachmentPath))
                Else
                    Throw New Exception("File not found: " & attachmentPath)
                End If
            Next

            Dim smtp As New SmtpClient("smtp.gmail.com")
            smtp.Port = 587
            smtp.EnableSsl = True
            smtp.Credentials = New NetworkCredential("phachara975@gmail.com", "nomg sznr hyjr nrum")

            smtp.Send(mail)

            BindMailFormatGrid()

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Email sent successfully!');", True)

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Error sending email: " & ex.Message & "');", True)
        End Try
    End Sub



    Private Sub BindDropdowns()
        ' ตั้งค่า DropDownList สำหรับ Type_Mail
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("SELECT DISTINCT Type_Mail FROM [SupplyChain].[dbo].[PSR_M_MailFormat]", conn)
            Dim reader As SqlDataReader = cmd.ExecuteReader()

            ddlSearchType.Items.Clear()
            ddlSearchType.Items.Add(New ListItem("All Type", ""))

            While reader.Read()
                ddlSearchType.Items.Add(New ListItem(reader("Type_Mail").ToString(), reader("Type_Mail").ToString()))
            End While

            reader.Close()
        End Using

        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("SELECT MailID FROM [SupplyChain].[dbo].[PSR_M_MailFormat]", conn)
            Dim reader As SqlDataReader = cmd.ExecuteReader()

            ddlSearchMailID.Items.Clear()
            ddlSearchMailID.Items.Add(New ListItem("All ID", ""))

            While reader.Read()
                ddlSearchMailID.Items.Add(New ListItem(reader("MailID").ToString(), reader("MailID").ToString()))
            End While

            reader.Close()
        End Using

        ' ตั้งค่า DropDownList สำหรับ MailID
        'Using conn As New SqlConnection(connStr)
        '    conn.Open()
        '    Dim cmd As New SqlCommand("SELECT MailID, Subject FROM [SupplyChain].[dbo].[PSR_M_MailFormat]", conn)
        '    Dim reader As SqlDataReader = cmd.ExecuteReader()
        '    ddlSearchMail.DataSource = reader
        '    ddlSearchMail.DataTextField = "Subject"  ' แสดง Subject
        '    ddlSearchMail.DataValueField = "MailID"  ' ค่า Value คือ MailID
        '    ddlSearchMail.DataBind()
        '    reader.Close()
        'End Using

        ' ตั้งค่า DropDownList สำหรับ Year
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("SELECT DISTINCT Year FROM [SupplyChain].[dbo].[PSR_M_MailFormat]", conn)
            Dim reader As SqlDataReader = cmd.ExecuteReader()


            ddlSearchYear.Items.Clear()
            ddlSearchYear.Items.Add(New ListItem("All Year", ""))

            While reader.Read()
                ddlSearchYear.Items.Add(New ListItem(reader("Year").ToString(), reader("Year").ToString()))
            End While

            reader.Close()
        End Using
    End Sub


    Protected Sub ddlSearch_SelectedIndexChanged(sender As Object, e As EventArgs)
        ' รับค่าจาก DropDownList
        Dim searchType As String = ddlSearchType.SelectedValue
        Dim searchMailID As String = ddlSearchMailID.SelectedValue
        Dim searchYear As String = ddlSearchYear.SelectedValue
        Dim searchStatus As String = ddlSearchStatus.SelectedValue

        ' เก็บค่าการค้นหาใน Session
        Session("SearchType") = searchType
        Session("SearchMailID") = searchMailID
        Session("SearchYear") = searchYear
        Session("SearchStatus") = searchStatus

        ' เรียกใช้ฟังก์ชันเพื่อโหลดข้อมูลที่กรอง
        LoadSearchResults()
    End Sub



    Protected Sub btnClear_Click(sender As Object, e As EventArgs)
        ' รีเซ็ตค่า DropDownList เป็นค่า "All"
        ddlSearchType.SelectedIndex = 0
        ddlSearchMailID.SelectedIndex = 0
        ddlSearchStatus.SelectedIndex = 0
        ddlSearchYear.SelectedIndex = 0

        ' รีเซ็ตค่าใน Session
        Session("SearchType") = String.Empty
        Session("SearchMailID") = String.Empty
        Session("SearchYear") = String.Empty
        Session("SearchStatus") = String.Empty

        ' โหลดข้อมูลทั้งหมดโดยไม่กรอง
        LoadSearchResults()
    End Sub



    Private Sub LoadSearchResults()
        Dim dt As New DataTable()

        ' อ่านค่าการค้นหาจาก Session
        Dim searchType As String = If(Session("SearchType") IsNot Nothing, Session("SearchType").ToString(), String.Empty)
        Dim searchMailID As String = If(Session("SearchMailID") IsNot Nothing, Session("SearchMailID").ToString(), String.Empty)
        Dim searchYear As String = If(Session("SearchYear") IsNot Nothing, Session("SearchYear").ToString(), String.Empty)
        Dim searchStatus As String = If(Session("SearchStatus") IsNot Nothing, Session("SearchStatus").ToString(), String.Empty)

        Using conn As New SqlConnection(connStr)
            conn.Open()

            ' คำสั่ง SQL สำหรับการค้นหาจากคอลัมน์ที่มีในตาราง
            Dim cmd As New SqlCommand("SELECT TOP 1000 MailID, Type_Mail, Year, Subject, Body, Status, ApprovedBy, ApprovedDate, CreatedDate, CreatedBy, UpdatedDate, UpdatedBy
                                  FROM [SupplyChain].[dbo].[PSR_M_MailFormat]
                                  WHERE (Type_Mail LIKE @Type OR @Type = '')
                                  AND (MailID = @MailID OR @MailID = '')
                                  AND (Year LIKE @Year OR @Year = '')
                                  AND (Status LIKE @Status OR @Status = '')", conn)

            cmd.Parameters.AddWithValue("@Type", "%" & searchType & "%")
            cmd.Parameters.AddWithValue("@MailID", searchMailID)
            cmd.Parameters.AddWithValue("@Year", "%" & searchYear & "%")
            cmd.Parameters.AddWithValue("@Status", "%" & searchStatus & "%")

            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
        End Using

        GridViewMailFormat.DataSource = dt
        GridViewMailFormat.DataBind()
    End Sub








End Class
