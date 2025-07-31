Public Class MonitorTLS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadTb()
        End If
    End Sub

    Public Function GetMockData() As DataTable
        Dim dt As New DataTable()

        dt.Columns.Add("EditAction", GetType(String))
        dt.Columns.Add("SupplierId", GetType(String))
        dt.Columns.Add("SendMail", GetType(String))
        dt.Columns.Add("SendAgain", GetType(String))
        dt.Columns.Add("Buyer", GetType(String))
        dt.Columns.Add("CommitmentLetter", GetType(String))
        dt.Columns.Add("Seller", GetType(String))
        dt.Columns.Add("username", GetType(String))
        dt.Columns.Add("TaxpayerAccountNumber", GetType(String))
        dt.Columns.Add("Response", GetType(String))
        dt.Columns.Add("RespondentsSignature", GetType(String))
        dt.Columns.Add("Note", GetType(String))
        dt.Columns.Add("ResponseDate", GetType(String))
        dt.Columns.Add("LastSentDate", GetType(String))
        dt.Columns.Add("PrintAction", GetType(String))
        dt.Columns.Add("ViewAction", GetType(String))

        dt.Rows.Add("Edit", "1001", "Yes", "No", "A", "Yes", "Seller 1", "Bob1", "12345678901", "Response 1", "Signed", "Note 1", "2025-01-01", "2025-01-01", "Print", "View")
        dt.Rows.Add("Edit", "1002", "Yes", "No", "B", "Yes", "Seller 2", "Bob12", "12345678902", "Response 2", "Signed", "Note 2", "2025-02-01", "2025-02-01", "Print", "View")
        dt.Rows.Add("Edit", "1003", "Yes", "No", "C", "Yes", "Seller 3", "Bob12", "12345678903", "Response 3", "Signed", "Note 3", "2025-03-01", "2025-03-01", "Print", "View")
        dt.Rows.Add("Edit", "1004", "Yes", "No", "A", "Yes", "Seller 4", "Bob12", "12345678904", "Response 4", "Signed", "Note 4", "2025-04-01", "2025-04-01", "Print", "View")
        dt.Rows.Add("Edit", "1005", "Yes", "No", "B", "Yes", "Seller 5", "Bob12", "12345678905", "Response 5", "Signed", "Note 5", "2025-05-01", "2025-05-01", "Print", "View")
        dt.Rows.Add("Edit", "1006", "Yes", "No", "C", "Yes", "Seller 6", "Bob12", "12345678906", "Response 6", "Signed", "Note 6", "2025-06-01", "2025-06-01", "Print", "View")
        dt.Rows.Add("Edit", "1007", "Yes", "No", "A", "Yes", "Seller 7", "Bob12", "12345678907", "Response 7", "Signed", "Note 7", "2025-07-01", "2025-07-01", "Print", "View")
        dt.Rows.Add("Edit", "1008", "Yes", "No", "B", "Yes", "Seller 8", "Bob12", "12345678908", "Response 8", "Signed", "Note 8", "2025-08-01", "2025-08-01", "Print", "View")
        dt.Rows.Add("Edit", "1009", "Yes", "No", "C", "Yes", "Seller 9", "Bob12", "12345678909", "Response 9", "Signed", "Note 9", "2025-09-01", "2025-09-01", "Print", "View")
        dt.Rows.Add("Edit", "1010", "Yes", "No", "A", "Yes", "Seller 10", "Bob12", "12345678910", "Response 10", "Signed", "Note 10", "2025-10-01", "2025-10-01", "Print", "View")
        dt.Rows.Add("Edit", "1011", "Yes", "No", "B", "Yes", "Seller 11", "Bob12", "12345678911", "Response 11", "Signed", "Note 11", "2025-11-01", "2025-11-01", "Print", "View")
        dt.Rows.Add("Edit", "1012", "Yes", "No", "C", "Yes", "Seller 12", "Bob12", "12345678912", "Response 12", "Signed", "Note 12", "2025-12-01", "2025-12-01", "Print", "View")
        dt.Rows.Add("Edit", "1013", "Yes", "No", "A", "Yes", "Seller 13", "Bob12", "12345678913", "Response 13", "Signed", "Note 13", "2026-01-01", "2026-01-01", "Print", "View")
        dt.Rows.Add("Edit", "1014", "Yes", "No", "B", "Yes", "Seller 14", "Bob12", "12345678914", "Response 14", "Signed", "Note 14", "2026-02-01", "2026-02-01", "Print", "View")
        dt.Rows.Add("Edit", "1015", "Yes", "No", "C", "Yes", "Seller 15", "Bob12", "12345678915", "Response 15", "Signed", "Note 15", "2026-03-01", "2026-03-01", "Print", "View")
        dt.Rows.Add("Edit", "1016", "Yes", "No", "A", "Yes", "Seller 16", "Bob12", "12345678916", "Response 16", "Signed", "Note 16", "2026-04-01", "2026-04-01", "Print", "View")
        dt.Rows.Add("Edit", "1017", "Yes", "No", "B", "Yes", "Seller 17", "Bob12", "12345678917", "Response 17", "Signed", "Note 17", "2026-05-01", "2026-05-01", "Print", "View")
        dt.Rows.Add("Edit", "1018", "Yes", "No", "C", "Yes", "Seller 18", "Bob12", "12345678918", "Response 18", "Signed", "Note 18", "2026-06-01", "2026-06-01", "Print", "View")
        dt.Rows.Add("Edit", "1019", "Yes", "No", "A", "Yes", "Seller 19", "Bob12", "12345678919", "Response 19", "Signed", "Note 19", "2026-07-01", "2026-07-01", "Print", "View")
        dt.Rows.Add("Edit", "1020", "Yes", "No", "B", "Yes", "Seller 20", "Bob12", "12345678920", "Response 20", "Signed", "Note 20", "2026-08-01", "2026-08-01", "Print", "View")

        Return dt
    End Function

    Public Sub PopulateBuyerDropdown(dt As DataTable)
        DropDownList1.Items.Clear()
        DropDownList1.Items.Add(New ListItem("All", "All"))

        Dim buyerNames = dt.AsEnumerable() _
                          .Select(Function(row) row.Field(Of String)("Buyer")) _
                          .Distinct()

        For Each buyerName As String In buyerNames
            DropDownList1.Items.Add(New ListItem(buyerName, buyerName))
        Next
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim selectedBuyer As String = DropDownList1.SelectedValue
        Dim dt As DataTable = GetMockData()

        If selectedBuyer <> "All" Then
            Dim filteredRows = dt.Select("Buyer = '" & selectedBuyer & "'")
            Dim filteredDt As New DataTable()
            filteredDt = dt.Clone()

            For Each row In filteredRows
                filteredDt.ImportRow(row)
            Next

            GridView1.DataSource = filteredDt
            Session("FilteredData") = filteredDt
        Else
            GridView1.DataSource = dt
        End If

        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        LoadTb()
    End Sub

    Public Sub LoadTb()
        Dim dt As DataTable = GetMockData()
        GridView1.DataSource = dt
        GridView1.DataBind()
        PopulateBuyerDropdown(dt)
    End Sub

    Protected Sub DateFilter_Changed(sender As Object, e As EventArgs)
        Dim dateStart As Date
        Dim dateEnd As Date

        If Date.TryParse(txtDateStart.Text, dateStart) AndAlso Date.TryParse(txtDateEnd.Text, dateEnd) Then
            Dim dt As DataTable = GetMockData()

            Dim result = dt.AsEnumerable().Where(Function(r)
                                                     Dim responseDate As Date
                                                     If Date.TryParse(r("ResponseDate").ToString(), responseDate) Then
                                                         Return responseDate >= dateStart AndAlso responseDate <= dateEnd
                                                     Else
                                                         Return False
                                                     End If
                                                 End Function)

            If result.Any() Then
                GridView1.DataSource = result.CopyToDataTable()
            Else
                GridView1.DataSource = Nothing
            End If
            GridView1.DataBind()
        End If
    End Sub
    Protected Sub txtKeyword_TextChanged(sender As Object, e As EventArgs)
        Dim keyword As String = txtKeyword.Text.Trim()
        Dim dt As DataTable = GetMockData()
        Dim result As IEnumerable(Of DataRow)

        If String.IsNullOrEmpty(keyword) Then
            GridView1.DataSource = dt
            GridView1.DataBind()
            Return
        End If

        result = dt.AsEnumerable().Where(Function(r) _
    r("SupplierId").ToString().ToLower().Contains(keyword.ToLower()) OrElse
    r("username").ToString().ToLower().Contains(keyword.ToLower()))

        If result.Any() Then
            GridView1.DataSource = result.CopyToDataTable()
        Else
            GridView1.DataSource = Nothing
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('No matching data found.');", True)
        End If

        GridView1.DataBind()
    End Sub


    Protected Sub btnClear_Click(sender As Object, e As EventArgs)
        txtKeyword.Text = ""
        DropDownList1.SelectedValue = "All"
        txtDateStart.Text = ""
        txtDateEnd.Text = ""
        GridView1.PageIndex = 0
        Dim dt As DataTable = GetMockData()
        GridView1.DataSource = GetMockData()
        GridView1.DataBind()
    End Sub



    'Protected Sub btnKeywordSearch_Click(sender As Object, e As EventArgs)
    '    Dim searchType As String = ddlSearchType.SelectedValue
    '    Dim keyword As String = txtKeyword.Text.Trim()
    '    Dim dt As DataTable = GetMockData()
    '    Dim result As IEnumerable(Of DataRow)

    '    ' ตรวจสอบค่าว่าง
    '    If String.IsNullOrEmpty(keyword) Then
    '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Please enter a keyword.');", True)
    '        Return
    '    End If

    '    ' ค้นหาตามประเภท
    '    If searchType = "All" Then
    '        result = dt.AsEnumerable().Where(Function(r) _
    '        r("SupplierId").ToString().ToLower().Contains(keyword.ToLower()) OrElse
    '        r("username").ToString().ToLower().Contains(keyword.ToLower()))
    '    Else
    '        result = dt.AsEnumerable().Where(Function(r) _
    '        r(searchType).ToString().ToLower().Contains(keyword.ToLower()))
    '    End If

    '    ' แสดงผลลัพธ์
    '    If result.Any() Then
    '        GridView1.DataSource = result.CopyToDataTable()
    '    Else
    '        GridView1.DataSource = Nothing
    '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('No matching data found.');", True)
    '    End If
    '    GridView1.DataBind()
    'End Sub





End Class