toasts = document.querySelectorAll('.toast-custom');

toasts.forEach(toast => {
  closeButton = toast.querySelector('.close-cross')

  closeButton.addEventListener('click', function(event){
    event.preventDefault();
    toast.remove();
  })
});
