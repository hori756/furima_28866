const pay = () => {
  Payjp.setPublicKey("pk_test_0b48ddd1f269a3499f53b7f7");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    console.log("OK")
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
  console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }
      else{ document.getElementById("charge-form").submit();
    }

    });
  });
 };
 
 window.addEventListener("load", pay);