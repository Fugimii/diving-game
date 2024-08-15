shader_type canvas_item;

uniform bool damaged = false;

void fragment() {
	if (damaged) {
		if (COLOR != vec4(0, 0, 0, 0)) {
			COLOR = vec4(255, 255, 255, 1);
		}
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
