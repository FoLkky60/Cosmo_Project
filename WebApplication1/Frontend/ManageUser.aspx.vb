Imports DevExpress.Web
Public Class ManageUser
    Inherits System.Web.UI.Page
    Dim objCon As New clsConnDbSQL
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("pousr") = "big"
        If Not IsPostBack Then
            Clearform()
        End If

        BindGridView()

    End Sub
    Private Sub BindGridView()

        Dim str_SQL = " 
                SELECT ROW_NUMBER() OVER (ORDER BY [ID]) AS Row ,[ID]
                    ,[Usrname]
                    ,[PW]
                    ,[UsrType]
                    ,[Detail]
                    ,[Supplierid]
                    ,[FNameT] + ' ' + [LNameT] AS FullnameT
                    ,[FNameE]
                    ,[PositionT]
                    ,[Tel]
                    ,[FlagActive]
                    --,CASE WHEN [FlagActive] = 1 THEN 'ใช้งาน' ELSE 'ระงับการใช้งาน' END AS Active_sta 
                    ,[FlagSupplierPull]
                    ,[PersonCode]
                    ,[UserRemark]
                FROM [SupplyChain].[dbo].[PSR_M_User] 
                where [UsrType] in ('Admin','Administrator')
                ORDER BY [FlagActive] desc ,[Usrname] asc
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
        If e.RowType <> DevExpress.Web.GridViewRowType.Data Then Return

        'Dim values() As Object = CType(grid.GetRowValues(e.VisibleIndex, New String() {"FlagActive"}), Object())
        Dim flagActive As Object = grid.GetRowValues(e.VisibleIndex, "FlagActive")
        Dim idTax As Object = grid.GetRowValues(e.VisibleIndex, "ID")

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

        If e.DataColumn.FieldName = "FlagActive" Then
            Dim value As Boolean = Convert.ToBoolean(e.CellValue)
            If value Then
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
                                        New String() {
                                            "ID", "Usrname", "PW", "UsrType", "Detail",
                                            "Supplierid", "FullnameT", "FNameE", "PositionT",
                                            "Tel", "FlagActive", "FlagSupplierPull", "PersonCode", "UserRemark"
                                        }
                                    ), Object())
        If values(0).ToString() <> "" AndAlso values(1).ToString() <> "" Then
            hdf_FormStatus.Value = "EDIT"
            lbl_form_sta.Text = "สถานะ: แก้ไขข้อมูลผู้ใช้งาน"
            lbl_form_sta.ForeColor = System.Drawing.Color.Orange
            hdf_userID.Value = values(0).ToString()
            lbl_Usrname.Text = values(1).ToString()
            txt_Usrname.Text = values(1).ToString()

            lbl_PW.Text = values(2).ToString()
            txt_PW.Text = values(2).ToString()

            lbl_FullnameT.Text = values(6).ToString()
            Dim n = values(6).ToString().Trim().Split(" "c)
            If n IsNot Nothing AndAlso n.Length >= 2 Then
                txt_FnameT.Text = n(0)
                txt_LnameT.Text = n(1)
            Else
                txt_FnameT.Text = ""
                txt_LnameT.Text = ""
            End If

            lbl_FnameE.Text = values(7).ToString()
            txt_FnameE.Text = values(7).ToString()
            lbl_PositionT.Text = values(8).ToString()
            txt_PositionT.Text = values(8).ToString()

            lbl_Phone.Text = values(9).ToString()
            txt_Phone.Text = values(9).ToString()

            Dim sta_a = values(10).ToString()
            If sta_a = "True" Then
                ddl_status.SelectedIndex = 1
            Else
                ddl_status.SelectedIndex = 2
            End If

            ddl_status.Enabled = True
            txt_Usrname.Enabled = False  ' ไม่ใช้แก้ไข username
            FormDetail.Style("display") = "block" ' แสดง

            Dim scr_str As String = " focusAndScroll(); "
            ScriptManager.RegisterStartupScript(Me, [GetType](), "setFocus", "focusAndScroll();", True)

        End If

    End Sub
    Protected Sub btn_NewUser_Click(ByVal sender As Object, ByVal e As EventArgs)

        Clearform()
        lbl_form_sta.Text = "สถานะ: เพิ่มผู้ใช้งาน"
        lbl_form_sta.ForeColor = System.Drawing.Color.Green
        hdf_FormStatus.Value = "ADD"
        ddl_status.SelectedIndex = 1
        ddl_status.Enabled = False

        FormDetail.Style("display") = "block" ' แสดง
    End Sub
    Protected Sub btn_Save_Click(ByVal sender As Object, ByVal e As EventArgs)

        If hdf_FormStatus.Value = "" Then Exit Sub

        If chkform_detail() Then
            If hdf_FormStatus.Value = "ADD" Then
                If chkDuplicateUsername(txt_Usrname.Text.Trim()) = True Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "myFunction1", "alert('Username นีัมีการใช้งานแล้ว  ');", True)
                Else
                    Dim qry As String = ""
                    qry += "INSERT INTO [PSR_M_User] " & vbCrLf
                    qry += "       ([Usrname] " & vbCrLf
                    qry += "       ,[PW] " & vbCrLf
                    qry += "       ,[UsrType] " & vbCrLf
                    qry += "       ,[FNameT] " & vbCrLf
                    qry += "       ,[LNameT] " & vbCrLf
                    qry += "       ,[FNameE] " & vbCrLf
                    qry += "       ,[PositionT] " & vbCrLf
                    qry += "       ,[Tel] " & vbCrLf
                    qry += "       ,[FlagActive]) " & vbCrLf
                    qry += "VALUES " & vbCrLf
                    qry += "       ('" & txt_Usrname.Text.Trim().ToUpper & "' " & vbCrLf
                    qry += "       ,'" & txt_PW.Text.Trim() & "' " & vbCrLf
                    qry += "       ,'Admin' " & vbCrLf
                    qry += "       ,'" & txt_FnameT.Text.Trim() & "' " & vbCrLf
                    qry += "       ,'" & txt_LnameT.Text.Trim() & "' " & vbCrLf
                    qry += "       ,'" & txt_FnameE.Text.Trim() & "' " & vbCrLf
                    qry += "       ,'" & txt_PositionT.Text.Trim() & "' " & vbCrLf
                    qry += "       ,'" & txt_Phone.Text.Trim() & "' " & vbCrLf
                    qry += "       ,'" & ddl_status.SelectedValue & "') " & vbCrLf

                    objCon.mqryNoReturn(qry)
                    Clearform()
                    'Save LogsSystem
                    Dim objLogs As New ClsSystemLogsInfo
                    Dim objLogs_ As New ClsSystemLogsInfo
                    objLogs.UserName = Session("pousr")
                    objLogs.EventType = "เพิ่มข้อมูล user"
                    objLogs.sEvent = "เพิ่มข้อมูล user " & txt_Usrname.Text.Trim().ToUpper
                    objLogs.ModuleName = "INSERT PSR_M_User"
                    objLogs.FunctionName = "btn_Save_Click()"
                    objLogs.IPAddress = objLogs_.GetIPAddress

                    objCon.mqryNoReturn(objLogs_.SqlCmd_Insert(objLogs))
                End If


            ElseIf hdf_FormStatus.Value = "EDIT" Then

                Dim qry As String = ""
                qry += "UPDATE [PSR_M_User] SET " & vbCrLf
                qry += "       [PW] = '" & txt_PW.Text.Trim() & "'," & vbCrLf
                qry += "       [UsrType] = 'Admin'," & vbCrLf
                qry += "       [FNameT] = '" & txt_FnameT.Text.Trim() & "'," & vbCrLf
                qry += "       [LNameT] = '" & txt_LnameT.Text.Trim() & "'," & vbCrLf
                qry += "       [FNameE] = '" & txt_FnameE.Text.Trim() & "'," & vbCrLf
                qry += "       [PositionT] = '" & txt_PositionT.Text.Trim() & "'," & vbCrLf
                qry += "       [Tel] = '" & txt_Phone.Text.Trim() & "'," & vbCrLf
                qry += "       [FlagActive] = '" & ddl_status.SelectedValue & "' " & vbCrLf
                qry += "WHERE [Usrname] = '" & hdf_userID.Value & "' " & vbCrLf

                objCon.mqryNoReturn(qry)
                'Save LogsSystem
                Dim objLogs As New ClsSystemLogsInfo
                Dim objLogs_ As New ClsSystemLogsInfo
                objLogs.UserName = Session("pousr")
                objLogs.EventType = "แก้ไขข้อมูล user"
                objLogs.sEvent = "แก้ไขข้อมูล user " & txt_Usrname.Text.Trim().ToUpper
                objLogs.ModuleName = "Update PSR_M_User"
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

    Private Sub Clearform()
        lbl_form_sta.Text = "สถานะ: -"
        lbl_form_sta.ForeColor = System.Drawing.Color.Black
        hdf_FormStatus.Value = ""
        hdf_userID.Value = ""

        lbl_Usrname.Text = ""
        lbl_PW.Text = ""
        lbl_FullnameT.Text = ""
        lbl_FnameE.Text = ""
        lbl_PositionT.Text = ""
        lbl_Phone.Text = ""

        txt_Usrname.Text = ""
        txt_PW.Text = ""
        txt_FnameT.Text = ""
        txt_LnameT.Text = ""
        txt_FnameE.Text = ""
        txt_PositionT.Text = ""
        txt_Phone.Text = ""

        ddl_status.SelectedIndex = 0
        ddl_status.Enabled = True
        txt_Usrname.Enabled = True

        FormDetail.Style("display") = "none" ' ซ่อน

        ScriptManager.RegisterStartupScript(Me, [GetType](), "setFocus", "scrollToTop();", True)

    End Sub

    Protected Function chkform_detail() As Boolean

        If String.IsNullOrWhiteSpace(txt_Usrname.Text) Then Return False
        If String.IsNullOrWhiteSpace(txt_PW.Text) Then Return False
        If String.IsNullOrWhiteSpace(txt_FnameT.Text) Then Return False
        If String.IsNullOrWhiteSpace(txt_LnameT.Text) Then Return False
        If String.IsNullOrWhiteSpace(txt_FnameE.Text) Then Return False
        If String.IsNullOrWhiteSpace(txt_PositionT.Text) Then Return False
        If String.IsNullOrWhiteSpace(txt_Phone.Text) Then Return False
        If ddl_status.SelectedIndex = 0 Then Return False

        Return True

    End Function
    Protected Function chkDuplicateUsername(ByVal username As String) As Boolean
        Dim qry As String = " SELECT [ID] FROM [PSR_M_User] WHERE [Usrname] = '" & username & "' "
        Dim return_str = objCon.mqryReturn(qry)

        If return_str = "" Then Return False

        Return True
    End Function
    Protected Function GetFilteredRowCountWithoutPage() As Integer
        Dim selectedRowsOnPage As Integer = 0
        For Each key In grid.GetCurrentPageRowValues("ID")
            If grid.Selection.IsRowSelectedByKey(key) Then
                selectedRowsOnPage += 1
            End If
        Next key
        Return grid.Selection.FilteredCount - selectedRowsOnPage
    End Function
End Class