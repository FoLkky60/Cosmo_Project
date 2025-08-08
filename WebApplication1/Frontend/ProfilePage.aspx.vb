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

            Dim cmd As New SqlCommand("SELECT 
                                U.Detail, 
                                U.UsrType, 
                                S.SupplierID, 
                                S.Address, 
                                S.Tel, 
                                S.Email, 
                                S.IDTax, 
                                S.FlagReady, 
                                S.Fax,
                                T.TlsID,
                                T.TlsYear,
                                T.SupplierCode,
                                T.DateCreate,
                                T.Buyer,
                                T.BuyerName,
                                T.ByUsr
                            FROM SupplyChain.dbo.PSR_M_User U
                            JOIN SupplyChain.dbo.PSR_T_Supplier S ON U.Supplierid = S.SupplierID
                            JOIN SupplyChain.dbo.PSR_T_Tls T ON S.SupplierID = T.Supplierid
                            WHERE U.Supplierid = @Supplierid", connect)

            cmd.Parameters.AddWithValue("@Supplierid", 6449)

            Dim reader As SqlDataReader = cmd.ExecuteReader()

            If reader.Read() Then
                FullNameProfile.Text = reader("Detail").ToString()
                UserType.Text = reader("UsrType").ToString()
                Address.Text = reader("Address").ToString()
                Tel.Text = reader("Tel").ToString()
                Email.Text = reader("Email").ToString()
                IDTax.Text = reader("IDTax").ToString()
                FlagReady.Text = reader("FlagReady").ToString()
                Fax.Text = reader("Fax").ToString()
                TlsYear.Text = reader("TlsYear").ToString()
                Buyer.Text = reader("Buyer").ToString()
                DateCreate.Text = reader("DateCreate").ToString()


            End If

            reader.Close()
        End Using



    End Sub

End Class