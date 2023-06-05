navContent = document.querySelector('.nav-content');
navButton = document.querySelector('.nav-button');

navButton.addEventListener('click', function(event){
  event.preventDefault();
  navContent.classList.contains('hidden') ? navContent.classList.remove('hidden') : navContent.classList.add('hidden');
});
