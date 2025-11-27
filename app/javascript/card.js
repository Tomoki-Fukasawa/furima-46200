const pay = () => {
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e)=>{
    console.log("form")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);