Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Public Class SummeryTLS
    Inherits System.Web.UI.Page
    Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"

    Private Function GetData() As DataTable
        Dim dt As New DataTable()
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmd As New SqlCommand("SELECT TOP (1000) [TlsID], [TlsYear], [Supplierid], [SupplierCode], [DateCreate], 
                                  [Response], [DateResponse], [Buyer], [BuyerName], [ByUsr], [DateUpload], 
                                  [FlagSentEmail], [SentEmailDatetime], [UnitSentEmail], [FlagRead], 
                                  [DateRead], [Remark], [FlagConfirm], [FileDocCommitment], [FlagCompleted], 
                                  [FlagPrint] 
                                  FROM [SupplyChain].[dbo].[PSR_T_Tls]", conn)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
        End Using
        Return dt
    End Function

    Public Sub LoadTb(Optional ByVal year As Integer? = Nothing)
        Dim dt As DataTable = GetData()

        If year.HasValue Then
            Dim filteredRows = dt.Select("TlsYear = " & year.Value)
            Dim filteredDt As New DataTable()
            filteredDt = dt.Clone()

            For Each row In filteredRows
                filteredDt.ImportRow(row)
            Next

            GridView1.DataSource = If(filteredDt.Rows.Count > 0, filteredDt, dt)
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
        txtSearchFrom.Text = ""
    End Sub
End Class
