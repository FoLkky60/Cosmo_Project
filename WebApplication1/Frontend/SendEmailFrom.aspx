<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SendEmailFrom.aspx.vb" Inherits="WebApplication1.SendEmailFrom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #ffffff;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .email-container {
            background: #ffffff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(6, 91, 167, 0.12), 
                        0 2px 8px rgba(6, 91, 167, 0.08);
            width: 100%;
            max-width: 480px;
            overflow: hidden;
            border: 1px solid rgba(6, 91, 167, 0.08);
        }

        .header {
            background: linear-gradient(135deg, #065ba7 0%, #0a7bc4 100%);
            color: white;
            padding: 24px 28px;
            text-align: center;
            position: relative;
        }

        .header h1 {
            font-size: 22px;
            margin-bottom: 6px;
            font-weight: 600;
            letter-spacing: -0.5px;
        }

        .header p {
            opacity: 0.92;
            font-size: 14px;
            font-weight: 400;
        }

        .form-container {
            padding: 28px 32px 32px;
            background: #ffffff;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            color: #1a1a1a;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
            letter-spacing: -0.2px;
        }

        input[type="email"],
        input[type="text"],
        textarea {
            width: 100%;
            padding: 14px 16px;
            border: 1.5px solid #e8eaed;
            border-radius: 12px;
            font-size: 14px;
            transition: all 0.2s ease;
            background: #ffffff;
            color: #1a1a1a;
            font-family: inherit;
        }

        input[type="email"]:focus,
        input[type="text"]:focus,
        textarea:focus {
            outline: none;
            border-color: #065ba7;
            box-shadow: 0 0 0 3px rgba(6, 91, 167, 0.08);
        }

        textarea {
            resize: vertical;
            min-height: 90px;
            line-height: 1.5;
        }

        .file-input-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .file-input-wrapper {
            flex: 1;
            min-width: 150px;
        }

        .file-input {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
        }

        .file-input input[type="file"] {
            position: absolute;
            left: -9999px;
        }

        .file-input-label {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 14px 16px;
            background: #f8f9fa;
            border: 1.5px dashed #d1d5db;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.2s ease;
            color: #6b7280;
            font-weight: 500;
            text-align: center;
            font-size: 13px;
        }

        .file-input-label:hover {
            background: #065ba7;
            color: white;
            border-color: #065ba7;
            border-style: solid;
        }

        .file-preview {
            margin-top: 10px;
            padding: 8px 12px;
            background: #f0f9ff;
            border-radius: 8px;
            font-size: 12px;
            color: #065ba7;
            display: none;
            border: 1px solid #e0f2fe;
        }

        .link-input-group {
            display: flex;
            gap: 15px;
            align-items: end;
        }

        .add-link-btn {
            background-color:white;
            color: black;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 13px;
            transition: all 0.2s ease;
            white-space: nowrap;
        }



        .links-list {
            margin-top: 16px;
        }

        .link-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 16px;
            background: #f8f9fa;
            border-radius: 10px;
            margin-bottom: 8px;
            font-size: 13px;
            border: 1px solid #e9ecef;
        }

        .link-item a {
            color: #065ba7;
            text-decoration: none;
            font-weight: 500;
            word-break: break-all;
            flex: 1;
            margin-right: 12px;
        }

        .remove-link {
            background: #ef4444;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 4px 8px;
            cursor: pointer;
            font-size: 11px;
            font-weight: 500;
        }

        .send-btn {
            width: 100%;
            padding: 16px;
            background: #065ba7;
            color: white;
            border: none;
            border-radius: 14px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            margin-top: 24px;
            letter-spacing: -0.2px;
        }

        .send-btn:hover {
            background: #054a91;
        }

        .send-btn:active {
            transform: scale(0.98);
        }

        /* Popup Styles */
        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .popup {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 25px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3),
                        0 0 0 1px rgba(255, 255, 255, 0.2);
            max-width: 350px;
            width: 90%;
            animation: popupShow 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        @keyframes popupShow {
            from {
                transform: scale(0.5) translateY(50px);
                opacity: 0;
            }
            to {
                transform: scale(1) translateY(0);
                opacity: 1;
            }
        }

        .popup-icon {
            font-size: 40px;
            color: #28a745;
            margin-bottom: 12px;
            animation: bounce 0.6s ease-in-out;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
        }

        .popup h2 {
            color: #065ba7;
            margin-bottom: 8px;
            font-size: 18px;
        }

        .popup p {
            color: #666;
            margin-bottom: 16px;
            font-size: 13px;
        }

        .popup-close {
            background: linear-gradient(135deg, #065ba7 0%, #0a7bc4 100%);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            font-size: 13px;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(6, 91, 167, 0.3);
        }

        .popup-close:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(6, 91, 167, 0.4);
        }

        @media (max-width: 768px) {
            body {
                padding: 5px;
            }
            
            .email-container {
                max-width: 100%;
                margin: 5px auto;
            }
            
            .file-input-group {
                flex-direction: column;
            }
            
            .link-input-group {
                flex-direction: column;
                align-items: stretch;
            }
            
            .form-container {
                padding: 15px 20px;
            }
            
            .header {
                padding: 15px 20px;
            }
            
            .header h1 {
                font-size: 18px;
            }
            
            .header p {
                font-size: 12px;
            }
        }
        .overflows {
            width:500px;
            overflow:auto;
        }
    </style>
</head>
<body>

    <div class="email-container">
        <div class="header">
            <h1>📧 ส่ง Email</h1>
            <p>เขียนข้อความและแนบไฟล์ได้อย่างง่ายดาย</p>
        </div>
        
        <div class="form-container">
            <form id="emailForm" runat="server">
                <div class="form-group">
                    <label for="recipient">ผู้รับ (To)</label>
                    <input type="email" id="recipient" name="recipient" placeholder="example@email.com" required/>
                </div>
                
                <div class="form-group">
                    <label for="subject">หัวข้อ (Subject)</label>
                    <input type="text" id="subject" name="subject" placeholder="หัวข้อของอีเมล" required/>
                </div>
                
                <div class="form-group">
                    <label for="message">ข้อความ (Message)</label>
                    <textarea id="message" name="message" placeholder="เขียนข้อความของคุณที่นี่..." required/></textarea>
                </div>
                
                <div class="form-group">
                    <label>แนบไฟล์</label>
                    <div class="file-input-group">
                        <div class="file-input-wrapper">
                            <div class="file-input">
                                <input type="file" id="fileAttachment" name="fileAttachment" multiple/>
                                <label for="fileAttachment" class="file-input-label">
                                    📎 เลือกไฟล์
                                </label>
                            </div>
                            <div class="file-preview" id="filePreview"></div>
                        </div>
                        
                        <div class="file-input-wrapper">
                            <div class="file-input">
                                <input type="file" id="imageAttachment" name="imageAttachment" accept="image/*" multiple/>
                                <label for="imageAttachment" class="file-input-label">
                                    🖼️ เลือกรูปภาพ
                                </label>
                            </div>
                            <div class="file-preview" id="imagePreview"></div>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>เพิ่มลิงค์</label>
                    <div class="link-input-group">
                        <input type="url" id="linkInput" placeholder="https://example.com"/>
                        <button type="button" class="add-link-btn" onclick="addLink()">เพิ่ม</button>
                    </div>
                    <div class="links-list" id="linksList"></div>
                </div>
                
                <button type="submit" class="send-btn">
                    📤 ส่งอีเมล
                </button>
                <div class="overflows">
                    <asp:GridView ID="GridViewMailFormat" runat="server" AutoGenerateColumns="True"></asp:GridView>
                </div>
            
            </form>
        </div>

       
    </div>



    
    <!-- Success Popup -->
    <div class="popup-overlay" id="popupOverlay">
        <div class="popup">
            <div class="popup-icon">✅</div>
            <h2>ส่งเรียบร้อย!</h2>
            <p>อีเมลของคุณถูกส่งเรียบร้อยแล้ว</p>
            <button class="popup-close" onclick="closePopup()">ตกลง</button>
        </div>
    </div>

    <script>
        let links = [];

        // File preview functionality
        document.getElementById('fileAttachment').addEventListener('change', function (e) {
            showFilePreview(e.target.files, 'filePreview');
        });

        document.getElementById('imageAttachment').addEventListener('change', function (e) {
            showFilePreview(e.target.files, 'imagePreview');
        });

        function showFilePreview(files, previewId) {
            const preview = document.getElementById(previewId);
            if (files.length > 0) {
                let fileNames = Array.from(files).map(file => file.name).join(', ');
                preview.textContent = `ไฟล์ที่เลือก: ${fileNames}`;
                preview.style.display = 'block';
            } else {
                preview.style.display = 'none';
            }
        }

        // Link management
        function addLink() {
            const linkInput = document.getElementById('linkInput');
            const url = linkInput.value.trim();

            if (url && isValidUrl(url)) {
                links.push(url);
                updateLinksList();
                linkInput.value = '';
            } else {
                alert('กรุณาใส่ URL ที่ถูกต้อง');
            }
        }

        function isValidUrl(string) {
            try {
                new URL(string);
                return true;
            } catch (_) {
                return false;
            }
        }

        function removeLink(index) {
            links.splice(index, 1);
            updateLinksList();
        }

        function updateLinksList() {
            const linksList = document.getElementById('linksList');
            linksList.innerHTML = '';

            links.forEach((link, index) => {
                const linkItem = document.createElement('div');
                linkItem.className = 'link-item';
                linkItem.innerHTML = `
                    <a href="${link}" target="_blank">${link}</a>
                    <button class="remove-link" onclick="removeLink(${index})">ลบ</button>
                `;
                linksList.appendChild(linkItem);
            });
        }

        // Form submission
        document.getElementById('emailForm').addEventListener('submit', function (e) {
            e.preventDefault();

            // Simulate sending email
            setTimeout(() => {
                showSuccessPopup();
                resetForm();
            }, 1000);
        });

        function showSuccessPopup() {
            document.getElementById('popupOverlay').style.display = 'flex';
        }

        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';
        }

        function resetForm() {
            document.getElementById('emailForm').reset();
            links = [];
            updateLinksList();
            document.getElementById('filePreview').style.display = 'none';
            document.getElementById('imagePreview').style.display = 'none';
        }

        // Allow Enter key to add links
        document.getElementById('linkInput').addEventListener('keypress', function (e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                addLink();
            }
        });

        // Close popup when clicking outside
        document.getElementById('popupOverlay').addEventListener('click', function (e) {
            if (e.target === this) {
                closePopup();
            }
        });
    </script>
</body>
</html>
