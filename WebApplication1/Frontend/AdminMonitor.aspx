<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="AdminMonitor.aspx.vb" Inherits="WebApplication1.AdminMonitor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="min-vh-100 p-3 ">
        <div class=" d-flex justify-content-center align-items-start flex-column  gap-2 d-lg-flex flex-lg-row ">
            



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
                <div class="max-wid overflow-auto shadowcustom bg-white">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="grid-sum" AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <PagerStyle CssClass="pager" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SupplierName2" HeaderText="Supplier Name 2" SortExpression="SupplierName2">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                                <HeaderStyle CssClass="p-2 text-center " />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IDTax" HeaderText="ID Tax" SortExpression="IDTax">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FlagIntranet" HeaderText="Flag" SortExpression="FlagIntranet">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Supplier_Remark" HeaderText="Remark" SortExpression="Supplier_Remark">
                                <HeaderStyle CssClass="p-2 text-center" />
                                <ItemStyle CssClass="p-2 border border-1  text-center" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
     </div>
</asp:Content>
