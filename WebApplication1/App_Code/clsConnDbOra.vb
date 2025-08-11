Imports System.Data
'Imports System.Data.OracleClient
Imports Oracle.DataAccess.Client

Public Class clsConnDbOra

    Public Shared connStringOra As String = ConfigurationManager.ConnectionStrings("dbserver").ConnectionString
    Dim ConDbOracleStr As OracleConnection
    Dim cmd As OracleCommand
    Dim drOra As Oracle.DataAccess.Client.OracleDataReader
    Dim daOra As OracleDataAdapter
    Dim dsOra As New DataSet
    Dim rtnOra As String = ""
    Dim qryOra As String = ""

    Public Sub ConnDb()
        ConDbOracleStr = New OracleConnection(connStringOra)
        ConDbOracleStr.Open()
        cmd = New OracleCommand("", ConDbOracleStr)
    End Sub
    Public Function GetCallDataTable(ByVal QueryString As String) As DataTable
        Dim objConn = New OracleConnection()
        objConn.ConnectionString = connStringOra
        objConn.Open()
        Dim dr As OracleDataAdapter = New OracleDataAdapter(QueryString, objConn)
        Dim dt As DataTable = New DataTable()
        dr.Fill(dt)
        Return dt
        objConn.Close()
        objConn.Dispose()
    End Function
    Public Function GetCallDataTable(ByVal QueryString As String, ByVal parameters As OracleParameter()) As DataTable

        Dim objConn As OracleConnection = Nothing
        Dim dr As OracleDataAdapter = Nothing
        Dim dt As New DataTable()

        Try
            objConn = New OracleConnection()
            objConn.ConnectionString = connStringOra
            objConn.Open()

            Dim objCmd As New OracleCommand(QueryString, objConn)
            objCmd.CommandType = CommandType.Text

            ' Add parameters to the command
            objCmd.Parameters.AddRange(parameters)

            dr = New OracleDataAdapter(objCmd)

            ' Fill the DataTable with the result set
            dr.Fill(dt)
        Catch ex As Exception

        Finally
            If objConn IsNot Nothing Then
                ' Clean up
                objConn.Close()
                objConn.Dispose()
            End If
        End Try

        Return dt
    End Function
    Public Function mQryReturnDr(ByVal qry As String) As OracleDataReader
        Dim ConDbStr As New OracleConnection(connStringOra)
        Dim myCommand As OracleCommand
        Dim dr As OracleDataReader

        ConDbStr.Open()
        myCommand = New OracleCommand("", ConDbStr)
        myCommand.CommandText = qry
        dr = myCommand.ExecuteReader()

        Return dr

    End Function
    Public Sub mqryNoReturn(ByVal qry As String)

        ConnDb()

        cmd = New OracleCommand("", ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub

    ' Comment by Nirun/Kla on 25/07/2019 Due to found some error on caller fuction.
    'Public Function mqryReturn(ByVal qry As String) As String
    '    ConnDb()
    '    ConDbOracleStr.Open()

    '    cmd = New OracleCommand("", ConDbOracleStr)

    '    cmd.CommandText = qry
    '    drOra = cmd.ExecuteReader()
    '    While drOra.Read
    '        rtnOra = drOra(0).ToString
    '    End While
    '    drOra = Nothing
    '    cmd.Dispose()
    '    ConDbOracleStr.Close()
    '    ConDbOracleStr.Dispose()
    '    Return rtnOra

    'End Function

    'Revised by  Nirun/Kla on 25/07/2019 ********************
    Public Function mqryReturn(ByVal qry As String) As String
        rtnOra = ""

        ConDbOracleStr = New OracleConnection(connStringOra)
        ConDbOracleStr.Open()

        cmd = New OracleCommand("", ConDbOracleStr)

        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        While drOra.Read
            rtnOra = drOra(0).ToString
        End While
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()
        Return rtnOra

    End Function
    'End Revised by  Nirun/Kla on 25/07/2019 ********************


    Public Sub selDDL(ByVal qry As String, ByVal tbName As String, ByVal ddl As DropDownList)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand(tbName, ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        ddl.Items.Clear()
        ddl.Items.Add("---All---")
        ddl.Items(0).Value = ("---All---")
        While drOra.Read
            ddl.Items.Add(drOra(0).ToString)
            ddl.Items(i).Value = drOra(1).ToString
            i += 1
        End While
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub

    Public Sub selDDL2(ByVal qry As String, ByVal tbName As String, ByVal ddl As DropDownList)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand("", ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        ddl.Items.Clear()
        ddl.Items.Add("--- ALL ---")
        ddl.Items(0).Value = ("--- ALL ---")
        While drOra.Read
            ddl.Items.Add(drOra(0).ToString)
            ddl.Items(i).Value = drOra(0).ToString
            i += 1
        End While
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub
    Public Sub selDDL3(ByVal qry As String, ByVal tbName As String, ByVal ddl As DropDownList)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand("", ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        ddl.Items.Clear()
        ddl.Items.Add("--- YY/WEEK ---")
        ddl.Items(0).Value = ("--- YY/WEEK ---")
        While drOra.Read
            ddl.Items.Add(drOra(0).ToString)
            ddl.Items(i).Value = drOra(0).ToString
            i += 1
        End While
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub
    Public Sub selDDL4(ByVal qry As String, ByVal tbName As String, ByVal ddl As DevExpress.Web.ASPxComboBox)
        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand("", ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()

        ddl.Items.Clear()
        ddl.Items.Add(New DevExpress.Web.ListEditItem("--- YY/WEEK ---", "--- YY/WEEK ---")) ' เพิ่มค่าหัวข้อ

        While drOra.Read()
            ddl.Items.Add(New DevExpress.Web.ListEditItem(drOra(0).ToString(), drOra(0).ToString()))
            i += 1
        End While

        drOra.Close()
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()
    End Sub
    Public Sub selDDL1(ByVal qry As String, ByVal tbName As String, ByVal ddl As DropDownList)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)

        Dim i As Integer = 1
        Dim t As String = ""
        ConDbOracleStr.Open()
        cmd = New OracleCommand(tbName, ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        ddl.Items.Clear()
        ddl.Items.Add("---All---")
        ddl.Items(0).Value = ("---All---")
        While drOra.Read
            If drOra(0).ToString.Contains("บริษัทจำกัด") = True Then
                ddl.Items.Add(chkwords(drOra(0).ToString) + Left(drOra(0).ToString, 6))
                ddl.Items(i).Value = drOra(1).ToString
            ElseIf drOra(0).ToString.Contains("ห้างหุ้นส่วนจำกัด") = True Then
                ddl.Items.Add(chkwords(drOra(0).ToString) + Left(drOra(0).ToString, 17))
                ddl.Items(i).Value = drOra(1).ToString
            Else
                t = drOra(0).ToString
            End If

            i += 1
        End While
        drOra = Nothing

        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub
    Public Sub selDDL5(ByVal qry As String, ByVal tbName As String, ByVal ddl As DropDownList)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand("", ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        ddl.Items.Clear()
        ddl.Items.Add("--- ALL ---")
        ddl.Items(0).Value = ("0")
        While drOra.Read
            ddl.Items.Add(drOra(0).ToString)
            ddl.Items(i).Value = drOra(1).ToString
            i += 1
        End While
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub

    Public Sub selDDL6(ByVal qry As String, ByVal tbName As String, ByVal ddl As DevExpress.Web.ASPxComboBox)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand("", ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()


        'ddl.Items.Add("*", "0")

        If drOra.HasRows Then
            ddl.Items.Clear()
            While drOra.Read()
                ddl.Items.Add(drOra(0).ToString(), drOra(1).ToString())
                i += 1
            End While

        End If

        drOra.Close()
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub
    Public Sub selDDL_Custname(ByVal qry As String, ByVal tbName As String, ByVal ddl As DevExpress.Web.ASPxComboBox)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand("", ConDbOracleStr)
        cmd.CommandText = " SELECT custinitialname CustName ,min(custcount) custcount FROM cid_customers WHERE cid_customers.ar_code <> '000000' GROUP BY custinitialname ORDER BY custinitialname "
        drOra = cmd.ExecuteReader()

        ddl.Items.Clear()
        'ddl.Items.Add("*", "0")

        While drOra.Read()
            ddl.Items.Add(drOra(0).ToString(), drOra(1).ToString())
            i += 1
        End While

        drOra.Close()
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub

    Public Sub ddl(ByVal qry As String, ByVal tbName As String, ByVal ddl As DropDownList)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 0

        ConDbOracleStr.Open()
        cmd = New OracleCommand(tbName, ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        ddl.Items.Clear()
        While drOra.Read
            ddl.Items.Add(drOra(0).ToString)
            ddl.Items(i).Value = drOra(1).ToString
            i += 1
        End While
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub

    Public Function chkwords(ByVal daOratasign As String) As String
        Dim wordsign As String() = {"บริษัท", "ห้างหุ้นส่วนจำกัด"}
        Dim i As Integer = 0
        For i = 0 To UBound(wordsign)
            daOratasign = Replace(daOratasign, wordsign(i), "")
        Next
        Return daOratasign
    End Function

    Public Sub LstBox(ByVal qry As String, ByVal tbName As String, ByVal lstb As ListBox)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand(tbName, ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        lstb.Items.Clear()
        Dim Item As ListItem = New ListItem()

        While drOra.Read

            lstb.DataTextField = drOra("fldSeriesname")
            lstb.DataValueField = drOra("fldSeriesID")
            lstb.Items.Add(drOra(0).ToString)
            i += 1


        End While
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub

    Public Sub LstBoxNew(ByVal qry As String, ByVal tbName As String, ByVal lstb As ListBox)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        Dim i As Integer = 1

        ConDbOracleStr.Open()
        cmd = New OracleCommand(tbName, ConDbOracleStr)
        cmd.CommandText = qry
        drOra = cmd.ExecuteReader()
        lstb.Items.Clear()
        Dim Item As ListItem = New ListItem()
        While drOra.Read
            lstb.DataTextField = drOra(0).ToString
            lstb.DataValueField = drOra(1).ToString
            lstb.Items.Add(drOra(0).ToString)
        End While
        drOra = Nothing
        cmd.Dispose()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub

    Public Sub loadgrd(ByVal sql As String, ByVal TableName As String, ByVal grd As GridView)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        ConDbOracleStr.Open()
        Dim qry As String = " " & sql & " "

        daOra = New OracleDataAdapter(qry, ConDbOracleStr)
        daOra.Fill(dsOra, TableName)
        grd.DataSource = dsOra.Tables(TableName)
        grd.DataBind()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()
        daOra.Dispose()
        dsOra.Dispose()

    End Sub

    Public Function GetdaOrataSet(ByVal sql As String, ByVal TableName As String) As Object

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        ConDbOracleStr.Open()
        qryOra = " " & sql & " "
        daOra = New OracleDataAdapter(qryOra, ConDbOracleStr)
        daOra.Fill(dsOra, TableName)
        Return dsOra

    End Function

    Public Sub loadDetails(ByVal sql As String, ByVal TableName As String, ByVal dv As DetailsView)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        ConDbOracleStr.Open()
        Dim qry As String = " " & sql & " "

        daOra = New OracleDataAdapter(qry, connStringOra)
        daOra.Fill(dsOra, TableName)
        dv.DataSource = dsOra.Tables(TableName)
        dv.DataBind()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()
        daOra.Dispose()
        dsOra.Dispose()

    End Sub

    Public Sub loadFormView(ByVal sql As String, ByVal TableName As String, ByVal FV As FormView)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        ConDbOracleStr.Open()
        Dim qry As String = " " & sql & " "
        daOra = New OracleDataAdapter(qry, connStringOra)
        daOra.Fill(dsOra, TableName)
        FV.DataSource = dsOra.Tables(TableName)
        FV.DataBind()
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()
        daOra.Dispose()
        dsOra.Dispose()

    End Sub

    Public Sub loadRep(ByVal sql As String, ByVal TableName As String, ByVal rep As Repeater, ByVal PageNumber As String)

        Dim ConDbOracleStr As New OracleConnection(connStringOra)
        ConDbOracleStr.Open()
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
        ConDbOracleStr.Close()
        ConDbOracleStr.Dispose()

    End Sub

    Public Sub keepLog(ByVal uname As String, ByVal ip As String, ByVal action As String)

        Dim hName As String = ""
        Dim host As System.Net.IPHostEntry = New System.Net.IPHostEntry()
        host = System.Net.Dns.GetHostEntry(HttpContext.Current.Request.ServerVariables("REMOTE_HOST"))

        If (host.HostName.Contains(".")) Then

            Dim sSplit() As String = host.HostName.Split(".")

            hName = sSplit(0).ToString()

        Else

            hName = host.HostName.ToString()
        End If

        Dim str As String

        If ip.Contains("::1") <> True Then
            str = "insert into tbllog(username,action,ip,pc_name) values ( "
            str += "'" & uname & "', "
            str += "'" & action & "', "
            str += "'" & ip & "' , '" & System.Net.Dns.GetHostEntry(HttpContext.Current.Request.ServerVariables("remote_addrOra")).HostName & "' "
            str += ")"
            mqryNoReturn(str)
        End If

    End Sub
    Public Sub SaveLog(ByVal events As String, ByVal username As String)
        Dim str, ipAddress, hostName, detail As String
        Dim context As System.Web.HttpContext = System.Web.HttpContext.Current()

        Try
            ipAddress = GetIPAddress() ' IP Address

            Dim ipAddress2 As String = System.Net.Dns.GetHostByName(System.Net.Dns.GetHostName()).AddressList(0).ToString()
            Dim host = System.Net.Dns.GetHostEntry(HttpContext.Current.Request.ServerVariables("REMOTE_HOST"))
            hostName = host.HostName 'System.Net.Dns.GetHostName() ' ชื่อเครื่อง
        Catch ex As Exception
            detail = ex.Message
        End Try


        str = " INSERT INTO CID_MSS_WEB_LOG ( IPADDRESS, HOSTNAME, EVENT, DETAIL, USERLOGIN ) VALUES ("
        str += "'" & ipAddress & "', "
        str += "'" & hostName & "', "
        str += "'" & events & "', "
        str += "'" & detail & "', "
        str += "'" & username & "' )"

        mqryNoReturn(str)



    End Sub

    Private Function GetClientIpAddress() As String


        Dim host As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName())

        For Each ip As System.Net.IPAddress In host.AddressList
            If ip.AddressFamily = System.Net.Sockets.AddressFamily.InterNetwork Then
                Return ip.ToString()
            End If
        Next

        Return host.ToString()

    End Function

    Public Function GetIPAddress() As String
        Try
            Dim context As System.Web.HttpContext = System.Web.HttpContext.Current()
            Dim sIPAddress As String = context.Request.ServerVariables("HTTP_X_FORWARDED_FOR") ' HTTP_X_FORWARDED_FOR
            If String.IsNullOrEmpty(sIPAddress) Then
                Return context.Request.ServerVariables("REMOTE_HOST")
            Else
                Dim ipArray As String() = sIPAddress.Split(New [Char]() {","c})
                Return ipArray(0)
            End If
        Catch ex As Exception
            Return ""
        End Try


    End Function 'Get IPaddress
End Class
