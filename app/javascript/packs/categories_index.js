const catSelect = document.querySelector(".category-selected");

const categoriesIndex = () => {
  document.querySelectorAll(".category-card").forEach((card) => {
    card.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("change-border-color");
      catSelect.innerText = event.currentTarget.innerText;
    });

  });
};




export { categoriesIndex };
