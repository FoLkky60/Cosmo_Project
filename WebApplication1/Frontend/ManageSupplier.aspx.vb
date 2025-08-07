Imports DevExpress.Web
Public Class ManageSupplier
    Inherits System.Web.UI.Page
    Dim objCon As New clsConnDbSQL
    Dim objConOra As New clsConnDbOra
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("pousr") = "big"
        If Not IsPostBack Then
            Clearform()
        End If

        BindGridView()
    End Sub

    Private Sub BindGridView()

        Dim str_SQL = " 
                SELECT ROW_NUMBER() OVER (ORDER BY [SupplierID]) AS Row ,[SupplierID]
                      ,[SupplierName]
                      ,[SupplierName2]
                      ,[Address]
                      ,[Tel]
                      ,[Email]
                      ,[IDTax]
                      ,[SupplierCode]
                      ,[CordinatorName]
                      ,[FlagReady]
                      ,[Fax]
                      ,[FlagIntranet]
                      ,[Supplier_Remark]
                  FROM [PSR_T_Supplier]
    
                ORDER BY [FlagReady] asc ,[SupplierName] asc
                "

        SqlDataSourceTab1.ConnectionString = ConfigurationManager.ConnectionStrings("SupplyChain").ConnectionString
        SqlDataSourceTab1.SelectCommand = str_SQL

        SqlDataSourceTab1.DataBind()
        grid.DataBind()

    End Sub
    Protected Sub GridView_CustomJSProperties(ByVal sender As Object, ByVal e As ASPxGridViewClientJSPropertiesEventArgs)
        e.Properties("cpVisibleRowCount") = grid.VisibleRowCount
        e.Properties("cpFilteredRowCountWithoutPage") = GetFilteredRowCountWithoutPage()
    End Sub

    Protected Sub grid_HtmlRowCreated(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowCreated
        'If e.RowType <> DevExpress.Web.GridViewRowType.Data Then Return

        ''Dim values() As Object = CType(grid.GetRowValues(e.VisibleIndex, New String() {"FlagActive"}), Object())
        'Dim flagActive As Object = grid.GetRowValues(e.VisibleIndex, "FlagReady")
        'Dim idTax As Object = grid.GetRowValues(e.VisibleIndex, "ID")

        'Dim lbl_Status As Label = TryCast(grid.FindRowCellTemplateControl(e.VisibleIndex, Nothing, "lbl_Status"), Label)
        'If lbl_Status IsNot Nothing Then
        '    Dim flagValue As Integer = Convert.ToInt32(flagActive)
        '    If flagValue = 1 Then
        '        lbl_Status.Text = "เปิดใช้งาน"
        '        lbl_Status.ForeColor = System.Drawing.Color.Green
        '    Else
        '        lbl_Status.Text = "ระงับการใช้งาน"
        '        lbl_Status.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "Row" Then
            ' หาค่าลำดับแถวจาก VisibleIndex (เริ่มที่ 0)
            e.Cell.Text = (e.VisibleIndex + 1).ToString()
        End If

        If e.DataColumn.FieldName = "FlagReady" Then
            Dim value As String = e.CellValue ' Convert.ToBoolean(e.CellValue)
            If value = "A" Then
                e.Cell.Text = "เปิดใช้งาน"
                e.Cell.ForeColor = System.Drawing.Color.Green
            Else
                e.Cell.Text = "ระงับการใช้งาน"
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub
    Protected Sub btn_Set_Click(ByVal sender As Object, ByVal e As EventArgs)

        Dim Button As Button = CType(sender, Button)
        Dim container As GridViewDataItemTemplateContainer = CType(Button.NamingContainer, GridViewDataItemTemplateContainer)
        Dim values() As Object = CType(container.Grid.GetRowValues(container.VisibleIndex, New String() {"id", "File_type", "Notification_text"}), Object())
        If values(0).ToString() <> "" AndAlso values(2).ToString() <> "" Then

        End If
    End Sub
    '--- ปุ่มกด  ดึงข้อมูล มา edit   ----
    Protected Sub btn_Edit_Click(ByVal sender As Object, ByVal e As EventArgs)

        Dim Button As Button = CType(sender, Button)
        Dim container As GridViewDataItemTemplateContainer = CType(Button.NamingContainer, GridViewDataItemTemplateContainer)
        Dim values() As Object = CType(container.Grid.GetRowValues(
                                        container.VisibleIndex,
                                        New String() {"SupplierID",
                                            "SupplierName", "SupplierCode", "SupplierName2", "IDTax", "Address",
                                            "Tel", "Fax", "Email", "FlagReady", "CordinatorName",
                                            "FlagIntranet", "Supplier_Remark"
                                        }
                                    ), Object())
        If values(0).ToString() <> "" AndAlso values(1).ToString() <> "" Then
            hdf_FormStatus.Value = "EDIT"
            lbl_form_sta.Text = "สถานะ: แก้ไขข้อมูลผู้ขาย"
            lbl_form_sta.ForeColor = System.Drawing.Color.Orange
            lbl_form_sta2.Text = "สถานะ: แก้ไขข้อมูลผู้ขาย"
            lbl_form_sta2.ForeColor = System.Drawing.Color.Orange
            hdf_supplierID.Value = values(0).ToString()

            txt_SupplierName.Text = values(1).ToString()
            txt_SupplierNameTax.Text = values(3).ToString()
            txt_CordinatorName.Text = values(10).ToString()
            txt_SupplierCode.Text = values(2).ToString()
            txt_IDTax.Text = values(4).ToString()
            txt_Address.Text = values(5).ToString()
            txt_Phone.Text = values(6).ToString()
            txt_Fax.Text = values(7).ToString()
            txt_Email.Text = values(8).ToString()


            Dim sta_a = values(9).ToString()
            If sta_a = "A" Then
                ddl_status.SelectedIndex = 1
            Else
                ddl_status.SelectedIndex = 2
            End If

            ddl_status.Enabled = True
            txt_IDTax.Enabled = False  ' ไม่ใช้แก้ไข IDTax เพราะเป็น user login ด้วย 

            FormSearch.Visible = False  ' ซ่อน  
            FormDetail.Visible = True  ' แสดง
            FormSave.Visible = True  ' แสดง

            Dim scr_str As String = " focusAndScroll(); "
            ScriptManager.RegisterStartupScript(Me, [GetType](), "setFocus", "focusAndScroll();", True)

        End If

    End Sub
    Protected Sub btn_NewSupplier_Click(ByVal sender As Object, ByVal e As EventArgs)

        Clearform()
        lbl_form_sta.Text = "สถานะ: เพิ่มผู้ขาย"
        lbl_form_sta2.Text = "สถานะ: เพิ่มผู้ขาย"
        lbl_form_sta.ForeColor = System.Drawing.Color.Green
        lbl_form_sta2.ForeColor = System.Drawing.Color.Green
        hdf_FormStatus.Value = "ADD"
        ddl_status.SelectedIndex = 1
        ddl_status.Enabled = False

        FormSearch.Visible = True  ' แสดง
        FormDetail.Visible = True  ' แสดง
        FormSave.Visible = True  ' แสดง
    End Sub
    Protected Sub btn_Save_Click(ByVal sender As Object, ByVal e As EventArgs)

        If hdf_FormStatus.Value = "" Then Exit Sub

        If chkform_detail() Then
            If hdf_FormStatus.Value = "ADD" Then
                If chkDuplicateUsername(txt_Usrname.Text.Trim()) = True Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "myFunction1", "alert('Username นีัมีการใช้งานแล้ว  ');", True)
                Else
                    Dim qry As String = ""
                    qry += "INSERT INTO [PSR_T_Supplier] (" & vbCrLf
                    qry += "    SupplierName," & vbCrLf
                    qry += "    SupplierName2," & vbCrLf
                    qry += "    CordinatorName," & vbCrLf
                    qry += "    SupplierCode," & vbCrLf
                    qry += "    IDTax," & vbCrLf
                    qry += "    Address," & vbCrLf
                    qry += "    Tel," & vbCrLf
                    qry += "    Fax," & vbCrLf
                    qry += "    Email" & vbCrLf
                    qry += ") VALUES (" & vbCrLf
                    qry += "    '" & txt_SupplierName.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                    qry += "    '" & txt_SupplierNameTax.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                    qry += "    '" & txt_CordinatorName.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                    qry += "    '" & txt_SupplierCode.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                    qry += "    '" & txt_IDTax.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                    qry += "    '" & txt_Address.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                    qry += "    '" & txt_Phone.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                    qry += "    '" & txt_Fax.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                    qry += "    '" & txt_Email.Text.Trim().Replace("'", "''") & "'" & vbCrLf
                    qry += ")" & vbCrLf

                    objCon.mqryNoReturn(qry)
                    Clearform()
                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "เพิ่มข้อมูล supplier"
                    objLogs.sEvent = "เพิ่มข้อมูล supplier " & txt_Usrname.Text.Trim().ToUpper
                    objLogs.ModuleName = "INSERT PSR_T_supplier"
                    objLogs.FunctionName = "btn_Save_Click()"
                    objLogs.IPAddress = objLogs_.GetIPAddress

                    objCon.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                End If


            ElseIf hdf_FormStatus.Value = "EDIT" Then

                Dim qry As String = ""
                qry += "UPDATE [PSR_T_Supplier] SET" & vbCrLf
                qry += "    [SupplierName] = '" & txt_SupplierName.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [SupplierName2] = '" & txt_SupplierNameTax.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [CordinatorName] = '" & txt_CordinatorName.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [SupplierCode] = '" & txt_SupplierCode.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [IDTax] = '" & txt_IDTax.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [Address] = '" & txt_Address.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [Tel] = '" & txt_Phone.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [Fax] = '" & txt_Fax.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [Email] = '" & txt_Email.Text.Trim().Replace("'", "''") & "'," & vbCrLf
                qry += "    [FlagReady] = '" & ddl_status.SelectedValue & "'" & vbCrLf
                qry += "WHERE [SupplierID] = '" & hdf_supplierID.Value & "' " & vbCrLf

                objCon.mqryNoReturn(qry)
                'Save LogsSystem
                Dim objLogs As New ClsSystemLogsInfo
                Dim objLogs_ As New ClsSystemLogsInfo
                objLogs.UserName = Session("pousr")
                objLogs.EventType = "แก้ไขข้อมูล supplier"
                objLogs.sEvent = "แก้ไขข้อมูล supplier " & txt_IDTax.Text.Trim().ToUpper & " - " & txt_SupplierName.Text.Trim()
                objLogs.ModuleName = "Update PSR_T_Supplier"
                objLogs.FunctionName = "btn_Save_Click()"
                objLogs.IPAddress = objLogs_.GetIPAddress

                objCon.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
            End If
            BindGridView()

            ScriptManager.RegisterStartupScript(Me, [GetType](), "myFunction1", "alert('บันทึกข้อมูลสำเร็จ');", True)
        Else
            ScriptManager.RegisterStartupScript(Me, [GetType](), "myFunction1", "alert('กรุณากรอกข้อมูลให้ครบถ้วน');", True)
        End If

    End Sub
    Protected Sub btn_Cancel_Click(ByVal sender As Object, ByVal e As EventArgs)
        Clearform()
    End Sub
    Protected Sub btn_copy_Click(ByVal sender As Object, ByVal e As EventArgs)

        If txt_searchSupplier.Text = "" Then Exit Sub
        If ddl_typeSearch.SelectedValue Is Nothing AndAlso ddl_typeSearch.SelectedValue = "" Then Exit Sub


        Dim qry As String = "
                                SELECT M.AP_CODE ,M.AP_NAME ,M.AP_NAME_TAX ,M.TAX_ADDR1|| M.TAX_ADDR2|| M.TAX_ADDR3 AS ADDRESS 
                                       ,M.TELEPHONE ,M.FAX ,M.ID_CARD AS IDTAX
                                       ,RTRIM(  CASE WHEN TRIM(ATTN_NAME) IS NOT NULL THEN ATTN_NAME || ',' ELSE '' END ||
                                                CASE WHEN TRIM(ATTN_NAME2) IS NOT NULL THEN ATTN_NAME2 || ',' ELSE '' END ||
                                                CASE WHEN TRIM(ATTN_NAME3) IS NOT NULL THEN ATTN_NAME3 || ',' ELSE '' END,
                                                ','
                                              ) AS CORDINATORNAME
                                       ,(SELECT LISTAGG(E_MAIL,',') WITHIN GROUP(ORDER BY AP_CODE) FROM AP_MASTER_EMAIL A WHERE A.AP_CODE = M.AP_CODE ) AS E_MAIL
                                FROM AP_MASTER M
                                WHERE 1 = 1 
                                "
        Select Case ddl_typeSearch.SelectedValue
            Case "1"
                qry += " AND M.AP_CODE = '" & txt_searchSupplier.Text & "' "
            Case "2"
                qry += " AND M.TAX_ID = '" & txt_searchSupplier.Text & "' "
        End Select

        Dim dt_supplier As DataTable = objConOra.GetCallDataTable(qry)

        If dt_supplier.Rows.Count > 0 Then
            Dim dr As DataRow = dt_supplier.Rows(0)
            Clear_text()
            Dim SupplierID As String = chkDuplicateSupplierCode(dr("AP_CODE").ToString())
            If SupplierID <> "" Then
                hdf_supplierID.Value = SupplierID
                ScriptManager.RegisterStartupScript(Me, [GetType](), "myFunction1", "alert('มี Supplier นี้ในระบบแล้ว');", True)

                lbl_form_sta.Text = "สถานะ: แก้ไขข้อมูลผู้ขาย"
                lbl_form_sta.ForeColor = System.Drawing.Color.Orange
                lbl_form_sta2.Text = "สถานะ: แก้ไขข้อมูลผู้ขาย"
                lbl_form_sta2.ForeColor = System.Drawing.Color.Orange
                hdf_FormStatus.Value = "EDIT"
                ddl_status.Enabled = True
            Else

                lbl_form_sta.Text = "สถานะ: เพิ่มผู้ขาย"
                lbl_form_sta.ForeColor = System.Drawing.Color.Green
                lbl_form_sta2.Text = "สถานะ: เพิ่มผู้ขาย"
                lbl_form_sta2.ForeColor = System.Drawing.Color.Green
                hdf_FormStatus.Value = "ADD"
                ddl_status.SelectedIndex = 1
                ddl_status.Enabled = False
            End If

            txt_SupplierCode.Text = dr("AP_CODE").ToString()
            txt_SupplierName.Text = dr("AP_NAME").ToString()
            txt_SupplierNameTax.Text = dr("AP_NAME_TAX").ToString()
            txt_Address.Text = dr("ADDRESS").ToString()
            txt_Phone.Text = dr("TELEPHONE").ToString()
            txt_Fax.Text = dr("FAX").ToString()
            txt_IDTax.Text = dr("IDTAX").ToString()
            txt_CordinatorName.Text = dr("CORDINATORNAME").ToString()
            txt_Email.Text = dr("E_MAIL").ToString()



        End If



    End Sub
    Protected Sub btn_ResetPW_Click(ByVal sender As Object, ByVal e As EventArgs)

        ScriptManager.RegisterStartupScript(Me, [GetType](), "closePasswordModal", "closePasswordModal();", True)

    End Sub
    Protected Sub btn_ChangePw_Click(ByVal sender As Object, ByVal e As EventArgs)

        ScriptManager.RegisterStartupScript(Me, [GetType](), "openPasswordModal", "openPasswordModal();", True)

    End Sub
    Protected Sub btn_clear_Click(ByVal sender As Object, ByVal e As EventArgs)
        'Clearform()

    End Sub
    Protected Sub ddl_typeSearch_OnChanged(sender As Object, e As EventArgs)
        Dim selectedValue As String = ddl_typeSearch.SelectedValue

        Select Case selectedValue
            Case "1"
                ' Supplier Code ถูกเลือก
                ' เพิ่มโค้ดที่ต้องการให้ทำงานที่นี่

            Case "2"
                ' ID Tax ถูกเลือก
        End Select
    End Sub
    Private Sub Clearform()
        lbl_form_sta.Text = "สถานะ: -"
        lbl_form_sta.ForeColor = System.Drawing.Color.Black
        lbl_form_sta2.Text = "สถานะ: -"
        lbl_form_sta2.ForeColor = System.Drawing.Color.Black

        Clear_text()

        ddl_status.SelectedIndex = 0
        ddl_status.Enabled = True
        txt_IDTax.Enabled = True

        FormSearch.Visible = False  ' ซ่อน
        FormDetail.Visible = False  ' ซ่อน
        FormSave.Visible = False  ' ซ่อน

        ScriptManager.RegisterStartupScript(Me, [GetType](), "setFocus", "scrollToTop();", True)

    End Sub
    Private Sub Clear_text()

        hdf_FormStatus.Value = ""
        hdf_supplierID.Value = ""

        txt_Usrname.Text = ""
        txt_PW.Text = ""

        txt_SupplierName.Text = ""
        txt_SupplierNameTax.Text = ""
        txt_CordinatorName.Text = ""
        txt_SupplierCode.Text = ""
        txt_IDTax.Text = ""
        txt_Address.Text = ""
        txt_Phone.Text = ""
        txt_Fax.Text = ""
        txt_Email.Text = ""

    End Sub
    Protected Function chkform_detail() As Boolean

        Dim isValid As Boolean = True

        If String.IsNullOrWhiteSpace(txt_SupplierName.Text) Then
            txt_SupplierName.CssClass = "info-value require error"
            isValid = False
        Else
            txt_SupplierName.CssClass = "info-value "
        End If

        ' ชื่อจดทะเบียนบริษัท
        If String.IsNullOrWhiteSpace(txt_SupplierNameTax.Text) Then
            txt_SupplierNameTax.CssClass = "info-value require error"
            isValid = False
        Else
            txt_SupplierNameTax.CssClass = "info-value "
        End If

        ' ชื่อติดต่อ
        If String.IsNullOrWhiteSpace(txt_CordinatorName.Text) Then
            txt_CordinatorName.CssClass = "info-value require error"
            isValid = False
        Else
            txt_CordinatorName.CssClass = "info-value "
        End If

        ' รหัสผู้ขาย
        If String.IsNullOrWhiteSpace(txt_SupplierCode.Text) Then
            txt_SupplierCode.CssClass = "info-value require error"
            isValid = False
        Else
            txt_SupplierCode.CssClass = "info-value "
        End If

        ' เลขที่ผู้เสียภาษี
        If String.IsNullOrWhiteSpace(txt_IDTax.Text) Then
            txt_IDTax.CssClass = "info-value require error"
            isValid = False
        Else
            txt_IDTax.CssClass = "info-value "
        End If

        ' ที่อยู่
        If String.IsNullOrWhiteSpace(txt_Address.Text) Then
            txt_Address.CssClass = "info-value require error"
            isValid = False
        Else
            txt_Address.CssClass = "info-value "
        End If

        ' เบอร์โทร
        If String.IsNullOrWhiteSpace(txt_Phone.Text) Then
            txt_Phone.CssClass = "info-value require error"
            isValid = False
        Else
            txt_Phone.CssClass = "info-value "
        End If

        ' อีเมล
        If String.IsNullOrWhiteSpace(txt_Email.Text) Then
            txt_Email.CssClass = "info-value require error"
            isValid = False
        Else
            txt_Email.CssClass = "info-value "
        End If

        ' สถานะ (DropDown)
        If ddl_status.SelectedIndex = 0 Then
            ddl_status.CssClass = "form-select require error"
            isValid = False
        Else
            ddl_status.CssClass = "form-select "
        End If

        Return isValid

    End Function
    Protected Function chkDuplicateSupplierCode(ByVal SupplierCode As String) As String
        Dim qry As String = " SELECT [SupplierID] FROM [PSR_T_Supplier] WHERE [SupplierCode] = '" & SupplierCode & "' "
        Dim return_str = objCon.mqryReturn(qry)

        Return return_str
    End Function
    Protected Function chkDuplicateUsername(ByVal username As String) As Boolean
        Dim qry As String = " SELECT [ID] FROM [PSR_M_User] WHERE [Usrname] = '" & username & "' "
        Dim return_str = objCon.mqryReturn(qry)

        If return_str = "" Then Return False

        Return True
    End Function
    Protected Function GetFilteredRowCountWithoutPage() As Integer
        Dim selectedRowsOnPage As Integer = 0
        For Each key In grid.GetCurrentPageRowValues("SupplierID")
            If grid.Selection.IsRowSelectedByKey(key) Then
                selectedRowsOnPage += 1
            End If
        Next key
        Return grid.Selection.FilteredCount - selectedRowsOnPage
    End Function

End Class