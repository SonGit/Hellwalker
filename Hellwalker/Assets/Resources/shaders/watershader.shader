Shader "Unlit/WaterShader" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Color ("Main Color", Vector) = (1,1,1,1)
		_SpeedX ("SpeedX", Float) = 1.5
		_SpeedY ("SpeedY", Float) = 1.5
		_Scale ("Scale", Range(0.005, 0.2)) = 0.3
		_TileX ("TileX", Float) = 5
		_TileY ("TileY", Float) = 5
	}
	SubShader {
		LOD 100
		Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			LOD 100
			Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZClip Off
			Cull Off
			GpuProgramID 44567
			Program "vp" {
				SubProgram "d3d9 " {
					"!!vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _MainTex_ST;
					//   row_major float4x4 unity_MatrixVP;
					//   row_major float4x4 unity_ObjectToWorld;
					//
					//
					// Registers:
					//
					//   Name                Reg   Size
					//   ------------------- ----- ----
					//   unity_ObjectToWorld c0       4
					//   unity_MatrixVP      c4       4
					//   _MainTex_ST         c8       1
					//
					
					    vs_3_0
					    def c9, 1, 0, 0, 0
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_texcoord o0.xy
					    dcl_position o1
					    mad r0, v0.xyzx, c9.xxxy, c9.yyyx
					    dp4 r1.x, c0, r0
					    dp4 r1.y, c1, r0
					    dp4 r1.z, c2, r0
					    dp4 r1.w, c3, r0
					    dp4 r2.x, c4, r1
					    dp4 r2.y, c5, r1
					    dp4 r2.z, c6, r1
					    dp4 r2.w, c7, r1
					    mad o0.xy, v1, c8, c8.zwzw
					    mad o1.xy, r2.w, c255, r2
					    mov o1.zw, r2
					
					// approximately 12 instruction slots used"
				}
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[5];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[3];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d9 " {
					Keywords { "FOG_LINEAR" }
					"!!vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _MainTex_ST;
					//   float4 unity_FogParams;
					//   row_major float4x4 unity_MatrixVP;
					//   row_major float4x4 unity_ObjectToWorld;
					//
					//
					// Registers:
					//
					//   Name                Reg   Size
					//   ------------------- ----- ----
					//   unity_ObjectToWorld c0       4
					//   unity_MatrixVP      c4       4
					//   unity_FogParams     c8       1
					//   _MainTex_ST         c9       1
					//
					
					    vs_3_0
					    def c10, 1, 0, 0, 0
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_texcoord o0.xy
					    dcl_texcoord1 o1.x
					    dcl_position o2
					    mad r0, v0.xyzx, c10.xxxy, c10.yyyx
					    dp4 r1.x, c0, r0
					    dp4 r1.y, c1, r0
					    dp4 r1.z, c2, r0
					    dp4 r1.w, c3, r0
					    dp4 r2.x, c4, r1
					    dp4 r2.y, c5, r1
					    dp4 r2.w, c7, r1
					    dp4 r0.x, c6, r1
					    mad o0.xy, v1, c9, c9.zwzw
					    mad o1.x, r0.x, c8.z, c8.w
					    mov r2.z, r0.x
					    mad o2.xy, r2.w, c255, r2
					    mov o2.zw, r2
					
					// approximately 14 instruction slots used"
				}
				SubProgram "d3d11 " {
					Keywords { "FOG_LINEAR" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[5];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = u_xlat0.z / _ProjectionParams.y;
					    gl_Position = u_xlat0;
					    u_xlat0.x = (-u_xlat1.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD1 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					//   float4 _Color;
					//   sampler2D _MainTex;
					//   float _Scale;
					//   float _SpeedX;
					//   float _SpeedY;
					//   float _TileX;
					//   float _TileY;
					//   float4 _Time;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Time        c0       1
					//   _Color       c1       1
					//   _SpeedX      c2       1
					//   _SpeedY      c3       1
					//   _Scale       c4       1
					//   _TileX       c5       1
					//   _TileY       c6       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c7, 0.159154937, 0.5, 6.28318548, -3.14159274
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    add r0.x, v0.y, v0.x
					    mov r0.y, c0.y
					    mul r0.z, r0.y, c2.x
					    mad r0.x, r0.x, c5.x, r0.z
					    mad r0.x, r0.x, c7.x, c7.y
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c7.z, c7.w
					    sincos r1.y, r0.x
					    mad r0.x, r1.y, c4.x, v0.x
					    mul r0.y, r0.y, c3.x
					    mad r0.y, v0.y, c6.x, r0.y
					    mad r0.y, r0.y, c7.x, c7.y
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c7.z, c7.w
					    sincos r1.x, r0.y
					    mad r0.x, r1.x, c4.x, r0.x
					    mov r0.y, v0.y
					    texld_pp r0, r0, s0
					    add r1, c1, c1
					    mul_pp oC0, r0, r1
					
					// approximately 34 instruction slots used (1 texture, 33 arithmetic)"
				}
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _Color;
						float _SpeedX;
						float _SpeedY;
						float _Scale;
						float _TileX;
						float _TileY;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
					    u_xlat2.xy = vec2(_SpeedX, _SpeedY) * _Time.yy;
					    u_xlat0.x = u_xlat0.x * _TileX + u_xlat2.x;
					    u_xlat2.x = vs_TEXCOORD0.y * _TileY + u_xlat2.y;
					    u_xlat2.x = cos(u_xlat2.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Scale + vs_TEXCOORD0.x;
					    u_xlat0.x = u_xlat2.x * _Scale + u_xlat0.x;
					    u_xlat0.y = vs_TEXCOORD0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1 = _Color + _Color;
					    SV_Target0 = u_xlat10_0 * u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d9 " {
					Keywords { "FOG_LINEAR" }
					"!!ps_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _Color;
					//   sampler2D _MainTex;
					//   float _Scale;
					//   float _SpeedX;
					//   float _SpeedY;
					//   float _TileX;
					//   float _TileY;
					//   float4 _Time;
					//   float4 unity_FogColor;
					//
					//
					// Registers:
					//
					//   Name           Reg   Size
					//   -------------- ----- ----
					//   _Time          c0       1
					//   unity_FogColor c1       1
					//   _Color         c2       1
					//   _SpeedX        c3       1
					//   _SpeedY        c4       1
					//   _Scale         c5       1
					//   _TileX         c6       1
					//   _TileY         c7       1
					//   _MainTex       s0       1
					//
					
					    ps_3_0
					    def c8, 0.159154937, 0.5, 6.28318548, -3.14159274
					    dcl_texcoord v0.xy
					    dcl_texcoord1 v1.x
					    dcl_2d s0
					    add r0.x, v0.y, v0.x
					    mov r0.y, c0.y
					    mul r0.z, r0.y, c3.x
					    mad r0.x, r0.x, c6.x, r0.z
					    mad r0.x, r0.x, c8.x, c8.y
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c8.z, c8.w
					    sincos r1.y, r0.x
					    mad r0.x, r1.y, c5.x, v0.x
					    mul r0.y, r0.y, c4.x
					    mad r0.y, v0.y, c7.x, r0.y
					    mad r0.y, r0.y, c8.x, c8.y
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c8.z, c8.w
					    sincos r1.x, r0.y
					    mad r0.x, r1.x, c5.x, r0.x
					    mov r0.y, v0.y
					    texld_pp r0, r0, s0
					    add r1, c2, c2
					    mad r0.xyz, r0, r1, -c1
					    mul_pp r0.w, r0.w, r1.w
					    mov_pp oC0.w, r0.w
					    mov_sat r0.w, v1.x
					    mad_pp oC0.xyz, r0.w, r0, c1
					
					// approximately 38 instruction slots used (1 texture, 37 arithmetic)"
				}
				SubProgram "d3d11 " {
					Keywords { "FOG_LINEAR" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _Color;
						float _SpeedX;
						float _SpeedY;
						float _Scale;
						float _TileX;
						float _TileY;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
					    u_xlat2.xy = vec2(_SpeedX, _SpeedY) * _Time.yy;
					    u_xlat0.x = u_xlat0.x * _TileX + u_xlat2.x;
					    u_xlat2.x = vs_TEXCOORD0.y * _TileY + u_xlat2.y;
					    u_xlat2.x = cos(u_xlat2.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Scale + vs_TEXCOORD0.x;
					    u_xlat0.x = u_xlat2.x * _Scale + u_xlat0.x;
					    u_xlat0.y = vs_TEXCOORD0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1 = _Color + _Color;
					    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = u_xlat10_0.w * u_xlat1.w;
					    SV_Target0.w = u_xlat6;
					    u_xlat6 = vs_TEXCOORD1;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}"
				}
			}
		}
	}
}