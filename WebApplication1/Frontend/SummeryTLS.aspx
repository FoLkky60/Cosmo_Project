<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="SummeryTLS.aspx.vb" Inherits="WebApplication1.SummeryTLS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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



            <div class="datagrid w-100 mw ">
                <div class="p-2 ">
                    <div class="  d-flex flex-column p-4  rounded-4">
                        <div class="px-3">ปี พ.ศ.</div>
                        <div>
                            <asp:TextBox ID="txtSearchFrom" runat="server" CssClass="searchbox-2 px-4" placeholder="Search..." AutoPostBack="true" OnTextChanged="txtSearchFrom_TextChanged" />
                            <asp:Button ID="Button2" runat="server" CssClass="print-box" Text="Clear" OnClick="Button2_Click" />

                        </div>

                    </div>
                </div>
                <div class="overflow-auto shadowcustom bg-white">
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        Width="100%"
                        Style="border: 1px solid #ddd;"
                        CssClass="grid-sum"
                        AllowPaging="True"
                        PageSize="10"
                        OnPageIndexChanging="GridView1_PageIndexChanging">
                        <PagerStyle CssClass="pager" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="sNO" HeaderText="ลำดับ" SortExpression="sNO">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="buyer_name" HeaderText="ชื่อดำเนินการ" SortExpression="buyer_name">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="po_sent" HeaderText="ส่ง" SortExpression="po_sent">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="po_accept" HeaderText="ตอบแล้ว" SortExpression="po_accept">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="po_no_response" HeaderText="ยังไม่ได้ตอบ" SortExpression="po_no_response">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pr_sent" HeaderText="ตรวจสอบแล้ว" SortExpression="pr_sent">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pr_accept" HeaderText="ยังไม่ได้ตรวจสอบ" SortExpression="pr_accept">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="eva_sent" HeaderText="ยังไม่ได้คำตอบ" SortExpression="eva_sent">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                            <asp:BoundField DataField="year" HeaderText="ปี พ.ศ." SortExpression="year">
                                <ItemStyle CssClass="p-2 border border-1 nowrap" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
