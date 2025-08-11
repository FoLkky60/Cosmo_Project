Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Dim objMyconn As New clsConnDbSQL

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub
    Protected Sub IbtLogin_Click(ByVal sender As Object, ByVal e As EventArgs)
        If chkFlagHold(txtUsername.Text.ToUpper, txtPassword.Text) Then
            mMsgBox("กรุณาติดต่อฝ่ายจัดซื้อเพื่อเข้าใช้งานระบบ...")
            Exit Sub
        End If

        mCheckPermission()
    End Sub
    'Protected Sub IbtLogin_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogin.Click


    '    If chkFlagHold(txtUsername.Text.ToUpper, txtpassword.Text) Then
    '        mMsgBox("กรุณาติดต่อฝ่ายจัดซื้อเพื่อเข้าใช้งานระบบ...")
    '        Exit Sub
    '    End If

    '    mCheckPermission()

    'End Sub

    Private Sub mCheckPermission()
        Dim objUsr As New clsUsr
        Dim qry As String = ""


        qry = " select COUNT(*)   " & vbCrLf
        qry += " from PSR_M_User m  " & vbCrLf
        qry += " 	left outer join PSR_T_Supplier s " & vbCrLf
        qry += " on m.Supplierid = s.SupplierID  " & vbCrLf
        qry += " where  " & vbCrLf
        qry += " 	usrname ='" & txtUsername.Text.Trim.ToUpper & "'  " & vbCrLf
        qry += " 	and Pw  ='" & txtPassword.Text.Trim & "' " & vbCrLf
        qry += "    and m.FlagActive = 1 " & vbCrLf


        Select Case "6" 'Me.ddlTypeSystem.Items(ddlTypeSystem.SelectedIndex).Value
            Case "0"

                If objMyconn.mGetData(qry) > 0 Then
                    lblMessage.Text = ""
                    Session("pousr") = UCase(txtUsername.Text.Trim.ToUpper)
                    Session("sl") = "T"
                    Session("SYS") = "PO"

                    FormsAuthentication.SetAuthCookie(Session("pousr").ToString(), False)


                    '## ทดสอบ 2016/01/04
                    '// Redirect New Page ใหม่
                    If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                        '' Response.Redirect("Form/FrmMonitorAcceptPO.aspx?ids=" & Session("pousr") & "")
                        Response.Redirect("./info3/ShowSlide.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")
                    ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                        ' Response.Redirect("Form/FrmListPOSent.aspx?ids=" & Session("pousr") & "")
                        Response.Redirect("./info3/ShowSlide.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")
                    End If


                Else
                    txtPassword.Text = ""
                    lblMessage.Text = "คุณระบุรหัสผ่านไม่ถูกต้อง ?"
                End If
            Case "1"

                If objMyconn.mGetData(qry) > 0 Then
                    lblMessage.Text = ""
                    Session("pousr") = UCase(txtUsername.Text.Trim)
                    Session("sl") = "T"
                    Session("SYS") = "EVL"

                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "ลงชื่อเข้าใช้งานระบบ"
                    objLogs.sEvent = "ลงชื่อเข้าใช้งานระบบ" & "สถานะ " & objUsr.GetUserType(Session("pousr"))
                    objLogs.ModuleName = "Login"
                    objLogs.FunctionName = "Login"
                    objLogs.IPAddress = objLogs_.GetIPAddress
                    '------------------------------------

                    ''//2018/03/29
                    '// Redirect New Page ใหม่
                    If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                        '' ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ' ''//Save LogsSystem

                        Response.Redirect("./info3/ShowSlide.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")

                    ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                        ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ''//Save LogsSystem
                        Response.Redirect("./info3/ShowSlide.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")
                    End If
                    '// Redirect New Page ใหม่


                    '' ''// Redirect New Page ใหม่
                    ' ''If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                    ' ''    Response.Redirect("Form/FrmMonitorEvaluation.aspx?ids=" & Session("pousr") & "")

                    ' ''ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                    ' ''    Response.Redirect("Form/FrmListEvaluation.aspx?ids=" & Session("pousr") & "")

                    ' ''End If
                    '' ''// Redirect New Page ใหม่

                Else
                    txtPassword.Text = ""
                    lblMessage.Text = "คุณระบุรหัสผ่านไม่ถูกต้อง ?"
                End If

            Case "2"

                If objMyconn.mGetData(qry) > 0 Then
                    lblMessage.Text = ""
                    Session("pousr") = UCase(txtUsername.Text.Trim)
                    Session("sl") = "T"
                    Session("SYS") = "QUO"

                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "ลงชื่อเข้าใช้งานระบบ"
                    objLogs.sEvent = "ลงชื่อเข้าใช้งานระบบ" & "สถานะ " & objUsr.GetUserType(Session("pousr"))
                    objLogs.ModuleName = "Login"
                    objLogs.FunctionName = "Login"
                    objLogs.IPAddress = objLogs_.GetIPAddress
                    '------------------------------------

                    '// Redirect New Page ใหม่
                    If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                        '' ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ' ''//Save LogsSystem

                        Response.Redirect("./info3/ShowSlide.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")
                    ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                        ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ''//Save LogsSystem
                        Response.Redirect("./info3/ShowSlide.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")
                    End If
                    '// Redirect New Page ใหม่

                Else
                    txtPassword.Text = ""
                    lblMessage.Text = "คุณระบุรหัสผ่านไม่ถูกต้อง ?"
                End If

            Case 3
                'Login Kathin

                If objMyconn.mGetData(qry) > 0 Then
                    lblMessage.Text = ""
                    Session("pousr") = UCase(txtUsername.Text.Trim)
                    Session("sl") = "T"
                    Session("SYS") = "KA"

                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "ลงชื่อเข้าใช้งานระบบ"
                    objLogs.sEvent = "ลงชื่อเข้าใช้งานระบบ" & "สถานะ " & objUsr.GetUserType(Session("pousr"))
                    objLogs.ModuleName = "Login Kathin"
                    objLogs.FunctionName = "Login Kathin"
                    objLogs.IPAddress = objLogs_.GetIPAddress
                    '------------------------------------

                    '// Redirect New Page ใหม่
                    If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                        '' ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ' ''//Save LogsSystem

                        ' Response.Redirect("./info3/ShowSlide.aspx?ids=" & Me.txtusername.Text.Trim & "")
                        Response.Redirect("Form/FrmKathinBuyerMonitor.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")
                    ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                        ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ''//Save LogsSystem

                        'ตรวจสอบสถานะว่าอ่านแล้ว กรณี Login เข้าใช้ระบบ
                        Dim sTaxid As String = UCase(txtUsername.Text.Trim)
                        qry = " update k set k.FlagRead = 1 ,k.readdate =GETDATE() from PSR_T_Kathin k where FlagRead <> 1 and KathinYear ='" & Date.Now.Year & "' and  SupplierID in (select top 1  SupplierID  from PSR_T_Supplier where IDTax ='" & sTaxid & "') "
                        objMyconn.mqryNoReturn(qry)
                        '---------------------------------

                        Response.Redirect("Form/FrmKathinSupplierAccept.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")

                    End If
                    '// Redirect New Page ใหม่


                Else
                    txtPassword.Text = ""
                    lblMessage.Text = "คุณระบุรหัสผ่านไม่ถูกต้อง ?"
                End If

            Case 5
                'Login IQC

                If objMyconn.mGetData(qry) > 0 Then
                    lblMessage.Text = ""
                    Session("pousr") = UCase(txtUsername.Text.Trim)
                    Session("sl") = "T"
                    Session("SYS") = "IQC"

                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "ลงชื่อเข้าใช้งานระบบ"
                    objLogs.sEvent = "ลงชื่อเข้าใช้งานระบบ" & "สถานะ " & objUsr.GetUserType(Session("pousr"))
                    objLogs.ModuleName = "Login IQC"
                    objLogs.FunctionName = "Login IQC"
                    objLogs.IPAddress = objLogs_.GetIPAddress
                    '------------------------------------

                    '// Redirect New Page ใหม่
                    If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                        '' ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ' ''//Save LogsSystem

                        ' Response.Redirect("./info3/ShowSlide.aspx?ids=" & Me.txtusername.Text.Trim & "")
                        Response.Redirect("Form/FrmMonitorAcceptIQC.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")
                    ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                        ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ''//Save LogsSystem

                        Response.Redirect("Form/FrmListIQCSent.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")

                    End If
                    '// Redirect New Page ใหม่
                Else
                    txtPassword.Text = ""
                    lblMessage.Text = "คุณระบุรหัสผ่านไม่ถูกต้อง ?"
                End If

            Case 6
                'Login TLS

                If objMyconn.mGetData(qry) > 0 Then
                    lblMessage.Text = ""
                    Session("pousr") = UCase(txtUsername.Text.Trim)
                    Session("sl") = "T"
                    Session("SYS") = "TLS"

                    FormsAuthentication.SetAuthCookie(Session("pousr").ToString(), False)
                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "ลงชื่อเข้าใช้งานระบบ"
                    objLogs.sEvent = "ลงชื่อเข้าใช้งานระบบ" & "สถานะ " & objUsr.GetUserType(Session("pousr"))
                    objLogs.ModuleName = "Login TLS"
                    objLogs.FunctionName = "Login TLS"
                    objLogs.IPAddress = objLogs_.GetIPAddress
                    '------------------------------------

                    '// Redirect New Page ใหม่
                    If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                        '' ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ' ''//Save LogsSystem

                        ' Response.Redirect("./info3/ShowSlide.aspx?ids=" & Me.txtusername.Text.Trim & "")
                        Response.Redirect("Frontend/Home.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")

                    ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                        ''Save LogsSystem
                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        ''//Save LogsSystem

                        Response.Redirect("Frontend/FromQeations.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")

                    End If
                    '// Redirect New Page ใหม่
                Else
                    txtPassword.Text = ""
                    lblMessage.Text = "คุณระบุรหัสผ่านไม่ถูกต้อง ?"
                End If
            Case 7

                If objMyconn.mGetData(qry) > 0 Then
                    lblMessage.Text = ""
                    Session("pousr") = UCase(txtUsername.Text.Trim)

                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "ลงชื่อเข้าใช้งานระบบ"
                    objLogs.sEvent = "ลงชื่อเข้าใช้งานระบบ" & "สถานะ " & objUsr.GetUserType(Session("pousr"))
                    objLogs.ModuleName = "Login CertificateISO"
                    objLogs.FunctionName = "Login CertificateISO"
                    objLogs.IPAddress = objLogs_.GetIPAddress
                    '------------------------------------

                    '// Redirect New Page ใหม่
                    If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        Response.Redirect("https://webcosmo.cosmo.co.th/CertificateISO/landingpage.aspx?user=A" & UCase(txtUsername.Text.Trim) & "")

                    ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                        objMyconn.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        Response.Redirect("https://webcosmo.cosmo.co.th/CertificateISO/landingpage.aspx?user=S" & UCase(txtUsername.Text.Trim) & "")

                    End If

                Else
                    txtPassword.Text = ""
                    lblMessage.Text = "คุณระบุรหัสผ่านไม่ถูกต้อง ?"
                End If

            Case 8
                ' ติดตามการตอบรับนโยบาย
                If objMyconn.mGetData(qry) > 0 Then
                    lblMessage.Text = ""
                    Session("pousr") = UCase(txtUsername.Text.Trim)

                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "ลงชื่อเข้าใช้งานระบบ"
                    objLogs.sEvent = "ลงชื่อเข้าใช้งานระบบ" & "สถานะ " & objUsr.GetUserType(Session("pousr"))
                    objLogs.ModuleName = "Login CertificateISO"
                    objLogs.FunctionName = "Login CertificateISO"
                    objLogs.IPAddress = objLogs_.GetIPAddress
                    '------------------------------------

                    '// Redirect New Page ใหม่
                    '// ปิดเก็บ log เวลาเข้าระบบ จะ publish ค่อยมาเปิด / 29-01-2568
                    If objUsr.GetUserType(Session("pousr")) = "Admin" Or objUsr.GetUserType(Session("pousr")) = "Administrator" Then

                        'objMyconn.mQryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        Response.Redirect("Form/FrmMonitorAcceptPolicy.aspx?ids=" & UCase(txtUsername.Text.Trim) & "")


                    ElseIf objUsr.GetUserType(Session("pousr")) = "Supplier" Then

                        'objMyconn.mQryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                        Response.Redirect("https://webcosmo.cosmo.co.th/Policy/ListPolicySent.aspx?user=" & UCase(txtUsername.Text.Trim) & "")

                    End If

                Else
                    txtPassword.Text = ""
                    lblMessage.Text = "คุณระบุรหัสผ่านไม่ถูกต้อง ?"
                End If


        End Select

    End Sub ' ตรวจสอบสิทธิ์การเข้าใช้งาน


#Region "ตรวจสอบสถานะระงับการใช้งาน"
    Private Function chkFlagHold(ByVal sUsr As String, ByVal sPw As String) As Boolean

        Dim qry As String = ""

        If ChkHold(sUsr) > 0 Then
            Return True
        Else
            Return False
        End If

    End Function
    Function ChkHold(ByVal sUsr As String) As String

        Dim qry As String = ""

        qry = "  --//หาค่า Hold เป็น 0 " & vbCrLf
        qry += "  declare @countUsrType integer,@countHold integer;  " & vbCrLf
        qry += "  set @countUsrType =( select COUNT(*) from PSR_M_User where Usrname ='" & sUsr & "'); " & vbCrLf
        qry += "  -------------start if--------------- " & vbCrLf
        qry += "  if  (@countUsrType > 0 ) " & vbCrLf
        qry += "  begin	 " & vbCrLf
        qry += " 		set @countHold = (select COUNT (*) from PSR_T_Supplier where IDTax = '" & sUsr & "' and FlagReady = 'H')		 " & vbCrLf
        qry += "  end;  " & vbCrLf
        qry += "  else  " & vbCrLf
        qry += "  begin " & vbCrLf
        qry += "  set @countHold = 0 " & vbCrLf
        qry += "  end ;  " & vbCrLf
        qry += "  -------------end if---------------- " & vbCrLf
        qry += "  select @countHold; " & vbCrLf

        If objMyconn.mGetData(qry) = Nothing Then
            Return "0"
        Else
            Return objMyconn.mGetData(qry)
        End If
    End Function

#End Region

#Region "MsgBox"
    'Run Script Message Box
    Public Sub mMsgBox(ByVal Message As String)

        Dim script As String = "<SCRIPT LANGUAGE=""JavaScript"">alert(""" & Message & """)</SCRIPT>"
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "null", script)
        '######################

    End Sub
#End Region

End Class