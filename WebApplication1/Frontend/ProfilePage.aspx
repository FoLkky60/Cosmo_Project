<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ProfilePage.aspx.vb" Inherits="WebApplication1.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
            0% { transform: rotate(45deg) translateX(-100%); }
            100% { transform: rotate(45deg) translateX(100%); }
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
            margin-bottom: 40px;
        }

        .info-section {
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 25px;
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
            padding-top:20px;
            display: flex;
            gap: 15px;
            justify-content: center;
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
            <button class="close-btn" onclick="closePasswordModal()">&times;</button>
            <h3>🔒 เปลี่ยนรหัสผ่าน</h3>
            <form onsubmit="changePassword(event)">
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
            </form>
        </div>
    </div>
</asp:Content>
