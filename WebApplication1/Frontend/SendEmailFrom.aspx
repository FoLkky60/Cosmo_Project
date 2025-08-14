<%@ Page Language="vb" AutoEventWireup="false" ValidateRequest="false" CodeBehind="SendEmailFrom.aspx.vb" Inherits="WebApplication1.SendEmailFrom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.iconify.design/3/3.1.0/iconify.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
  
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../style/EmaiUserFrom.css" rel="stylesheet" />
    <script>
        window.onload = function () {
            CKEDITOR.replace('<%= txtBody.ClientID %>', {
                height: 300,

            });
        };
        function syncCKEditor() {
            for (var instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
        }

 
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



        function showSuccessAlert() {
            alert("ส่งอีเมลเรียบร้อยแล้ว!");  
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
</head>
<body>

   <div class="email-container p-4">


        <div class="">
            <form id="emailForm" runat="server" enctype="multipart/form-data">
                <div class="p-0 m-0  ">
                    <asp:TextBox ID="txtRecipient" runat="server" CssClass=" w-100 no-border" required="true" placeholder="ส่งถึง" />
                    
                </div>
                <div class="p-0 m-0 ">
                    <asp:TextBox ID="txtSubject" runat="server" CssClass=" w-100 no-border" required="true" placeholder="หัวข้อ" />
                </div>
                <div class="p-0 m-0 ">
                    <asp:TextBox ID="txtBody" runat="server" CssClass="my-editor"  ValidateRequest="false"></asp:TextBox>
                </div>

            
                <asp:FileUpload ID="fuFiles" runat="server" CssClass="mt-2" AllowMultiple="true" />
             
                
                   <asp:Button ID="btnSend" runat="server" Text="📤 ส่งอีเมล" CssClass="send-btn" OnClick="btnSend_Click" OnClientClick="syncCKEditor();" />
            </form>
        </div>


    </div>


<div class="popup-overlay" id="popupOverlay" style="display:none;">  <!-- ซ่อนโดยดีฟอลต์ -->
    <div class="popup">
        <div class="popup-icon">✅</div>
        <h2>ส่งเรียบร้อย!</h2>
        <p>อีเมลของคุณถูกส่งเรียบร้อยแล้ว</p>
        <button class="popup-close" onclick="closePopup()">ตกลง</button>
    </div>
</div>




</body>
</html>
