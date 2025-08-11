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
                <div class=" max-wid  overflow-auto shadowcustom bg-white">
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
                            <asp:BoundField DataField="TlsID" HeaderText="TlsID" SortExpression="TlsID">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TlsYear" HeaderText="TlsYear" SortExpression="TlsYear">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Supplierid" HeaderText="Supplierid" SortExpression="Supplierid">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SupplierCode" HeaderText="SupplierCode" SortExpression="SupplierCode">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DateCreate" HeaderText="DateCreate" SortExpression="DateCreate">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Response" HeaderText="Response" SortExpression="Response">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DateResponse" HeaderText="DateResponse" SortExpression="DateResponse">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Buyer" HeaderText="Buyer" SortExpression="Buyer">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BuyerName" HeaderText="BuyerName" SortExpression="BuyerName">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ByUsr" HeaderText="ByUsr" SortExpression="ByUsr">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DateUpload" HeaderText="DateUpload" SortExpression="DateUpload">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FlagSentEmail" HeaderText="FlagSentEmail" SortExpression="FlagSentEmail">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SentEmailDatetime" HeaderText="SentEmailDatetime" SortExpression="SentEmailDatetime">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UnitSentEmail" HeaderText="UnitSentEmail" SortExpression="UnitSentEmail">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FlagRead" HeaderText="FlagRead" SortExpression="FlagRead">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DateRead" HeaderText="DateRead" SortExpression="DateRead">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FlagConfirm" HeaderText="FlagConfirm" SortExpression="FlagConfirm">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FileDocCommitment" HeaderText="FileDocCommitment" SortExpression="FileDocCommitment">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FlagCompleted" HeaderText="FlagCompleted" SortExpression="FlagCompleted">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FlagPrint" HeaderText="FlagPrint" SortExpression="FlagPrint">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1 nowrap text-center" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>



            </div>
        </div>
    </div>
</asp:Content>
