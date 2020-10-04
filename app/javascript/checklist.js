const addCheckList = () => {
  const addNewButton = document.getElementById("add_check_item");
  let sendRowButton
  const checkList = document.getElementById("check_list");

  addNewButton.addEventListener("click", () => {
    console.log("add button pushed");
    const HTML = `
      <div class="checklist_form">
        <input placeholder="New check item" type="text" name="check_item[text]" id="new_check_item">
        <input type="button" value="add" id="send_row_btn" class="btn add_item_btn">
      </div>
      `
    let inputItemForm = document.getElementById("new_check_item");
    if (!inputItemForm) {
      checkList.insertAdjacentHTML("afterend", HTML);
      sendRowButton = document.getElementById("send_row_btn");
      sendRowButton.addEventListener("click", function(){ sendRow(checkList) });
      //Enterを押した時もチェックリスト追加できるようにする
      inputItemForm = document.getElementById("new_check_item");
      window.addEventListener("keydown", (e) => {
        console.log(inputItemForm.value);
        console.log("addCheckList -> inputItemForm.value", inputItemForm.value);
        const key = e.key;
        if (key == "Enter" && inputItemForm.value) {
          e.preventDefault();
          sendRow(checkList);
        }
      })
    }

  })

  console.log("addCheckList func loaded");
};

const sendRow = (checkList) => {
  const formData = new FormData(document.getElementsByTagName("form")[0]);
  for (let value of formData.entries()) {
    console.log(value);
  }
  const XHR = new XMLHttpRequest();
  const checkListId = formData.get('routine[check_list_id]') || 'shouldCreateList';
  XHR.open("POST", `./check_list/${checkListId}/check_items/`, true);
  XHR.responseType = "json";
  XHR.send(formData);
  XHR.onload = () => {
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
    }
    const item = XHR.response.check_item;
    console.log("XHR.onload -> item", item);
    const HTML = `
      <li>
        <input type="checkbox" name="${item.id}" id="${item.id}" value="true" class="check_item">
        <label for="${item.id}">${item.text}</label>
      </li>
    `
    checkList.insertAdjacentHTML("beforeend", HTML);
    document.getElementById("new_check_item").value = null;
  }
}

window.addEventListener("load", addCheckList);