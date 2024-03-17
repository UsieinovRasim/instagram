import { Collapse } from 'flowbite';

document.addEventListener('DOMContentLoaded', function() {
  const toggleButton = document.getElementById('navbar-toggle');
  const menu = document.getElementById('navbar-menu');

  const collapseMenu = new Collapse(menu, toggleButton);

  toggleButton.addEventListener('click', function() {
    collapseMenu.toggle();
  });
});
