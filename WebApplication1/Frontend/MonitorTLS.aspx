<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="MonitorTLS.aspx.vb" Inherits="WebApplication1.MonitorTLS" %>
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


            <div class=" d-flex gap-2 flex-column w-100 mw p-2 ">
                <div class=" d-flex  rounded-4 p-2  ">
                    <div>
                        <div class="col">
                            <div class="d-flex flex-wrap gap-3 p-2 overflow-auto ">
                                <div class="col ">
                                    <div class="d-flex w-100">
                                       <%-- <div class="">
                                            <asp:DropDownList ID="ddlSearchType" runat="server" CssClass="search-dropdown ">
                                                <asp:ListItem Text="All" Value="All" />
                                                <asp:ListItem Text="Name" Value="Seller" />
                                                <asp:ListItem Text="ID" Value="SupplierId" />
                                            </asp:DropDownList>
                                        </div>--%>

                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true"
                                            EmptyDataText="No data found. Please try again with a different keyword."
                                            CssClass="gridview-class">
                                        </asp:GridView>

                                        <asp:TextBox ID="txtKeyword" runat="server" CssClass="searchbox px-4" AutoPostBack="true"
                                            OnTextChanged="txtKeyword_TextChanged" placeholder="Search..." />

                                    </div>
                                </div>
                                <%--<div>                                  
                                    <asp:Button ID="btnKeywordSearch" runat="server" Text="Search" CssClass="print-box" OnClick="btnKeywordSearch_Click" />
                                </div>--%>

                                <div>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="dropdown-box dropdown-toggle">
                                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Buyer 1" Value="Buyer 1"></asp:ListItem>
                                        <asp:ListItem Text="Buyer 2" Value="Buyer 2"></asp:ListItem>
                                        <asp:ListItem Text="Buyer 3" Value="Buyer 3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="">
                                    <div class=" d-flex gap-2">
                                        <div class="">
                                            <asp:TextBox ID="txtDateStart" runat="server" TextMode="Date" CssClass="search-calender"
                                                AutoPostBack="true" OnTextChanged="DateFilter_Changed" />
                                        </div>
                                        <div class="">
                                            <asp:TextBox ID="txtDateEnd" runat="server" TextMode="Date" CssClass="search-calender"
                                                AutoPostBack="true" OnTextChanged="DateFilter_Changed" />
                                        </div>
                                    </div>

                                </div>

                                <div>
                                    <asp:Button ID="Button2" runat="server" Text="Print" class="print-box" OnClientClick="openPopup(); return false;" />
                                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="print-box" OnClick="btnClear_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-100 overflow-auto mw shadowcustom bg-white">
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
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnShowPopup" runat="server" Text="Edit" OnClick="btnShowPopup_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" SortExpression="SupplierId" />
                            <asp:BoundField DataField="SendMail" HeaderText="Mail" SortExpression="SendMail" />
                            <asp:BoundField DataField="SendAgain" HeaderText="SA" SortExpression="SendAgain" />
                            <asp:BoundField DataField="Buyer" HeaderText="Buyer" SortExpression="Buyer" />
                            <asp:BoundField DataField="CommitmentLetter" HeaderText="Letter" SortExpression="CommitmentLetter" />
                            <asp:BoundField DataField="Seller" HeaderText="Seller" SortExpression="Seller" />
                            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                            <asp:BoundField DataField="TaxpayerAccountNumber" HeaderText="Taxpayer" SortExpression="TaxpayerAccountNumber" />
                            <asp:BoundField DataField="Response" HeaderText="Response" SortExpression="Response" />
                            <asp:BoundField DataField="RespondentsSignature" HeaderText="Respondent Signature" SortExpression="RespondentsSignature" />
                            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                            <asp:BoundField DataField="ResponseDate" HeaderText="Response Date" SortExpression="ResponseDate" />
                            <asp:BoundField DataField="LastSentDate" HeaderText="Last Sent Date" SortExpression="LastSentDate" />
                            <asp:BoundField DataField="PrintAction" HeaderText="Print" SortExpression="PrintAction" />
                            <asp:BoundField DataField="ViewAction" HeaderText="View" SortExpression="ViewAction" />
                        </Columns>
                        <HeaderStyle CssClass="GridViewHeader" />
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>

    <div id="overlay" class="overlay" onclick="closePopup()"></div>
    <div id="popup" class="popup">
        <div class=" d-flex justify-content-center flex-column gap-4">
            <iconify-icon class=" d-flex justify-content-end" icon="carbon:close-outline" width="32" height="32" onclick="closePopup()"></iconify-icon>
            <div class="dropdown-item-container  d-flex align-items-center gap-2">
                <div>Year</div>
                <div class="dropdown">
                    <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Sort
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </div>
            </div>
            <div class="dropdown-item-container d-flex align-items-center gap-2">
                <div>Divisioms</div>
                <div class="dropdown">
                    <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Sort
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </div>
            </div>
            <asp:Button CssClass="" ID="Button1" runat="server" Text="Button" />
        </div>
    </div>

    <div id="overlayEdit" class="overlay" onclick="closeEditPopup()"></div>
    <div id="popupEdit" class="popupEdit">
        <div class="d-flex justify-content-center flex-column gap-4 bg-white p-4 rounded shadowcustom" style="max-height: 80vh; overflow: auto; min-width: 80vw;">

            <h5 class="text-center">ข้อมูลในตาราง</h5>
            <div class="text-end">
                <button class="btn btn-secondary mt-3" type="button" onclick="closeEditPopup()">ปิด</button>
            </div>
            <div class="d-flex justify-content-center w-100 overflow-auto">
                <asp:GridView ID="GridViewPopup" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="grid-sum"
                    
                    OnPageIndexChanging="GridViewPopup_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" SortExpression="SupplierId" />
                        <asp:BoundField DataField="SendMail" HeaderText="Mail" SortExpression="SendMail" />
                        <asp:BoundField DataField="SendAgain" HeaderText="SA" SortExpression="SendAgain" />
                        <asp:BoundField DataField="Buyer" HeaderText="Buyer" SortExpression="Buyer" />
                        <asp:BoundField DataField="CommitmentLetter" HeaderText="Letter" SortExpression="CommitmentLetter" />
                        <asp:BoundField DataField="Seller" HeaderText="Seller" SortExpression="Seller" />
                        <asp:BoundField DataField="TaxpayerAccountNumber" HeaderText="Taxpayer" SortExpression="TaxpayerAccountNumber" />
                        <asp:BoundField DataField="Response" HeaderText="Response" SortExpression="Response" />
                        <asp:BoundField DataField="RespondentsSignature" HeaderText="Respondent Signature" SortExpression="RespondentsSignature" />
                        <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                        <asp:BoundField DataField="ResponseDate" HeaderText="Response Date" SortExpression="ResponseDate" />
                        <asp:BoundField DataField="LastSentDate" HeaderText="Last Sent Date" SortExpression="LastSentDate" />
                        <asp:BoundField DataField="PrintAction" HeaderText="Print" SortExpression="PrintAction" />
                        <asp:BoundField DataField="ViewAction" HeaderText="View" SortExpression="ViewAction" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
