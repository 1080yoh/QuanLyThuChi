<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="QuanLyThuChi.Layout.Navbar" %>
<ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
    <li class="nav-item text-white" style="display: flex; align-items: center;">Xin chào &nbsp;<b><%=Session["username"].ToString()%></b>
    </li>
    <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-bell fa-fw"></i>
            <!--span class="badge badge-danger">9+</span-->
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
        </div>
    </li>
    <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="ThemTaiKhoan.aspx">Thêm tài khoản</a>
            <a class="dropdown-item" href="DoiMatKhau.aspx">Đổi mật khẩu</a>
            <a class="dropdown-item" href="Logout.aspx">Đăng xuất</a>
        </div>
    </li>

</ul>
