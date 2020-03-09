Shader "TMPro/Distance Field Overlay" {
	Properties {
		_FaceTex ("Face Texture", 2D) = "white" {}
		_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
		_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
		_FaceColor ("Face Color", Vector) = (1,1,1,1)
		_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
		_OutlineColor ("Outline Color", Vector) = (0,0,0,1)
		_OutlineTex ("Outline Texture", 2D) = "white" {}
		_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
		_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
		_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
		_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
		_Bevel ("Bevel", Range(0, 1)) = 0.5
		_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
		_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
		_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
		_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
		_LightAngle ("Light Angle", Range(0, 6.283185)) = 3.1416
		_SpecularColor ("Specular", Vector) = (1,1,1,1)
		_SpecularPower ("Specular", Range(0, 4)) = 2
		_Reflectivity ("Reflectivity", Range(5, 15)) = 10
		_Diffuse ("Diffuse", Range(0, 1)) = 0.5
		_Ambient ("Ambient", Range(1, 0)) = 0.5
		_BumpMap ("Normal map", 2D) = "bump" {}
		_BumpOutline ("Bump Outline", Range(0, 1)) = 0
		_BumpFace ("Bump Face", Range(0, 1)) = 0
		_ReflectFaceColor ("Reflection Color", Vector) = (0,0,0,1)
		_ReflectOutlineColor ("Reflection Color", Vector) = (0,0,0,1)
		_Cube ("Reflection Cubemap", Cube) = "black" {}
		_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
		_UnderlayColor ("Border Color", Vector) = (0,0,0,0.5)
		_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
		_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
		_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
		_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
		_GlowColor ("Color", Vector) = (0,1,0,0.5)
		_GlowOffset ("Offset", Range(-1, 1)) = 0
		_GlowInner ("Inner", Range(0, 1)) = 0.05
		_GlowOuter ("Outer", Range(0, 1)) = 0.05
		_GlowPower ("Falloff", Range(1, 0)) = 0.75
		_WeightNormal ("Weight Normal", Float) = 0
		_WeightBold ("Weight Bold", Float) = 0.5
		_ShaderFlags ("Flags", Float) = 0
		_ScaleRatioA ("Scale RatioA", Float) = 1
		_ScaleRatioB ("Scale RatioB", Float) = 1
		_ScaleRatioC ("Scale RatioC", Float) = 1
		_MainTex ("Font Atlas", 2D) = "white" {}
		_TextureWidth ("Texture Width", Float) = 512
		_TextureHeight ("Texture Height", Float) = 512
		_GradientScale ("Gradient Scale", Float) = 5
		_ScaleX ("Scale X", Float) = 1
		_ScaleY ("Scale Y", Float) = 1
		_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
		_VertexOffsetX ("Vertex OffsetX", Float) = 0
		_VertexOffsetY ("Vertex OffsetY", Float) = 0
		_MaskCoord ("Mask Coordinates", Vector) = (0,0,100000,100000)
		_MaskSoftnessX ("Mask SoftnessX", Float) = 0
		_MaskSoftnessY ("Mask SoftnessY", Float) = 0
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 32316
			Program "vp" {
				SubProgram "d3d9 " {
					"!!vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   row_major float4x4 _EnvMatrix;
					//   float4 _FaceColor;
					//   float _FaceDilate;
					//   float _GradientScale;
					//   float4 _OutlineColor;
					//   float _OutlineSoftness;
					//   float _OutlineWidth;
					//   float _PerspectiveFilter;
					//   float _ScaleRatioA;
					//   float _ScaleX;
					//   float _ScaleY;
					//   float4 _ScreenParams;
					//   float _VertexOffsetX;
					//   float _VertexOffsetY;
					//   float _WeightBold;
					//   float _WeightNormal;
					//   float3 _WorldSpaceCameraPos;
					//   row_major float4x4 glstate_matrix_projection;
					//   row_major float4x4 unity_MatrixVP;
					//   row_major float4x4 unity_ObjectToWorld;
					//   row_major float4x4 unity_WorldToObject;
					//
					//
					// Registers:
					//
					//   Name                      Reg   Size
					//   ------------------------- ----- ----
					//   unity_ObjectToWorld       c0       4
					//   glstate_matrix_projection c4       4
					//   unity_MatrixVP            c8       4
					//   unity_WorldToObject       c12      3
					//   _EnvMatrix                c15      3
					//   _WorldSpaceCameraPos      c18      1
					//   _ScreenParams             c19      1
					//   _FaceColor                c20      1
					//   _FaceDilate               c21      1
					//   _OutlineSoftness          c22      1
					//   _OutlineColor             c23      1
					//   _OutlineWidth             c24      1
					//   _WeightNormal             c25      1
					//   _WeightBold               c26      1
					//   _ScaleRatioA              c27      1
					//   _VertexOffsetX            c28      1
					//   _VertexOffsetY            c29      1
					//   _GradientScale            c30      1
					//   _ScaleX                   c31      1
					//   _ScaleY                   c32      1
					//   _PerspectiveFilter        c33      1
					//
					
					    vs_3_0
					    def c34, 0.00122070313, 5, 0, 0
					    def c35, 0, 1, 1.5, 0.5
					    dcl_position v0
					    dcl_normal v1
					    dcl_color v2
					    dcl_texcoord v3
					    dcl_texcoord1 v4
					    dcl_position o0
					    dcl_color o1
					    dcl_color1 o2
					    dcl_color2 o3
					    dcl_texcoord o4
					    dcl_texcoord1 o5
					    dcl_texcoord2 o6
					    dcl_texcoord3 o7.xyz
					    add r0.x, c28.x, v0.x
					    add r0.y, c29.x, v0.y
					    mad r0.zw, v0.z, c35.xyyx, c35.xyxy
					    dp4 r1.x, c0, r0
					    dp4 r1.y, c1, r0
					    dp4 r1.z, c2, r0
					    dp4 r1.w, c3, r0
					    dp4 r4.x, c8, r1
					    dp4 r4.y, c9, r1
					    dp4 r4.z, c10, r1
					    dp4 r1.x, c11, r1
					    mov r0.w, v0.w
					    dp4 r2.x, c0, r0
					    dp4 r2.y, c1, r0
					    dp4 r2.z, c2, r0
					    mov o6.xy, r0
					    add r0.xyz, -r2, c18
					    nrm r2.xyz, r0
					    mul r1.yzw, c13.xxyz, v1.y
					    mad r1.yzw, v1.x, c12.xxyz, r1
					    mad r1.yzw, v1.z, c14.xxyz, r1
					    nrm r3.xyz, r1.yzww
					    dp3 r0.w, r3, r2
					    mov r2.xy, c19
					    mul r1.yz, r2.xxyw, c4.xxyw
					    add r1.y, r1.z, r1.y
					    mul r1.y, r1_abs.y, c31.x
					    rcp r3.x, r1.y
					    mul r1.yz, r2.xxyw, c5.xxyw
					    add r1.y, r1.z, r1.y
					    mul r1.y, r1_abs.y, c32.x
					    rcp r3.y, r1.y
					    mul r1.yz, r1.x, r3.xxyw
					    mov r4.w, r1.x
					    mul r1.xw, r1.yyzz, r1.yyzz
					    add r1.x, r1.w, r1.x
					    rsq r1.x, r1.x
					    mul r1.x, r1.x, v4_abs.y
					    mul r1.x, r1.x, c30.x
					    mul r1.w, r1.x, c35.z
					    mov r2.y, c35.y
					    add r2.x, r2.y, -c33.x
					    mul r2.x, r1.w, r2.x
					    mad r2.z, r1.x, c35.z, -r2.x
					    mad r0.w, r0_abs.w, r2.z, r2.x
					    mad r0.w, r1.x, -c35.z, r0.w
					    abs r1.x, c7.w
					    sge r1.x, -r1.x, r1.x
					    mad r3.y, r1.x, r0.w, r1.w
					    rcp r0.w, r3.y
					    sge r1.x, c35.x, v4.y
					    mov r2.x, c25.x
					    add r1.w, -r2.x, c26.x
					    mad r1.x, r1.x, r1.w, c25.x
					    mov r2.x, c27.x
					    mul r1.w, r2.x, c21.x
					    mul r1.w, r1.w, c35.w
					    rcp r2.z, c30.x
					    mad r3.w, r1.x, r2.z, r1.w
					    add r1.x, -r3.w, c35.w
					    mad o5.z, r0.w, c35.w, r1.x
					    mul r0.w, r0.w, c35.w
					    mad r1.x, c24.x, -r2.x, r2.y
					    mad r1.x, c22.x, -r2.x, r1.x
					    mad r0.w, r1.x, c35.w, -r0.w
					    add o5.x, -r3.w, r0.w
					    mov o5.yw, r3
					    mul o2, c20, v2
					    mul o3.w, c23.w, v2.w
					    frc r0.w, v4.x
					    add r1.x, -r0.w, v4.x
					    mul o4.w, r0.w, c34.y
					    mul o4.z, r1.x, c34.x
					    rcp r2.z, r1.y
					    rcp r2.w, r1.z
					    mul o6.zw, r2, c35.w
					    dp3 o7.x, c15, r0
					    dp3 o7.y, c16, r0
					    dp3 o7.z, c17, r0
					    mov o1, v2
					    mov o3.xyz, c23
					    mov o4.xy, v3
					    mad o0.xy, r4.w, c255, r4
					    mov o0.zw, r4
					
					// approximately 88 instruction slots used"
				}
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[4];
						mat4x4 _EnvMatrix;
						vec4 unused_0_8[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_14[3];
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						vec4 unused_0_19[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[3];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_COLOR2;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    vs_TEXCOORD2.xy = u_xlat0.xy;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_COLOR1 = in_COLOR0 * _FaceColor;
					    vs_COLOR2.w = in_COLOR0.w * _OutlineColor.w;
					    vs_COLOR2.xyz = _OutlineColor.xyz;
					    u_xlat9 = floor(in_TEXCOORD1.x);
					    vs_TEXCOORD0.z = u_xlat9 * 0.00122070313;
					    u_xlat9 = fract(in_TEXCOORD1.x);
					    vs_TEXCOORD0.w = u_xlat9 * 5.0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat1.ww / u_xlat1.xy;
					    u_xlat7 = dot(u_xlat1.xy, u_xlat1.xy);
					    vs_TEXCOORD2.zw = vec2(0.5, 0.5) / u_xlat1.xy;
					    u_xlat1.x = inversesqrt(u_xlat7);
					    u_xlat1.x = u_xlat1.x * abs(in_TEXCOORD1.y);
					    u_xlat1.x = u_xlat1.x * _GradientScale;
					    u_xlat4.x = u_xlat1.x * 1.5;
					    u_xlat7 = (-_PerspectiveFilter) + 1.0;
					    u_xlat7 = u_xlat7 * u_xlat4.x;
					    u_xlat1.x = u_xlat1.x * 1.5 + (-u_xlat7);
					    u_xlat9 = abs(u_xlat9) * u_xlat1.x + u_xlat7;
					    u_xlatb1 = glstate_matrix_projection[3].w==0.0;
					    u_xlat4.x = (u_xlatb1) ? u_xlat9 : u_xlat4.x;
					    u_xlatb9 = 0.0>=in_TEXCOORD1.y;
					    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat1.x = (-_WeightNormal) + _WeightBold;
					    u_xlat9 = u_xlat9 * u_xlat1.x + _WeightNormal;
					    u_xlat9 = u_xlat9 / _GradientScale;
					    u_xlat1.x = _FaceDilate * _ScaleRatioA;
					    u_xlat4.z = u_xlat1.x * 0.5 + u_xlat9;
					    vs_TEXCOORD1.yw = u_xlat4.xz;
					    u_xlat9 = 0.5 / u_xlat4.x;
					    u_xlat1.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat1.x = (-_OutlineSoftness) * _ScaleRatioA + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.5 + (-u_xlat9);
					    vs_TEXCOORD1.x = (-u_xlat4.z) + u_xlat1.x;
					    u_xlat1.x = (-u_xlat4.z) + 0.5;
					    vs_TEXCOORD1.z = u_xlat9 + u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyw = _EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = _EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d9 " {
					"!!ps_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _ClipRect;
					//   sampler2D _FaceTex;
					//   float _FaceUVSpeedX;
					//   float _FaceUVSpeedY;
					//   sampler2D _MainTex;
					//   float _OutlineSoftness;
					//   sampler2D _OutlineTex;
					//   float _OutlineUVSpeedX;
					//   float _OutlineUVSpeedY;
					//   float _OutlineWidth;
					//   float _ScaleRatioA;
					//   float4 _Time;
					//   bool _UseClipRect;
					//
					//
					// Registers:
					//
					//   Name             Reg   Size
					//   ---------------- ----- ----
					//   _Time            c0       1
					//   _FaceUVSpeedX    c1       1
					//   _FaceUVSpeedY    c2       1
					//   _OutlineSoftness c3       1
					//   _OutlineUVSpeedX c4       1
					//   _OutlineUVSpeedY c5       1
					//   _OutlineWidth    c6       1
					//   _ScaleRatioA     c7       1
					//   _UseClipRect     c8       1
					//   _ClipRect        c9       1
					//   _FaceTex         s0       1
					//   _OutlineTex      s1       1
					//   _MainTex         s2       1
					//
					
					    ps_3_0
					    def c10, 0.5, 1, 0, 0
					    dcl_color1_pp v0
					    dcl_color2_pp v1
					    dcl_texcoord v2
					    dcl_texcoord1 v3.xyz
					    dcl_texcoord2 v4.xy
					    dcl_2d s0
					    dcl_2d s1
					    dcl_2d s2
					    texld r0, v2, s2
					    add r1, r0.w, -v3.x
					    add r0.x, -r0.w, v3.z
					    texkill r1
					    mov r1.x, c7.x
					    mul r0.y, r1.x, c6.x
					    mul_pp r0.z, r0.y, v3.y
					    mad r0.y, r0.y, -v3.y, c10.y
					    rsq r0.w, r0.z
					    mul_pp r0.z, r0.z, c10.x
					    rcp_pp r0.w, r0.w
					    cmp_pp r0.y, r0.y, r0.w, c10.y
					    mad_sat_pp r0.w, r0.x, v3.y, r0.z
					    mad_pp r0.x, r0.x, v3.y, -r0.z
					    mul_pp r0.y, r0.y, r0.w
					    mov r1.y, c0.y
					    mad r2.x, c1.x, r1.y, v2.z
					    mad r2.y, c2.x, r1.y, v2.w
					    texld r2, r2, s0
					    mul_pp r2, r2, v0
					    mul_pp r2.xyz, r2.w, r2
					    mad r3.x, c4.x, r1.y, v2.z
					    mad r3.y, c5.x, r1.y, v2.w
					    texld r3, r3, s1
					    mul_pp r3, r3, v1
					    mul_pp r3.xyz, r3.w, r3
					    lrp_pp r4, r0.y, r3, r2
					    mul r0.y, r1.x, c3.x
					    mul_pp r0.z, r0.y, v3.y
					    mad_pp r0.y, r0.y, v3.y, c10.y
					    rcp r0.y, r0.y
					    mad_pp r0.x, r0.z, c10.x, r0.x
					    mul_sat_pp r0.x, r0.y, r0.x
					    add_pp r0.x, -r0.x, c10.y
					    mul_pp r0, r0.x, r4
					    add r1.xy, c9.zwzw, -v4
					    cmp r1.xy, r1, c10.y, c10.z
					    add r1.zw, -c9.xyxy, v4.xyxy
					    cmp r1.xy, r1.zwzw, r1, c10.z
					    mul r1.x, r1.y, r1.x
					    mul_pp r1, r0, r1.x
					    cmp_pp oC0, -c8.x, r0, r1
					
					// approximately 42 instruction slots used (3 texture, 39 arithmetic)"
				}
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _FaceUVSpeedX;
						float _FaceUVSpeedY;
						vec4 unused_0_3;
						float _OutlineSoftness;
						float _OutlineUVSpeedX;
						float _OutlineUVSpeedY;
						vec4 unused_0_7;
						float _OutlineWidth;
						vec4 unused_0_9[15];
						float _ScaleRatioA;
						vec4 unused_0_11[5];
						int _UseClipRect;
						vec4 _ClipRect;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FaceTex;
					uniform  sampler2D _OutlineTex;
					in  vec4 vs_COLOR1;
					in  vec4 vs_COLOR2;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat3 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
					    u_xlat6.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat9 = u_xlat3 * vs_TEXCOORD1.y + u_xlat0.x;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.x = u_xlat3 * vs_TEXCOORD1.y + (-u_xlat0.x);
					    u_xlat3 = u_xlat6.x * u_xlat9;
					    u_xlat6.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat6.xy);
					    u_xlat1 = u_xlat10_1 * vs_COLOR2;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat6.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat10_2 = texture(_FaceTex, u_xlat6.xy);
					    u_xlat2 = u_xlat10_2 * vs_COLOR1;
					    u_xlat2.xyz = u_xlat2.www * u_xlat2.xyz;
					    u_xlat1 = u_xlat1 + (-u_xlat2);
					    u_xlat1 = vec4(u_xlat3) * u_xlat1 + u_xlat2;
					    u_xlat3 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat6.x = u_xlat3 * vs_TEXCOORD1.y;
					    u_xlat3 = u_xlat3 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x / u_xlat3;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
					    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
					    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
					    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat1 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = (_UseClipRect != 0) ? u_xlat1 : u_xlat0;
					    return;
					}"
				}
			}
		}
	}
	Fallback "TMPro/Mobile/Distance Field"
	CustomEditor "TMPro_SDFMaterialEditor"
}