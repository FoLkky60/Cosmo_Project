<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="ManageUser.aspx.vb" Inherits="WebApplication1.ManageUser" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="Head" runat="server">
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
            margin-top: 20px;
        }



        .profile-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin: 0 auto 20px;
            position: relative;
            overflow: hidden;
            border: 3px solid #065ba7;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: #065ba7;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            color: white;
            font-weight: bold;
        }

        .profile-avatar::before {
            display: none;
        }

        @keyframes shine {
            0% {
                transform: rotate(45deg) translateX(-100%);
            }

            100% {
                transform: rotate(45deg) translateX(100%);
            }
        }

        .profile-name {
            font-size: 32px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 8px;
        }

        .profile-role {
            display: inline-block;
            padding: 8px 20px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .role-admin {
            background: #065ba7;
            color: white;
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
        .info-value.textname {
            width: 35%;
        }
        .actions {
            /*padding-top: 20px;*/
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

        .btn-success {
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
        .info-item input.info-value[type="text"] {
            border-radius: 8px;
            border: 1px solid #bed6f6;
            height: 40px;
            padding: 6px 12px;
        }
        .info-item input.info-value[type="text"]:focus {
            border: 1px solid #16719a; 
            outline: none;             
        }

    </style>
    <script>
        let isAdmin = true;

        function openPasswordModal() {
            document.getElementById('passwordModal').style.display = 'block';
        }

        function closePasswordModal() {
            document.getElementById('passwordModal').style.display = 'none';
            document.getElementById('currentPassword').value = '';
            document.getElementById('newPassword').value = '';
            document.getElementById('confirmPassword').value = '';
        }

        function changePassword(event) {
            event.preventDefault();

            const currentPassword = document.getElementById('currentPassword').value;
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword !== confirmPassword) {
                alert('รหัสผ่านใหม่ไม่ตรงกัน กรุณาลองใหม่');
                return;
            }

            if (newPassword.length < 6) {
                alert('รหัสผ่านต้องยาวอย่างน้อย 6 ตัวอักษร');
                return;
            }

            // จำลองการเปลี่ยนรหัสผ่าน
            alert('เปลี่ยนรหัสผ่านสำเร็จ!');
            closePasswordModal();
        }

        function editProfile() {
            alert('🎉 ฟีเจอร์แก้ไขโปรไฟล์จะเปิดใช้งานเร็วๆ นี้!');
        }

        //function toggleRole() {
        //    const roleElement = document.getElementById('userRole');

        //    if (isAdmin) {
        //        roleElement.textContent = 'ผู้ใช้งาน';
        //        roleElement.className = 'profile-role role-user';
        //        isAdmin = false;
        //    } else {
        //        roleElement.textContent = 'ผู้ดูแลระบบ';
        //        roleElement.className = 'profile-role role-admin';
        //        isAdmin = true;
        //    }
        //}

        function focusAndScroll() {
            const el = document.getElementById('<%= txt_FnameT.ClientID %>');
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
            }, 20); // หน่วงเวลา 200 ms
        }

        // ปิด modal เมื่อคลิกนอกพื้นที่
        window.onclick = function (event) {
            const modal = document.getElementById('passwordModal');
            if (event.target === modal) {
                closePasswordModal();
            }
        }

        // เอาออกส่วนเปลี่ยนสีอวตาร
        document.addEventListener('DOMContentLoaded', function () {
            // ไม่มีการเปลี่ยนสีอวตาร
        });
    </script>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
            <div class="container p-4 ">
                <%--min-vh-100--%>
                <div class="actions">
                        <asp:Button ID="btn_NewUser" Text="📝 เพิ่มผู้ใช้งาน" runat="server" OnClick="btn_NewUser_Click" CssClass="btn btn-info" />
                        <%--<asp:Button ID="btn_ChangePw" Text="🔒 เปลี่ยนรหัสผ่าน" runat="server" OnClick="btn_ChangePw_Click" CssClass="btn btn-primary" />--%>
                        <%--<button class="btn btn-primary" onclick="openPasswordModal()">
                    🔒 เปลี่ยนรหัสผ่าน
                </button>--%>
                        <%--<button class="btn btn-secondary" onclick="editProfile()">
                            ✏️ แก้ไขโปรไฟล์
                        </button>--%>
                        <%--<button class="btn btn-success" onclick="toggleRole()">
                            🔄 เปลี่ยนสิทธิ์
                        </button>--%>

                    </div>
                <div class="profile-card">
                    <div class="profile-header" style="display: none;">
                        <div class="profile-avatar" id="avatar">
                            สม
                        </div>
                        <h1 class="profile-name">นายสมชาย วิริยะ</h1>
                        <span class="profile-role role-admin" id="userRole">ผู้ดูแลระบบ</span>
                    </div>

                    <div class="profile-info" ID="FormDetail" runat="server" style="display:none;">
                        <div class="info-section">
                            <asp:HiddenField ID="hdf_userID" runat="server" /> 
                            <asp:HiddenField ID="hdf_FormStatus" runat="server" /> 
                            <div class="info-item"> 
                                <h3>📋 ข้อมูลผู้ใช้งาน</h3>  
                                <asp:Label ID="lbl_form_sta" Text="สถานะ: -" runat="server" Font-Size="12" Font-Bold="true"/>
                            </div>
                            <div class="info-item">
                                <label >ชื่อ-นามสกุล: <samp style="color: red;">*</samp></label>
                                <asp:Label ID="lbl_FullnameT" runat="server" CssClass="info-value" Visible="false"/>
                                <asp:TextBox ID="txt_FnameT" runat="server" CssClass="info-value textname" Visible="true"/>
                                <asp:TextBox ID="txt_LnameT" runat="server" CssClass="info-value textname" Visible="true"/>
                            </div>
                            <div class="info-item">
                                <label >Name: <samp style="color: red;">*</samp></label>
                                <asp:Label ID="lbl_FnameE" runat="server" CssClass="info-value" Visible="false"/>
                                <asp:TextBox ID="txt_FnameE" runat="server" CssClass="info-value" Visible="true"/>
                            </div>
                            <div class="info-item">
                                <label >ตำแหน่ง: <samp style="color: red;">*</samp></label>
                                <asp:Label ID="lbl_PositionT" runat="server" CssClass="info-value" Visible="false"/>
                                <asp:TextBox ID="txt_PositionT" runat="server" CssClass="info-value" Visible="true"/>
                            </div>
                            <div class="info-item">
                                <label >เบอร์โทรศัพท์: <samp style="color: red;">*</samp></label>
                                <asp:Label ID="lbl_Phone" runat="server" CssClass="info-value" Visible="false"/>
                                <asp:TextBox ID="txt_Phone" runat="server" CssClass="info-value" Visible="true"/>
                            </div>
                            <div class="info-item">
                                <label >Usrname: <samp style="color: red;">*</samp></label>
                                <asp:Label ID="lbl_Usrname" runat="server" CssClass="info-value" Visible="false"/>
                                <asp:TextBox ID="txt_Usrname" runat="server" CssClass="info-value" Visible="true"/>
                            </div>
                            <div class="info-item">
                                <label >Password: <samp style="color: red;">*</samp></label>
                                <asp:Label ID="lbl_PW" runat="server" CssClass="info-value" Visible="false"/>
                                <asp:TextBox ID="txt_PW" runat="server" CssClass="info-value" Visible="true"/>
                            </div>
                            <div class="">
                                <label >สถานะการใช้งาน: <samp style="color: red;">*</samp></label>
                                <asp:DropDownList ID="ddl_status" runat="server" CssClass="form-select" Width="150" Height="30" Font-Size="10">
                                    <asp:ListItem Text="-- กรุณาเลือก --" Value="" />
                                    <asp:ListItem Text="เปิดใช้งาน" Value="1" />
                                    <asp:ListItem Text="ระงับการใช้งาน" Value="0" />
                                </asp:DropDownList>
                            </div>
                            
                            <div class="actions" style="justify-content: center; margin-top: 20px;" >
                                <asp:Button ID="btn_Save" runat="server" Text="💾 บันทึก" CssClass="btn btn-primary" OnClick="btn_Save_Click"/>
                                <asp:Button ID="btn_Cancel" runat="server" Text="❌ Cancel" CssClass="btn btn-warning" OnClick="btn_Cancel_Click"/>
                  
                            </div>
                            
                        </div>

                        <%--<div class="info-section">
                            <h3>🏢 ข้อมูลการปฏิบัติงาน</h3>
                            <div class="info-item">
                                <span class="info-label">หน่วยงาน:</span>
                                <span class="info-value">บริษัท เทคคอร์ป จำกัด (มหาชน)</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">ตำแหน่ง:</span>
                                <span class="info-value">หัวหน้าฝ่ายเทคโนโลยีสารสนเทศ</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">วันที่เริ่มปฏิบัติงาน:</span>
                                <span class="info-value">15 มีนาคม 2563</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">ระดับเงินเดือน:</span>
                                <span class="info-value">ระดับ 9</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">สถานะการทำงาน:</span>
                                <span class="info-value">ปฏิบัติงานปกติ</span>
                            </div>
                        </div>--%>
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
                    KeyFieldName="ID" Width="100%" OnCustomJSProperties="GridView_CustomJSProperties" EnableCallBacks="false" CssClass="">
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
                        <dx:GridViewDataColumn FieldName="Usrname" Caption="Usrname" Width="30">
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="PW" Caption="Password" Width="30">
                            <Settings AllowDragDrop="True" AllowHeaderFilter="False" AllowAutoFilter="False" AllowSort="false" />
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="FullnameT" Caption="Name Thai" Width="100" />
                        <dx:GridViewDataColumn FieldName="FNameE" Caption="Name English" Width="100" />
                        <dx:GridViewDataColumn FieldName="PositionT" Caption="ตำแหน่ง" Width="100" />
                        <dx:GridViewDataColumn FieldName="Tel" Caption="เบอร์โทรศัพท์" Width="50" />
                        <%--<dx:GridViewDataColumn FieldName="FlagActive" Caption="Status" Width="50" >
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                    <DataItemTemplate>
                        <asp:Label ID="lbl_Status" Text="" runat="server" />
                    </DataItemTemplate>
                </dx:GridViewDataColumn>--%>
                        <dx:GridViewDataCheckColumn FieldName="FlagActive" Caption="Status" Width="50">
                            <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <PropertiesCheckEdit DisplayTextChecked="เปิดใช้งาน" DisplayTextUnchecked="ระงับการใช้งาน" />
                            <Settings AllowAutoFilter="True" />
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataColumn Caption="Action" Width="80">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <DataItemTemplate>
                                <asp:Button ID="btn_Edit" Text="Edit" runat="server" OnClick="btn_Edit_Click" CssClass="my-2 btn-edit" />
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <%--<dx:GridViewDataColumn FieldName="count_p" Caption="REACH & Prop65" Width="100" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                    <DataItemTemplate>
                        <asp:Label ID="lbl_CountSendMail_P" Text="" runat="server" />
                    </DataItemTemplate>
                </dx:GridViewDataColumn>--%>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager PageSizeItemSettings-Visible="false" PageSize="20" PageSizeItemSettings-Items="20, 50, 100, 200"></SettingsPager>
                    <Styles>
                        <Header HorizontalAlign="Center" VerticalAlign="Middle" />
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSourceTab1" runat="server"></asp:SqlDataSource>
            </div>


            <!-- Modal สำหรับเปลี่ยนรหัสผ่าน -->

            <div id="passwordModal" class="modal">
                <div class="modal-content">
                    <div class="d-flex justify-content-center ">
                        <div class="">
                            <button class="close-btn" onclick="closePasswordModal()">&times;</button>
                            <h3>🔒 เปลี่ยนรหัสผ่าน</h3>
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
                                <div class="actions">
                                    <%--<asp:Button ID="btn_save_changePw" Text="Save" runat="server" OnClick="btn_save_changePw_Click" CssClass="btn btn-primary" />--%>
                                    <%--<button type="submit" class="btn btn-primary">บันทึก</button>--%>
                                    <button type="button" class="btn btn-secondary" onclick="closePasswordModal()">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
