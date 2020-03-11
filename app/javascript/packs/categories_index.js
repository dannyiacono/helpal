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
    catSelect.classList.add('blue-back');
    catSelect.innerText = event.currentTarget.innerText;
    catInput.value = catId.innerText;
    const catEmpty = document.querySelector(".no-category-selected");
     catEmpty.classList.add("d-none")
    });
  });
  if(catSelect.innerText === "") {
    catSelect.insertAdjacentHTML("afterend","<span class='no-category-selected'>Please select a category before continuing.</span>");
  }

};


export { categoriesIndex };
