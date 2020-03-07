const status_color = () => {
  if (document.getElementById('conversation-status').textContent = 'pending') {
  document.getElementById('conversation-status').style.color = "black";
  }
  else if (document.getElementById('conversation-status').textContent = 'ongoing') {
  document.getElementById('conversation-status').style.color = "red";
  }
  else {
  document.getElementById('conversation-status').style.color = "green";
  }
}

export { status_color };
