<%@ Page Language="vb" AutoEventWireup="false" ValidateRequest="false" CodeBehind="SendEmailFrom.aspx.vb" Inherits="WebApplication1.SendEmailFrom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.iconify.design/3/3.1.0/iconify.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <link href="../style/EmaiUserFrom.css" rel="stylesheet" />
    <script>
        window.onload = function () {
            CKEDITOR.replace('<%= txtBody.ClientID %>', {
                height: 200,

            });
        };
        function syncCKEditor() {
            for (var instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
        }

    </script>
</head>
<body>

    <div class="email-container">
        <div class="header">
            <a href="EmailMonitorTLS" class="contain">
                <span class="iconify" data-icon="ic:baseline-arrow-back" data-width="24" data-height="24"></span> 
            </a>
            <h1>📧 ส่ง Email</h1>
            <p>เขียนข้อความและแนบไฟล์ได้อย่างง่ายดาย</p>
        </div>

        <div class="form-container">
            <form id="emailForm" runat="server" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="recipient">ผู้รับ (To)</label>
                    <asp:TextBox ID="txtRecipient" runat="server" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label for="subject">หัวข้อ (Subject)</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label for="message">ข้อความ (Message)</label>
                    <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Rows="10" Columns="80" ValidateRequest="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>แนบไฟล์</label>
                    <asp:FileUpload ID="fuFile" runat="server" AllowMultiple="true" />
                </div>                   
                   <asp:Button ID="btnSend" runat="server" Text="📤 ส่งอีเมล" CssClass="send-btn" OnClick="btnSend_Click" OnClientClick="syncCKEditor();" />
            </form>
        </div>


    </div>

     <%--<div class="form-group">
                    <label>แนบไฟล์</label>
                    <div class="file-input-group">
                        <div class="file-input-wrapper">
                            <div class="file-input">
                                <asp:FileUpload ID="FileUpload1" runat="server" />

                                <label for="fileAttachment" class="file-input-label">
                                    📎 เลือกไฟล์
                                </label>
                            </div>
                            <div class="file-preview" id="filePreview"></div>
                        </div>

                        <div class="file-input-wrapper">
                            <div class="file-input">
                                <asp:FileUpload ID="fuImage" runat="server" AllowMultiple="true" accept="image/*" />
                                <label for="imageAttachment" class="file-input-label">
                                    🖼️ เลือกรูปภาพ
                                </label>
                            </div>
                            <div class="file-preview" id="imagePreview"></div>
                        </div>
                    </div>
                </div>  --%>   


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



        function showSuccessPopup() {
            document.getElementById('popupOverlay').style.display = 'flex';

            setTimeout(function () {
                window.location.reload();
            }, 1500);
        }

        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';
            window.location.reload();
        }

        function resetForm() {
            document.getElementById('emailForm').reset();
            links = [];
            updateLinksList();
            document.getElementById('filePreview').style.display = 'none';
            document.getElementById('imagePreview').style.display = 'none';
        }


        document.getElementById('linkInput').addEventListener('keypress', function (e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                addLink();
            }
        });

        document.getElementById('popupOverlay').addEventListener('click', function (e) {
            if (e.target === this) {
                closePopup();
            }
        });
    </script>
</body>
</html>
