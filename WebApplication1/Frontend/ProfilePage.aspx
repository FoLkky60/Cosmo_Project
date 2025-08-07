<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ProfilePage.aspx.vb" Inherits="WebApplication1.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../style/Profile.css" rel="stylesheet" />
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

        function toggleRole() {
            const roleElement = document.getElementById('userRole');
            
            if (isAdmin) {
                roleElement.textContent = 'ผู้ใช้งาน';
                roleElement.className = 'profile-role role-user';
                isAdmin = false;
            } else {
                roleElement.textContent = 'ผู้ดูแลระบบ';
                roleElement.className = 'profile-role role-admin';
                isAdmin = true;
            }
        }

        // ปิด modal เมื่อคลิกนอกพื้นที่
        window.onclick = function(event) {
            const modal = document.getElementById('passwordModal');
            if (event.target === modal) {
                closePasswordModal();
            }
        }

        // เอาออกส่วนเปลี่ยนสีอวตาร
        document.addEventListener('DOMContentLoaded', function() {
            // ไม่มีการเปลี่ยนสีอวตาร
        });
    </script>

    <div class="container p-4 min-vh-100">
        <div class="profile-card">
            <div class="profile-header">
                <div class="profile-avatar" id="avatar">
                    สม
                </div>
                <h1 class="profile-name">นายสมชาย วิริยะ</h1>
                <span class="profile-role role-admin" id="userRole">ผู้ดูแลระบบ</span>
            </div>

            <div class="profile-info">
                <div class="info-section">
                    <h3>📋 ข้อมูลส่วนตัว</h3>
                    <div class="info-item">
                        <span class="info-label">ชื่อ-นามสกุล:</span>
                        <span class="info-value">นายสมชาย วิริยะ</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">รหัสพนักงาน:</span>
                        <span class="info-value">EMP001234</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">อีเมล:</span>
                        <span class="info-value">somchai.w@techcorp.co.th</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">เบอร์โทรศัพท์:</span>
                        <span class="info-value">02-123-4567 ต่อ 1234</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">หน่วยงาน:</span>
                        <span class="info-value">ฝ่ายเทคโนโลยีสารสนเทศ</span>
                    </div>
                </div>

                <div class="info-section">
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
                </div>
            </div>

            <div class="stats">
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
            </div>

            <div class="actions">
                <button class="btn btn-primary" onclick="openPasswordModal()">
                    🔒 เปลี่ยนรหัสผ่าน
                </button>
                <button class="btn btn-secondary" onclick="editProfile()">
                    ✏️ แก้ไขโปรไฟล์
                </button>
                <button class="btn btn-success" onclick="toggleRole()">
                    🔄 เปลี่ยนสิทธิ์
                </button>
            </div>
        </div>
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
                            <input type="password" id="currentPassword" required>
                        </div>
                        <div class="form-group">
                            <label for="newPassword">รหัสผ่านใหม่:</label>
                            <input type="password" id="newPassword" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">ยืนยันรหัสผ่านใหม่:</label>
                            <input type="password" id="confirmPassword" required>
                        </div>
                        <div class="actions">
                            <button type="submit" class="btn btn-primary">บันทึก</button>
                            <button type="button" class="btn btn-secondary" onclick="closePasswordModal()">ยกเลิก</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
