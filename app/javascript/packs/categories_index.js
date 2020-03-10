const catSelect = document.querySelector(".category-selected");

const catInput = document.getElementById("request_category_id");
const catId = document.querySelector(".name_cat_id");

const categoriesIndex = () => {
  const categories = document.querySelectorAll(".category-card");
  categories.forEach((card) => {
    card.addEventListener("click", (event) => {
      categories.forEach((category) => {
        category.classList.remove("change-border-color")
      })
    event.currentTarget.classList.add("change-border-color");
    catSelect.innerText = event.currentTarget.innerText;
    catInput.value = catId.innerText;
    });

  });
};




export { categoriesIndex };
