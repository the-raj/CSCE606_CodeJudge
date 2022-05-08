export function show(headline, copy, buttonArray) {
  const modal = document.querySelector(".modal")
  const headlineNode = modal.querySelector(".modal__headline")
  const copyNode = modal.querySelector(".modal__copy")
  const buttonContainer = modal.querySelector(".modal__buttons")

  document.body.style.overflow = "hidden"
  headlineNode.textContent = headline != null ? headline : ""
  copyNode.textContent = copy != null ? copy : ""
  if (buttonArray !== undefined && buttonArray.length > 0) {
    buttonArray.forEach((button) => {
      buttonContainer.innerHTML += button
    })
  }
  modal.classList.add("modal--show")
}

export function close() {
  const modal = document.querySelector(".modal")
  const headlineNode = modal.querySelector(".modal__headline")
  const copyNode = modal.querySelector(".modal__copy")
  const buttonContainer = modal.querySelector(".modal__buttons")  
  modal.classList.remove("modal--show")
  document.body.style.overflow = ""
  headlineNode.textContent = ""
  copyNode.textContent = ""
  while (buttonContainer.firstChild) {
    buttonContainer.removeChild(buttonContainer.lastChild);
  }
}