
const btnSinIn = document.getElementById("sign-in"),
      btnSinUp = document.getElementById("sign-up"),
      formregister =document.querySelector(".register"),
      formlogin =document.querySelector(".login");

      btnSinIn.addEventListener("click", e => {
        formregister.classList.add("hide");
        formlogin.classList.remove("hide")
      })


      btnSinUp.addEventListener("click", e => {
        formlogin.classList.add("hide");
        formregister.classList.remove("hide")
      })
