Imports System.Data  
Imports Microsoft.VisualBasic
Imports DevExpress.Web
Imports System.Data.SqlClient

Public Class clsConnDbSQL

    Public Shared connectionString As String = ConfigurationManager.ConnectionStrings("SupplyChain").ConnectionString
    Dim ConDbStr As SqlConnection
    Dim myCommand As SqlCommand
    Dim dr As SqlDataReader
    Dim da As SqlDataAdapter
    Dim ds As New DataSet 
    Dim rtn As String = ""
    Dim qry As String = ""

    Public Sub ConnDb()
        ConDbStr = New SqlConnection(connectionString)
        ConDbStr.Open()
        myCommand = New SqlCommand("", ConDbStr)
    End Sub
   Public Function GetCallDataTable(ByVal QueryString As String) As DataTable
        Dim objConn As SqlConnection = New SqlConnection()
        objConn.ConnectionString = connectionString
        objConn.Open()
        Dim dr As SqlDataAdapter = New SqlDataAdapter(QueryString, objConn)
        Dim dt As DataTable = New DataTable()
        dr.Fill(dt)
        Return dt
        dr = Nothing 
        objConn.Close()
        objConn.Dispose()
    End Function
    Public Function mQryReturnDr(ByVal qry As String) As SqlDataReader
        Dim ConDbStr As New SqlConnection(connectionString)
        Dim myCommand As SqlCommand
        Dim dr As SqlDataReader

        ConDbStr.Open()
        myCommand = New SqlCommand("", ConDbStr)
        myCommand.CommandText = qry
        dr = myCommand.ExecuteReader()
        Return dr

    End Function
     Public Sub mqryNoReturn(ByVal qry As String)

        ConnDb()

        myCommand = New SqlCommand("", ConDbStr)
        myCommand.CommandText = qry
        dr = myCommand.ExecuteReader()
        dr = Nothing
        myCommand.Dispose()
        ConDbStr.Close()
        ConDbStr.Dispose()

    End Sub

    Public Function mqryReturn(ByVal qry As String) As String
        ConnDb()
        'ConDbStr.Open()
        myCommand = New SqlCommand("", ConDbStr)
        myCommand.CommandText = qry
        dr = myCommand.ExecuteReader()
        While dr.Read
            rtn = dr(0).ToString
        End While
        dr = Nothing
        myCommand.Dispose()
        ConDbStr.Close()
        ConDbStr.Dispose()
        Return rtn

    End Function
    Public Function mGetData(ByVal qry As String) As String
        ConnDb()

        Dim rtn As String = ""
        myCommand.CommandText = qry
        dr = myCommand.ExecuteReader()
        While dr.Read
            rtn = dr(0).ToString
        End While
        ConDbStr.Close()
        Return rtn
    End Function
    Public Sub mQryReturn2(ByVal qry As String)
        ConDbStr.Open()
        '    myCommand = New SqlCommand("", ConDbStr)
        myCommand.CommandText = qry
        dr = myCommand.ExecuteReader()
        ConDbStr.Close()
    End Sub

    Public Sub selDDL(ByVal qry As String, ByVal tbName As String, ByVal ddl As DropDownList)

        Dim ConDbStr As New SqlConnection(connectionString)
        Dim i As Integer = 1

        ConDbStr.Open()
        mycommand = New SqlCommand(tbName, ConDbStr)
        mycommand.CommandText = qry
        dr = mycommand.ExecuteReader()
        ddl.Items.Clear()
        ddl.Items.Add("---All---")
        ddl.Items(0).Value = ("---All---")
        While dr.Read
            ddl.Items.Add(dr(0).ToString)
            ddl.Items(i).Value = dr(1).ToString
            i += 1
        End While
        dr = Nothing
        mycommand.Dispose()
        ConDbStr.Close()
        ConDbStr.Dispose()

    End Sub

    Public Function chkwords(ByVal datasign As String) As String
        Dim wordsign As String() = {"บริษัท", "ห้างหุ้นส่วนจำกัด"}
        Dim i As Integer = 0
        For i = 0 To UBound(wordsign)
            datasign = Replace(datasign, wordsign(i), "")
        Next
        Return datasign
    End Function

    Public Sub LstBox(ByVal qry As String, ByVal tbName As String, ByVal lstb As ListBox)

        Dim ConDbStr As New SqlConnection(connectionString)
        Dim i As Integer = 1

        ConDbStr.Open()
        mycommand = New SqlCommand(tbName, ConDbStr)
        mycommand.CommandText = qry
        dr = mycommand.ExecuteReader()
        lstb.Items.Clear()
        Dim Item As ListItem = New ListItem()

        While dr.Read

            lstb.DataTextField = dr("fldSeriesname")
            lstb.DataValueField = dr("fldSeriesID")
            lstb.Items.Add(dr(0).ToString)
            i += 1

        End While
        dr = Nothing
        mycommand.Dispose()
        ConDbStr.Close()
        ConDbStr.Dispose()

    End Sub

    Public Sub LstBoxNew(ByVal qry As String, ByVal tbName As String, ByVal lstb As ListBox)

        Dim ConDbStr As New SqlConnection(connectionString)
        Dim i As Integer = 1

        ConDbStr.Open()
        mycommand = New SqlCommand(tbName, ConDbStr)
        mycommand.CommandText = qry
        dr = mycommand.ExecuteReader()
        lstb.Items.Clear()
        Dim Item As ListItem = New ListItem()
        While dr.Read
            lstb.DataTextField = dr(0).ToString
            lstb.DataValueField = dr(1).ToString
            lstb.Items.Add(dr(0).ToString)
        End While
        dr = Nothing
        mycommand.Dispose()
        ConDbStr.Close()
        ConDbStr.Dispose()

    End Sub

    Public Sub loadgrd(ByVal sql As String, ByVal TableName As String, ByVal grd As GridView)

        Dim ConDbStr As New SqlConnection(connectionString)
        ConDbStr.Open()
        Dim qry As String = " " & sql & " "

        da = New SqlDataAdapter(qry, ConDbStr)
        da.Fill(ds, TableName)
        grd.DataSource = ds.Tables(TableName)
        grd.DataBind()
        ConDbStr.Close()
        ConDbStr.Dispose()
        da.Dispose()
        ds.Dispose()
    End Sub
    'Public Sub LoadGrdDev(ByVal sql As String, ByVal TableName As String, ByVal grd As ASPxGridView)
    '     Dim ConDbStr As New SqlConnection(connectionString)
    '     Dim da As SqlDataAdapter
    '     Dim ds As New System.Data.DataSet
    '     ConDbStr.Open()
    '     Dim qry As String = sql
    '     da = New SqlDataAdapter(qry, ConDbStr)
    '     da.Fill(ds, TableName)
    '     grd.DataSource = ds.Tables(TableName)
    '     grd.DataBind()
    '     ConDbStr.Close()
    '     ConDbStr.Dispose()
    '     da.Dispose()
    '     ds.Dispose()
    ' End Sub
    Public Function GetDataSet(ByVal sql As String, ByVal TableName As String) As Object

        Dim ConDbStr As New SqlConnection(connectionString)
        ConDbStr.Open()
        qry = " " & sql & " "
        da = New SqlDataAdapter(qry, ConDbStr)
        da.Fill(ds, TableName)
        Return ds

    End Function

    Public Sub loadDetails(ByVal sql As String, ByVal TableName As String, ByVal dv As DetailsView)

        Dim ConDbStr As New SqlConnection(connectionString)
        ConDbStr.Open()
        Dim qry As String = " " & sql & " "

        da = New SqlDataAdapter(qry, ConDbStr)
        da.Fill(ds, TableName)
        dv.DataSource = ds.Tables(TableName)
        dv.DataBind()
        ConDbStr.Close()
        ConDbStr.Dispose()
        da.Dispose()
        ds.Dispose()
    End Sub

    Public Sub loadFormView(ByVal sql As String, ByVal TableName As String, ByVal FV As FormView)

        Dim ConDbStr As New SqlConnection(connectionString)
        ConDbStr.Open()
        Dim qry As String = " " & sql & " "
        da = New SqlDataAdapter(qry, ConDbStr)
        da.Fill(ds, TableName)
        FV.DataSource = ds.Tables(TableName)
        FV.DataBind()
        ConDbStr.Close()
        ConDbStr.Dispose()
        da.Dispose()
        ds.Dispose()
    End Sub

    Public Sub loadRep(ByVal sql As String, ByVal TableName As String, ByVal rep As Repeater, ByVal PageNumber As String)

        Dim ConDbStr As New SqlConnection(connectionString)
        ConDbStr.Open()
        Dim myTable As New DataTable()

        Dim pgitems As New PagedDataSource()
        Dim dv As New DataView(myTable)
        pgitems.DataSource = dv
        pgitems.AllowPaging = True
        pgitems.PageSize = 5 ' Sets the number of records to display per page
        pgitems.CurrentPageIndex = 1
        If pgitems.PageCount > 1 Then
            rep.Visible = True
            Dim pages As New ArrayList()
            For i As Integer = 0 To pgitems.PageCount - 1
                pages.Add((i + 1).ToString())
            Next i
            rep.DataSource = pages
            rep.DataBind()
        Else
            rep.Visible = False
        End If
        rep.DataSource = pgitems
        rep.DataBind()
        ConDbStr.Close()
        ConDbStr.Dispose()

    End Sub

    Public Function GetDataReader() As SqlDataReader
        Return dr
    End Function

End Class
