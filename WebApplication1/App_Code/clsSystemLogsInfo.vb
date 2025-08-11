Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class ClsSystemLogsInfo

#Region "Private Variables"

    Private m_ID As String
    Private m_UserName As String
    Private m_EventType As String
    Private m_Event As String
    Private m_EventDate As String
    Private m_ModuleName As String
    Private m_FunctionName As String
    Private m_IPaddress As String

#End Region

#Region "Constructor"

    Sub New()
        Reset()
    End Sub

    Public Sub Reset()

        m_ID = ""
        m_UserName = ""
        m_EventType = ""
        m_Event = ""
        m_EventDate = ""
        m_ModuleName = ""
        m_FunctionName = ""
        m_IPaddress = ""

    End Sub

#End Region

#Region "Property"

    Public Property id() As String
        Get
            Return m_ID
        End Get
        Set(ByVal value As String)
            m_ID = value
        End Set
    End Property

    Public Property UserName() As String
        Get
            Return m_UserName
        End Get
        Set(ByVal value As String)
            m_UserName = value
        End Set
    End Property

    Public Property EventType() As String
        Get
            Return m_EventType
        End Get
        Set(ByVal value As String)
            m_EventType = value
        End Set
    End Property

    Public Property sEvent() As String
        Get
            Return m_Event
        End Get
        Set(ByVal value As String)
            m_Event = value
        End Set
    End Property

    Public Property EventDate() As Date
        Get
            Return m_EventDate
        End Get
        Set(ByVal value As Date)
            m_EventDate = value
        End Set
    End Property

    Public Property ModuleName() As String
        Get
            Return m_ModuleName
        End Get
        Set(ByVal value As String)
            m_ModuleName = value
        End Set
    End Property

    Public Property FunctionName() As String
        Get
            Return m_FunctionName
        End Get
        Set(ByVal value As String)
            m_FunctionName = value
        End Set
    End Property

    Public Property IPAddress() As String
        Get
            Return m_IPaddress
        End Get
        Set(ByVal value As String)
            m_IPaddress = value
        End Set
    End Property

#End Region

#Region "Method"
    Public Function Find(ByVal nid As String) As ClsSystemLogsInfo

        Find = Find_("id = '" & nid & "'")

    End Function

    Public Function Find_(ByVal sCondition As String) As ClsSystemLogsInfo

        Dim objcon As New clsConnDbSQL
        Dim qry As String

        qry = " SELECT [ID] " & vbCrLf
        qry += "       ,[UserName] " & vbCrLf
        qry += "       ,[EventType] " & vbCrLf
        qry += "       ,[Event] " & vbCrLf
        qry += "       ,Convert(nvarchar,Dateadd(year,543,[EventDate]),103) AS [EventDate] " & vbCrLf
        qry += "       ,[ModuleName] " & vbCrLf
        qry += "       ,[FunctionName] " & vbCrLf
        qry += "       ,[IPAddress]" & vbCrLf
        qry += "   FROM [PSR_SystemLogs] " & vbCrLf

        qry += " where " & sCondition

        Find_ = New ClsSystemLogsInfo


        objcon.mqryReturn(qry)
        Dim reader As SqlDataReader = objcon.GetDataReader()

        While reader.Read
            Find_.m_ID = reader("ID")
            Find_.m_UserName = reader("UserName")
            Find_.m_EventType = reader("EventType")
            Find_.m_Event = reader("Event")
            Find_.m_EventDate = reader("EventDate")
            Find_.m_ModuleName = reader("ModuleName")
            Find_.m_FunctionName = reader("FunctionName")
            Find_.m_IPaddress = reader("IPAddress")
        End While


    End Function



#End Region

#Region "Script SqlCmd"

    Public Function SqlCmd_Select(ByRef objLogsInfo As ClsSystemLogsInfo) As String

        Dim qry As String = ""

        qry = " SELECT [ID] " & vbCrLf
        qry += "       ,ROW_NUMBER() over(order by id ) AS NO " & vbCrLf
        qry += "       ,[UserName] " & vbCrLf
        qry += "       ,[EventType] " & vbCrLf
        qry += "       ,[Event] " & vbCrLf
        qry += "       ,[EventDate] " & vbCrLf
        qry += "       ,[ModuleName] " & vbCrLf
        qry += "       ,[FunctionName] " & vbCrLf
        qry += "       ,[IPAddress]" & vbCrLf
        qry += "   FROM [PSR_SystemLogs] " & vbCrLf

        Return qry

    End Function

    Public Function SqlCmd_Insert(ByRef objLogsInfo As ClsSystemLogsInfo) As String

        Dim qry As String = ""

        qry = " INSERT INTO [PSR_SystemLogs] " & vbCrLf
        qry += "            ([UserName] " & vbCrLf
        qry += "            ,[EventType] " & vbCrLf
        qry += "            ,[Event] " & vbCrLf
        qry += "            ,[EventDate] " & vbCrLf
        qry += "            ,[ModuleName] " & vbCrLf
        qry += "            ,[FunctionName]" & vbCrLf
        qry += "            ,[IPAddress]" & vbCrLf
        qry += "            ) " & vbCrLf
        qry += "      VALUES " & vbCrLf
        qry += "            ( " & vbCrLf
        qry += "            '" & objLogsInfo.UserName & "'--<UserName, nvarchar(50),> " & vbCrLf
        qry += "            ,'" & objLogsInfo.EventType & "'--<EventType, nvarchar(100),> " & vbCrLf
        qry += "            ,'" & objLogsInfo.sEvent & "'--<Event, nvarchar(max),> " & vbCrLf
        qry += "            ,GETDATE()--<EventDate, datetime,> " & vbCrLf
        qry += "            ,'" & objLogsInfo.ModuleName & "'--<ModuleName, nvarchar(100),> " & vbCrLf
        qry += "            ,'" & objLogsInfo.FunctionName & "'--<FunctionName, nvarchar(100),> " & vbCrLf
        qry += "            ,'" & objLogsInfo.IPAddress & "'--<IPAddress, nvarchar(50),> " & vbCrLf
        qry += "            ) " & vbCrLf

        Return qry

    End Function

    Public Function SqlCmd_Update(ByRef objLogsInfo As ClsSystemLogsInfo) As String

        Dim qry As String = ""

        qry = " UPDATE [PSR_SystemLogs] " & vbCrLf
        qry += "    SET [UserName] = '" & objLogsInfo.UserName & "'--<UserName, nvarchar(50),> " & vbCrLf
        qry += "       ,[EventType] = '" & objLogsInfo.EventType & "'--<EventType, nvarchar(100),> " & vbCrLf
        qry += "       ,[Event] = '" & objLogsInfo.sEvent & "'--<Event, nvarchar(max),> " & vbCrLf
        qry += "       ,[EventDate] = '" & objLogsInfo.EventDate & "'--<EventDate, datetime,> " & vbCrLf
        qry += "       ,[ModuleName] = '" & objLogsInfo.ModuleName & "'--<ModuleName, nvarchar(100),> " & vbCrLf
        qry += "       ,[FunctionName] = '" & objLogsInfo.FunctionName & "'--<FunctionName, nvarchar(100),> " & vbCrLf
        qry += "       ,[IPAddress] = '" & objLogsInfo.IPAddress & "'--<IPAddress, nvarchar(50),> " & vbCrLf
        qry += "  WHERE  " & vbCrLf
        qry += " 	ID = '" & objLogsInfo.id & "' " & vbCrLf

        Return qry

    End Function

    Public Function SqlCmd_Delete(ByRef objLogsInfo As ClsSystemLogsInfo) As String

        Dim qry As String = ""

        qry = " DELETE FROM [PSR_SystemLogs] WHERE id ='" & objLogsInfo.id & "' " & vbCrLf

        Return qry

    End Function

#End Region


    Public Sub SaveLogs(ByVal objLogs As ClsSystemLogsInfo)

        Dim objMyconM As New clsConnDbSQL

        Try
            objMyconM.mqryNoReturn(SqlCmd_Insert(objLogs))
            mMsg("Completed...")
        Catch ex As Exception
            mMsg(ex.ToString)
        End Try

    End Sub 'SaveLogs


    Public Sub mMsg(ByVal Message As String)

        Dim page As Page = HttpContext.Current.CurrentHandler
        Dim strScript As String = "<script language='javascript'>alert(\'" + Message + "\');</script>"
        ScriptManager.RegisterStartupScript(page, page.GetType(), "PopupCP", strScript, False)

    End Sub 'แสดงข้อมูล


    Public Function GetIPAddress() As String

        Dim context As System.Web.HttpContext = System.Web.HttpContext.Current()
        Dim sIPAddress As String = context.Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If String.IsNullOrEmpty(sIPAddress) Then
            Return context.Request.ServerVariables("REMOTE_ADDR")
        Else
            Dim ipArray As String() = sIPAddress.Split(New [Char]() {","c})
            Return ipArray(0)
        End If

    End Function 'Get IPaddress

End Class
