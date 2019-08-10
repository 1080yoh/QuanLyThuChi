<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="QuanLyChiTieu.aspx.cs" Inherits="QuanLyThuChi.QuanLyChiTieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (!daThem)
        {%>
    <div class="alert alert-info alert-dismissible fade show" role="alert">
        <strong>Thông báo!</strong> Hôm nay bạn chưa có khoản chi nào
          <button type="button" class="close" data-dismiss="alert" aria-label="Close" data-toggle="tooltip" data-placement="top" title="Đóng">
              <span aria-hidden="true">&times;</span>
          </button>
    </div>
    <%} %>
    <div class="row">
        <div class="col-lg-4">
            <section class="card">
                <header class="card-header">
                    <i class="fas fa-pencil-alt"></i>
                    Thêm các khoản chi hôm nay
                </header>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtSoTien">Số tiền</label>
                        <div class="input-group">
                            <asp:TextBox ID="txtSoTien" runat="server" CssClass="form-control" TextMode="Number" step="10000" min="0"></asp:TextBox>
                            <div class="input-group-prepend">
                                <div class="input-group-text">VNĐ</div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dropdownLoaiKhoanChi">Loại khoản chi</label>
                        <asp:DropDownList ID="dropdownLoaiKhoanChi" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="tenkhoanchi" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLTHUCHIConnectionString %>" SelectCommand="SELECT * FROM [LOAIKHOANCHI]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label for="comment">Comment:</label>
                        <asp:TextBox ID="chitiet" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <asp:Button ID="BtnThemKhoanChi" CssClass="btn btn-primary" runat="server" Text="Thêm khoản chi này" OnClick="BtnThemKhoanChi_Click" />
                </div>
            </section>
        </div>
        <div class="col-lg-8">
            <section class="card">
                <header class="card-header">
                    <div class="row">
                        <div class="col-md-4">
                            <i class="fas fa-table"></i>
                            Chi tiết các khoản chi 
                        </div>

                        <asp:DropDownList ID="chonNgay" AutoPostBack="true" CssClass="form-control col-md-2 form-control-sm" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="homNay" Selected="True">Hôm nay</asp:ListItem>
                            <asp:ListItem Value="thangNay">Tháng này</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </header>
                <style>
                    .table-fixed {
                        max-height: 372px;
                        overflow-y: scroll;
                    }

                        .table-fixed thead tr:nth-child(1) th {
                            background: white;
                            position: sticky;
                            top: 0;
                            z-index: 10;
                        }
                </style>
                <div class="card-body">
                    <div class="table-fixed">
                        <asp:GridView ID="gridViewKhoanChi" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-fixed" DataKeyNames="ID">
                            <Columns>
                                <asp:TemplateField HeaderText="STT">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Số tiền" SortExpression="sotien">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server"
                                            Text='<%# Convert.ToInt32(Eval("sotien")) + " VNĐ" %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ngay" HeaderText="Thời gian" SortExpression="ngay" />
                                <asp:BoundField DataField="tenkhoanchi" HeaderText="Loại khoản chi" SortExpression="tenkhoanchi" />
                                <asp:BoundField DataField="chitiet" HeaderText="Chi tiết" SortExpression="chitiet" />
                                <asp:BoundField DataField="nguoithem" HeaderText="Người tạo" SortExpression="nguoithem" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $("#ContentPlaceHolder1_gridViewKhoanChi").addClass('table-striped');
        })
    </script>
</asp:Content>
