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