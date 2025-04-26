// Biểu đồ doanh thu theo tháng
var revenueCtx = document.getElementById('revenueChart').getContext('2d');
var revenueChart = new Chart(revenueCtx, {
    type: 'line', // Biểu đồ đường
    data: {
        labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11'],
        datasets: [{
            label: 'Doanh thu',
            data: [20000000, 15000000, 30000000, 30000000, 25000000, 50000000, 60000000, 65000000, 55000000, 40000000, 50000000],
            borderColor: 'rgba(75, 192, 192, 1)',
            tension: 0.1
        }]
    }
});

// Biểu đồ khách hàng
var customerCtx = document.getElementById('customerChart').getContext('2d');
var customerChart = new Chart(customerCtx, {
    type: 'bar', // Biểu đồ cột
    data: {
        labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11'],
        datasets: [{
            label: 'Khách hàng mới',
            data: [30, 35, 30, 60, 70, 50, 55, 40, 80, 75, 90],
            backgroundColor: 'rgba(153, 102, 255, 0.2)',
            borderColor: 'rgba(153, 102, 255, 1)',
            borderWidth: 1
        }]
    }
});




// Biểu đồ doanh thu theo ngày
const dailyCtx = document.getElementById('dailyRevenueChart').getContext('2d');

// Dữ liệu doanh thu theo ngày (tổng cộng 45 triệu VNĐ)
const dailyRevenueData = {
    labels: Array.from({ length: 30 }, (_, i) => `Ngày ${i + 1}`), // Ngày 1 đến Ngày 30
    datasets: [{
        label: 'Doanh thu (VNĐ)',
        data: [2000000, 1500000, 1700000, 1600000, 1400000, 1800000, 1300000,
            2000000, 1900000, 1500000, 1800000, 1600000, 1700000, 1400000,
            1500000, 1800000, 2000000, 1600000, 1500000, 1400000, 1800000,
            1700000, 1600000, 2000000, 1500000, 1800000, 1400000, 1700000,
            1500000, 1400000], // Tổng cộng 45 triệu VNĐ
        backgroundColor: 'rgba(33, 150, 243, 0.5)', // Màu xanh dương nhạt
        borderColor: 'rgba(33, 150, 243, 1)', // Màu xanh dương đậm
        borderWidth: 2,
        fill: true, // Tô màu dưới đường
    }]
};

// Tùy chọn hiển thị biểu đồ
const dailyRevenueOptions = {
    responsive: true,
    plugins: {
        legend: {
            position: 'top',
        },
        tooltip: {
            callbacks: {
                label: function(context) {
                    return `${context.raw.toLocaleString()} ₫`;
                }
            }
        }
    },
    scales: {
        x: {
            title: {
                display: true,
                text: 'Ngày trong tháng',
            }
        },
        y: {
            beginAtZero: true,
            title: {
                display: true,
                text: 'Doanh thu (VNĐ)',
            },
            ticks: {
                callback: function(value) {
                    return value.toLocaleString() + ' ₫';
                }
            }
        }
    }
};

// Vẽ biểu đồ
new Chart(dailyCtx, {
    type: 'line', // Biểu đồ đường
    data: dailyRevenueData,
    options: dailyRevenueOptions
});
