
window.onload = function() {
    const loggedInUser = localStorage.getItem('loggedInUser');
    if (loggedInUser) {
        document.getElementById('login-button').style.display = 'none';
        document.getElementById('register-button').style.display = 'none';
        document.getElementById('account-button').style.display = 'inline-block';
        document.getElementById('logout-button').style.display = 'inline-block';
        document.getElementById('account-button').addEventListener('click', function() {
            displayPurchaseHistory();
        })
    }

    // Đăng xuất
    document.getElementById('logout-button').addEventListener('click', function() {
        localStorage.removeItem('loggedInUser');
        window.location.reload();
        window.location.href = "index.html";
    });
};
