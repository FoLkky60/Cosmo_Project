Public Class SummeryTLS
    Inherits System.Web.UI.Page

    Public Function GetMockData() As DataTable
        Dim dt As New DataTable()

        dt.Columns.Add("sNO", GetType(Integer))
        dt.Columns.Add("buyer_name", GetType(String))
        dt.Columns.Add("username", GetType(String))
        dt.Columns.Add("po_sent", GetType(Integer))
        dt.Columns.Add("po_accept", GetType(Integer))
        dt.Columns.Add("po_no_response", GetType(Integer))
        dt.Columns.Add("pr_sent", GetType(Integer))
        dt.Columns.Add("pr_accept", GetType(Integer))
        dt.Columns.Add("eva_sent", GetType(Integer))
        dt.Columns.Add("year", GetType(Integer))

        dt.Rows.Add(1, "John Doe", "johndoe", 10, 5, 3, 7, 8, 4, 2016)
        dt.Rows.Add(2, "Jane Smith", "janesmith", 12, 9, 2, 5, 7, 6, 2016)
        dt.Rows.Add(3, "Sam Brown", "sambrown", 8, 6, 5, 4, 6, 3, 2016)
        dt.Rows.Add(4, "Alice Green", "alicegreen", 11, 7, 4, 6, 8, 5, 2016)
        dt.Rows.Add(5, "Bob White", "bobwhite", 9, 5, 6, 7, 6, 4, 2016)
        dt.Rows.Add(6, "Charlie Black", "charblack", 10, 6, 5, 5, 7, 6, 2016)
        dt.Rows.Add(7, "Diana Gray", "dianagray", 13, 8, 3, 6, 9, 5, 2016)
        dt.Rows.Add(8, "Ethan Blue", "ethanblue", 7, 4, 4, 5, 5, 3, 2016)
        dt.Rows.Add(9, "Fiona Pink", "fionapink", 11, 9, 2, 7, 6, 4, 2016)
        dt.Rows.Add(10, "George Red", "georgered", 12, 7, 4, 6, 8, 5, 2016)
        dt.Rows.Add(11, "Hannah Gold", "hannahgold", 10, 6, 5, 5, 7, 4, 2016)
        dt.Rows.Add(12, "Ian Silver", "iansilver", 9, 7, 3, 6, 6, 4, 2017)
        dt.Rows.Add(13, "Jill Brown", "jillbrown", 8, 5, 4, 5, 7, 5, 2017)
        dt.Rows.Add(14, "Kevin Gray", "kevingray", 11, 6, 2, 4, 8, 3, 2017)
        dt.Rows.Add(15, "Laura Black", "laurablack", 10, 8, 3, 7, 7, 6, 2017)
        dt.Rows.Add(16, "Mike White", "mikewhite", 12, 7, 5, 6, 9, 5, 2017)
        dt.Rows.Add(17, "Nina Green", "ninagreen", 9, 6, 4, 5, 6, 4, 2018)
        dt.Rows.Add(18, "Oscar Pink", "oscarpink", 8, 5, 3, 4, 7, 3, 2018)
        dt.Rows.Add(19, "Paula Blue", "paulablue", 11, 7, 2, 6, 8, 5, 2018)
        dt.Rows.Add(20, "Quincy Red", "quincyred", 10, 6, 5, 5, 7, 4, 2018)

        Return dt
    End Function

    Public Sub LoadTb(Optional ByVal year As Integer? = Nothing)
        Dim dt As DataTable = GetMockData()

        If year.HasValue Then
            Dim filteredRows = dt.Select("year = " & year.Value)
            Dim filteredDt As New DataTable()
            filteredDt = dt.Clone()

            For Each row In filteredRows
                filteredDt.ImportRow(row)
            Next

            If filteredDt.Rows.Count > 0 Then
                GridView1.DataSource = filteredDt
            Else
                GridView1.DataSource = dt
            End If
        Else
            GridView1.DataSource = dt
        End If

        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        LoadTb()
    End Sub

    Protected Sub txtSearchFrom_TextChanged(sender As Object, e As EventArgs)
        If String.IsNullOrWhiteSpace(txtSearchFrom.Text) Then
            LoadTb()
        Else
            Dim year As Integer
            If Integer.TryParse(txtSearchFrom.Text, year) Then
                LoadTb(year)
            Else
                Response.Write("<script>alert('กรุณากรอกปีเป็นตัวเลขที่ถูกต้อง');</script>")
            End If
        End If
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadTb()
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        LoadTb()
    End Sub

End Class