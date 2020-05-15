<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="QuanLyThuChi.ThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-8">
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-chart-bar"></i>
                    Tổng khoản chi tháng này: <b style="color: red" id="tong"></b>VNĐ
                </div>
                <div class="card-body">
                    <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                            <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                            <div class=""></div>
                        </div>
                    </div>
                    <canvas id="_7DayChart" width="677" height="338" class="chartjs-render-monitor" style="display: block; width: 677px; height: 338px;"></canvas>
                </div>
                <div class="card-footer small text-muted">Cập nhật lần cuối <%=lastTime %> bởi <%=lastUser %></div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-chart-pie"></i>
                    Biểu đồ sử dụng các khoản chi tháng này
                </div>
                <div class="card-body">
                    <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                            <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                            <div class=""></div>
                        </div>
                    </div>
                    <canvas id="myPieChart" width="303" height="303" class="chartjs-render-monitor" style="display: block; width: 303px; height: 303px;"></canvas>
                </div>
                <div class="card-footer small text-muted">Cập nhật lần cuối <%=lastTime.ToLocalTime() %> bởi <%=lastUser %></div>
            </div>
        </div>
    </div>
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>



    <div class="row">
        <div class="col-lg-8">
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-chart-bar"></i>
                    Tổng khoản thu tháng này: <b style="color: red" id="tongThu"></b>VNĐ
                </div>
                <div class="card-body">
                    <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                            <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                            <div class=""></div>
                        </div>
                    </div>
                    <canvas id="_7DayChartThu" width="677" height="338" class="chartjs-render-monitor" style="display: block; width: 677px; height: 338px;"></canvas>
                </div>
                <div class="card-footer small text-muted">Cập nhật lần cuối <%=lastTimeThu %> bởi <%=lastUserThu %></div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-chart-pie"></i>
                    Biểu đồ sử dụng các khoản thu tháng này
                </div>
                <div class="card-body">
                    <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                            <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                            <div class=""></div>
                        </div>
                    </div>
                    <canvas id="myPieChartThu" width="303" height="303" class="chartjs-render-monitor" style="display: block; width: 303px; height: 303px;"></canvas>
                </div>
                <div class="card-footer small text-muted">Cập nhật lần cuối <%=lastTimeThu.ToLocalTime() %> bởi <%=lastUserThu %></div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script>
        $(function () {
            $.ajax({
                type: "POST",
                url: "/ThongKe.aspx/ThongKeTong",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    let chartData = data.d;
                    console.log(chartData)
                    let sum = chartData.Data.reduce((a, b) => a + b, 0);
                    $("#tong").text(sum + " ");
                    new Chart("_7DayChart", {
                        type: "bar",
                        data: {
                            labels: chartData.Labels.map(a => new Date(a).toLocaleDateString()),
                            datasets: [{
                                label: "Tổng tiền: ",
                                backgroundColor: '#4caf50',
                                borderColor: "red",
                                hoverBorderColor: "red",
                                data: chartData.Data
                            }]
                        },
                        options: {
                            tooltips: {
                                callbacks: {
                                    label: function (tooltipItem, data) {
                                        return tooltipItem.yLabel + " VNĐ";
                                    }
                                }
                            },
                            scales: {
                                yAxes: [
                                    {
                                        id: 'y-axis-1',
                                        display: true,
                                        position: 'left',
                                        ticks: {
                                            callback: function (value, index, values) {
                                                return value + " VNĐ";
                                            }
                                        },
                                    }
                                ]
                            },
                            legend: {
                                display: false
                            }
                        }
                    })
                }
            })
            $.ajax({
                type: "POST",
                url: "/ThongKe.aspx/ThongKeTheoLoaiChi",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    let chartData = data.d;
                    new Chart("myPieChart", {
                        type: "pie",
                        data: {
                            labels: chartData.Labels,
                            datasets: [{
                                data: chartData.Data.map(value => parseInt(value)),
                                backgroundColor: ["red", "green", "yellow", "violet", "blue", "orange", "blue", "black", "ocean"],
                            }]

                        },
                        options: {

                        }
                    })
                }
            })



            $.ajax({
                type: "POST",
                url: "/ThongKe.aspx/ThongKeTongThu",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    let chartData = data.d;
                    console.log(chartData)
                    let sum = chartData.Data.reduce((a, b) => a + b, 0);
                    $("#tongThu").text(sum + " ");
                    new Chart("_7DayChartThu", {
                        type: "bar",
                        data: {
                            labels: chartData.Labels.map(a => new Date(a).toLocaleDateString()),
                            datasets: [{
                                label: "Tổng tiền: ",
                                backgroundColor: '#4caf50',
                                borderColor: "red",
                                hoverBorderColor: "red",
                                data: chartData.Data
                            }]
                        },
                        options: {
                            tooltips: {
                                callbacks: {
                                    label: function (tooltipItem, data) {
                                        return tooltipItem.yLabel + " VNĐ";
                                    }
                                }
                            },
                            scales: {
                                yAxes: [
                                    {
                                        id: 'y-axis-1',
                                        display: true,
                                        position: 'left',
                                        ticks: {
                                            callback: function (value, index, values) {
                                                return value + " VNĐ";
                                            }
                                        },
                                    }
                                ]
                            },
                            legend: {
                                display: false
                            }
                        }
                    })
                }
            })
            $.ajax({
                type: "POST",
                url: "/ThongKe.aspx/ThongKeTheoLoaiThu",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    let chartData = data.d;
                    new Chart("myPieChartThu", {
                        type: "pie",
                        data: {
                            labels: chartData.Labels,
                            datasets: [{
                                data: chartData.Data.map(value => parseInt(value)),
                                backgroundColor: ["red", "green", "yellow", "violet", "blue", "orange", "blue", "black", "ocean"],
                            }]

                        },
                        options: {

                        }
                    })
                }
            })
        })
    </script>
</asp:Content>
