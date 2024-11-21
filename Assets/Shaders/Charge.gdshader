shader_type canvas_item;

uniform float intensity;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	vec4 white = vec4(1.0,1.0,1.0,1.0);
	COLOR.rgb = mix(tex_color.rgb, white.rgb,intensity);
	COLOR.a = tex_color.a;
}