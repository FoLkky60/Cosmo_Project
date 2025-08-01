Imports Microsoft.VisualBasic

Public Class clsPO

    Public Function GetSupplierID(ByVal SupplierName As String) As String

        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select SupplierID  from PSR_T_Supplier  where SupplierName = '" & SupplierName & "'"

        Return objMyconM.mGetData(qry)

    End Function

    Public Function GetSupplierIDByPOID(ByVal POID As String) As String

        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select IDSupplier  from PSR_T_Po where poid = '" & POID & "'"

        Return objMyconM.mGetData(qry)

    End Function

    Public Function GetTaxID(ByVal Supplierid As String) As String

        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select IDTax  from PSR_T_Supplier  where Supplierid = '" & Supplierid & "'"

        Return objMyconM.mGetData(qry)

    End Function

    Public Function GetFlagSentEmail(ByVal POID As String) As String

        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select FlagSentEmail  from PSR_T_Po where PoID ='" & POID & "'"

        Return objMyconM.mGetData(qry)

    End Function

    Public Function GetFileName(ByVal PoID As String) As String
        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select PoFile  from psr_t_po where PoID ='" & PoID & "'"

        Return objMyconM.mGetData(qry)

    End Function
    Public Function GetPOname(ByVal PoID As String) As String
        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select PoName  from PSR_T_Po where PoID ='" & PoID & "'"

        Return objMyconM.mGetData(qry)

    End Function
    Public Function GetPOId(ByVal PoName As String) As String
        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select PoID  from PSR_T_Po where PoName ='" & PoName & "'"

        Return objMyconM.mGetData(qry)

    End Function

    Public Function GetMaxPOID() As String
        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select Max(PoID)  from PSR_T_Po "

        Return objMyconM.mGetData(qry)

    End Function

    Public Function GetStaffName(ByVal Staffusr As String) As String

        'Staffusr : ชื่อผู้ใช้งาน

        Dim objMyconM As New clsConnDbSQL
        Dim qry As String = ""

        qry = "select top 1 Detail from PSR_M_User where Usrname = '" & Staffusr & "' "
        Return objMyconM.mGetData(qry)

    End Function

    Public Function GetMaxResponseNo(ByVal POid As String) As Integer
        Dim maxid As Integer = 1
        Dim qry As String = ""
        Dim objMyconM As New clsConnDbSQL
        qry = "select MAX(ResponseTimeNo )+1 as MaxNo from PSR_T_Po_Response_Time where PoID ='" & POid & "'"

        If objMyconM.mGetData(qry) = Nothing Then
            Return maxid
        Else
            Return objMyconM.mGetData(qry)
        End If

    End Function 'หาจำนวนครั้งล่าสุดของการตอบรับเอกสาร

    Public Function GetLastResponseNo(ByVal POid As String) As Integer
        Dim maxid As Integer = 1
        Dim qry As String = ""
        Dim objMyconM As New clsConnDbSQL
        qry = "select MAX(ResponseTimeNo ) as MaxNo from PSR_T_Po_Response_Time where PoID ='" & POid & "'"

        If objMyconM.mGetData(qry) = Nothing Then
            Return maxid
        Else
            Return objMyconM.mGetData(qry)
        End If

    End Function 'หาจำนวนครั้งล่าสุดของการตอบรับเอกสาร

#Region "Insert Sent Email / Per Hours not mor 100 Mail"

    Public Sub mInsertCountSentMail(ByVal MailAddress As String, ByVal MailStaffName As String, ByVal MailDetail As String)

        Dim objMycon As New clsConnDbSQL
        Dim qry As String = ""

        qry = " INSERT INTO [PSR_T_SentMailTime] " & vbCrLf
        qry += "            ( " & vbCrLf
        qry += " 			   [SentMailAddresss] " & vbCrLf
        qry += " 			   ,[SentMailDateTime] " & vbCrLf
        qry += " 			   ,[SentMailStaff] " & vbCrLf
        qry += " 			   ,[SentMailDetail] " & vbCrLf
        qry += " 			   ,[SentMailNum] " & vbCrLf
        qry += "            ) " & vbCrLf
        qry += "      VALUES " & vbCrLf
        qry += "            ( " & vbCrLf
        qry += " 			   '" & MailAddress & "'--<SentMailAddresss, nvarchar(100),> " & vbCrLf
        qry += " 			   ,getdate() --<SentMailDateTime, datetime,> " & vbCrLf
        qry += " 			   ,'" & MailStaffName & "'--<SentMailStaff, nvarchar(50),> " & vbCrLf
        qry += " 			   ,'" & MailDetail & "'--<SentMailDetail, nvarchar(200),> " & vbCrLf
        qry += " 			   ,1--<SentMailNum, int,> " & vbCrLf
        qry += "            ) " & vbCrLf

        objMycon.mqryNoReturn(qry)

    End Sub 'Insert การ Sent ในแต่ละครั้ง ให้บันทึกข้อมูลใน Table เพื่อนับจำนวน E-mail ที่เข้ามาในแต่ละชั่วโมง

    Public Function GetCountSentMail()

        Dim objMycon As New clsConnDbSQL
        Dim qry As String = ""
        qry = " select count(TimeSent) from( " & vbCrLf
        qry += " select   " & vbCrLf
        qry += " SUBSTRING (CONVERT(nvarchar,sentMailDatetime,108),1,2) as TimeSent " & vbCrLf
        qry += " from PSR_T_SentMailTime " & vbCrLf
        qry += " where  " & vbCrLf
        qry += " CONVERT(nvarchar,sentMailDatetime,111) = CONVERT(nvarchar,getdate(),111)  --Day " & vbCrLf
        qry += " and SUBSTRING (CONVERT(nvarchar,sentMailDatetime,108),1,2) =SUBSTRING (CONVERT(nvarchar,getdate(),108),1,2) --Time " & vbCrLf
        qry += " ) as tbl " & vbCrLf
        qry += " group by TimeSent " & vbCrLf


        If objMycon.mGetData(qry) = Nothing Then
            Return 0
            'Return 100 'For Test
        Else
            Return objMycon.mGetData(qry)
            'Return 100 'For Test
        End If

    End Function 'นับจำนวนการส่ง Mail

    Function QryUpdateUnitSentMail(ByVal PoID As String) As String
        Dim qry As String = ""

        qry = " update PSR_T_Po  " & vbCrLf
        qry += " set  " & vbCrLf
        qry += " UnitSentEmail = (UnitSentEmail+1)  " & vbCrLf
        qry += " where PoID = '" & PoID & "' " & vbCrLf

        Return qry
    End Function 'นับจำนวนการ Sent Mail

    Function QryUpdateUnitSentMailCOA(ByVal PoID As String) As String
        Dim qry As String = ""

        qry = " update PSR_T_Po  " & vbCrLf
        qry += " set  " & vbCrLf
        qry += " UnitSentEmailCOA  = (UnitSentEmailCOA +1)  " & vbCrLf
        qry += " where PoID = '" & PoID & "' " & vbCrLf

        Return qry
    End Function 'นับจำนวนการ Sent Mail

#End Region

    Function QryResponsePobyItem(ByVal sPoName As String, Optional ByVal bFlagConfirm As Boolean = False, Optional ByVal nResponseTime As Integer = 0) As String
        Dim qry As String = ""
        Dim objmycon As New clsConnDbSQL

        qry = "select COUNT(*) from PSR_T_Po_Response where POId = '" & Me.GetPOId(sPoName) & "' and POTimeItemNo = '" & nResponseTime & "'"
        Dim nCntHaveItem As Integer = objmycon.mGetData(qry)

        If bFlagConfirm = False Then

            '----------กรณียังไม่ตอบรับ
            qry = "  select    " & vbCrLf
            qry += "             po.PoID    " & vbCrLf
            '----------------------------------------------------------------------------------------
            qry += "              -- //pt " & vbCrLf
            qry += "                 ,pt.[ID]   " & vbCrLf
            qry += "           	     ,pt.[PoNo]   " & vbCrLf
            qry += "                 ,pt.[ItemNo]     " & vbCrLf
            qry += "                 ,pt.[FG_CODE]   " & vbCrLf
            qry += "                 ,pt.[FG_DET]   " & vbCrLf
            qry += "                 ,CONVERT(nvarchar,pt.[DELIVERY_DATE],103) as [DELIVERY_DATE]   " & vbCrLf
            qry += "                 ,CONVERT(nvarchar,DateAdd(day,3,pt.[DELIVERY_DATE]),103) as [DELIVERY_DATE_COA]   " & vbCrLf
            qry += "                 ,pt.[UMS_CODE]   " & vbCrLf
            qry += "                 ,isnull([Qty],0) [Qty]   " & vbCrLf
            qry += "                 ,pt.[Remark]    " & vbCrLf
            qry += "                 ,pt.[FlagSDS_E]    " & vbCrLf
            qry += "                 ,pt.[FlagSDS_T]    " & vbCrLf
            qry += "                 ,pt.[FlagTDS_E]   " & vbCrLf
            qry += "                 ,pt.[FlagTDS_T]   " & vbCrLf
            qry += "                 ,pt.[FlagCOA_E]   " & vbCrLf
            qry += "                 ,pt.[FlagCOA_T]   " & vbCrLf
            qry += "                 ,pt.[SDS_File_Eng]    " & vbCrLf
            qry += "                 ,pt.[SDS_File_Thai]    " & vbCrLf
            qry += "                 ,pt.[TDS_File_Eng]    " & vbCrLf
            qry += "                 ,pt.[TDS_File_Thai]    " & vbCrLf
            qry += "                 ,pt.[COA_File_Eng]    " & vbCrLf
            qry += "                 ,pt.[COA_File_Thai]   " & vbCrLf
            qry += "                 ,pt.[FlagSentCOA_T]  " & vbCrLf
            qry += "                 ,pt.[FlagSentCOA_E]  " & vbCrLf
            qry += "                 ,pt.[FlagReceiveDoc]  " & vbCrLf
            '----------------------------------------------------------------------------------------
            qry += "             ,'1' as POResponse   " & vbCrLf
            qry += "             ,convert(nvarchar,pt.DELIVERY_DATE,103) as PODateDelay   " & vbCrLf
            qry += "             ,'' as PORemark   " & vbCrLf
            qry += "             from cosmodb3.dbo.PSR_T_Po as po   " & vbCrLf
            qry += "             ----------------------------------  " & vbCrLf
            qry += "             left outer join (   " & vbCrLf
            qry += "             SELECT [ID]   " & vbCrLf
            qry += "           	    ,[PoNo]   " & vbCrLf
            qry += "                 ,[ItemNo]     " & vbCrLf
            qry += "                 ,[FG_CODE]   " & vbCrLf
            qry += "                 ,[FG_DET]   " & vbCrLf
            qry += "                 ,CONVERT(nvarchar,DELIVERY_DATE,103) as [DELIVERY_DATE]   " & vbCrLf
            qry += "                 ,CONVERT(nvarchar,DateAdd(day,3,[DELIVERY_DATE]),103) as [DELIVERY_DATE_COA]  " & vbCrLf
            qry += "                 ,[UMS_CODE]   " & vbCrLf
            qry += "                 ,[Qty]   " & vbCrLf
            qry += "                 ,[Remark]    " & vbCrLf
            qry += "                 ,[FlagSDS_E]   " & vbCrLf
            qry += "                 ,[FlagSDS_T]   " & vbCrLf
            qry += "                 ,[FlagTDS_E]  " & vbCrLf
            qry += "                 ,[FlagTDS_T]  " & vbCrLf
            qry += "                 ,[FlagCOA_E]  " & vbCrLf
            qry += "                 ,[FlagCOA_T]  " & vbCrLf
            qry += "                 ,[SDS_File_Eng]   " & vbCrLf
            qry += "                 ,[SDS_File_Thai]   " & vbCrLf
            qry += "                 ,[TDS_File_Eng]   " & vbCrLf
            qry += "                 ,[TDS_File_Thai]   " & vbCrLf
            qry += "                 ,[COA_File_Eng]   " & vbCrLf
            qry += "                 ,[COA_File_Thai]  " & vbCrLf
            qry += "                 ,[FlagSentCOA_T] " & vbCrLf
            qry += "                 ,[FlagSentCOA_E] " & vbCrLf
            qry += "                 ,[FlagReceiveDoc] " & vbCrLf
            qry += "             FROM cosmodb3.dbo.[PSR_T_PO_Item]   " & vbCrLf
            qry += "             ) as pt   " & vbCrLf
            qry += "             on po.PoName =replace (pt.poNo,'/','_')  " & vbCrLf
            qry += "             --------------------------------     " & vbCrLf
            qry += "             where   " & vbCrLf
            qry += "             Po.PoName = '" & sPoName & "'  " & vbCrLf

            If nCntHaveItem > 0 Then
                If nResponseTime > 1 Then qry += "  and ppr.POTimeItemNo = " & nResponseTime - 1 & " " & vbCrLf
            End If

        Else


            '----------กรณีตอบรับแล้ว
            qry = " select   " & vbCrLf
            qry += "            po.PoID   " & vbCrLf
            qry += "                 ,pt.ID  " & vbCrLf
            qry += "           	     ,pt.[PoNo]   " & vbCrLf
            qry += "                 ,isnull(pt.ItemNo ,ROW_NUMBER () over(order By po.poid)) as ItemNo " & vbCrLf
            qry += "                 ,pt.[FG_CODE]   " & vbCrLf
            qry += "                 ,pt.[FG_DET]   " & vbCrLf
            qry += "                 ,pt. [DELIVERY_DATE]   " & vbCrLf
            qry += "                 ,pt.[DELIVERY_DATE_COA]  " & vbCrLf
            qry += "                 ,pt.[UMS_CODE]   " & vbCrLf
            qry += "                 ,pt.[Qty]   " & vbCrLf
            qry += "                 ,pt.[Remark]    " & vbCrLf
            qry += "                 ,pt.[FlagSDS_E]   " & vbCrLf
            qry += "                 ,pt.[FlagSDS_T]   " & vbCrLf
            qry += "                 ,pt.[FlagTDS_E]  " & vbCrLf
            qry += "                 ,pt.[FlagTDS_T]  " & vbCrLf
            qry += "                 ,pt.[FlagCOA_E]  " & vbCrLf
            qry += "                 ,pt.[FlagCOA_T]  " & vbCrLf
            qry += "                 ,pt.[SDS_File_Eng]   " & vbCrLf
            qry += "                 ,pt.[SDS_File_Thai]   " & vbCrLf
            qry += "                 ,pt.[TDS_File_Eng]   " & vbCrLf
            qry += "                 ,pt.[TDS_File_Thai]   " & vbCrLf
            qry += "                 ,pt.[COA_File_Eng]   " & vbCrLf
            qry += "                 ,pt.[COA_File_Thai]  " & vbCrLf
            qry += "                 ,pt.[FlagSentCOA_T] " & vbCrLf
            qry += "                 ,pt.[FlagSentCOA_E] " & vbCrLf
            qry += "                 ,pt.[FlagReceiveDoc] " & vbCrLf
            qry += "            ,ppr.POResponse  " & vbCrLf
            qry += "            ,convert(nvarchar,ppr.PODateDelay ,103) as PODateDelay  " & vbCrLf
            qry += "            ,ppr.PORemark  " & vbCrLf
            qry += "            from cosmodb3.dbo.PSR_T_Po as po  " & vbCrLf
            qry += "            ---------------------------------- " & vbCrLf
            qry += "            left outer join (  " & vbCrLf
            qry += "            SELECT [ID]  " & vbCrLf
            qry += "          	    ,[PoNo]  " & vbCrLf
            qry += "                ,[ItemNo]    " & vbCrLf
            qry += "                ,[FG_CODE]  " & vbCrLf
            qry += "                ,[FG_DET]  " & vbCrLf
            qry += "                ,CONVERT(nvarchar,[DELIVERY_DATE],103) as [DELIVERY_DATE]  " & vbCrLf
            qry += "                ,CONVERT(nvarchar,DateAdd(day,3,[DELIVERY_DATE]),103) as [DELIVERY_DATE_COA]  " & vbCrLf
            qry += "                ,[UMS_CODE]  " & vbCrLf
            qry += "                ,[Qty]  " & vbCrLf
            qry += "                ,[Remark]   " & vbCrLf
            qry += "                ,[FlagSDS_E]   " & vbCrLf
            qry += "                ,[FlagSDS_T]   " & vbCrLf
            qry += "                ,[FlagTDS_E]  " & vbCrLf
            qry += "                ,[FlagTDS_T]  " & vbCrLf
            qry += "                ,[FlagCOA_E]  " & vbCrLf
            qry += "                ,[FlagCOA_T]  " & vbCrLf
            qry += "                ,[SDS_File_Eng]   " & vbCrLf
            qry += "                ,[SDS_File_Thai]   " & vbCrLf
            qry += "                ,[TDS_File_Eng]   " & vbCrLf
            qry += "                ,[TDS_File_Thai]   " & vbCrLf
            qry += "                ,[COA_File_Eng]   " & vbCrLf
            qry += "                ,[COA_File_Thai]  " & vbCrLf
            qry += "                ,[FlagSentCOA_T] " & vbCrLf
            qry += "                ,[FlagSentCOA_E] " & vbCrLf
            qry += "                ,[FlagReceiveDoc] " & vbCrLf
            qry += "            FROM cosmodb3.dbo.[PSR_T_PO_Item]  " & vbCrLf
            qry += "            ) as pt  " & vbCrLf
            qry += "            on po.PoName =replace (pt.poNo,'/','_')   " & vbCrLf
            qry += "            ---------------------------------- " & vbCrLf
            qry += "            left outer join  " & vbCrLf
            qry += "            ( " & vbCrLf
            qry += "             select * from cosmodb3.dbo.PSR_T_Po_Response            " & vbCrLf
            qry += "            ) ppr " & vbCrLf
            qry += "            on po.poid =ppr.POId " & vbCrLf

            Dim qrycheck_haveItem As String = "select  COUNT(*) from PSR_T_PO_Item where PONo ='" & Replace(sPoName, "_", "/") & "'" & vbCrLf
            If objmycon.mGetData(qrycheck_haveItem) > 0 Then
                qry += "            and pt.ItemNo = ppr.POItem  " & vbCrLf
            End If

            qry += "            ---------------------------------- " & vbCrLf
            qry += "            where  " & vbCrLf
            qry += "            Po.PoName = '" & sPoName & "' " & vbCrLf


            Dim qrycheck As String = "select  COUNT(*) from cosmodb3.dbo.PSR_T_Po_Response where POId ='" & Me.GetPOId(sPoName) & "'" & vbCrLf
            If objmycon.mGetData(qrycheck) > 0 Then
                qry += "        and  ( select max(POTimeItemNo ) from cosmodb3.dbo.PSR_T_Po_Response  where POId =ppr.POId) = ppr.POTimeItemNo " & vbCrLf
                ' If nResponseTime > 1 Then qry += "  and ppr.POTimeItemNo = " & nResponseTime - 1 & " " & vbCrLf
            End If

        End If

        Return qry

    End Function

    '## ตรวจสอบกรณีไม่มี Item Po ในระบบ Po Online ให้ return 0
    Public Function ChkHaveItemPOInOnline(ByVal sPono As String) As String

        Dim objMycon As New clsConnDbSQL

        Dim qry As String = ""
        qry = "select COUNT(*) from PSR_T_Po_Item where PONo = REPLACE ('" & sPono & "','_','/')"

        If objMycon.mGetData(qry) Is Nothing Then
            Return 0
        End If

        Return objMycon.mGetData(qry)

    End Function

#Region "UploadFile"

    'Update COA / SDS / TDS
    Public Sub UpdateSDS(ByVal sFileName As String, ByVal PoNo As String, ByVal sItemno As String)
        Dim objMycon As New clsConnDbSQL
        Dim qry As String = ""

        qry = " UPDATE [PSR_T_Po_Item] " & vbCrLf
        qry += "    SET       " & vbCrLf
        qry += "       [SDS_File] = '" & sFileName & "'--<SDS_File, nvarchar(400),> " & vbCrLf
        qry += "  WHERE  " & vbCrLf
        qry += " 	PONo ='" & PoNo & "' " & vbCrLf
        qry += " 	and itemno = '" & sItemno & "' " & vbCrLf

        objMycon.mqryNoReturn(qry)

    End Sub

    Public Sub UpdateTDS(ByVal sFileName As String, ByVal PoNo As String, ByVal sItemno As String)
        Dim objMycon As New clsConnDbSQL
        Dim qry As String = ""

        qry = " UPDATE [PSR_T_Po_Item] " & vbCrLf
        qry += "    SET       " & vbCrLf
        qry += "       [TDS_File] = '" & sFileName & "'--<TDS_File, nvarchar(400),> " & vbCrLf
        qry += "  WHERE  " & vbCrLf
        qry += " 	PONo ='" & PoNo & "' " & vbCrLf
        qry += " 	and itemno = '" & sItemno & "' " & vbCrLf

        objMycon.mqryNoReturn(qry)

    End Sub

    Public Sub UpdateCOA(ByVal sFileName As String, ByVal PoNo As String, ByVal sItemno As String)
        Dim objMycon As New clsConnDbSQL
        Dim qry As String = ""

        qry = " UPDATE [PSR_T_Po_Item] " & vbCrLf
        qry += "    SET       " & vbCrLf
        qry += "       [COA_File] = '" & sFileName & "'--<COA_File, nvarchar(400),> " & vbCrLf
        qry += "  WHERE  " & vbCrLf
        qry += " 	PONo ='" & PoNo & "' " & vbCrLf
        qry += " 	and itemno = '" & sItemno & "' " & vbCrLf

        objMycon.mqryNoReturn(qry)

    End Sub

    'ตรวจสอบว่ามีการตอบรับ Po หรือยัง
    Public Function ChkPoResponse(ByVal sPoId As String) As Boolean

        Dim objMycon As New clsConnDbSQL
        Dim qry As String = ""

        qry = " select COUNT(*)  FROM [PSR_T_Po] p  where p.PoID = '" & sPoId & "'    and p.FlagConfirm = 0"

        If objMycon.mGetData(qry) > 0 Then
            Return False
        End If

        Return True

    End Function


#End Region

#Region "LoadTablePo"

    'แสดงรายการ file แนบ COA / TDS / SDS
    'Public Sub LoadAcceptPOFile(ByVal TB As Table, ByVal PoID As String)
    '    Dim objMyConTB As New clsConnDbSQL
    '    If TB Is Nothing Then Exit Sub

    '    Dim qry As String = ""
    '    qry = " select  count(*) from PSR_M_PO_Item where PONo in ( " & vbCrLf
    '    qry += " select replace(poname,'_','/') from PSR_T_Po where PoID ='" & PoID & "' " & vbCrLf
    '    qry += " ) " & vbCrLf
    '    Dim Row As Integer = objMyConTB.mGetData(qry)


    '    TB.Width = 400

    '    Try



    '        Dim lbNo(Row - 1) As Label
    '        Dim tb01(Row - 1) As Table

    '        Dim strHtml(Row - 1) As String

    '        Dim chk01(Row - 1) As RadioButtonList
    '        Dim txt01DelDate(Row - 1) As TextBox
    '        Dim txt02Remark(Row - 1) As TextBox

    '        Dim i As Integer = 0
    '        qry = "   select    " & vbCrLf
    '        qry += "   P.PoID    " & vbCrLf
    '        qry += "   ,P.PoName    " & vbCrLf
    '        qry += "   ,POI.ItemNo   " & vbCrLf
    '        qry += "   ,POI.ItemRef   " & vbCrLf
    '        qry += "   ,POI.Qty  " & vbCrLf
    '        qry += "   ,convert(nvarchar,POI.DELIVERY_DATE,103) as sDELIVERY_DATE   " & vbCrLf
    '        qry += "   ,POI.FlagCOA_T  " & vbCrLf
    '        qry += "   ,POI.FlagCOA_E  " & vbCrLf
    '        qry += "   ,ISNULL(POI.COA_File_Eng,'') as COA_File_Eng  " & vbCrLf
    '        qry += "   ,ISNULL(POI.TDS_File_Eng,'') as TDS_File_Eng  " & vbCrLf
    '        qry += "   ,ISNULL(POI.SDS_File_Eng,'') as SDS_File_Eng  " & vbCrLf
    '        qry += "   ,ISNULL(POI.COA_File_Thai,'') as COA_File_Thai " & vbCrLf
    '        qry += "   ,ISNULL(POI.TDS_File_Thai,'') as TDS_File_Thai  " & vbCrLf
    '        qry += "   ,ISNULL(POI.SDS_File_Thai,'') as SDS_File_Thai  " & vbCrLf
    '        qry += "   from PSR_T_Po P   " & vbCrLf
    '        qry += "   --//----------------  " & vbCrLf
    '        qry += "   , (  " & vbCrLf
    '        qry += "   select * from PSR_T_Po_Item -- where PONo ='SCID15/0001'  " & vbCrLf
    '        'qry += "   where  (flagSDS_E = 1 or FlagTDS_E = 1 or FlagCOA_E = 1)   "
    '        qry += ") Poi  " & vbCrLf
    '        qry += "   --------------------- " & vbCrLf

    '        qry += "  Where P.PoID = '" & PoID & "' " & vbCrLf
    '        qry += "  and p.PoName = replace(POI.PONo ,'/','_')   " & vbCrLf


    '        Dim objMyconM As New clsConnDbSQL
    '        With objMyconM
    '            .mQryReturn2(qry)
    '            While .dr.Read

    '                lbNo(i) = New Label
    '                lbNo(i).ID = "lbNoProperties" & i & TB.ID & ""
    '                lbNo(i).Width = 250
    '                lbNo(i).CssClass = "MainFont"
    '                lbNo(i).Text = " รายการที่  " & .dr("ItemNo").ToString & ".  " & IIf((.dr("FlagCOA_E") = "True" Or .dr("FlagCOA_T") = "True"), "ต้องการเอกสาร COA", "")


    '                Dim sPahtCOA As String = "../Data/COA/"
    '                Dim sPahtTDS As String = "../Data/TDS/"
    '                Dim sPahtSDS As String = "../Data/SDS/"

    '                Dim l1 As String = sPahtCOA & .dr("COA_File_Eng").ToString()
    '                Dim l2 As String = sPahtTDS & .dr("TDS_File_Eng").ToString()
    '                Dim l3 As String = sPahtSDS & .dr("SDS_File_Eng").ToString()
    '                Dim l4 As String = sPahtCOA & .dr("COA_File_Thai").ToString()
    '                Dim l5 As String = sPahtTDS & .dr("TDS_File_Thai").ToString()
    '                Dim l6 As String = sPahtSDS & .dr("SDS_File_Thai").ToString()

    '                strHtml(i) = " <table  width=""150"" border=""1"" cellspacing=""0""> " & vbCrLf
    '                strHtml(i) += "   <tr> " & vbCrLf
    '                strHtml(i) += "     <td bgcolor=""#006699"" style=""border:thin;color:#FFFFFF; height:23px;""><div align=""center""><strong>COA</strong></div></td> " & vbCrLf
    '                'strHtml(i) += "     <td bgcolor=""#006699"" style=""border:thin;color:#FFFFFF; height:23px;""><div align=""center""><strong>TDS</strong></div></td> " & vbCrLf
    '                'strHtml(i) += "     <td bgcolor=""#006699"" style=""border:thin;color:#FFFFFF; height:23px;""><div align=""center""><strong>SDS</strong></div></td> " & vbCrLf
    '                strHtml(i) += "   </tr> " & vbCrLf
    '                strHtml(i) += "   <tr> " & vbCrLf
    '                If .dr("COA_File_Thai").ToString() <> "" Then
    '                    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center""><a href=""" & l4 & """>ภาษาไทย</a></div></td> " & vbCrLf
    '                Else
    '                    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center"">-</div></td> " & vbCrLf
    '                End If
    '                'If .dr("TDS_File_Thai").ToString() <> "" Then
    '                '    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center""><a href=""" & l5 & """>ภาษาไทย</a></div></td> " & vbCrLf
    '                'Else
    '                '    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center"">-</div></td> " & vbCrLf
    '                'End If
    '                'If .dr("SDS_File_Thai").ToString() <> "" Then
    '                '    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center""><a href=""" & l6 & """>ภาษาไทย</a></div></td> " & vbCrLf
    '                'Else
    '                '    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center"">-</div></td> " & vbCrLf
    '                'End If

    '                strHtml(i) += "   </tr> " & vbCrLf
    '                strHtml(i) += "   <tr> " & vbCrLf

    '                If .dr("COA_File_Eng").ToString() <> "" Then
    '                    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center""><a href=""" & l1 & """>English</a></div></td> " & vbCrLf

    '                Else
    '                    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center"">-</div></td> " & vbCrLf
    '                End If
    '                'If .dr("TDS_File_Eng").ToString() <> "" Then
    '                '    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center""><a href=""" & l2 & """>English</a></div></td> " & vbCrLf

    '                'Else
    '                '    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center"">-</div></td> " & vbCrLf
    '                'End If

    '                'If .dr("SDS_File_Eng").ToString() <> "" Then
    '                '    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center""><a href=""" & l3 & """>English</a></div></td> " & vbCrLf

    '                'Else
    '                '    strHtml(i) += "     <td bgcolor=""#FFFFFF"" style=""border:thin;""><div align=""center"">-</div></td> " & vbCrLf
    '                'End If

    '                strHtml(i) += "   </tr> " & vbCrLf
    '                strHtml(i) += " </table> " & vbCrLf

    '                i += 1
    '            End While

    '        End With

    '        'Get ค่าในตาราง

    '        Dim col As Integer = 2

    '        Dim c(Row * col) As TableCell
    '        Dim r(Row) As TableRow

    '        'การสร้าง row/cell ใน table control
    '        For i = 0 To Row - 1
    '            r(i) = New TableRow

    '            'สร้าง cell
    '            For k As Integer = 0 To col - 1
    '                c(k) = New TableCell
    '                c(k).BorderColor = Drawing.Color.Black
    '                c(k).BorderStyle = BorderStyle.Solid
    '                c(k).BorderWidth = 1
    '                c(k).HorizontalAlign = HorizontalAlign.Left

    '                Select Case k

    '                    Case "0"
    '                        'c(k).Controls.Add(lbNo(i))
    '                        c(k).Text = "  -" & lbNo(i).Text
    '                        c(k).HorizontalAlign = HorizontalAlign.Left
    '                        c(k).Width = 250
    '                        c(k).VerticalAlign = VerticalAlign.Middle


    '                    Case "1"
    '                        c(k).Text = strHtml(i)
    '                    Case Else

    '                End Select

    '                'addRow
    '                r(i).Cells.Add(c(k))
    '                '------------------       
    '            Next
    '            '--------------------------
    '            TB.Rows.Add(r(i))
    '        Next
    '        TB.CellSpacing = 0

    '    Catch ex As Exception

    '    End Try

    'End Sub

    'Public Sub LoadAcceptPO(ByVal TB As Table, ByVal row As Integer, ByVal PoID As String)

    '    If TB Is Nothing Then Exit Sub


    '    Dim lbNo(row - 1) As Label
    '    Dim tb01(row - 1) As Table
    '    Dim tb02(row - 1) As Table


    '    Dim chk01(row - 1) As RadioButtonList
    '    Dim txt01DelDate(row - 1) As TextBox
    '    Dim txt02Remark(row - 1) As TextBox

    '    Dim i As Integer = 0
    '    Dim qry As String = ""
    '    qry = " select ResponseTimeNo ,ConfirmID "
    '    qry += " ,case when confirmId like '%ไม่ตอบรับทุกรายการตาม PO%'  then 'ไม่ได้ตามกำหนด PO' else (case when ConfirmId is not NULL then 'ได้ตามกำหนด PO' else '' end ) end  AS [ConfirmIDShot]  " & vbCrLf
    '    'qry += ", 'ครั้งที่  '+ltrim(str(ResponseTimeNo)) +'. '+ (case when confirmId like '%ไม่ตอบรับทุกรายการตาม PO%'  then 'ไม่ได้ตามกำหนด PO' else (case when ConfirmId is not NULL then 'ได้ตามกำหนด PO' else '' end ) end )+' วันที่ ' + CONVERT(nvarchar,ConfirmDate,3) +' '+ CONVERT (nvarchar,ConfirmDate,8) as NO " & vbCrLf

    '    qry += "  , " & vbCrLf
    '    qry += "  ( " & vbCrLf
    '    qry += "  case when ((select COUNT(*) from PSR_T_Po_Response_Time where POId =t.PoID )<2 ) " & vbCrLf
    '    qry += "  then '' " & vbCrLf
    '    qry += "  else  " & vbCrLf
    '    qry += "   'ครั้งที่  '+ ltrim(str(ResponseTimeNo)) +'. ' " & vbCrLf
    '    qry += "  end  " & vbCrLf
    '    qry += "  ) " & vbCrLf
    '    qry += "  + (case when confirmId like '%ไม่ตอบรับทุกรายการตาม PO%'  then 'ไม่ได้ตามกำหนด PO' else (case when ConfirmId is not NULL then 'ได้ตามกำหนด PO' else '' end ) end )+' วันที่ ' + CONVERT(nvarchar,ConfirmDate,3) +' '+ CONVERT (nvarchar,ConfirmDate,8) as NO  " & vbCrLf

    '    qry += " from PSR_T_Po_Response_Time as t  " & vbCrLf
    '    qry += " where POId ='" & PoID & "' " & vbCrLf
    '    qry += " order by ResponseTimeNo desc" & vbCrLf

    '    Dim objMyconM As New clsConnDbSQL

    '    With objMyconM.mqryReturn(qry)
    '        While .dr.Read

    '            lbNo(i) = New Label
    '            lbNo(i).ID = "lbNoProperties" & i & TB.ID & ""
    '            lbNo(i).Width = 300
    '            lbNo(i).CssClass = "MainFont"
    '            lbNo(i).Text = .dr("NO").ToString

    '            tb01(i) = New Table
    '            tb01(i).ID = "tb01Properties" & i & TB.ID & ""
    '            ' tb01(i).CssClass = "MainFont"
    '            tb01(i).Width = 500
    '            mLoadPoResponse(tb01(i), PoID, .dr("ResponseTimeNo").ToString)
    '            tb01(i).Enabled = True
    '            tb01(i).Visible = True


    '            If .dr("ConfirmIDShot").ToString = "ตอบรับเอกสาร [กรณีได้ตามกำหนด PO]" Or .dr("ConfirmIDShot").ToString = "ได้ตามกำหนด PO" Or .dr("ConfirmIDShot").ToString = "ตอบรับทุกรายการตาม PO" Then
    '                lbNo(i).ForeColor = Drawing.Color.Blue
    '                lbNo(i).Font.Bold = True
    '            ElseIf .dr("ConfirmIDShot").ToString = "ตอบรับเอกสาร [กรณีไม่ได้ตามกำหนด PO]" Or .dr("ConfirmIDShot").ToString = "ไม่ได้ตามกำหนด PO" Or .dr("ConfirmIDShot").ToString = "ไม่ตอบรับทุกรายการตาม PO" Then
    '                lbNo(i).ForeColor = Drawing.Color.Red
    '                lbNo(i).Font.Bold = True
    '            Else
    '                lbNo(i).ForeColor = Drawing.Color.Black
    '                lbNo(i).Font.Bold = True

    '            End If

    '            i += 1
    '        End While

    '    End With

    '    'Get ค่าในตาราง

    '    Dim col As Integer = 2

    '    Dim c(row * col) As TableCell
    '    Dim r(row) As TableRow

    '    'การสร้าง row/cell ใน table control
    '    For i = 0 To row - 1
    '        r(i) = New TableRow

    '        'สร้าง cell
    '        For k As Integer = 0 To col - 1
    '            c(k) = New TableCell

    '            c(k).HorizontalAlign = HorizontalAlign.Left

    '            Select Case k

    '                Case "1"
    '                    c(k).Controls.Add(lbNo(i))
    '                    'c(k).Text = "."
    '                    c(k).HorizontalAlign = HorizontalAlign.Left
    '                    'Response.Write("<br>")
    '                    c(k).Controls.Add(tb01(i))

    '                Case Else

    '            End Select

    '            'addRow
    '            r(i).Cells.Add(c(k))
    '            '------------------       
    '        Next
    '        '--------------------------
    '        TB.Rows.Add(r(i))
    '    Next

    'End Sub

    'Public Sub mLoadPoResponse(ByVal TB As Table, ByVal Poid As String, ByVal ItemNo As Integer)

    '    If ItemNo = 0 Then ItemNo = "1"

    '    'sFlag = 1 is Insert / sFlag = 2 is View
    '    'TB คือ Table ที่ต้องการนำเอาข้อมูลไปใส่
    '    'TimeUnit คือ จำนวนครั้งในรอบปี
    '    TB.Controls.Clear()


    '    '-----------------------------------------------------------------
    '    Dim objMyconM As New clsConnDbSQL
    '    Dim qry As String = ""

    '    qry += "  select   " & vbCrLf
    '    qry += "  P.PoID   " & vbCrLf
    '    qry += "  ,P.PoName   " & vbCrLf
    '    qry += "  ,POI.ItemNo  " & vbCrLf
    '    qry += "  ,POI.ItemRef  " & vbCrLf
    '    qry += "  ,POI.Qty " & vbCrLf
    '    qry += "  ,convert(nvarchar,POI.DELIVERY_DATE,103) as sDELIVERY_DATE  " & vbCrLf
    '    qry += "  ,Pr.POItem   " & vbCrLf
    '    qry += "  ,convert(nvarchar,pr.[PODateDelay],103) AS PODateDelay  " & vbCrLf
    '    qry += "  ,pr.PORemark   " & vbCrLf
    '    qry += "  ,pr.POResponse   " & vbCrLf
    '    qry += "  ,POI.COA_File_Eng " & vbCrLf
    '    qry += "  ,POI.TDS_File_Eng " & vbCrLf
    '    qry += "  ,POI.SDS_File_Eng " & vbCrLf
    '    qry += "  from PSR_T_Po P  " & vbCrLf
    '    qry += "  left outer join (  " & vbCrLf
    '    qry += "  --กรณีที่ตอบรับไม่ตามกำหนด  " & vbCrLf
    '    qry += "  select * from PSR_T_Po_Response where  POResponse <> 1  " & vbCrLf
    '    qry += "  --//----------------  " & vbCrLf
    '    qry += "  ) as PR  " & vbCrLf
    '    qry += "  on p.PoID = PR.POId   " & vbCrLf
    '    qry += "  --//---------------- " & vbCrLf
    '    qry += "  , ( " & vbCrLf
    '    qry += "  select * from PSR_T_Po_Item -- where PONo ='SCID15/0001' " & vbCrLf
    '    'qry += "  where  (flagSDS_E = 1 or FlagTDS_E = 1 or FlagCOA_E = 1) "
    '    qry += "  ) Poi " & vbCrLf
    '    qry += "  --------------------- " & vbCrLf
    '    qry += "  Where P.PoID = '" & Poid & "' " & vbCrLf
    '    qry += "  and p.PoName = replace(POI.PONo ,'/','_')   " & vbCrLf

    '    If ChkPoResponse(Poid) Then
    '        qry += "  and PR .POItem = poi.ItemNo  " & vbCrLf
    '        qry += "  and pr.POTimeItemNO ='" & ItemNo & "' " & vbCrLf
    '    End If

    '    Dim i As Integer = 1
    '    ' TB.BorderWidth = 1

    '    TB.Width = 500
    '    Dim col As Integer = 5
    '    Dim row As Integer = 1 'บวก Head 1 รายการ

    '    row = objMyconM.mGetData("select count(*) from (" & qry & ") as xx")

    '    If row = 0 Then Exit Sub

    '    Dim lbNo(row) As Label
    '    Dim lbAcceptLise(row) As Label
    '    Dim chk01(row) As RadioButtonList
    '    Dim txt01DelDate(row) As TextBox
    '    Dim txt02Remark(row) As TextBox
    '    Dim lb01DueDate(row) As Label 'เพิ่ม 04/02/2016    

    '    qry += "   order by [POTimeItemNo],cast([POItem] as integer)  asc " & vbCrLf

    '    With objMyconM
    '        .mqryReturn(qry)
    '        While .dr.Read

    '            '####################################


    '            'กำหนดค่าให้กับตัว control แต่ละตัว

    '            lbNo(i) = New Label
    '            lbNo(i).ID = "lbNoProperties" & i & TB.ID & ""
    '            lbNo(i).Width = 150
    '            lbNo(i).Text = .dr("ItemNo").ToString & ".  " & .dr("ItemRef").ToString



    '            lbAcceptLise(i) = New Label
    '            lbAcceptLise(i).ID = "lbAcceptListProperties" & i & TB.ID & ""
    '            lbAcceptLise(i).Width = 75
    '            Select Case .dr("POResponse").ToString
    '                Case "1"
    '                    lbAcceptLise(i).Text = "ไม่เลื่อน"
    '                Case "2"
    '                    lbAcceptLise(i).Text = "เลื่อนออก"
    '                Case "3"
    '                    lbAcceptLise(i).Text = "เลื่อนเข้า"
    '            End Select

    '            lb01DueDate(i) = New Label
    '            lb01DueDate(i).ID = "lb01DueDateProperties" & i & TB.ID & ""
    '            lb01DueDate(i).Width = 85
    '            lb01DueDate(i).Text = .dr("sDELIVERY_DATE").ToString


    '            txt01DelDate(i) = New TextBox
    '            txt01DelDate(i).ID = "txt01DelDateProperties" & i & TB.ID & ""
    '            txt01DelDate(i).Width = 85
    '            txt01DelDate(i).Text = .dr("PODateDelay").ToString
    '            txt01DelDate(i).AutoPostBack = False
    '            txt01DelDate(i).ReadOnly = True


    '            txt02Remark(i) = New TextBox
    '            txt02Remark(i).ID = "txt02RemarkProperties" & i & TB.ID & ""
    '            txt02Remark(i).Width = 150
    '            txt02Remark(i).Text = .dr("PORemark").ToString
    '            txt02Remark(i).AutoPostBack = False
    '            txt02Remark(i).ReadOnly = True

    '            i += 1
    '        End While

    '    End With
    '    '-----------------------------------------------------------------

    '    Dim c(row * col) As TableCell
    '    Dim r(row) As TableRow

    '    'การสร้าง row/cell ใน table control
    '    For i = 0 To row
    '        r(i) = New TableRow


    '        'สร้าง cell
    '        For k As Integer = 0 To col - 1
    '            c(k) = New TableCell

    '            If i <> 0 Then
    '                c(k).HorizontalAlign = HorizontalAlign.Left
    '                Select Case k

    '                    Case "0"
    '                        c(k).Controls.Add(lbNo(i))
    '                        c(k).HorizontalAlign = HorizontalAlign.Center
    '                    Case "1"
    '                        c(k).Controls.Add(lb01DueDate(i))
    '                        c(k).Width = 150
    '                    Case "2"
    '                        c(k).Controls.Add(lbAcceptLise(i))
    '                        c(k).HorizontalAlign = HorizontalAlign.Center
    '                        c(k).Width = 230
    '                    Case "3"
    '                        c(k).Controls.Add(txt01DelDate(i))
    '                    Case "4"
    '                        c(k).Controls.Add(txt02Remark(i))
    '                        c(k).Width = 150
    '                    Case Else
    '                End Select



    '            End If
    '            'addRow

    '            c(k).BorderColor = System.Drawing.SystemColors.ActiveCaptionText
    '            c(k).BorderStyle = BorderStyle.Solid
    '            c(k).BorderWidth = 1
    '            r(i).Cells.Add(c(k))
    '            '------------------
    '            If i <> 0 Then
    '                TB.Rows(0).HorizontalAlign = HorizontalAlign.Center
    '                TB.Rows(0).Cells(0).ControlStyle.BackColor = Drawing.Color.LightBlue
    '                TB.Rows(0).Cells(0).BackColor = Drawing.ColorTranslator.FromHtml("#3AC0F2")
    '                TB.Rows(0).Cells(0).Height = 30
    '                TB.Rows(0).Cells(1).ControlStyle.BackColor = Drawing.Color.LightBlue
    '                TB.Rows(0).Cells(1).BackColor = Drawing.ColorTranslator.FromHtml("#3AC0F2")
    '                TB.Rows(0).Cells(1).Height = 30
    '                TB.Rows(0).Cells(2).ControlStyle.BackColor = Drawing.Color.LightBlue
    '                TB.Rows(0).Cells(2).BackColor = Drawing.ColorTranslator.FromHtml("#3AC0F2")
    '                TB.Rows(0).Cells(2).Height = 30
    '                TB.Rows(0).Cells(3).ControlStyle.BackColor = Drawing.Color.LightBlue
    '                TB.Rows(0).Cells(3).BackColor = Drawing.ColorTranslator.FromHtml("#3AC0F2")
    '                TB.Rows(0).Cells(3).Height = 30
    '                TB.Rows(0).Cells(4).ControlStyle.BackColor = Drawing.Color.LightBlue
    '                TB.Rows(0).Cells(4).BackColor = Drawing.ColorTranslator.FromHtml("#3AC0F2")
    '                TB.Rows(0).Cells(4).Height = 30



    '                TB.Rows(0).ControlStyle.Font.Bold = True
    '                TB.Rows(0).Cells(0).Text = "รายการในใบสั่งซื้อ"
    '                TB.Rows(0).Cells(1).Text = "วันกำหนดส่ง"
    '                TB.Rows(0).Cells(2).Text = "เลือก"
    '                TB.Rows(0).Cells(3).Text = "วันที่เลื่อน"
    '                TB.Rows(0).Cells(4).Text = "สาเหตุที่เลื่อน"


    '            End If
    '        Next
    '        '--------------------------
    '        TB.Rows.Add(r(i))
    '    Next
    '    TB.CellSpacing = 0

    'End Sub

#End Region

    Public Sub UpdateFlagRead_PO(ByVal sPOID As String)

        Dim qry As String = ""
        Dim objMyconM As New clsConnDbSQL

        qry = "update PSR_T_Po  set flagread = 1 ,readdate =getdate() where PoID ='" & sPOID & "'"

        Try
            objMyconM.mqryNoReturn(qry)
        Catch ex As Exception
            'Me.mMsgBox(ex.ToString)
        End Try

    End Sub


#Region "Get Count"

    Public Function GetCountCOA(ByVal PoNo As String) '## แสดงรายการที่ต้องการ COA แต่ยังไม่ได้แนบไฟล์

        Dim objMycon As New clsConnDbSQL
        Dim qry As String = "select COUNT(*) from PSR_T_Po_Item  where PONo  = replace('" & PoNo & "','_','/') and (COA_File_Eng  is  null and COA_File_Thai is  null)"

        Try
            Return objMycon.mGetData(qry)
        Catch ex As Exception
            Return 1
        End Try

    End Function
#End Region

End Class
