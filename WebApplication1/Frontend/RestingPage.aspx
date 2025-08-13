<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RestingPage.aspx.vb" Inherits="WebApplication1.RestingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet"/>

    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"/>

    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inria+Sans:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Playpen+Sans+Thai:wght@100..800&family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&family=Sarabun:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet"/>

    <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
    <title></title>
    <style>
        .main-box {
            color: #065ba7;
            outline:none;
            width:200px;
            transition-duration: 0.1s ;
        }
        .main-box:hover {
            transform:scale(1.1);
        }
        a{
            outline:none;
            text-decoration:none;
        }

    </style>
</head>
    
<body>
    <form id="form1" runat="server">

        <div class=" d-flex justify-content-center align-items-center min-vh-100 gap-4  ">
            <a href="Home" class="main-box  shadow rounded-4 p-4">
                <div class=" d-flex justify-content-center align-items-center flex-column   ">
                    <iconify-icon icon="material-symbols-light:home-rounded" width="80" height="80"></iconify-icon>
                    <h5 class="mt-3">Home</h5>
                </div>
            </a>
            <a href="FromQeations" class="main-box  shadow rounded-4 p-4">
                <div class=" d-flex justify-content-center align-items-center flex-column   ">
                    <iconify-icon icon="mingcute:paper-fill" width="80" height="80"></iconify-icon>
                    <h5 class="mt-3">แบบประเมิน</h5>
                </div>
            </a>
            <a href="AdminMonitor" class="main-box  shadow rounded-4 p-4">
                <div class=" d-flex justify-content-center align-items-center flex-column    ">
                    <iconify-icon icon="ri:admin-fill" width="80" height="80"></iconify-icon>
                    <h5 class="mt-3">AdminMonitor</h5>
                </div>
            </a>
            <a href="EmailMonitorTLS" class="main-box  shadow rounded-4 p-4">
                <div class=" d-flex justify-content-center align-items-center flex-column  ">
                    <iconify-icon icon="ic:baseline-email" width="80" height="80"></iconify-icon>
                    <h5 class="mt-3">EmailMonitor</h5>
                </div>
            </a>
            <a href="SummeryTLS" class="main-box  shadow rounded-4 p-4">
                <div class=" d-flex justify-content-center align-items-center flex-column    ">
                    <iconify-icon icon="ic:round-people" width="80" height="80"></iconify-icon>
                    <h5 class="mt-3">SummeryTLS</h5>
                </div>
            </a>
        </div>
    </form>
</body>
</html>
