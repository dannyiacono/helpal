const status_color = () => {
  const conversations_status = document.querySelectorAll('.conversation-status');

  conversations_status.forEach(conversation_status => {
    if (conversation_status.textContent == 'pending') {
      conversation_status.style.color = "black";
    }
    else if (conversation_status.textContent == 'ongoing') {
      conversation_status.style.color = "red";
    }
    else {
      conversation_status.style.color = "green";
    }
  });
}

export { status_color };
