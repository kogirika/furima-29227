function calculation(){

  const inputPriceElem = document.getElementById("item-price");
  const addTaxPriceElem = document.getElementById("add-tax-price");
  const profitElem = document.getElementById("profit");
  
  inputPriceElem.addEventListener('input', function(){

    let inputPrice = this.value;
    let addTaxPrice = Math.floor(inputPrice / 10);
    let profit = inputPrice - addTaxPrice;
    
    addTaxPriceElem.innerHTML = addTaxPrice;
    profitElem.innerHTML = profit;
  });
};

window.addEventListener('load', calculation);