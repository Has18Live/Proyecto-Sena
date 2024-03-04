document.addEventListener("DOMContentLoaded", function() {
    // Selecciona el contenedor del slider y las imágenes
    var slider = document.querySelector(".slider");
    var slides = document.querySelector(".slides");

    // Define una función para cambiar las imágenes automáticamente cada 3 segundos
    setInterval(function() {
        // Mueve el primer elemento al final de la lista
        var firstSlide = slides.firstElementChild;
        slides.appendChild(firstSlide);

        // Ajusta la transformación CSS para mostrar la nueva imagen
        slides.style.transform = "translateX(-1256px)";
        slides.style.transition = "transform 0s"; // Elimina la transición para evitar efecto brusco

        // Espera un corto período de tiempo antes de restaurar la transición
        setTimeout(function() {
            slides.style.transition = "transform 0.5s";
            slides.style.transform = "translateX(0)";
        }, 50); // 50 milisegundos es un valor suficiente para que la transformación sin transición ocurra

    }, 3000); // Cambia las imágenes cada 3 segundos
});
