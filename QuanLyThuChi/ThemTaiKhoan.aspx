<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="ThemTaiKhoan.aspx.cs" Inherits="QuanLyThuChi.ThemTaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <header class="card-header">
            Thêm tài khoản
        </header>
        <div class="card-body">
            <div class='form-group row'>
                <label for="username" class="col-sm-2 col-form-label">Tên đăng nhập</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="username" runat="server" placeholder="Tên đăng nhập" CssClass="form-control" minlength="5"></asp:TextBox>
                    <asp:Label ID="invalidUsername" CssClass="invalid-feedback" Style="display: block; color: red;" runat="server"></asp:Label>
                </div>
            </div>
            <div class="form-group row">
                <label for="password" class="col-sm-2 col-form-label">Mật khẩu</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="password" CssClass="form-control" runat="server" TextMode="Password" placeholder="Mật khẩu" minlength="4" required></asp:TextBox>

                </div>
            </div>
            <div class="form-group row">
                <label for="confirmPassword" class="col-sm-2 col-form-label">Nhập lại mật khẩu</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="confirmPassword" CssClass="form-control"  TextMode="Password" runat="server" placeholder="Nhập lại mật khẩu" minlength="4" required></asp:TextBox>
                    <asp:Label ID="invalidConfirm" CssClass="invalid-feedback" Style="display: block; color: red;" runat="server"></asp:Label>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-4">
                    <asp:Button ID="ThemTaiKhoanBtn" runat="server" CssClass="btn btn-primary" Text="Thêm tài khoản" OnClick="ThemTaiKhoanBtn_Click"/>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
