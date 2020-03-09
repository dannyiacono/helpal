import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.querySelectorAll(".search-input");
  if (locationInput) {
    places({ container: locationInput });
  }
};


export { initAutocomplete }
