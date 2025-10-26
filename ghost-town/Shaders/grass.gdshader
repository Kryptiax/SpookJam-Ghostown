shader_type spatial;
render_mode shadows_disabled;

uniform sampler2D albedo : source_color, filter_nearest_mipmap;

uniform sampler2D wind_noise : repeat_enable, filter_linear_mipmap, hint_default_black;

uniform float wind_speed = 0.1;
uniform float wind_scale = 30.0;
uniform float wind_strength = 0.2;
uniform float angle = 0.0;

void vertex()
{
	NORMAL = vec3(0.0, 1.0, 0.0);
	// Billboard Mode: Y-Billboard
	MODELVIEW_MATRIX = VIEW_MATRIX * mat4(
			MAIN_CAM_INV_VIEW_MATRIX[0],
			MAIN_CAM_INV_VIEW_MATRIX[1],
			MAIN_CAM_INV_VIEW_MATRIX[2],
			MODEL_MATRIX[3]);
	MODELVIEW_NORMAL_MATRIX = mat3(MODELVIEW_MATRIX);
	
	float top_mask = 1.0 - UV.y;
	
	float cosA = cos(radians(angle));
	float sinA = sin(radians(angle));
	mat2 R = mat2(vec2(cosA, -sinA), vec2(sinA, cosA));
	
	vec3 world_pos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	vec2 wind = texture(wind_noise, (world_pos.xz / wind_scale) + TIME * wind_speed).xy;
	wind = wind * 2.0 - 1.0;
	wind = R * wind;
	
	VERTEX.xz += wind * wind_strength * top_mask;
}

void fragment()
{
	vec4 color = texture(albedo, UV);
	ALBEDO = color.rgb;
	ALPHA = color.a;
	ALPHA_SCISSOR_THRESHOLD = 0.5;
}