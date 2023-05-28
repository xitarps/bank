// document.addEventListener('turbo:load', function(){
  toasts = document.querySelectorAll('.toast-custom')
  toasts.forEach(toast => {
    closeButton = toast.querySelector('.close-cross')

    closeButton.addEventListener('click', function(e){
      e.preventDefault();
      toast.remove();
    })
  });
// });
