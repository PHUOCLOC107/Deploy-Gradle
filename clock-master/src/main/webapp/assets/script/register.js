document.querySelector('form').addEventListener('submit', function (event) {
    event.preventDefault();
    const fullname = document.getElementById('fullname').value;
    const phonenumber = document.getElementById('phonenumber').value;
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    if (localStorage.getItem(username)) {
        alert('Tên đăng nhập đã tồn tại.');
    } else {
        localStorage.setItem(username, JSON.stringify({fullname, phonenumber, password}));
        alert('Đăng ký thành công. Bạn có thể đăng nhập.');
        window.location.href = "login.html";
    }
});
