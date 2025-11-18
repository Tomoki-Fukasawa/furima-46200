const price =()=>{
  const priceInput = document.getElementById("item-price");
  //入力された価格を取得し、表示する
  priceInput.addEventListener("input", ()=>{
    const inputValue = priceInput.value;
    console.log(inputValue);
    //入力された値を計算し、販売手数料として表示する
    const addTaxDom =document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1);
    console.log(addTaxDom);

    //入力された値を計算し、販売利益として表示する
    const ProfitDom =document.getElementById("profit");
    ProfitDom.innerHTML = Math.floor(inputValue-(inputValue*0.1));
    console.log(ProfitDom);
  });
};
window.addEventListener('turbo:load',price);
window.addEventListener('turbo:render',price);
