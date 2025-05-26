/**
 * 
 */

// /asset/js/mypage/userInfoPopup.js

function attachDynamicEvents() {
  const nameBtn = document.getElementById("editId");
  const phoneBtn = document.getElementById("editPhone");
  const pwdBtn = document.getElementById("editPw");

  if (nameBtn) {
    nameBtn.onclick = () =>
      openPopup(`${contextPath}/editName.me`);
  }
  if (phoneBtn) {
    phoneBtn.onclick = () =>
      openPopup(`${contextPath}/editPhone.me`);
  }
  if (pwdBtn) {
    pwdBtn.onclick = () =>
      openPopup(`${contextPath}/editPassword.me`);
  }
}

function openPopup(page) {
  window.open(page, "popup", "width=400,height=300,scrollbars=no");
}
