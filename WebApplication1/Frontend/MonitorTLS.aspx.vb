Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Public Class MonitorTLS
    Inherits System.Web.UI.Page
    Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadTb()
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

    Private Sub BindMailGrid()
        Dim dt As New DataTable()
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("SELECT MailID, Subject FROM PSR_M_MailFormat ORDER BY MailID DESC", conn)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
        End Using
        GridViewMail.DataSource = dt
        GridViewMail.DataBind()
    End Sub

    Protected Sub GridViewMail_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "ViewMail" Then
            Dim mailID As Integer = Convert.ToInt32(e.CommandArgument)
            LoadMailDetails(mailID)
            pnlPopup.Visible = True
        End If
    End Sub

    Private Sub LoadMailDetails(mailID As Integer)
        Using conn As New SqlConnection(connStr)
            conn.Open()

            ' Load Mail content
            Dim cmdMail As New SqlCommand("SELECT Subject, Body FROM PSR_M_MailFormat WHERE MailID = @MailID", conn)
            cmdMail.Parameters.AddWithValue("@MailID", mailID)
            Dim reader = cmdMail.ExecuteReader()
            If reader.Read() Then
                lblSubject.Text = reader("Subject").ToString()
                lblBody.Text = reader("Body").ToString().Replace(vbCrLf, "<br>")
            End If
            reader.Close()

            ' Load Attachments
            Dim dtAttach As New DataTable()
            Dim cmdAttach As New SqlCommand("SELECT File_name AS FileName FROM PSR_M_MailAttachments WHERE MailID = @MailID", conn)
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

    Protected Sub btnClose_Click(sender As Object, e As EventArgs)
        pnlPopup.Visible = False
    End Sub
    'Public Sub PopulateBuyerDropdown(dt As DataTable)
    '    DropDownList1.Items.Clear()
    '    DropDownList1.Items.Add(New ListItem("All", "All"))

    '    Dim buyerNames = dt.AsEnumerable().
    '                      Select(Function(row) row.Field(Of String)("Buyer")).
    '                      Where(Function(name) Not String.IsNullOrEmpty(name)).
    '                      Distinct()

    '    For Each buyerName As String In buyerNames
    '        DropDownList1.Items.Add(New ListItem(buyerName, buyerName))
    '    Next
    'End Sub

    'Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
    '    Dim selectedBuyer As String = DropDownList1.SelectedValue
    '    Dim dt As DataTable = GetRealData()

    '    If selectedBuyer <> "All" Then
    '        Dim filteredRows = dt.Select("Buyer = '" & selectedBuyer.Replace("'", "''") & "'")
    '        Dim filteredDt As DataTable = dt.Clone()

    '        For Each row In filteredRows
    '            filteredDt.ImportRow(row)
    '        Next

    '        GridViewMailFormat.DataSource = filteredDt
    '        Session("FilteredData") = filteredDt
    '    Else
    '        GridViewMailFormat.DataSource = dt
    '    End If

    '    GridViewMailFormat.DataBind()
    'End Sub

    'Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
    '    GridViewMailFormat.PageIndex = e.NewPageIndex
    '    LoadTb()
    'End Sub

    'Protected Sub DateFilter_Changed(sender As Object, e As EventArgs)
    '    Dim dateStart As Date
    '    Dim dateEnd As Date

    '    If Date.TryParse(txtDateStart.Text, dateStart) AndAlso Date.TryParse(txtDateEnd.Text, dateEnd) Then
    '        Dim dt As DataTable = GetRealData()

    '        Dim result = dt.AsEnumerable().Where(Function(r)
    '                                                 Dim responseDate As Date
    '                                                 If Date.TryParse(r("ResponseDate").ToString(), responseDate) Then
    '                                                     Return responseDate >= dateStart AndAlso responseDate <= dateEnd
    '                                                 Else
    '                                                     Return False
    '                                                 End If
    '                                             End Function)

    '        If result.Any() Then
    '            GridViewMailFormat.DataSource = result.CopyToDataTable()
    '        Else
    '            GridViewMailFormat.DataSource = Nothing
    '        End If
    '        GridViewMailFormat.DataBind()
    '    End If
    'End Sub

    'Protected Sub txtKeyword_TextChanged(sender As Object, e As EventArgs)
    '    Dim keyword As String = txtKeyword.Text.Trim()
    '    Dim dt As DataTable = GetRealData()
    '    Dim result As IEnumerable(Of DataRow)

    '    If String.IsNullOrEmpty(keyword) Then
    '        GridViewMailFormat.DataSource = dt
    '        GridViewMailFormat.DataBind()
    '        Return
    '    End If

    '    result = dt.AsEnumerable().Where(Function(r) _
    '        r("SupplierId").ToString().ToLower().Contains(keyword.ToLower()) OrElse
    '        r("username").ToString().ToLower().Contains(keyword.ToLower()))

    '    If result.Any() Then
    '        GridViewMailFormat.DataSource = result.CopyToDataTable()
    '    Else
    '        GridViewMailFormat.DataSource = Nothing
    '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('No matching data found.');", True)
    '    End If

    '    GridViewMailFormat.DataBind()
    'End Sub

    'Protected Sub btnClear_Click(sender As Object, e As EventArgs)
    '    txtKeyword.Text = ""
    '    DropDownList1.SelectedValue = "All"
    '    txtDateStart.Text = ""
    '    txtDateEnd.Text = ""
    '    GridViewMailFormat.PageIndex = 0
    '    LoadTb()
    'End Sub
End Class
