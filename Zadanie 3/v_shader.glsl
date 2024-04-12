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
	vec4 blackColor = vec4(0,0,0,0);
	vec4 whiteColor = vec4(1,1,1,1);
	vec4 lightPoint = vec4(0,0,-6,1);

	vec4 l = normalize(V*lightPoint-V*M*vertex);
	vec4 n = normalize(V*M*vertexNormals);
	vec4 v=normalize(vec4(0,0,0,1) - V*M*vertex);
	vec4 r = reflect(-l, n);



	float rv=clamp(dot(r,v),0,1);

	rv=pow(rv,25);

	i_c=color*blackColor + color * whiteColor *(dot(n,l)) + whiteColor * whiteColor*rv;

	gl_Position = P*V*M*vertex;

}
