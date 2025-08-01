Imports Microsoft.VisualBasic

Public Class clsUsr

    Public Sub Adduser(ByVal userName As String, ByVal Pw As String, Optional ByVal Usrtype As String = "")

        Dim objMyConM As New clsConnDbSQL
        Dim qry As String = ""

        qry = " insert into PSR_M_User( " & vbCrLf
        qry += " userName " & vbCrLf
        qry += " ,Pw " & vbCrLf
        qry += " ,Usrtype) " & vbCrLf
        qry += " values( " & vbCrLf
        qry += " '" & userName & "' " & vbCrLf
        qry += " ,'" & Pw & "' " & vbCrLf

        If Usrtype = "" Then
            qry += " ,'Supplier' " & vbCrLf
        Else
            qry += " ,'" & Usrtype & "' " & vbCrLf
        End If

        qry += " ) " & vbCrLf
        '-------------------------------------------
        Try
            objMyConM.mqryNoReturn(qry)
        Catch ex As Exception
            Exit Sub
        End Try
        '-------------------------------------------
    End Sub

    Function GetUserName_ByIDTax(ByVal IDTax As String) As String

        Dim objMyConM As New clsConnDbSQL
        Dim qry As String = ""

        qry += " SELECT SupplierName " & vbCrLf
        qry += " FROM PSR_T_Supplier t " & vbCrLf
        qry += " Where IDTax = '" & IDTax & "' " & vbCrLf
        qry += "  " & vbCrLf
        '-------------------------------------------
        Try
            Return objMyConM.mGetData(qry)
        Catch ex As Exception
            Return ""
        End Try
        '-------------------------------------------

    End Function 'เงื่อนไขโดยรหัสการเสียภาษี

    Function GetUserName_ByIDSupplier(ByVal IDSuplier As String) As String

        Dim objMyConM As New clsConnDbSQL
        Dim qry As String = ""

        qry += " SELECT SupplierName " & vbCrLf
        qry += " FROM PSR_T_Supplier t " & vbCrLf
        qry += " Where SupplierId = '" & IDSuplier & "' " & vbCrLf
        qry += "  " & vbCrLf
        '-------------------------------------------
        Try
            Return objMyConM.mGetData(qry)
        Catch ex As Exception
            Return ""
        End Try
        '-------------------------------------------

    End Function 'เงื่อนไขโดยรหัสผู้ขาย

    Function GetSupplierID_ByIDTax(ByVal IDTax As String) As String

        Dim objMyConM As New clsConnDbSQL
        Dim qry As String = ""

        qry += " SELECT SupplierID " & vbCrLf
        qry += " FROM PSR_T_Supplier t " & vbCrLf
        qry += " Where IDTax = '" & IDTax & "' " & vbCrLf
        qry += "  " & vbCrLf
        '-------------------------------------------
        Try
            Return objMyConM.mGetData(qry)
        Catch ex As Exception
            Return ""
        End Try
        '-------------------------------------------

    End Function 'เงื่อนไขโดย IdSupplier

    Function GetUserType(ByVal username As String) As String
        'Exp : username = 000จท003
        Dim objMyConM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select top 1 UsrType from PSR_M_User  where Usrname =('" & username & "')"

        Return objMyConM.mGetData(qry)

        'Return : Supplier / Admin

    End Function 'เงื่อนไขการ Get ค่า Type user [Admin / Supplier]

    Function GetUserPosition(ByVal username As String) As String

        Dim sPositionT As String = "Purchasing Officer"
        'Exp : username = PS12
        Dim objMyConM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select top 1 PositionT  from PSR_M_User where Usrname ='" & username & "'"

        If objMyConM.mGetData(qry) <> Nothing Then
            sPositionT = objMyConM.mGetData(qry)
        End If

        Return sPositionT

    End Function

    Function GetUserTel(ByVal username As String) As String

        Dim sTel As String = " ต่อ 7227"
        'Exp : username = PS12
        Dim objMyConM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select top 1 Tel  from PSR_M_User where Usrname ='" & username & "'"

        If objMyConM.mGetData(qry) <> Nothing Then
            sTel = objMyConM.mGetData(qry)
        End If

        Return sTel


    End Function

    Function GetUserDetail(ByVal username As String) As String

        Dim sUsr As String = ""
        'Exp : username = PS12
        Dim objMyConM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select top 1 FNameT  from PSR_M_User where Usrname ='" & username & "'"

        If objMyConM.mGetData(qry) <> Nothing Then
            sUsr = objMyConM.mGetData(qry)
        End If

        Return sUsr

    End Function




    Public Function GetStaffName(ByVal Staffusr As String) As String

        'Staffusr : ชื่อผู้ใช้งาน

        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select top 1 Detail from PSR_M_User where Usrname = '" & Staffusr & "' "
        Return objMyconM.mGetData(qry)

    End Function


End Class
