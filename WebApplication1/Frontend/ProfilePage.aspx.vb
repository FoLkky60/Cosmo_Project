Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail
Imports System.IO


Public Class ProfilePage

    Inherits System.Web.UI.Page
    Dim connStr As String = "Data Source=VMWEBSERVER;Initial Catalog=SupplyChain;Persist Security Info=True;User ID=SupplyChain;Password=9999"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadUserProfile()
        End If
    End Sub

    Private Sub LoadUserProfile()
        Using connect As New SqlConnection(connStr)
            connect.Open()

            Dim cmd As New SqlCommand("SELECT TOP 1000 ID, Usrname, PW, UsrType, Detail, Supplierid, FNameT, FNameE, PositionT, Tel, FlagActive, FlagSupplierPull, LNameT, PersonCode, UserRemark 
                          FROM SupplyChain.dbo.PSR_M_User 
                          WHERE UserID = @UserID 
                            AND Usrname = @Usrname 
                            AND Detail = @Detail 
                            AND Supplierid = @Supplierid 
                            AND FNameT = @FNameT
                            AND FNameE = @FNameE
                            AND PositionT = @PositionT", connect)

            cmd.Parameters.AddWithValue("@UserID", 1)
            'cmd.Parameters.AddWithValue("@Usrname", usrname)
            'cmd.Parameters.AddWithValue("@Detail", detail)
            'cmd.Parameters.AddWithValue("@Supplierid", supplierId)
            'cmd.Parameters.AddWithValue("@FNameT", fnameT)
            'cmd.Parameters.AddWithValue("@FNameE", fnameE)
            'cmd.Parameters.AddWithValue("@PositionT", positionT)




        End Using


    End Sub

End Class