' filepath: c:\Users\Developer\Desktop\2\Cosmo_Project\WebApplication1\Frontend\SendEmailFrom.aspx.vb
Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Public Class SendEmailFrom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindMailFormatGrid()
        End If
    End Sub

    Private Sub BindMailFormatGrid()
        Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"
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

    ' ...ฟังก์ชัน SendEmail เดิม...
End Class