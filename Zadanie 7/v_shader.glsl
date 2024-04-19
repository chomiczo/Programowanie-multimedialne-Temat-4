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
in vec2 i_tc;

out vec4 vertex_f;
out vec4 vertexNormals_f;
out vec4 color_f;
out vec2 texCoord_f;
out vec2 i_tc_f;


void main(void) {
	vertex_f = vertex; 
	vertexNormals_f = vertexNormals;
	color_f = color; 
	texCoord_f = texCoord;
	i_tc_f = i_tc;


	gl_Position = P*V*M*vertex;

}
