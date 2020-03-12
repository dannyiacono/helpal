const scrollToLastMessage = () => {
  const messages = document.querySelectorAll('.conversation-messages');
  const lastMessage = messages[messages.length - 1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}


export { scrollToLastMessage };
