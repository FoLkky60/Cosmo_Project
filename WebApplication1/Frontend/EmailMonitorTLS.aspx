<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="EmailMonitorTLS.aspx.vb" Inherits="WebApplication1.MonitorTLS" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <link href="../style/Emailmonitor.css" rel="stylesheet" />
    <script>
       

        window.onload = function () {
            CKEDITOR.replace('<%= txtBody.ClientID %>', {
                height: 200, 
                toolbar: [
                    { name: 'document', items: ['Source', '-', 'Save'] },
                    { name: 'clipboard', items: ['Undo', 'Redo'] },
                    { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'] },
                    { name: 'colors', items: ['TextColor', 'BGColor'] }, 
                    { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote'] },
                    { name: 'links', items: ['Link', 'Unlink'] },
                    { name: 'insert', items: ['Image', 'Table', 'HorizontalRule'] },
                    { name: 'styles', items: ['Format', 'FontSize'] }
                ]

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
                <div class=" d-flex justify-content-between  gap-2 ">
                    <div class="d-flex  align-items-center gap-4 ">
                        <div>
                            <asp:DropDownList ID="ddlSearchType" runat="server" CssClass="dropdown-custom" AutoPostBack="true" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                <asp:ListItem Text="All" Value="" />

                            </asp:DropDownList>
                        </div>

                        <div>
                            <asp:DropDownList ID="ddlSearchMailID" runat="server" CssClass="dropdown-custom " AutoPostBack="true" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                <asp:ListItem Text="All" Value="" />

                            </asp:DropDownList>
                        </div>


                        <div>
                            <asp:DropDownList ID="ddlSearchYear" runat="server" CssClass="dropdown-custom" AutoPostBack="true" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                <asp:ListItem Text="All" Value="" />

                            </asp:DropDownList>
                        </div>


                        <div>
                            <asp:DropDownList ID="ddlSearchStatus" runat="server" CssClass="dropdown-custom" AutoPostBack="true" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                <asp:ListItem Text="All" Value="" />

                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:LinkButton ID="clearSearch" runat="server" Text="Clear" CssClass=" " OnClick="btnClear_Click">
                            <iconify-icon icon="tdesign:clear-filled" width="24" height="24"></iconify-icon>
                            </asp:LinkButton>
                        </div>

                    </div>

                    <div class=" d-flex justify-content-end  m-2 ">
                        <a href="SendEmailFrom" class="btn btn-info  cursor-pointer">📝 เพิ่มเมล
                        </a>
                    </div>
                </div>
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
                            <asp:BoundField DataField="MailID" HeaderText="MailID">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Type_Mail" HeaderText="Type Mail">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Year" HeaderText="Year">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Subject" HeaderText="Subject">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ApprovedBy" HeaderText="Approved By">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ApprovedDate" HeaderText="Approved Date">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CreatedBy" HeaderText="Created By">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UpdatedDate" HeaderText="Updated Date">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UpdatedBy" HeaderText="Updated By">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="View">
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
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
                                <ItemStyle CssClass="p-2 border border-1 text-center" />
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
                            <div class="file-item m-1">
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
