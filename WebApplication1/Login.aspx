<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../style/Login.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:wght@400;700&display=swap" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class=" d-flex justify-content-center align-content-center min-vh-100 bg-blue-custom ">
            <div class=" d-flex flex-column justify-content-center align-content-center box-shadow: rgba(0, 0, 0, 0.1) 0px 20px 25px -5px, rgba(0, 0, 0, 0.04) 0px 10px 10px -5px;ะำพ">
                <div class="shadow p-5 rounded-4 bg-white">

                    <div id="loginBlock" class=" show ">
                        <h3 class="text-center">Login</h3>

                        <div class="form-group mt-5">
                            <div class="userbox">user</div>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="w-100" />
                            <div class="tiny">We'll never share your email with anyone else.</div>
                        </div>

                        <div class="form-group mt-3">
                            <div class="userbox">password</div>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="w-100" />
                            <div class="tiny">Must be at least 8 characters long.</div>
                        </div>

                        <div class="mt-3">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
                        </div>
                        <div class="d-flex flex-column gap-1 mt-1">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="submit-style" OnClick="IbtLogin_Click" />

                            <div class="forgot-style cursor" onclick="showForgotPassword()">forgot password?</div>
                        </div>

                        <div class=" d-flex justify-content-center">
                            <div class=" d-flex flex-column  mt-4 text-gray text-link">
                                <p>1. คู่มือการตอบรับใบสั่งซื้อออนไลน์</p>
                                <p>2. คู่มือการตอบรับใบเสนอราคาออนไลน์</p>
                                <p>3. คู่มือการตอบรับใบประเมินผู้ขายออนไลน์</p>
                                <p>4. คู่มือการแนบเอกสาร COA</p>
                            </div>
                        </div>
                        <div class=" d-flex flex-column justify-content-center align-items-center text-gray pt-2 ">
                            <img class="logo-img" src="imge/522d82_fb7cc55b09e0427c9bf4dca3e95c50ac~mv2.png" />
                            <div class="cosmo-ver">Version.Cosmo2025/01</div>
                        </div>


                    </div>

                    <div id="forgotPasswordBlock" class=" hidden ">
                        <h3 class="text-center">Reset Password</h3>

                        <div class="form-group mt-5">
                            <div class="userbox">user</div>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="w-100" />
                            <div class="tiny">We'll never share your email with anyone else.</div>
                        </div>

                        <div class="form-group mt-3">
                            <div class="userbox">password</div>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="w-100" />
                            <div class="tiny">Must be at least 8 characters long.</div>
                        </div>

                        <div class="mt-3">
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" />
                        </div>
                        <div class="d-flex flex-column gap-1 mt-1">
                            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="submit-style" />

                            <div class="forgot-style cursor" onclick="showLogin()">Login</div>
                        </div>

                        <div class=" d-flex justify-content-center">
                            <div class=" d-flex flex-column  mt-4 text-gray text-link">
                                <p>1. คู่มือการตอบรับใบสั่งซื้อออนไลน์</p>
                                <p>2. คู่มือการตอบรับใบเสนอราคาออนไลน์</p>
                                <p>3. คู่มือการตอบรับใบประเมินผู้ขายออนไลน์</p>
                                <p>4. คู่มือการแนบเอกสาร COA</p>
                            </div>
                        </div>
                        <div class=" d-flex flex-column justify-content-center align-items-center text-gray pt-2 ">
                            <img class="logo-img" src="imge/522d82_fb7cc55b09e0427c9bf4dca3e95c50ac~mv2.png" />
                            <div class="cosmo-ver">Version.Cosmo2025/01</div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </form>
    <script>
        function showForgotPassword() {
            document.getElementById('loginBlock').classList.remove('show');
            document.getElementById('loginBlock').classList.add('hidden');

            document.getElementById('forgotPasswordBlock').classList.remove('hidden');
            document.getElementById('forgotPasswordBlock').classList.add('show');
        }

        function showLogin() {
            document.getElementById('forgotPasswordBlock').classList.remove('show');
            document.getElementById('forgotPasswordBlock').classList.add('hidden');

            document.getElementById('loginBlock').classList.remove('hidden');
            document.getElementById('loginBlock').classList.add('show');
        }

    </script>

</body>
</html>
