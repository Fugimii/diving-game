shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {
    // Calculate UV coordinates
	vec2 uv = SCREEN_UV;
    // Offset the UV coordinates based on a sine wave
    uv.x += sin(SCREEN_UV.y * 50.0 + TIME) * 0.0025; // Adjust the frequency and amplitude as needed
    uv.y += sin(SCREEN_UV.x * 50.0 + TIME) * 0.0025;

    // Sample the texture using the modified UV coordinates
	
	
	
    COLOR = vec4(texture(screen_texture, uv).r, texture(screen_texture, uv).g, texture(screen_texture, uv).b, 255);
}