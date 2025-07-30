<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Profile.aspx.vb" Inherits="WebApplication1.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="min-vh-100 d-flex justify-content-center align-items-center flex-column">
        <div class=" d-flex flex-column shadow p-4 rounded-3 ">
            <div class="p-2 d-flex justify-content-center align-content-center">
                <img src="../imge/3135715.png" class="rounded" width="100" height="100" />
            </div>
            <div class="pt-4">
                        <div class=" d-flex justify-content-center  p-1 bg-success rounded-5 px-2 w-fit text-white tiny shadowcustom">Admin</div>
                    </div>
            <div class="d-flex flex-row gap-4">
                <div>Fristname</div>
                <div>Lastname</div>
                <div>Company</div>
            </div>
        </div>
        <div class="pt-4">
            <div class=" d-flex justify-content-between shadow p-4 rounded-3 gap-4">
                <div>you can reset password this here</div>
                <button class="">Chang Password</button>
            </div>
            
            
        </div>
        
    </div>
</asp:Content>
