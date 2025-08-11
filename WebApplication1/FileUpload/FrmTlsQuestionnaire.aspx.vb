Imports System.Data
Partial Class Form_FFrmTlsQuestionnaire
    Inherits System.Web.UI.Page

    Dim objMyconG As New clsConnection
    Dim objTls As New clsTls
    Dim objUsr As New clsUsr
    Dim sYear As String = 2021      ''Format(Date.UtcNow ,"yyyy")


    Dim sTlsId As String = ""
    Dim sSupplierId As String = ""



#Region "MsgBox"
    'Run Script Message Box
    Public Sub mMsgBox(ByVal Message As String)
        Dim script As String = "<SCRIPT LANGUAGE=""JavaScript"">alert(""" & Message & """)</SCRIPT>"
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "null", script)
        '######################
    End Sub
#End Region


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ''Me.hdfTlsId.Value = "4389"
        ''Me.hdfSupplierId.Value = "2452"
        ''sTlsId = "4389"
        ''sSupplierId = "2452"


        sTlsId = Request.QueryString("id")
        sSupplierId = Request.QueryString("s")
        Me.hdfTlsId.Value = Request.QueryString("id")
        Me.hdfSupplierId.Value = Request.QueryString("s")

        ''Me.lblCompany.Text = "สถานประกอบการ :" + objUsr.GetUserName_ByIDSupplier(hdfSupplierId.Value)
        Me.lblCompany.Text = "สถานประกอบการ :" + objUsr.GetUserName_ByIDSupplier(sSupplierId)


        If Not IsPostBack Then
            '' Me.hdfTlsId.Value = objTls.GetTlsId(Me.hdfSupplierId.Value, sYear)

            If ChkAnsQuestionnaire(sTlsId) > 0 Then

                mLoadDetail(sTlsId)


                '' ''ถ้ามีการรับเอกสารจากแผนกจัดซื้อแล้วไม่สามารถบันทึกได้
                        'Dim qry As String = ""
                        'qry = "SELECT count([TlsID]) FROM [PSR_T_Tls] Where [FlagCompleted] = 'True'  and TlsID = '" & sTlsId & "'"

                        'If objMyconG.mGetData(qry) = 1 Then
                        '    btSave.Visible = False
                        '    btCancel.Visible = False
                        'Else
                        '    btSave.Visible = True
                        '    btCancel.Visible = True
                        'End If

                'ไกด์แก้ ให้ เปิดตัวประเมินให้มีการแก้ไข
                btSave.Visible = True
                btCancel.Visible = True

            Else

                btSave.Visible = True
                btCancel.Visible = True

            End If

        End If


    End Sub
    Public Function check_rbt9(ByVal y As RadioButton)
        If y.Checked = False Then
            Dim test_rbt As String = y.GroupName

            Return test_rbt
        Else
            Dim test_rbt As String = y.GroupName
            Return test_rbt
        End If



    End Function

    Function ChkAnsQuestionnaire(ByVal s_TlsID As String)
        Dim objMycon As New clsConnection

        Dim qry As String = ""
        qry = "SELECT count([TlsID]) FROM [PSR_T_Tls] Where [FlagConfirm] = 'True'  and TlsID = '" & s_TlsID & "'"


        Return objMycon.mGetData(qry)

    End Function

    Function fChkBeforeSave() As Boolean

        Dim obj1 As New clsTlsQuestionnaireInfo

        '1.1

        'If obj1.ChkBeforSaveTlsQ(hdfSupplierId, hdfTlsId _
        '  , rbt1_1_a _
        '  , rbt1_1_b _
        '  , rbt1_1_c _
        '  ) = False Then 'แสดงว่ามีค่าว่าง
        '    Return False
        'End If



        Return True

    End Function

    Protected Sub btSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btSave.Click

        'ตรวจสอบก่อนบันทึก
        'If hdfTlsId.Value = "" Or hdfSupplierId.Value = "" Then
        '    Me.mMsgBox("กรุณา Login เข้าระบบใหม่อีกครั้ง ?")
        '    Exit Sub
        'End If

        If txtRemark_2.Text = "" Or txtRemark_2.Text.Length < 6 Then
            Me.mMsgBox("กรุณาลงชื่อผู้ตอบรับเอกสาร ระบุ ชื่อ- นามสกุล ด้วยค่ะ")
            Exit Sub
        End If


        Try
            If fChkBeforeSave() = True Then
                'mSave("")

                'Dim sId As String = hdfTlsId.Value

                'Dim sTlsId As String = hdfSupplierId.Value

                btSave0_Click(Nothing, Nothing)

                mUpdateTls(sTlsId)

                mMsgBox("บันทึกข้อมูลเรียบร้อยแล้ว")



                Response.Redirect("FrmListTLSSent.aspx?id=" & sTlsId & "&s=" & sSupplierId & "")


            Else
                mMsgBox("กรุณากรอกข้อมูลให้ครบถ้วน ?")
                Exit Sub
            End If



        Catch ex As Exception
            mMsgBox("เกิดความผิดพลาดในการบันทึกข้อมูล?")
        End Try

    End Sub

    Protected Sub btCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCancel.Click

    End Sub

    Private Sub mSave(ByVal qry As String)

        Dim objMycon As New clsConnection

        'Dim qry As String = ""
        Dim obj1 As New clsTlsQuestionnaireInfo

        Dim objSup As New clsSupplierInfo
        objSup = objSup.Find(sSupplierId)

        Dim qrycnt As String = ""
        qrycnt = " declare @n int; " & vbCrLf
        qrycnt += " set @n = (select count(*) from PSR_T_TlsQuestionnaire where tlsID ='" & sTlsId & "'); " & vbCrLf
        qrycnt += " begin " & vbCrLf
        qrycnt += " delete from PSR_T_TlsQuestionnaire where tlsid='" & sTlsId & "';" & vbCrLf
        qrycnt += qry & vbCrLf
        qrycnt += " end; " & vbCrLf


        Try
            objMycon.mQryNoReturn(qrycnt)
        Catch ex As Exception
            Me.mMsgBox("เกิดความผิดพลาดในการบันทึกข้อมูล ?")
        End Try


    End Sub

    Private Sub mUpdateTls(ByVal s_TlsId As String)
        Dim objMycon As New clsConnection
        Dim qry As String = ""
        Dim objSup As New clsSupplierInfo
        objSup = objSup.Find(sSupplierId)

        qry = " UPDATE [PSR_T_Tls] " & vbCrLf
        qry += "    SET       " & vbCrLf
        qry += "       [Response] = '" & txtRemark_2.Text & "'--<Response, nvarchar(100),> " & vbCrLf
        qry += "       ,[DateResponse] = Getdate()-- <DateResponse, datetime,>   " & vbCrLf
        qry += "       ,[Remark] = '" & txtRemark_3.Text & "'--<Remark, nvarchar(50),> " & vbCrLf
        qry += "       ,FlagConfirm = 'True'" & vbCrLf
        ''qry += "       ,FlagCompleted = 'True'" & vbCrLf
        qry += "       ,FileDocCommitment = 'NULL'" & vbCrLf

        qry += "  WHERE Tlsid ='" & s_TlsId & "' " & vbCrLf

        Try
            objMycon.mQryNoReturn(qry)
        Catch ex As Exception

        End Try


    End Sub

    Private Sub mLoadDetail(ByVal s_TlsId As String)

        Dim obj1 As New clsTlsQuestionnaireInfo
        Dim objMycon As New clsConnection

        'objTls.Find()

        Dim qry As String = ""

        qry = " SELECT [TlsID] " & vbCrLf
        qry += "       ,[TlsYear] " & vbCrLf
        qry += "       ,[Supplierid] " & vbCrLf
        qry += "       ,[SupplierCode] " & vbCrLf
        qry += "       ,[DateCreate] " & vbCrLf
        qry += "       ,[Response] " & vbCrLf
        qry += "       ,[DateResponse] " & vbCrLf
        qry += "       ,[Buyer] " & vbCrLf
        qry += "       ,[BuyerName] " & vbCrLf
        qry += "       ,[ByUsr] " & vbCrLf
        qry += "       ,[DateUpload] " & vbCrLf
        qry += "       ,[FlagSentEmail] " & vbCrLf
        qry += "       ,[SentEmailDatetime] " & vbCrLf
        qry += "       ,[UnitSentEmail] " & vbCrLf
        qry += "       ,[FlagRead] " & vbCrLf
        qry += "       ,[DateRead] " & vbCrLf
        qry += "       ,[Remark] " & vbCrLf
        qry += "       ,[FlagConfirm] " & vbCrLf
        qry += "       ,[FlagConfirm] " & vbCrLf
        qry += "       ,[FileDocCommitment] " & vbCrLf
        qry += "   FROM [PSR_T_Tls] " & vbCrLf
        qry += " where TlsId = '" & s_TlsId & "' " & vbCrLf


        With objMycon
            .mQryReturn(qry)
            While .dr.Read

                s_TlsId = .dr("TlsID").ToString

                Me.txtRemark_2.Text = .dr("Response").ToString
                Me.txtRemark_3.Text = .dr("Remark").ToString
                ''1.1
                Dim A1, A2, A3, strart_rtb, text_count As Integer
                Dim rbta1, rbta2, rbta3, rbt_conv_text As String
                Dim check_return_rbt As String
                Dim Query As String = ""
                strart_rtb = 1
                text_count = 1
                While strart_rtb < 385
                    A1 = strart_rtb
                    A2 = strart_rtb + 1
                    A3 = strart_rtb + 2
                    rbta1 = "rbt_" + A1.ToString()
                    rbta2 = "rbt_" + A2.ToString()
                    rbta3 = "rbt_" + A3.ToString()

                    If strart_rtb = 1 Then
                        rbt_conv_text = "txt_input_" + Convert.ToString(text_count)
                    Else
                        rbt_conv_text = "txt_input_" + Convert.ToString(text_count)
                    End If
                    Dim txt_reamrk_con As TextBox = conv_textbox_retuen(rbt_conv_text)
                    Dim rbt_yes As RadioButton = (conv_rbt(rbta1))
                    Dim rbt_no As RadioButton = (conv_rbt(rbta2))
                    Dim rbt_ig As RadioButton = (conv_rbt(rbta3))
                    Dim sgroup_name As String = (conv_rbt(rbta1).GroupName).ToString()
                    Dim rbt_group_name As String = Mid(sgroup_name, 2, 2)
                    Dim rbt_group_chioce As String = Mid(sgroup_name, 4, 2)
                    ''มี Sub
                    If rbt_group_name = "13" And rbt_group_chioce = "14" Then
                        rbt_group_chioce = Mid(sgroup_name, 4, 3)
                    End If

                    ''If rbt_group_name = "a01" Then
                    ''    rbt_group_chioce = "1"
                    ''    rbt_group_name = rbt_group_name.Substring(0, 3).ToString()
                    ''Else
                    ''    If rbt_group_name.Length = 4 Then
                    ''        rbt_group_chioce = rbt_group_name.Substring(3, 1).ToString()
                    ''    Else
                    ''        rbt_group_chioce = rbt_group_name.Substring(3, 2).ToString()
                    ''    End If
                    ''    rbt_group_name = rbt_group_name.Substring(0, 3).ToString()
                    ''End If

                    obj1.LoadDetail(sSupplierId, rbt_group_name, rbt_group_chioce, sTlsId _
                    , rbt_yes _
                    , rbt_no _
                    , rbt_ig _
                    , txt_reamrk_con)


                    strart_rtb += 3
                    text_count += 1

                    If rbt_group_name = "15" And rbt_group_chioce = "01" Then
                        Exit While
                    End If

                End While

            End While
        End With

    End Sub


    Protected Sub btSave0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btSave0.Click

        Dim obj As New clsTlsQuestionnaireInfo
        Dim A1, A2, A3, strart_rtb, text_count As Integer
        Dim rbta1, rbta2, rbta3, rbt_conv_text As String
        Dim check_return_rbt As String
        Dim Query As String = ""
        strart_rtb = 1
        text_count = 1
        While strart_rtb < 385
            A1 = strart_rtb
            A2 = strart_rtb + 1
            A3 = strart_rtb + 2
            rbta1 = "rbt_" + A1.ToString()
            rbta2 = "rbt_" + A2.ToString()
            rbta3 = "rbt_" + A3.ToString()
            'If check_rbt1(conv_rbt(rbta1), conv_rbt(rbta2), conv_rbt(rbta3)) = False Then
            '    Me.mMsgBox("กรุณาตรวจสอบข้อมมูล เนื่องจากมีการบันทึกข้อมูลไม่ครบ")
            '    Exit Sub
            'End If
            If strart_rtb = 1 Then
                rbt_conv_text = "txt_input_" + Convert.ToString(text_count)
            Else
                rbt_conv_text = "txt_input_" + Convert.ToString(text_count)
            End If
            Dim txt_reamrk_con As String = conv_textbox(rbt_conv_text).ToString()
            Dim rbt_yes As String = check_true_false_rbt(conv_rbt(rbta1).Checked)
            Dim rbt_no As String = check_true_false_rbt(conv_rbt(rbta2).Checked)
            Dim rbt_ig As String = check_true_false_rbt(conv_rbt(rbta3).Checked)
            Dim sgroup_name As String = (conv_rbt(rbta1).GroupName).ToString()
            Dim rbt_group_name As String = Mid(sgroup_name, 2, 2)
            Dim rbt_group_chioce As String = Mid(sgroup_name, 4, 2)

            ''มี Sub
            If rbt_group_name = "13" And rbt_group_chioce = "14" Then
                rbt_group_chioce = Mid(sgroup_name, 4, 3)
            End If


            ''If rbt_group_name = "a01" Then
            ''    rbt_group_chioce = "1"
            ''    rbt_group_name = rbt_group_name.Substring(0, 3).ToString()
            ''    'ElseIf rbt_group_name.Length >7 then 
            ''    '    rbt_group_chioce = rbt_group_name.Substring(7,1).ToString()
            ''    '    rbt_group_name = rbt_group_name.Substring(0,3).ToString()
            ''Else
            ''    If rbt_group_name.Length = 4 Then
            ''        rbt_group_chioce = rbt_group_name.Substring(3, 1).ToString()
            ''    Else
            ''        rbt_group_chioce = rbt_group_name.Substring(3, 2).ToString()
            ''    End If
            ''    rbt_group_name = rbt_group_name.Substring(0, 3).ToString()
            ''End If

            Query += obj.SqlCmd_Insert(sSupplierId, rbt_group_name, rbt_group_chioce, sTlsId _
        , rbt_yes _
        , rbt_no _
        , rbt_ig _
        , txt_reamrk_con)


            strart_rtb += 3
            text_count += 1

            If rbt_group_name = "13" And rbt_group_chioce = "15" Then
                mSave(Query)
                Exit While
            End If

        End While
        ''If strart_rtb = 385 Then
        ''    mSave(Query)
        ''End If

    End Sub
    Public Function check_true_false_rbt(ByVal y As Boolean) As String
        Dim return_rbt As String
        If y = True Then
            Return "1"
        Else
            Return "0"
        End If

    End Function
    Public Function check_rbt1(ByVal y As RadioButton, ByVal noo As RadioButton, ByVal ig As RadioButton)
        If y.Checked = False And noo.Checked = False And ig.Checked = False Then
            'Dim  test_rbt  As string  = y.GroupName 
            'Dim test_test As String =y.Text 
            Return False
        Else
            'Dim  test_rbt  As string  = y.GroupName 
            Return True
        End If

        'Dim  test_rbt  As string  = y.GroupName 

    End Function
    Public Function retrun_ckeck(ByVal y As RadioButton, ByVal noo As RadioButton, ByVal ig As RadioButton) As String
        Dim rtb_bt As String
        If y.Checked = True Then
            rtb_bt = "1"

        ElseIf noo.Checked = True Then
            rtb_bt = "0"

        ElseIf ig.Checked = True Then
            rtb_bt = "9"

        End If
        Return (rtb_bt)

    End Function

    Public Function conv_rbt(ByVal a1_rbt As String) As RadioButton
        Dim a1 As RadioButton = CType(FindControl(a1_rbt), RadioButton)
        Return a1
    End Function
    Public Function conv_textbox(ByVal a1_textbox As String) As String
        Dim textbox_1 As TextBox = CType(FindControl(a1_textbox), TextBox)
        Dim text2 As String = Convert.ToString(textbox_1.Text)
        Return text2
    End Function
    Public Function conv_textbox_retuen(ByVal a1_textbox As String) As TextBox
        Dim textbox_1 As TextBox = CType(FindControl(a1_textbox), TextBox)

        Return textbox_1
    End Function

End Class
