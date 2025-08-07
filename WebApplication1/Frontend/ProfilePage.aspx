<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ProfilePage.aspx.vb" Inherits="WebApplication1.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../style/Profile.css" rel="stylesheet" />
    <script src="../javaScript/ProfilePage.js"></script>

<div class="container p-4 min-vh-100">
        <div class="profile-card">
            <div class="profile-header">
                <div class="profile-avatar" id="avatar">
                    <asp:Literal ID="LiteralAvatar" runat="server" Text="สม" />
                </div>
                <h1 class="profile-name">
                    <asp:Literal ID="LiteralName" runat="server" Text="นายสมชาย วิริยะ" />
                </h1>
                <span class="profile-role role-admin" id="userRole">
                    <asp:Literal ID="LiteralRole" runat="server" Text="ผู้ดูแลระบบ" />
                </span>
            </div>

            <div class="profile-info">
                <div class="info-section">
                    <h3>📋 ข้อมูลส่วนตัว</h3>
                    <div class="info-item">
                        <span class="info-label">ชื่อ-นามสกุล:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralFullName" runat="server" Text="นายสมชาย วิริยะ" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">รหัสพนักงาน:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralEmployeeID" runat="server" Text="EMP001234" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">อีเมล:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralEmail" runat="server" Text="somchai.w@techcorp.co.th" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">เบอร์โทรศัพท์:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralPhone" runat="server" Text="02-123-4567 ต่อ 1234" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">หน่วยงาน:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralDepartment" runat="server" Text="ฝ่ายเทคโนโลยีสารสนเทศ" />
                        </span>
                    </div>
                </div>

                <div class="info-section">
                    <h3>🏢 ข้อมูลการปฏิบัติงาน</h3>
                    <div class="info-item">
                        <span class="info-label">หน่วยงาน:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralCompany" runat="server" Text="บริษัท เทคคอร์ป จำกัด (มหาชน)" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">ตำแหน่ง:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralPosition" runat="server" Text="หัวหน้าฝ่ายเทคโนโลยีสารสนเทศ" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">วันที่เริ่มปฏิบัติงาน:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralStartDate" runat="server" Text="15 มีนาคม 2563" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">ระดับเงินเดือน:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralSalaryLevel" runat="server" Text="ระดับ 9" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">สถานะการทำงาน:</span>
                        <span class="info-value">
                            <asp:Literal ID="LiteralWorkStatus" runat="server" Text="ปฏิบัติงานปกติ" />
                        </span>
                    </div>
                </div>
            </div>

            <div class="stats">
                <div class="stat-item">
                    <div class="stat-number">
                        <asp:Literal ID="LiteralWorkDays" runat="server" Text="1,247" />
                    </div>
                    <div class="stat-label">วันปฏิบัติงาน</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">
                        <asp:Literal ID="LiteralProjectsCompleted" runat="server" Text="28" />
                    </div>
                    <div class="stat-label">โครงการที่สำเร็จ</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">
                        <asp:Literal ID="LiteralRating" runat="server" Text="4.8" />
                    </div>
                    <div class="stat-label">คะแนนประเมิน</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">
                        <asp:Literal ID="LiteralYearsInService" runat="server" Text="5" />
                    </div>
                    <div class="stat-label">ปีอายุงาน</div>
                </div>
            </div>
            
    <!-- Modal สำหรับเปลี่ยนรหัสผ่าน -->

           <%-- <div class="actions">
                <asp:Button ID="btnChangePassword" runat="server" Text="🔒 เปลี่ยนรหัสผ่าน" CssClass="btn btn-primary" OnClick="openPasswordModal()" />
                <asp:Button ID="btnEditProfile" runat="server" Text="✏️ แก้ไขโปรไฟล์" CssClass="btn btn-secondary" OnClick="editProfile()" />
                <asp:Button ID="btnToggleRole" runat="server" Text="🔄 เปลี่ยนสิทธิ์" CssClass="btn btn-success" OnClick="toggleRole()" />
            </div>--%>
        </div>
    </div>

    <%--<div id="passwordModal" class="modal">
        <div class="modal-content">
            <div class="d-flex justify-content-center">
                <div>
                    <button class="close-btn" OnClick="closePasswordModal()">&times;</button>
                    <h3>🔒 เปลี่ยนรหัสผ่าน</h3>
                    <div onsubmit="changePassword(event)">
                        <div class="form-group">
                            <label for="currentPassword">รหัสผ่านปัจจุบัน:</label>
                            <input type="password" id="currentPassword" required />
                        </div>
                        <div class="form-group">
                            <label for="newPassword">รหัสผ่านใหม่:</label>
                            <input type="password" id="newPassword" required />
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">ยืนยันรหัสผ่านใหม่:</label>
                            <input type="password" id="confirmPassword" required />
                        </div>
                        <div class="actions">
                            <button type="submit" class="btn btn-primary">บันทึก</button>
                            <button type="button" class="btn btn-secondary" OnClick="closePasswordModal()">ยกเลิก</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
