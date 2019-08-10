<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuanLyThuChi.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
</head>
<body class="bg-secondary">
    <form id="form1" runat="server">
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Đăng nhập</div>

                <div class="card-body">
                    <div>
                        <asp:Label ID="ThongBao" runat="server" Text="" Font-Italic="True" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <asp:TextBox ID="username" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Tài khoản" required autofocus></asp:TextBox>
                            <label for="username">Tài khoản</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Mật khẩu" required></asp:TextBox>
                            <label for="password">Mật khẩu</label>
                        </div>
                    </div>
                    <asp:Button ID="BtnLogin" runat="server" Text="Đăng nhập" CssClass="btn btn-primary btn-block" OnClick="BtnLogin_Click" />
                </div>

            </div>
        </div>

    </form>
</body>
</html>
