Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Public Class MonitorTLS
    Inherits System.Web.UI.Page
    Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"


    Public Property GridViewMail As Object

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindMailFormatGrid()
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
                row("FileSize") = "2.4 MB" ' Mocked value, you can calculate it dynamically if needed
            Next

            ' Bind attachments to the Repeater
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


End Class
