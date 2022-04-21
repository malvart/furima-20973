window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTax = inputValue / 10;
  addTaxDom.innerHTML = Math.floor(addTax).toLocaleString();
  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = Math.floor(inputValue - addTax).toLocaleString();
})
})