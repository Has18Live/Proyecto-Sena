document.addEventListener("DOMContentLoaded", function() {
    const slides = document.querySelectorAll("");
    let currentIndex = 0;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            if (i === index) {
                slide.style.display = "block";
            } else {
                slide.style.display = "none";
            }
        });
    }

    function nextSlide() {
        currentIndex++;
        if (currentIndex >= slides.length) {
            currentIndex = 0;
        }
        showSlide(currentIndex);
    }

    // Mostrar la primera imagen al cargar la página
    showSlide(currentIndex);

    // Cambiar la imagen cada 3 segundos
    setInterval(nextSlide, 3000);
});
