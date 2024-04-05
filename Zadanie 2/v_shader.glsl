#version 330

//Zmienne jednorodne
uniform mat4 P;
uniform mat4 V;
uniform mat4 M;


//Atrybuty
in vec4 vertex; //wspolrzedne wierzcholka w przestrzeni modelu
in vec4 vertexNormals; //wektor normalny w przestrzeni modelu
in vec4 color; //kolor skojarzony z wierzcho³kiem
in vec2 texCoord; //wspó³rzêdna teksturowana


out vec4 i_c;

void main(void) {
    vec4 blackColor = vec4(0, 0, 0, 0); // Kolor czarny
    vec4 whiteColor = vec4(1, 1, 1, 1); // Kolor bia³y
    vec4 lightPoint = vec4(0, 0, -6, 1); // Po³o¿enie Ÿród³a œwiat³a w przestrzeni modelu

    // Wektor do Ÿród³a œwiat³a w przestrzeni modelu

    vec4 l = normalize(V * lightPoint - V * M * vertex);

    // Normalizacja wektora normalnego
    vec4 n = normalize(V * M * vertexNormals);

    // Przypisanie obliczonego koloru do wyjœciowej zmiennej
    i_c = color * blackColor + color * whiteColor*(dot(n,l));




    // Ustawienie pozycji w przestrzeni ekranu
    gl_Position = P * V * M * vertex;
}
