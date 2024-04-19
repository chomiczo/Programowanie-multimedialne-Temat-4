#version 330

//Zmienne jednorodne
uniform mat4 P;
uniform mat4 V;
uniform mat4 M;
uniform sampler2D tex;
uniform sampler2D tex2;

out vec4 pixelColor; //Zmienna wyjsciowa fragment shadera. Zapisuje sie do niej ostateczny (prawie) kolor piksela
in vec4 vertex_f;
in vec4 vertexNormals_f;
in vec4 color_f;
in vec2 texCoord_f;
in vec2 i_tc_f;

void main(void) {
	vec4 blackColor = vec4(0,0,0,0);
	vec4 whiteColor = vec4(1,1,1,1);
	vec4 lightPoint = vec4(0,0,-6,1);

	vec4 l = normalize(V*lightPoint-V*M*vertex_f);
	vec4 n = normalize(V*M*vertexNormals_f);
	vec4 v=normalize(vec4(0,0,0,1) - V*M*vertex_f);
	vec4 r = reflect(-l, n);

	vec4 color_f = texture2D(tex,i_tc_f);
	vec4 color_f_2 = texture2D(tex2, i_tc_f);

	float rv=clamp(dot(r,v),0,1);

	rv=pow(rv,25);

	vec4 i_c=color_f*blackColor + color_f * whiteColor *(dot(n,l)) + color_f_2 * whiteColor*rv;

	pixelColor=i_c;

}
