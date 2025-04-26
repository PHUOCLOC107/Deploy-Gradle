document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault();

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    if (username === 'admin' && password === 'admin123') {
        // Chuyển hướng đến trang admin
        window.location.href = 'admin.html';
    } else {
        // Kiểm tra tài khoản trong localStorage
        const user = JSON.parse(localStorage.getItem(username));
        if (user && user.password === password) {
            // Lưu trạng thái đăng nhập
            localStorage.setItem('loggedInUser', username);
            window.location.href = "index.html";
        } else {
            alert('Tên đăng nhập hoặc mật khẩu không đúng!');
        }
    }

});