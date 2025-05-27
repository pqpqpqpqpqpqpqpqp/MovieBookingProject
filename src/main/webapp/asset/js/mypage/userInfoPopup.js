function openPopup(page) {
  window.open(contextPath + page, "popup", "width=400,height=300,scrollbars=no");
}

function attachDynamicEvents() {
  const nameBtn = document.getElementById("editId");
  const phoneBtn = document.getElementById("editPhone");
  const pwdBtn = document.getElementById("editPw");

  if (nameBtn) {
    nameBtn.onclick = () => openPopup("/editName.me");
  }
  if (phoneBtn) {
    phoneBtn.onclick = () => openPopup("       /editPhone.me");
  }
  if (pwdBtn) {
    pwdBtn.onclick = () => openPopup("/editPassword.me");
  }
}
