<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="MonitorTLS.aspx.vb" Inherits="WebApplication1.MonitorTLS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .text-wid {
            width: 350px;
            height: auto;
            max-height: 200px;
            overflow: auto;
        }
        .box-width {
            width:300px;
        }
        .btn-w {
            width: 100px;
        }
        /* Style for Overlay */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
            display: none; /* Initially hidden */
            z-index: 1000; /* Makes sure the overlay is on top */
        }

        .popupstatus {
            display: none;
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            border-radius: 8px;
            z-index: 1000;
        }

    </style>
    <style>


        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;


        }

        .popup-overlay {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .popup-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            padding: 0;
            max-width: 520px;
            width: 100%;
            max-height: 90vh;
            overflow: hidden;
            position: relative;
            animation: slideUp 0.3s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .popup-header {
            background:#065ba7;
            color: white;
            padding: 24px 32px;
            position: relative;
            overflow: hidden;
        }

        .popup-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 20"><defs><pattern id="grain" width="100" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="0.5" fill="white" opacity="0.1"/><circle cx="50" cy="5" r="0.3" fill="white" opacity="0.1"/><circle cx="80" cy="15" r="0.4" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="20" fill="url(%23grain)"/></svg>') repeat;
            opacity: 0.3;
        }

        .popup-title {
            font-size: 22px;
            font-weight: 700;
            margin: 0;
            position: relative;
            z-index: 1;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .popup-title::before {
            content: '📧';
            font-size: 24px;
        }

        .popup-body {
            padding: 32px;
        }

        .field-group {
            margin-bottom: 28px;
        }

        .field-label {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .field-content {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 16px;
            font-size: 15px;
            max-height:150px;
            overflow:auto;
            line-height: 1.6;
            color: #4b5563;
            transition: all 0.2s ease;
            position: relative;
        }

        .field-content:hover {
            background: #f1f5f9;
            border-color: #cbd5e1;
        }

        .field-content.subject {
            font-weight: 600;
            color: #1f2937;
        }

        .field-content.description {
            min-height: 80px;
        }

        .file-item {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 12px 16px;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .file-item:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .file-icon {
            width: 36px;
            height: 36px;
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 12px;
        }

        .file-info {
            flex: 1;
        }

        .file-name {
            font-weight: 600;
            color: #1f2937;
            font-size: 14px;
            margin-bottom: 2px;
        }

        .file-size {
            font-size: 12px;
            color: #6b7280;
        }

        .action-buttons {
            display: flex;
            gap: 16px;
            justify-content: center;
            margin-top: 32px;
            padding-top: 24px;
            border-top: 1px solid #f1f5f9;
        }

        .btn {
            padding: 14px 32px;
            border: none;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            min-width: 120px;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-reject {
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            color: white;
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
        }

        .btn-reject:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(239, 68, 68, 0.4);
        }

        .btn-approve {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: white;
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
        }

        .btn-approve:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(16, 185, 129, 0.4);
        }

        .close-btn {
            position: absolute;
            top: 20px;
            right: 24px;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            transition: all 0.2s ease;
            z-index: 2;
        }

        .close-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: rotate(90deg);
        }

        @media (max-width: 768px) {
            .popup-container {
                margin: 20px;
                max-width: calc(100vw - 40px);
            }
            
            .popup-body {
                padding: 24px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
    <script>
        function openPopup() {
  
            document.getElementById('overlay').style.display = 'block';
            document.getElementById('popup').style.display = 'block';
        }

        function closePopup() {
          
            document.getElementById('overlay').style.display = 'none';
            document.getElementById('popup').style.display = 'none';
        }
    </script>
    <script>
        function openPopupEdit() {
            document.getElementById('overlayEdit').style.display = 'block';
            document.getElementById('popupEdit').style.display = 'block';
        }

        function closeEditPopup() {
            
            document.getElementById('overlayEdit').style.display = 'none';
            document.getElementById('popupEdit').style.display = 'none';
        }
        function handleApprove() {
            alert('อีเมลได้รับการอนุมัติแล้ว');
            // เพิ่มโค้ดสำหรับการอนุมัติที่นี่
        }

        function handleReject() {
            if (confirm('คุณแน่ใจหรือไม่ที่จะปฏิเสธอีเมลนี้?')) {
                alert('อีเมลถูกปฏิเสธแล้ว');
                // เพิ่มโค้ดสำหรับการปฏิเสธที่นี่
            }
        }
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="min-vh-100 p-3 ">
        <div class=" d-flex justify-content-center align-items-start flex-column  gap-2 d-lg-flex flex-lg-row ">
            <div class="p-4">
                <div class=" d-flex justify-content-center align-items-center flex-column shadowcustom p-4 rounded-4 usercard bg-white ">
                    <img src="../imge/3135715.png" width="200" height="200" class=" rounded-img " />
                    <div class="pt-4">
                        <div class=" d-flex justify-content-center  p-1 bg-success rounded-5 px-2 w-fit text-white tiny shadowcustom">Admin</div>
                    </div>
                    <div class=" d-flex  text-start gap-2 p-4 fw-light ">
                        <div class="text-start">Dr.test testttt </div>
                    </div>
                </div>
            </div>


            <div class=" d-flex gap-2 flex-column w-100 mw p-2 ">
                <div class=" d-flex  rounded-4 p-2  ">
                    <div>
                        <div class="col">
                            <div class="d-flex flex-wrap gap-3 p-2 overflow-auto ">
                                <div class="col ">
                                    <div class="d-flex w-100">
                                        <%-- <div class="">
                                            <asp:DropDownList ID="ddlSearchType" runat="server" CssClass="search-dropdown ">
                                                <asp:ListItem Text="All" Value="All" />
                                                <asp:ListItem Text="Name" Value="Seller" />
                                                <asp:ListItem Text="ID" Value="SupplierId" />
                                            </asp:DropDownList>
                                        </div>--%>

                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true"
                                            EmptyDataText="No data found. Please try again with a different keyword."
                                            CssClass="gridview-class">
                                        </asp:GridView>

                                        <asp:TextBox ID="txtKeyword" runat="server" CssClass="searchbox px-4" AutoPostBack="true"
                                            OnTextChanged="txtKeyword_TextChanged" placeholder="Search..." />

                                    </div>
                                </div>
                                <%--<div>                                  
                                    <asp:Button ID="btnKeywordSearch" runat="server" Text="Search" CssClass="print-box" OnClick="btnKeywordSearch_Click" />
                                </div>--%>

                                <div>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="dropdown-box dropdown-toggle">
                                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Buyer 1" Value="Buyer 1"></asp:ListItem>
                                        <asp:ListItem Text="Buyer 2" Value="Buyer 2"></asp:ListItem>
                                        <asp:ListItem Text="Buyer 3" Value="Buyer 3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="">
                                    <div class=" d-flex gap-2">
                                        <div class="">
                                            <asp:TextBox ID="txtDateStart" runat="server" TextMode="Date" CssClass="search-calender"
                                                AutoPostBack="true" OnTextChanged="DateFilter_Changed" />
                                        </div>
                                        <div class="">
                                            <asp:TextBox ID="txtDateEnd" runat="server" TextMode="Date" CssClass="search-calender"
                                                AutoPostBack="true" OnTextChanged="DateFilter_Changed" />
                                        </div>
                                    </div>

                                </div>

                                <div>
                                    <asp:Button ID="Button2" runat="server" Text="Print" class="print-box" OnClientClick="openPopup(); return false;" />
                                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="print-box" OnClick="btnClear_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-100 overflow-auto mw shadowcustom bg-white">
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        Width="100%"
                        Style="border: 1px solid #ddd;"
                        CssClass="grid-sum"
                        AllowPaging="True"
                        PageSize="10"
                        OnPageIndexChanging="GridView1_PageIndexChanging">
                        <PagerStyle CssClass="pager" HorizontalAlign="Center" />
                        <Columns>
                            <%--<asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnShowPopup" runat="server" Text="Edit" OnClick="btnShowPopup_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" SortExpression="SupplierId" />
                            <asp:BoundField DataField="SendMail" HeaderText="Mail" SortExpression="SendMail" />
                            <asp:BoundField DataField="SendAgain" HeaderText="SA" SortExpression="SendAgain" />
                            <asp:BoundField DataField="Buyer" HeaderText="Buyer" SortExpression="Buyer" />
                            <asp:BoundField DataField="CommitmentLetter" HeaderText="Letter" SortExpression="CommitmentLetter" />
                            <asp:BoundField DataField="Seller" HeaderText="Seller" SortExpression="Seller" />
                            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                            <asp:BoundField DataField="TaxpayerAccountNumber" HeaderText="Taxpayer" SortExpression="TaxpayerAccountNumber" />
                            <asp:BoundField DataField="Response" HeaderText="Response" SortExpression="Response" />
                            <asp:BoundField DataField="RespondentsSignature" HeaderText="Respondent Signature" SortExpression="RespondentsSignature" />
                            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                            <asp:BoundField DataField="ResponseDate" HeaderText="Response Date" SortExpression="ResponseDate" />
                            <asp:BoundField DataField="LastSentDate" HeaderText="Last Sent Date" SortExpression="LastSentDate" />
                            <asp:BoundField DataField="PrintAction" HeaderText="Print" SortExpression="PrintAction" />
                            <asp:TemplateField HeaderText="View" SortExpression="ViewAction">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkView" runat="server" Text="View" OnClientClick="openPopupEdit(); return false;" />
                                </ItemTemplate>
                            </asp:TemplateField>




                        </Columns>
                        <HeaderStyle CssClass="GridViewHeader" />
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>

    <div id="overlay" class="overlay" onclick="closePopup()"></div>
    <div id="popup" class="popup">
        <div class=" d-flex justify-content-center flex-column gap-4">
            <iconify-icon class=" d-flex justify-content-end" icon="carbon:close-outline" width="32" height="32" onclick="closePopup()"></iconify-icon>
            <div class="dropdown-item-container  d-flex align-items-center gap-2">
                <div>Year</div>
                <div class="dropdown">
                    <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Sort
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </div>
            </div>
            <div class="dropdown-item-container d-flex align-items-center gap-2">
                <div>Divisioms</div>
                <div class="dropdown">
                    <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Sort
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </div>
            </div>
            <asp:Button CssClass="" ID="Button1" runat="server" Text="Button" />
        </div>
    </div>

    <div id="overlayEdit" class="overlay" onclick="closeEditPopup()"></div>
    <div id="popupEdit" class="popupstatus">
        <div class="popup-overlay">
        <div class="popup-container">
            <div class="popup-header">
                <h2 class="popup-title">ตรวจสอบอีเมล</h2>
                <button class="close-btn"></button>
            </div>
            
            <div class="popup-body">
                

                <div class="field-group">
                    <div class="field-label">📝 หัวเรื่อง</div>
                    <div class="field-content subject">
                        ขอความอนุเคราะห์ในการจัดการประชุมประจำเดือน
                    </div>
                </div>

                <div class="field-group">
                    <div class="field-label">💬 รายละเอียด</div>
                    <div class="field-content description">
                        เรียน ผู้จัดการฝ่าย<br><br>
                        ขอความอนุเคราะห์ในการจัดการประชุมประจำเดือนสำหรับทีมพัฒนาระบบ โดยขอนัดหมายในวันที่ 15 สิงหาคม 2567 เวลา 14:00 น. เพื่อหารือเกี่ยวกับแผนงานในไตรมาสหน้า และการปรับปรุงระบบที่จำเป็น
                      
                    </div>
                </div>

                <div class="field-group">
                    <div class="field-label">📎 ไฟล์แนบ</div>
                    <div class="file-item">
                        <div class="file-icon">PDF</div>
                        <div class="file-info">
                            <div class="file-name">แผนงานประชุม_สิงหาคม.pdf</div>
                            <div class="file-size">2.4 MB</div>
                        </div>
                    </div>
                </div>

                <div class="action-buttons">
                    <button class="btn btn-reject" onclick="handleReject()">ปฏิเสธ</button>
                    <button class="btn btn-approve" onclick="handleApprove()">อนุมัติ</button>
                </div>
            </div>
        </div>
    </div>
    </div>


</asp:Content>
