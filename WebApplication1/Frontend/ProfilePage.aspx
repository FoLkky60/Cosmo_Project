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
                    <asp:Literal ID="UserType" runat="server" />
                </span>
            </div>

            <div class="profile-info">
                <div class="info-section">
                    <h3>📋 ข้อมูลส่วนตัว</h3>
                    <div class="info-item">
                        <span class="info-label">ชื่อ-นามสกุล:</span>
                        <span class="info-value">
                            <asp:Literal ID="FullNameProfile" runat="server" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">IDTax:</span>
                        <span class="info-value">
                            <asp:Literal ID="IDTax" runat="server"  />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">อีเมล:</span>
                        <span class="info-value">
                            <asp:Literal ID="Email" runat="server" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">เบอร์โทรศัพท์:</span>
                        <span class="info-value">
                            <asp:Literal ID="Tel" runat="server" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Fax:</span>
                        <span class="info-value">
                            <asp:Literal ID="Fax" runat="server"  />
                        </span>
                    </div>
                </div>

                <div class="info-section">
                    <h3>🏢 ข้อมูลการปฏิบัติงาน</h3>
                    <div class="info-item">
                        <span class="info-label">FlagReady:</span>
                        <span class="info-value">
                            <asp:Literal ID="FlagReady" runat="server" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Address:</span>
                        <span class="info-value">
                            <asp:Literal ID="Address" runat="server" />
                        </span>
                    </div>
                    <div class="info-item">
                        <span class="info-label"></span>
                        <span class="info-value">
                           
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
