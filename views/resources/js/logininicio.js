document.addEventListener("DOMContentLoaded", function() {
    const loginForm = document.getElementById("loginForm");

    loginForm.addEventListener("submit", function(event) {
        // Evita el comportamiento predeterminado de enviar el formulario
        event.preventDefault();

        // Redirige a la página deseada
        window.location.href = "ruta_de_tu_pagina_de_inicio.html";
    });
});
