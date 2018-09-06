(function() {
addEventListener("direct-upload:initialize", event => {
  const { target, detail } = event
  const { id, file, progress } = detail
  const progressBar = document.getElementById("progress-bar")
  progressBar.insertAdjacentHTML("beforebegin", `
  <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
    <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
    <span class="direct-upload__filename">${file.name} </span>
    <br>
  </div>
`)
})

addEventListener("direct-upload:start", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.remove("direct-upload--pending")
})

addEventListener("direct-upload:progress", event => {
  const { id, progress } = event.detail
  const progressElement = document.getElementById(`direct-upload-progress-${id}`)
  progressElement.style.width = `${progress}%`
})

addEventListener("direct-upload:error", event => {
  event.preventDefault()
  const { id, error } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--error")
  element.setAttribute("title", error)
  const errorMessage = document.getElementById('duplicate_message')
  const errorContainer = document.getElementsByClassName('duplicate-message-container')
  if ( errorContainer[0].style.display = "none") {
    errorContainer[0].style.display = "block";
  }

  const newError = error + ". This file already exist"
  errorMessage.innerHTML = newError
  const uploadBtn = document.getElementById('upload-file')
  uploadBtn.removeAttribute('data-disable-with');
})

addEventListener("direct-upload:end", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--complete")
})

})();
