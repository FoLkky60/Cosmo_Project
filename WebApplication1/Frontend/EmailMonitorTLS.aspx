<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="EmailMonitorTLS.aspx.vb" Inherits="WebApplication1.MonitorTLS" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <link href="../style/Emailmonitor.css" rel="stylesheet" />
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
    <script>
        function openPopup() {
  
            document.getElementById('overlay').style.display = 'block';
            document.getElementById('popup').style.display = 'block';
        }

        function closePopup() {
          
            document.getElementById('overlay').style.display = 'none';
            document.getElementById('popup').style.display = 'none';
        }
    </script>
    <script>
        function openPopupEdit() {
            document.getElementById('<%= pnlPopup.ClientID %>').style.display = 'block';
            document.getElementById('overlayEdit').style.display = 'block';
        }
        function closeEditPopup() {
            document.getElementById('<%= pnlPopup.ClientID %>').style.display = 'none';
            document.getElementById('overlayEdit').style.display = 'none';
        }
        function handleApprove() {
            alert('อีเมลได้รับการอนุมัติแล้ว');
            // เพิ่มโค้ดสำหรับการอนุมัติที่นี่
        }

        function handleReject() {
            if (confirm('คุณแน่ใจหรือไม่ที่จะปฏิเสธอีเมลนี้?')) {
                alert('อีเมลถูกปฏิเสธแล้ว');
                // เพิ่มโค้ดสำหรับการปฏิเสธที่นี่
            }
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="min-vh-100 p-3 ">
        <div class=" d-flex justify-content-center align-items-start flex-column  gap-2 d-lg-flex flex-lg-row ">
            <div class="p-4">
                <div class=" d-flex justify-content-center align-items-center flex-column shadowcustom p-4 rounded-4 usercard bg-white ">
                    <img src="../imge/3135715.png" width="200" height="200" class=" rounded-img " />
                    <div class="pt-4">
                        <div class=" d-flex justify-content-center  p-1 bg-success rounded-5 px-2 w-fit text-white tiny shadowcustom">Admin</div>
                    </div>
                    <div class=" d-flex  text-start gap-2 p-4 fw-light ">
                        <div class="text-start">Dr.test testttt </div>
                    </div>
                </div>
            </div>


            <div class=" d-flex gap-2 flex-column w-100 mw p-2 ">
                <div class=" d-flex  rounded-4 p-2  ">
                    <div>
                        <div class="col">
                            <div class="d-flex flex-wrap gap-3 p-2 overflow-auto ">
                                <div class="col ">
                                    <div class="d-flex w-100">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true"
                                            EmptyDataText="No data found. Please try again with a different keyword."
                                            CssClass="gridview-class">
                                        </asp:GridView>
                                    </div>
                                </div>

                                

                            </div>
                        </div>
                    </div>
                </div>
                <a href="SendEmailFrom" class=" d-flex justify-content-end  cursor-pointer m-2" > 
                                    <iconify-icon icon="zondicons:add-solid" width="50" height="50"></iconify-icon>
                                </a>
                <div class="w-100 overflow-auto mw shadowcustom bg-white">
                    <asp:GridView ID="GridViewMailFormat" runat="server" AutoGenerateColumns="False"
                        Width="100%"
                        Style="border: 1px solid #ddd;"
                        CssClass="grid-sum"
                        AllowPaging="True"
                        PageSize="10"
                        DataKeyNames="MailID"
                        OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCommand="GridViewMailFormat_RowCommand"
                        >
                        <PagerStyle CssClass="pager" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="MailID" HeaderText="MailID" />
                            <asp:BoundField DataField="Type_Mail" HeaderText="Type Mail" />
                            <asp:BoundField DataField="Year" HeaderText="Year" />
                            <asp:BoundField DataField="Subject" HeaderText="Subject" />
                            <asp:BoundField DataField="ApprovedBy" HeaderText="Approved By" />
                            <asp:BoundField DataField="ApprovedDate" HeaderText="Approved Date" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" />
                            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" />
                            <asp:BoundField DataField="UpdatedDate" HeaderText="Updated Date" />
                            <asp:BoundField DataField="UpdatedBy" HeaderText="Updated By" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />

                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <asp:LinkButton
                                        ID="lnkView"
                                        runat="server"
                                        Text="View"
                                        CommandName="ViewMail"
                                        CommandArgument='<%# Eval("MailID") %>'  />
                                </ItemTemplate>
                            </asp:TemplateField>
              

                            <asp:TemplateField HeaderText="Send Mail">
                                <ItemTemplate>
                                    <asp:Button
                                        ID="btnSendMail"
                                        runat="server"
                                        Text="Send"
                                        CommandName="SendMail"
                                        CommandArgument='<%# Eval("MailID") %>'
                                        OnClick="btnSendMail_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>

    <div id="overlayEdit" class="overlay" onclick="closeEditPopup()"></div>
    <asp:Panel ID="pnlPopup" runat="server" CssClass="popupstatus bg-white" Visible="False">
        <div class="popup-body">
            <asp:HiddenField ID="hdnMailID" runat="server" />
            <div class="  d-flex gap-5">
            <div>
                <div class="field-group">
                    <div class="field-label">📝 หัวเรื่อง</div>
                    <div class="field-content">
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-controls  "  Rows="10" Columns="80" ValidateRequest="false" />
                    </div>

                </div>

                <div class="field-group">
                    <div class="field-label">💬 รายละเอียด</div>
                    <div class="field-content">
                        <asp:Literal ID="litBody" runat="server"></asp:Literal>
                    </div>

                </div>


                <div class="field-group">
                    <div class="field-label">📎 ไฟล์แนบ</div>
                    <asp:Repeater ID="rptAttachments" runat="server">
                        <ItemTemplate>
                            <div class="file-item">
                                <div class="file-icon">📄</div>
                                <div class="file-info">
                                    <div class="file-name">
                                        <a href='<%# Eval("FileLink") %>' target="_blank"><%# Eval("FileName") %></a>
                                    </div>
                                    <div class="file-size"><%# Eval("FileSize") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

            <div class="field-group">
                <div class="field-label">💬 แก้ไข</div>
                <div class="">
                    <asp:TextBox ID="txtBody" runat="server" CssClass="form-controls" TextMode="MultiLine" Rows="5" />
                </div>
            </div>
            </div>

            <div class="action-buttons">
                <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-cancle-custom" OnClick="btnClose_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-reject" OnClick="btnDelete_Click" OnClientClick="return confirm('ยืนยันการลบข้อมูลนี้?');" />
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-approve" OnClick="btnSave_Click" />
            </div>
        </div>
    </asp:Panel>


</asp:Content>
