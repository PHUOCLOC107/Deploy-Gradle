function toggleChat() {
    const chatBox = document.getElementById("chatBox");
    const chatButton = document.getElementById("chatButton");
    const chatIcon = document.getElementById("chatIcon");

    if (chatBox.style.display === "none" || chatBox.style.display === "") {
        chatBox.style.display = "flex";
        setTimeout(() => {
            chatBox.classList.add("show");
        }, 2);
        chatButton.classList.add("rotate");
        chatIcon.textContent = "✖";
    } else {
        chatBox.classList.remove("show");  // Remove the show class to slide out
        setTimeout(() => {
            chatBox.style.display = "none";
        }, 400);  // Wait for the slide-out transition to finish before hiding
        chatButton.classList.remove("rotate");
        chatIcon.textContent = "💬";
    }
}