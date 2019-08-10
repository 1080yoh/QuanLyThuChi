<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="QuanLyThuChi.DoiMatKhau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <header class="card-header">
            Đổi mật khẩu
        </header>
        <div class="card-body">
            <div class='form-group row'>
                <label for="password" class="col-sm-2 col-form-label">Mật khẩu cũ</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Mật khẩu cũ" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="invalidPassword" CssClass="invalid-feedback" Style="display: block; color: red;" runat="server"></asp:Label>
                </div>
            </div>
            <div class="form-group row">
                <label for="newPassword" class="col-sm-2 col-form-label">Mật khẩu mới</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="newPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Mật khẩu mới" minlength="4"></asp:TextBox>

                </div>
            </div>
            <div class="form-group row">
                <label for="confirmPassword" class="col-sm-2 col-form-label">Nhập lại mật khẩu</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="confirmPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                    <asp:Label ID="invalidConfirm" CssClass="invalid-feedback" Style="display: block; color: red;" runat="server"></asp:Label>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-4">
                    <asp:Button ID="DoiMatKhauBtn" runat="server" CssClass="btn btn-primary" Text="Đổi mật khẩu" OnClick="DoiMatKhauBtn_Click" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
