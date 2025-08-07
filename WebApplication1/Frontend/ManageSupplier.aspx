<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="ManageSupplier.aspx.vb" Inherits="WebApplication1.ManageSupplier" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin: 0 auto;
        }

        .profile-card {
            background: white;
            transition: transform 0.3s ease;
        }


        @keyframes shine {
            0% {
                transform: rotate(45deg) translateX(-100%);
            }

            100% {
                transform: rotate(45deg) translateX(100%);
            }
        }


        .role-user {
            background: #065ba7;
            color: white;
        }

        .profile-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            /*margin-bottom: 40px;*/
        }

        .info-section {
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 10px 25px;
            max-width: 600px;
        }

            .info-section h3 {
                color: #2c3e50;
                margin-bottom: 15px;
                font-size: 18px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            padding: 8px 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

            .info-item:last-child {
                border-bottom: none;
                margin-bottom: 0;
            }

        .info-label {
            font-weight: 600;
            color: #7f8c8d;
        }

        .info-value {
            font-weight: 500;
            color: #2c3e50;
        }

        .actions {
            padding-top: 20px;
            margin-bottom: 20px;
            display: flex;
            gap: 15px;
            justify-content: start;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: #065ba7;
            color: white;
        }

        .btn-secondary {
            background: #065ba7;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .stat-item {
            text-align: center;
            padding: 20px;
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }

            .stat-item:hover {
                transform: scale(1.05);
            }

        .stat-number {
            font-size: 28px;
            font-weight: 700;
            color: #065ba7;
        }

        .stat-label {
            font-size: 14px;
            color: #7f8c8d;
            margin-top: 5px;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            z-index: 1000;
        }

        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 30px;
            border-radius: 20px;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        .modal h3 {
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 20px;
        }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: #2c3e50;
            }

            .form-group input {
                width: 100%;
                padding: 12px;
                border: 2px solid #e0e0e0;
                border-radius: 8px;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

                .form-group input:focus {
                    outline: none;
                    border-color: #065ba7;
                }

        .close-btn {
            position: absolute;
            top: 15px;
            right: 20px;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #7f8c8d;
        }

        td {
            height: 25px;
            border: 0px solid black;
            /*text-align: start;*/
        }

        .btn-edit {
            height: 26px;
            color: Black;
            background-color: #dae3f3;
            border: 0px solid #bed6f6;
            border-radius: 5px;
            width: 60px;
            font-size: 16px;
        }

            .btn-edit:hover {
                transform: scale(1.05);
                background-color: #fe6b43;
                border: 1px solid #bed6f6;
            }

        .btn-reset-password {
            background-color: #9575cd;
            color: white;
            border: none;
            transition: background-color 0.3s ease;
        }

            .btn-reset-password:hover {
                background-color: #7e57c2;
                color: white;
            }

            .btn-reset-password:active {
                background-color: #673ab7 !important;
                color: white !important;
            }

        .info-item input.info-value[type="text"], .info-item input.info-value[type="password"] {
            border-radius: 8px;
            border: 1px solid #bed6f6;
            height: 40px;
            padding: 6px 12px;
        }

            .info-item input.info-value[type="text"]:focus, .info-item input.info-value[type="password"]:focus {
                border: 1px solid #16719a;
                outline: none;
            }

        .info-item textarea.info-value {
            border-radius: 8px;
            border: 1px solid #bed6f6;
            padding: 6px 12px;
            height: auto; /* หรือปรับตามความต้องการ */
            min-height: 40px;
        }

            .info-item textarea.info-value:focus {
                border: 1px solid #16719a;
                outline: none;
            }

        .textbox_Address {
            height: 95%;
            width: 100%;
        }

        .info-value.require {
            border: 1px solid #bed6f6;
            border-radius: 8px;
            height: 40px;
            padding: 6px 12px;
        }

            .info-value.require.error {
                border: 1px solid red !important;
                background-color: #fff0f0;
            }

        .form-select.require.error {
            border: 1px solid red !important;
            background-color: #fff0f0;
        }
    </style>
    <script>

        function openPasswordModal() {
            document.getElementById('passwordModal').style.display = 'block';
        }

        function closePasswordModal() {
            document.getElementById('passwordModal').style.display = 'none';
            document.getElementById('currentPassword').value = '';
            document.getElementById('newPassword').value = '';
            document.getElementById('confirmPassword').value = '';
        }

        function focusAndScroll() {
            const el = document.getElementById('<%= txt_SupplierName.ClientID %>');
            if (el) {
                el.focus();
                setTimeout(function () {
                    el.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }, 20);
            }
        }

        function scrollToTop() {
            setTimeout(() => {
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }, 20);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container p-4 ">
                <%--min-vh-100--%>
                <h3>📋 Manage Supplier </h3>
                <div class="profile-card">
                    <div class="actions">
                        <asp:Button ID="btn_NewSupplier" Text="📝 เพิ่มผู้ขาย" runat="server" OnClick="btn_NewSupplier_Click" CssClass="btn btn-info" />
                        <asp:Button ID="btn_ChangePw" runat="server" Text="🔒 Reset Password" CssClass="btn btn-reset-password" OnClick="btn_ChangePw_Click" />

                        <%--<asp:Button ID="btn_ChangePw" Text="🔒 เปลี่ยนรหัสผ่าน" runat="server" OnClick="btn_ChangePw_Click" CssClass="btn btn-primary" />--%>
                        <%--<button class="btn btn-primary" onclick="openPasswordModal()">
                                🔒 เปลี่ยนรหัสผ่าน
                             </button>--%>
                        <%--<button class="btn btn-secondary" onclick="editProfile()">
                                ✏️ แก้ไขโปรไฟล์
                            </button>--%>
                    </div>
                    <div class="profile-info" id="FormSearch" runat="server" visible="false">
                        
                        <div class="info-section">
                            <h3>📋 ค้นหาจากข้อมูล Oracle </h3>
                            <div class="info-item ">
                                <asp:DropDownList ID="ddl_typeSearch" runat="server" CssClass="form-select" Width="150" Height="30" Font-Size="12">
                                    <asp:ListItem Text="Supplier Code" Value="1" />
                                    <asp:ListItem Text="ID Tax" Value="2" />
                                </asp:DropDownList>
                                <asp:TextBox ID="txt_searchSupplier" runat="server" CssClass="info-value" Visible="true" />
                                
                            </div>
                            <div class="actions p-0 m-0" style="justify-content: center; ">
                                <asp:Button ID="btn_copy_Ora" Text="📋 คัดลอก" runat="server" OnClick="btn_copy_Click" CssClass="btn btn-success" />
                                <%--<asp:Button ID="btn_clear" Text="🧹 ล้างข้อมูล" runat="server" OnClick="btn_clear_Click" CssClass="btn btn-outline-secondary" />--%>
                            </div>
                        </div>
                        
                    </div>
                    <br />
                    <div class="profile-info" id="FormDetail" runat="server" visible="false">

                        <div class="info-section">
                            <asp:HiddenField ID="hdf_supplierID" runat="server" />
                            <asp:HiddenField ID="hdf_FormStatus" runat="server" />
                            <div class="info-item">
                                <h3>📋 ข้อมูลผู้ขาย</h3>
                                <asp:Label ID="lbl_form_sta" Text="สถานะ: -" runat="server" Font-Size="12" Font-Bold="true" />
                            </div>

                            <div class="info-item">
                                <label>
                                    รหัสผู้ขาย (Supplier Code):
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_SupplierCode" runat="server" CssClass="info-value" Visible="true" />
                            </div>
                            <div class="info-item">
                                <label>
                                    ชื่อผู้ขาย:
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_SupplierName" runat="server" CssClass="info-value" Visible="true" />
                            </div>
                            <div class="info-item">
                                <label>
                                    ชื่อจดทะเบียนบริษัท:
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_SupplierNameTax" runat="server" CssClass="info-value" Visible="true" />
                            </div>
                            <div class="info-item">
                                <label>
                                    ชื่อผู้ติดต่อ:
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_CordinatorName" runat="server" CssClass="info-value" Visible="true" />
                            </div>
                            <div class="info-item">
                                <label>
                                    เลขที่ผู้เสียภาษี(Tax ID 13 หลัก):
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_IDTax" runat="server" CssClass="info-value" Visible="true" />
                            </div>


                            <div class="">
                                <label>
                                    สถานะการใช้งาน:
                                    <samp style="color: red;">*</samp></label>
                                <asp:DropDownList ID="ddl_status" runat="server" CssClass="form-select" Width="150" Height="30" Font-Size="10">
                                    <asp:ListItem Text="-- กรุณาเลือก --" Value="" />
                                    <asp:ListItem Text="เปิดใช้งาน" Value="A" />
                                    <asp:ListItem Text="ระงับการใช้งาน" Value="H" />
                                </asp:DropDownList>
                            </div>


                        </div>

                        <div class="info-section">
                            <div class="info-item">
                                <h3>🏢 ที่อยู่ติดต่อ</h3>
                                <asp:Label ID="lbl_form_sta2" Text="สถานะ: -" runat="server" Font-Size="12" Font-Bold="true" />
                            </div>
                            <div class="info-item">
                                <label>
                                    ที่อยู่ (Address):
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_Address" runat="server" CssClass="info-value" TextMode="MultiLine" Rows="4" Visible="true" />
                            </div>
                            <div class="info-item">
                                <label>
                                    โทรศัพท์ (Tel):
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_Phone" runat="server" CssClass="info-value" Visible="true" />
                            </div>
                            <div class="info-item">
                                <label>
                                    Fax:
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_Fax" runat="server" CssClass="info-value" Visible="true" />
                            </div>
                            <div class="info-item">
                                <label>
                                    E-Mail:
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_Email" runat="server" CssClass="info-value" TextMode="MultiLine" Rows="3" Visible="true" />
                            </div>
                            <div class="info-item d-none">
                                <label>
                                    Usrname:
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_Usrname" runat="server" CssClass="info-value" Visible="false" />
                            </div>
                            <div class="info-item d-none">
                                <label>
                                    Password:
                                    <samp style="color: red;">*</samp></label>
                                <asp:TextBox ID="txt_PW" runat="server" CssClass="info-value" TextMode="Password" Visible="false" />
                            </div>
                            <div class="actions" style="justify-content: center; margin-top: 20px;">
                            </div>
                        </div>

                    </div>
                    <div class="actions" style="justify-content: center; margin-top: 20px;" id="FormSave" runat="server" visible="false">
                        <asp:Button ID="btn_Save" runat="server" Text="💾 บันทึก" CssClass="btn btn-primary" OnClick="btn_Save_Click" />
                        <asp:Button ID="btn_Cancel" runat="server" Text="❌ Cancel" CssClass="btn btn-warning" OnClick="btn_Cancel_Click" />
                    </div>
                    <%--<div class="stats">
                <div class="stat-item">
                    <div class="stat-number">1,247</div>
                    <div class="stat-label">วันปฏิบัติงาน</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">28</div>
                    <div class="stat-label">โครงการที่สำเร็จ</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">4.8</div>
                    <div class="stat-label">คะแนนประเมิน</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">5</div>
                    <div class="stat-label">ปีอายุงาน</div>
                </div>
            </div>--%>
                </div>
            </div>

            <div class="container p-4 min-vh-100">
                <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="SqlDataSourceTab1" Theme="Office2003Blue"
                    KeyFieldName="SupplierID" Width="100%" OnCustomJSProperties="GridView_CustomJSProperties" EnableCallBacks="false" CssClass="">
                    <Settings ShowFilterRow="true" ShowFilterBar="Hidden" VerticalScrollBarMode="Hidden" VerticalScrollableHeight="500" />
                    <SettingsBehavior AllowGroup="false" AllowDragDrop="false" />
                    <%--<ClientSideEvents Init="OnGridViewInit" SelectionChanged="OnGridViewSelectionChanged" EndCallback="OnGridViewEndCallback" />--%>
                    <Columns>
                        <%--<dx:GridViewCommandColumn ShowSelectCheckbox="True" ShowClearFilterButton="true" SelectAllCheckboxMode="Page" Width="60"/>--%>
                        <dx:GridViewDataColumn FieldName="Row" Width="30" Caption="No">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <Settings AllowDragDrop="True" AllowHeaderFilter="False" AllowAutoFilter="False" AllowSort="True" />
                            <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="IDTax" Caption="IDTax" Width="100" />
                        <dx:GridViewDataColumn FieldName="SupplierName" Caption="Supplier Name" Width="120" />
                        <dx:GridViewDataColumn FieldName="SupplierCode" Caption="supplier Code" Width="80" />
                        <dx:GridViewDataColumn Caption="Address [ที่อยู่]" Width="250px">
                            <DataItemTemplate>
                                <div style="white-space: normal; word-wrap: break-word;">
                                    <span style="color: Blue;">ชื่อบริษัท:</span>
                                    <asp:Label ID="lblSupplierNameTax" runat="server" Text='<%# Eval("SupplierName2") %>' />
                                    <br />
                                    <br />
                                    <span style="color: Blue;">ที่อยู่:</span>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>' />
                                    <br />
                                    <br />
                                    <span style="color: Blue;">Tel.:</span>
                                    <asp:Label ID="lblTel" runat="server" Text='<%# Eval("Tel") %>' />
                                    <br />
                                    <span style="color: Blue;">Fax.:</span>
                                    <asp:Label ID="lblFax" runat="server" Text='<%# Eval("Fax") %>' />
                                </div>
                            </DataItemTemplate>
                            <CellStyle Wrap="True" VerticalAlign="Top" HorizontalAlign="Left" Paddings-Padding="5px" />
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="Email" Caption="Email" Width="200">
                            <DataItemTemplate>
                                <asp:TextBox ID="txtEditAddress" runat="server" TextMode="MultiLine" ReadOnly="true" CssClass="textbox_Address" Width="200"
                                    Text='<%# Eval("Email")%>'> </asp:TextBox>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <%--<dx:GridViewDataCheckColumn FieldName="FlagReady" Caption="Status" Width="80">
                            <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <PropertiesCheckEdit DisplayTextChecked="เปิดใช้งาน" DisplayTextUnchecked="ระงับการใช้งาน" />
                            <Settings AllowAutoFilter="True" />
                        </dx:GridViewDataCheckColumn>--%>
                        <dx:GridViewDataComboBoxColumn FieldName="FlagReady" Caption="Status" Width="100">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="เปิดใช้งาน" Value="A" />
                                    <dx:ListEditItem Text="ระงับการใช้งาน" Value="H" />
                                </Items>
                            </PropertiesComboBox>
                            <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <Settings AllowAutoFilter="True" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataColumn Caption="Action" Width="80">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <DataItemTemplate>
                                <asp:Button ID="btn_Edit" Text="Edit" runat="server" OnClick="btn_Edit_Click" CssClass="my-2 btn-edit" />
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                    <%--<SettingsSearchPanel Visible="True" />
                    <SettingsBehavior AllowFocusedRow="True" />--%>
                    <SettingsPager PageSizeItemSettings-Visible="false" PageSize="20" PageSizeItemSettings-Items="20, 50, 100, 200"></SettingsPager>
                    <Styles>
                        <Header HorizontalAlign="Center" VerticalAlign="Middle" />
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSourceTab1" runat="server"></asp:SqlDataSource>
            </div>

            <!-- Modal สำหรับ Reset Password -->
            <div id="passwordModal" class="modal">
                <div class="modal-content">
                    <div class="d-flex justify-content-center ">
                        <div class="">
                            <button class="close-btn" onclick="closePasswordModal()">&times;</button>
                            <h3>🔒 Reset Password</h3>
                            <div onsubmit="changePassword(event)">
                                <div class="form-group">
                                    <label for="currentPassword">รหัสผ่านปัจจุบัน:</label>
                                    <input type="password" id="currentPassword">
                                    <%--required--%>
                                </div>
                                <div class="form-group">
                                    <label for="newPassword">รหัสผ่านใหม่:</label>
                                    <input type="password" id="newPassword">
                                    <%--required--%>
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword">ยืนยันรหัสผ่านใหม่:</label>
                                    <input type="password" id="confirmPassword">
                                    <%--required--%>
                                </div>
                                <div class="actions" style="justify-content: center;">
                                    <%--<asp:Button ID="btn_save_changePw" Text="Save" runat="server" OnClick="btn_save_changePw_Click" CssClass="btn btn-primary" />--%>
                                    <%--<button type="submit" class="btn btn-primary">บันทึก</button>--%>
                                    <asp:Button ID="btn_ResetPW" runat="server" Text="🔑 Reset " CssClass="btn btn-reset-password" OnClick="btn_ResetPW_Click" />
                                    <button type="button" class="btn btn-warning" onclick="closePasswordModal()">❌ Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
