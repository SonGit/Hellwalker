Shader "Hidden/Vignetting" {
	Properties {
		_MainTex ("Base", 2D) = "white" {}
		_VignetteTex ("Vignette", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 15824
			Program "vp" {
				SubProgram "d3d9 " {
					"!!vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _MainTex_TexelSize;
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
					//   _MainTex_TexelSize  c8       1
					//
					
					    vs_3_0
					    def c9, 1, 0, -2, 0
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_position o0
					    dcl_texcoord o1.xy
					    dcl_texcoord1 o2.xy
					    mad r0, v0.xyzx, c9.xxxy, c9.yyyx
					    dp4 r1.x, c0, r0
					    dp4 r1.y, c1, r0
					    dp4 r1.z, c2, r0
					    dp4 r1.w, c3, r0
					    dp4 r2.x, c4, r1
					    dp4 r2.y, c5, r1
					    dp4 r2.z, c6, r1
					    dp4 r2.w, c7, r1
					    mov r0.y, c9.y
					    slt r0.x, c8.y, r0.y
					    mad r0.y, v1.y, c9.z, c9.x
					    mad o2.y, r0.x, r0.y, v1.y
					    mov o1.xy, v1
					    mov o2.x, v1.x
					    mad o0.xy, r2.w, c255, r2
					    mov o0.zw, r2
					
					// approximately 17 instruction slots used"
				}
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
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
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					//   float _Blur;
					//   float _Intensity;
					//   sampler2D _MainTex;
					//   sampler2D _VignetteTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Intensity   c0       1
					//   _Blur        c1       1
					//   _MainTex     s0       1
					//   _VignetteTex s1       1
					//
					
					    ps_3_0
					    def c2, -0.5, 0, 1, 0
					    dcl_texcoord_pp v0.xy
					    dcl_texcoord1 v1.xy
					    dcl_2d s0
					    dcl_2d s1
					    add_pp r0.xy, c2.x, v0
					    add_pp r0.xy, r0, r0
					    dp2add_pp r0.x, r0, r0, c2.y
					    mul_sat_pp r0.y, r0.x, c1.x
					    mov r0.z, c2.z
					    mad r0.x, r0.x, -c0.x, r0.z
					    texld_pp r1, v0, s0
					    texld_pp r2, v1, s1
					    lrp_pp r3, r0.y, r2, r1
					    mul_pp oC0, r0.x, r3
					
					// approximately 11 instruction slots used (2 texture, 9 arithmetic)"
				}
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _Intensity;
						float _Blur;
						vec4 unused_0_3;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _VignetteTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat0.xy + u_xlat0.xy;
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1.x = u_xlat0.x * _Blur;
					    u_xlat0.x = (-u_xlat0.x) * _Intensity + 1.0;
					    u_xlat1.x = u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat10_2 = texture(_VignetteTex, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2 = u_xlat10_2 + (-u_xlat10_3);
					    u_xlat1 = u_xlat1.xxxx * u_xlat16_2 + u_xlat10_3;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
					    return;
					}"
				}
			}
		}
	}
}