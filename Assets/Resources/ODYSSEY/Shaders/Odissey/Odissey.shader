// Compiled shader for Web Player, uncompressed size: 414.3KB

Shader "Odissey/Odissey A" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Texture", 2D) = "white" {}
 _FresnelFactor ("Fresnel Factor", Range(-10,1)) = 0.5
 _EmissionFactor ("White Emission", Range(0,10)) = 0
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Diffuse" }


 // Stats for Vertex shader:
 //       d3d11 : 40 avg math (26..67)
 //    d3d11_9x : 40 avg math (26..67)
 //        d3d9 : 54 avg math (34..90)
 //      opengl : 52 avg math (32..88)
 // Stats for Fragment shader:
 //       d3d11 : 10 avg math (7..13), 2 avg texture (1..3)
 //    d3d11_9x : 10 avg math (7..13), 2 avg texture (1..3)
 //        d3d9 : 12 avg math (9..14), 2 avg texture (1..3)
 //      opengl : 13 avg math (10..16), 2 avg texture (1..3)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Transparent" "RenderType"="Diffuse" }
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
// Stats: 53 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Float 23 [_FresnelFactor]
Float 24 [_EmissionFactor]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, vertex.normal, c[22].w;
DP3 R3.w, R0, c[6];
DP3 R2.w, R0, c[7];
DP3 R1.x, R0, c[5];
MOV R1.y, R3.w;
MOV R1.z, R2.w;
MUL R0, R1.xyzz, R1.yzzx;
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[17];
DP4 R2.y, R1, c[16];
DP4 R2.x, R1, c[15];
DP4 R3.z, R0, c[20];
DP4 R3.y, R0, c[19];
DP4 R3.x, R0, c[18];
MUL R1.y, R3.w, R3.w;
MOV R0.w, c[0].x;
MAD R0.x, R1, R1, -R1.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[21];
MOV R0.xyz, c[13];
ADD result.texcoord[4].xyz, R3, R2;
DP4 R1.w, R0, c[11];
DP4 R1.y, R0, c[9];
DP4 R1.z, R0, c[10];
MOV R0, c[14];
MAD R1.yzw, R1, c[22].w, -vertex.position.xxyz;
DP3 R2.x, R1.yzww, R1.yzww;
RSQ R3.x, R2.x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
DP3 R0.w, R2, R2;
MUL R0.xyz, R3.x, R1.yzww;
DP3 R0.x, vertex.normal, R0;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
MUL R0.x, -R0, c[23];
DP3 R0.y, vertex.normal, R2;
MIN R0.x, R0, c[0];
MIN R0.y, R0, c[0].x;
MAX R0.x, R0, c[0].y;
MAX R0.y, R0, c[0];
ADD R0.x, -R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[24];
END
# 53 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 55 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
Float 22 [_FresnelFactor]
Float 23 [_EmissionFactor]
Vector 24 [_MainTex_ST]
"vs_2_0
def c25, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c21.w
dp3 r4.y, r0, c5
dp3 r4.x, r0, c6
dp3 r3.w, r0, c4
mov r3.x, r4.y
mov r3.y, r4.x
mul r0, r3.wxyy, r3.xyyw
mov r3.z, c25.x
dp4 r1.z, r3.wxyz, c16
dp4 r1.y, r3.wxyz, c15
dp4 r1.x, r3.wxyz, c14
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
add r0.xyz, r1, r2
mul r1.w, r4.y, r4.y
mad r0.w, r3, r3, -r1
mul r1.xyz, r0.w, c20
add oT4.xyz, r0, r1
mov r2.w, c25.x
mov r2.xyz, c12
dp4 r3.z, r2, c10
dp4 r3.x, r2, c8
dp4 r3.y, r2, c9
mad r2.xyz, r3, c21.w, -v0
dp3 r1.x, r2, r2
mov r0, c10
dp4 r3.z, c13, r0
mov r0, c9
rsq r2.w, r1.x
dp4 r3.y, c13, r0
mov r1, c8
dp4 r3.x, c13, r1
mul r0.xyz, r2.w, r2
dp3 r0.x, v1, r0
dp3 r0.w, r3, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r3
mul r0.x, -r0, c22
dp3 r0.y, v1, r1
min r0.x, r0, c25
min r0.y, r0, c25.x
max r0.x, r0, c25.y
max r0.y, r0, c25
add r0.x, -r0, c25
mul oT1.x, r0, r0.y
mov oT3.z, r4.x
mov oT3.y, r4
mov oT3.x, r3.w
mad oT0.xy, v2, c24, c24.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c23
"
}
SubProgram "d3d11 " {
// Stats: 40 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedbhldmpdcahmajkmicifipcnmblkhgbadabaaaaaabaaiaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcfmagaaaaeaaaabaajhabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
eccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadicaaaaj
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaa
egbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaafhccabaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaa
aaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
acaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 40 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedmbpmmbnhollpilhbcdhlfplbjekmdkacabaaaaaaoialaaaaaeaaaaaa
daaaaaaaaeaeaaaagiakaaaadaalaaaaebgpgodjmmadaaaammadaaaaaaacpopp
faadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaabaaaeaaaaaaaaaa
acaacgaaahaaafaaaaaaaaaaadaaaaaaaeaaamaaaaaaaaaaadaaamaaadaabaaa
aaaaaaaaadaabaaaafaabdaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaabaaaaacaaaaahiaadaaoeka
afaaaaadabaaahiaaaaaffiabeaaoekaaeaaaaaeaaaaaliabdaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabfaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabgaaoekaaeaaaaaeaaaaahiaaaaaoeiabhaappkaaaaaoejbceaaaaac
abaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabia
aaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiabiaaaakaakaaaaadaaaaabia
aaaaaaiabiaaffkaacaaaaadaaaaabiaaaaaaaibbiaaffkaabaaaaacabaaapia
aeaaoekaafaaaaadaaaaaoiaabaaffiabeaajakaaeaaaaaeaaaaaoiabdaajaka
abaaaaiaaaaaoeiaaeaaaaaeaaaaaoiabfaajakaabaakkiaaaaaoeiaaeaaaaae
aaaaaoiabgaajakaabaappiaaaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaad
aaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffiabiaaaakaakaaaaad
aaaaaciaaaaaffiabiaaffkaafaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaafaaaaadaaaaahiaacaaoejabhaappka
afaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiia
biaaffkaajaaaaadabaaabiaafaaoekaaaaaoeiaajaaaaadabaaaciaagaaoeka
aaaaoeiaajaaaaadabaaaeiaahaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjia
aaaakeiaajaaaaadadaaabiaaiaaoekaacaaoeiaajaaaaadadaaaciaajaaoeka
acaaoeiaajaaaaadadaaaeiaakaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaia
aaaaaaiaaaaappibabaaaaacabaaahoaaaaaoeiaaeaaaaaeacaaahoaalaaoeka
aaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaanaaoekaaeaaaaaeaaaaapia
amaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaaioaabaaffka
ppppaaaafdeieefcfmagaaaaeaaaabaajhabaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadicaaaajbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaa
aaaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
fgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
baaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaa
jgahbaaaaaaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaa
aaaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 32 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Float 16 [_FresnelFactor]
Float 17 [_EmissionFactor]
Vector 18 [unity_LightmapST]
Vector 19 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[20] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[14];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[16];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP3 R1.x, R2, R2;
RSQ R0.w, R1.x;
MUL R1.xyz, R0.w, R2;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R0.y, R0, c[0];
ADD R0.x, -R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[17];
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Float 15 [_FresnelFactor]
Float 16 [_EmissionFactor]
Vector 17 [unity_LightmapST]
Vector 18 [_MainTex_ST]
"vs_2_0
def c19, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c12
mov r1.w, c19.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r2.xyz, r0, c14.w, -v0
dp3 r1.x, r2, r2
mov r0, c10
dp4 r3.z, c13, r0
mov r0, c9
rsq r2.w, r1.x
dp4 r3.y, c13, r0
mov r1, c8
dp4 r3.x, c13, r1
mul r0.xyz, r2.w, r2
dp3 r0.x, v1, r0
dp3 r0.w, r3, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r3
mul r0.x, -r0, c15
dp3 r0.y, v1, r1
min r0.x, r0, c19
min r0.y, r0, c19.x
max r0.x, r0, c19.y
max r0.y, r0, c19
add r0.x, -r0, c19
mul oT1.x, r0, r0.y
mad oT0.xy, v2, c18, c18.zwzw
mad oT3.xy, v3, c17, c17.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c16
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedphbciokpmfmlmbgoapnfiipobbbehlliabaaaaaaaiagaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcgmaeaaaaeaaaabaa
blabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaa
aaaaaaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaa
agijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaa
aaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaafgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaah
ccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaa
abaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedldblajlmbencimaefelnmgpncgblgcfkabaaaaaanaaiaaaaaeaaaaaa
daaaaaaapeacaaaagiahaaaadaaiaaaaebgpgodjlmacaaaalmacaaaaaaacpopp
fiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
adaaabaaaaaaaaaaabaaaeaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaa
adaaaaaaaeaaagaaaaaaaaaaadaabaaaafaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafapaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaahiaaeaaoekaafaaaaadabaaahiaaaaaffia
alaaoekaaeaaaaaeaaaaaliaakaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
amaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaanaaoekaaeaaaaae
aaaaahiaaaaaoeiaaoaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibabaaaakaalaaaaad
aaaaabiaaaaaaaiaapaaaakaakaaaaadaaaaabiaaaaaaaiaapaaffkaacaaaaad
aaaaabiaaaaaaaibapaaffkaabaaaaacabaaapiaafaaoekaafaaaaadaaaaaoia
abaaffiaalaajakaaeaaaaaeaaaaaoiaakaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiaamaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiaanaajakaabaappia
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiaapaaaakaakaaaaadaaaaaciaaaaaffiaapaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaaeaaaaaeabaaadoaaeaaoejaacaaoekaacaaookaafaaaaadaaaaapia
aaaaffjaahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaafdeieefcgmaeaaaaeaaaabaa
blabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaa
aaaaaaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaa
agijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaa
aaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaafgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaah
ccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaa
abaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaealaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 32 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Float 16 [_FresnelFactor]
Float 17 [_EmissionFactor]
Vector 18 [unity_LightmapST]
Vector 19 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[20] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[14];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[16];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP3 R1.x, R2, R2;
RSQ R0.w, R1.x;
MUL R1.xyz, R0.w, R2;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R0.y, R0, c[0];
ADD R0.x, -R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[17];
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Float 15 [_FresnelFactor]
Float 16 [_EmissionFactor]
Vector 17 [unity_LightmapST]
Vector 18 [_MainTex_ST]
"vs_2_0
def c19, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c12
mov r1.w, c19.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r2.xyz, r0, c14.w, -v0
dp3 r1.x, r2, r2
mov r0, c10
dp4 r3.z, c13, r0
mov r0, c9
rsq r2.w, r1.x
dp4 r3.y, c13, r0
mov r1, c8
dp4 r3.x, c13, r1
mul r0.xyz, r2.w, r2
dp3 r0.x, v1, r0
dp3 r0.w, r3, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r3
mul r0.x, -r0, c15
dp3 r0.y, v1, r1
min r0.x, r0, c19
min r0.y, r0, c19.x
max r0.x, r0, c19.y
max r0.y, r0, c19
add r0.x, -r0, c19
mul oT1.x, r0, r0.y
mad oT0.xy, v2, c18, c18.zwzw
mad oT3.xy, v3, c17, c17.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c16
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedphbciokpmfmlmbgoapnfiipobbbehlliabaaaaaaaiagaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcgmaeaaaaeaaaabaa
blabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaa
aaaaaaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaa
agijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaa
aaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaafgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaah
ccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaa
abaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedldblajlmbencimaefelnmgpncgblgcfkabaaaaaanaaiaaaaaeaaaaaa
daaaaaaapeacaaaagiahaaaadaaiaaaaebgpgodjlmacaaaalmacaaaaaaacpopp
fiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
adaaabaaaaaaaaaaabaaaeaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaa
adaaaaaaaeaaagaaaaaaaaaaadaabaaaafaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafapaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaahiaaeaaoekaafaaaaadabaaahiaaaaaffia
alaaoekaaeaaaaaeaaaaaliaakaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
amaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaanaaoekaaeaaaaae
aaaaahiaaaaaoeiaaoaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibabaaaakaalaaaaad
aaaaabiaaaaaaaiaapaaaakaakaaaaadaaaaabiaaaaaaaiaapaaffkaacaaaaad
aaaaabiaaaaaaaibapaaffkaabaaaaacabaaapiaafaaoekaafaaaaadaaaaaoia
abaaffiaalaajakaaeaaaaaeaaaaaoiaakaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiaamaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiaanaajakaabaappia
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiaapaaaakaakaaaaadaaaaaciaaaaaffiaapaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaaeaaaaaeabaaadoaaeaaoejaacaaoekaacaaookaafaaaaadaaaaapia
aaaaffjaahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaafdeieefcgmaeaaaaeaaaabaa
blabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaa
aaaaaaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaa
agijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaa
aaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaafgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaah
ccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaa
abaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaealaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 59 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Float 24 [_FresnelFactor]
Float 25 [_EmissionFactor]
Vector 26 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[27] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..26] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, vertex.normal, c[23].w;
DP3 R3.w, R0, c[6];
DP3 R2.w, R0, c[7];
DP3 R1.x, R0, c[5];
MOV R1.y, R3.w;
MOV R1.z, R2.w;
MUL R0, R1.xyzz, R1.yzzx;
MOV R1.w, c[0].x;
DP4 R3.z, R0, c[21];
DP4 R3.y, R0, c[20];
DP4 R3.x, R0, c[19];
DP4 R2.z, R1, c[18];
DP4 R2.y, R1, c[17];
DP4 R2.x, R1, c[16];
MUL R0.x, R3.w, R3.w;
MAD R1.y, R1.x, R1.x, -R0.x;
ADD R2.xyz, R2, R3;
MOV R0.w, c[0].x;
MOV R0.xyz, c[13];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[23].w, -vertex.position;
MUL R0.xyz, R1.y, c[22];
DP3 R0.w, R3, R3;
RSQ R1.y, R0.w;
ADD result.texcoord[4].xyz, R2, R0;
MOV R0, c[15];
MUL R2.xyz, R1.y, R3;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
DP3 R0.x, vertex.normal, R2;
DP3 R0.y, R3, R3;
RSQ R0.y, R0.y;
MUL R2.xyz, R0.y, R3;
DP3 R0.y, vertex.normal, R2;
MIN R0.y, R0, c[0].x;
MAX R1.y, R0, c[0];
MUL R0.x, -R0, c[24];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
MUL result.texcoord[1].x, R0.z, R1.y;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].z;
MOV R1.z, R2.x;
MUL R1.w, R2.y, c[14].x;
ADD result.texcoord[5].xy, R1.zwzw, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MOV result.texcoord[2].x, c[25];
END
# 59 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 60 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Float 24 [_FresnelFactor]
Float 25 [_EmissionFactor]
Vector 26 [_MainTex_ST]
"vs_2_0
def c27, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c23.w
dp3 r4.x, r0, c5
dp3 r3.w, r0, c6
dp3 r2.w, r0, c4
mov r2.x, r4
mov r2.y, r3.w
mov r2.z, c27.x
mul r0, r2.wxyy, r2.xyyw
dp4 r1.z, r2.wxyz, c18
dp4 r1.y, r2.wxyz, c17
dp4 r1.x, r2.wxyz, c16
dp4 r2.z, r0, c21
dp4 r2.y, r0, c20
dp4 r2.x, r0, c19
add r0.xyz, r1, r2
mul r0.w, r4.x, r4.x
mov r1.w, c27.x
mov r1.xyz, c12
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r1.xyz, r2, c23.w, -v0
mad r0.w, r2, r2, -r0
mul r2.xyz, r0.w, c22
dp3 r0.w, r1, r1
rsq r1.w, r0.w
add oT4.xyz, r0, r2
mov r0, c10
dp4 r3.z, c15, r0
mov r0, c9
dp4 r3.y, c15, r0
mul r2.xyz, r1.w, r1
mov r1, c8
dp4 r3.x, c15, r1
dp3 r0.y, r3, r3
rsq r0.y, r0.y
mul r1.xyz, r0.y, r3
dp3 r0.y, v1, r1
min r0.y, r0, c27.x
max r1.w, r0.y, c27.y
dp3 r0.x, v1, r2
mul r0.x, -r0, c24
min r0.x, r0, c27
max r0.x, r0, c27.y
add r0.z, -r0.x, c27.x
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c27.z
mul r1.y, r1, c13.x
mad oT5.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
mov oT3.z, r3.w
mov oT3.y, r4.x
mov oT3.x, r2.w
mad oT0.xy, v2, c26, c26.zwzw
mov oT2.x, c25
"
}
SubProgram "d3d11 " {
// Stats: 43 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedbpbkkepoffdiphgjamnhplkipncfdjmnabaaaaaamaaiaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcpeagaaaaeaaaabaalnabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaiaaaaaaaaaaaaaibcaabaaa
abaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaa
abaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaal
ocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaa
agijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaa
baaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaaf
bcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaa
abaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaa
jgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
ajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaa
aaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaa
acaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaa
bbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaa
bbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaai
bcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaai
ccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaai
ecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaak
hccabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 43 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedbjcjcfljmbdnjjjemigknokijlecfgooabaaaaaaoeamaaaaaeaaaaaa
daaaaaaafaaeaaaaemalaaaabeamaaaaebgpgodjbiaeaaaabiaeaaaaaaacpopp
jmadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaiaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaa
acaacgaaahaaagaaaaaaaaaaadaaaaaaaeaaanaaaaaaaaaaadaaamaaadaabbaa
aaaaaaaaadaabaaaafaabeaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapka
aaaaaaaaaaaaiadpaaaaaadpaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaabaaaaacaaaaahiaadaaoeka
afaaaaadabaaahiaaaaaffiabfaaoekaaeaaaaaeaaaaaliabeaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabhaaoekaaeaaaaaeaaaaahiaaaaaoeiabiaappkaaaaaoejbceaaaaac
abaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabia
aaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiabjaaaakaakaaaaadaaaaabia
aaaaaaiabjaaffkaacaaaaadaaaaabiaaaaaaaibbjaaffkaabaaaaacabaaapia
afaaoekaafaaaaadaaaaaoiaabaaffiabfaajakaaeaaaaaeaaaaaoiabeaajaka
abaaaaiaaaaaoeiaaeaaaaaeaaaaaoiabgaajakaabaakkiaaaaaoeiaaeaaaaae
aaaaaoiabhaajakaabaappiaaaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaad
aaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffiabjaaaakaakaaaaad
aaaaaciaaaaaffiabjaaffkaafaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaafaaaaadaaaaahiaacaaoejabiaappka
afaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeaaaaaliabbaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiia
bjaaffkaajaaaaadabaaabiaagaaoekaaaaaoeiaajaaaaadabaaaciaahaaoeka
aaaaoeiaajaaaaadabaaaeiaaiaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjia
aaaakeiaajaaaaadadaaabiaajaaoekaacaaoeiaajaaaaadadaaaciaakaaoeka
acaaoeiaajaaaaadadaaaeiaalaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaia
aaaaaaiaaaaappibabaaaaacabaaahoaaaaaoeiaaeaaaaaeacaaahoaamaaoeka
aaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapia
anaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
aeaaaakaafaaaaadabaaaiiaabaaaaiabjaakkkaafaaaaadabaaafiaaaaapeia
bjaakkkaacaaaaadadaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacadaaamoaaaaaoeia
abaaaaacaaaaaioaabaaffkappppaaaafdeieefcpeagaaaaeaaaabaalnabaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
afaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
dicaaaajbcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaa
aiaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaa
adaaaaaabbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaa
agijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaa
dcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaafgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaa
jgahbaaaabaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaah
ocaabaaaabaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaa
abaaaaaaegbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaa
bkaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaag
iccabaaaabaaaaaabkiacaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadgaaaaafhccabaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaa
egakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaabkaabaia
ebaaaaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
aeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
// Stats: 37 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_Scale]
Float 17 [_FresnelFactor]
Float 18 [_EmissionFactor]
Vector 19 [unity_LightmapST]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[15];
MAD R0.xyz, R0, c[16].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[17];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP3 R0.w, R2, R2;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R2;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[19], c[19].zwzw;
MOV result.texcoord[2].x, c[18];
END
# 37 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 39 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_Scale]
Float 17 [_FresnelFactor]
Float 18 [_EmissionFactor]
Vector 19 [unity_LightmapST]
Vector 20 [_MainTex_ST]
"vs_2_0
def c21, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.w, c21.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r1.xyz, r0, c16.w, -v0
dp3 r0.x, r1, r1
rsq r1.w, r0.x
mov r0, c10
dp4 r3.z, c15, r0
mov r0, c9
dp4 r3.y, c15, r0
mul r2.xyz, r1.w, r1
mov r1, c8
dp4 r3.x, c15, r1
dp3 r0.y, r3, r3
rsq r0.y, r0.y
mul r1.xyz, r0.y, r3
dp3 r0.y, v1, r1
min r0.y, r0, c21.x
max r1.w, r0.y, c21.y
dp3 r0.x, v1, r2
mul r0.x, -r0, c17
min r0.x, r0, c21
max r0.x, r0, c21.y
add r0.z, -r0.x, c21.x
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c21.z
mul r1.y, r1, c13.x
mad oT4.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
mad oT0.xy, v2, c20, c20.zwzw
mad oT3.xy, v3, c19, c19.zwzw
mov oT2.x, c18
"
}
SubProgram "d3d11 " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecediapheajfnijhoeeikplbllfbcjoanfgaabaaaaaaliagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcaeafaaaaeaaaabaaebabaaaafjaaaaae
egiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaaj
bcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaiaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaa
abaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaa
egbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
aeaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedjeemffhibnmfakoifjpoflojdcmedmfkabaaaaaammajaaaaaeaaaaaa
daaaaaaaeaadaaaaemaiaaaabeajaaaaebgpgodjaiadaaaaaiadaaaaaaacpopp
keacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
adaaabaaaaaaaaaaabaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaabaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaaaaaaaaaiadpaaaaaadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaahiaaeaaoekaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
anaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaae
aaaaahiaaaaaoeiaapaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibabaaaakaalaaaaad
aaaaabiaaaaaaaiabaaaaakaakaaaaadaaaaabiaaaaaaaiabaaaffkaacaaaaad
aaaaabiaaaaaaaibbaaaffkaabaaaaacabaaapiaagaaoekaafaaaaadaaaaaoia
abaaffiaamaajakaaeaaaaaeaaaaaoiaalaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiaanaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiaaoaajakaabaappia
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiabaaaaakaakaaaaadaaaaaciaaaaaffiabaaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaaeaaaaaeabaaadoaaeaaoejaacaaoekaacaaookaafaaaaadaaaaapia
aaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaafaaaakaafaaaaadabaaaiiaabaaaaia
baaakkkaafaaaaadabaaafiaaaaapeiabaaakkkaacaaaaadacaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaa
fdeieefcaeafaaaaeaaaabaaebabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
eccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaiaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaabaaaaaah
bcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaa
acaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaa
agaabaaaacaaaaaabacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaajgahbaaa
abaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaa
ogikcaaaaaaaaaaaakaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaa
aiaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaa
ajaaaaaaogikcaaaaaaaaaaaajaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
adaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 37 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_Scale]
Float 17 [_FresnelFactor]
Float 18 [_EmissionFactor]
Vector 19 [unity_LightmapST]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[15];
MAD R0.xyz, R0, c[16].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[17];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP3 R0.w, R2, R2;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R2;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[19], c[19].zwzw;
MOV result.texcoord[2].x, c[18];
END
# 37 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 39 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_Scale]
Float 17 [_FresnelFactor]
Float 18 [_EmissionFactor]
Vector 19 [unity_LightmapST]
Vector 20 [_MainTex_ST]
"vs_2_0
def c21, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.w, c21.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r1.xyz, r0, c16.w, -v0
dp3 r0.x, r1, r1
rsq r1.w, r0.x
mov r0, c10
dp4 r3.z, c15, r0
mov r0, c9
dp4 r3.y, c15, r0
mul r2.xyz, r1.w, r1
mov r1, c8
dp4 r3.x, c15, r1
dp3 r0.y, r3, r3
rsq r0.y, r0.y
mul r1.xyz, r0.y, r3
dp3 r0.y, v1, r1
min r0.y, r0, c21.x
max r1.w, r0.y, c21.y
dp3 r0.x, v1, r2
mul r0.x, -r0, c17
min r0.x, r0, c21
max r0.x, r0, c21.y
add r0.z, -r0.x, c21.x
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c21.z
mul r1.y, r1, c13.x
mad oT4.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
mad oT0.xy, v2, c20, c20.zwzw
mad oT3.xy, v3, c19, c19.zwzw
mov oT2.x, c18
"
}
SubProgram "d3d11 " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecediapheajfnijhoeeikplbllfbcjoanfgaabaaaaaaliagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcaeafaaaaeaaaabaaebabaaaafjaaaaae
egiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaaj
bcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaiaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaa
abaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaa
egbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
aeaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedjeemffhibnmfakoifjpoflojdcmedmfkabaaaaaammajaaaaaeaaaaaa
daaaaaaaeaadaaaaemaiaaaabeajaaaaebgpgodjaiadaaaaaiadaaaaaaacpopp
keacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
adaaabaaaaaaaaaaabaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaabaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaaaaaaaaaiadpaaaaaadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaahiaaeaaoekaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
anaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaae
aaaaahiaaaaaoeiaapaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibabaaaakaalaaaaad
aaaaabiaaaaaaaiabaaaaakaakaaaaadaaaaabiaaaaaaaiabaaaffkaacaaaaad
aaaaabiaaaaaaaibbaaaffkaabaaaaacabaaapiaagaaoekaafaaaaadaaaaaoia
abaaffiaamaajakaaeaaaaaeaaaaaoiaalaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiaanaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiaaoaajakaabaappia
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiabaaaaakaakaaaaadaaaaaciaaaaaffiabaaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaaeaaaaaeabaaadoaaeaaoejaacaaoekaacaaookaafaaaaadaaaaapia
aaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaafaaaakaafaaaaadabaaaiiaabaaaaia
baaakkkaafaaaaadabaaafiaaaaapeiabaaakkkaacaaaaadacaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaa
fdeieefcaeafaaaaeaaaabaaebabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
eccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaiaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaabaaaaaah
bcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaa
acaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaa
agaabaaaacaaaaaabacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaajgahbaaa
abaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaa
ogikcaaaaaaaaaaaakaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaa
aiaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaa
ajaaaaaaogikcaaaaaaaaaaaajaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
adaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 83 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
Float 31 [_FresnelFactor]
Float 32 [_EmissionFactor]
Vector 33 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[34] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[30].w;
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP3 R3.x, R3, c[7];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R4.w, R0, c[28];
DP4 R4.z, R0, c[27];
DP4 R4.y, R0, c[26];
MAD R1.w, R4.x, R4.x, -R1;
ADD R2.xyz, R2, R4.yzww;
MUL R0.xyz, R1.w, c[29];
ADD R2.xyz, R2, R0;
ADD result.texcoord[4].xyz, R2, R1;
MOV R1, c[14];
MOV R0.w, c[0].x;
MOV R0.xyz, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP4 R4.w, R0, c[11];
DP4 R4.y, R0, c[9];
DP4 R4.z, R0, c[10];
MAD R0.xyz, R4.yzww, c[30].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R1.x, R2, R2;
DP3 R0.x, vertex.normal, R0;
RSQ R0.w, R1.x;
MUL R1.xyz, R0.w, R2;
MUL R0.x, -R0, c[31];
DP3 R0.y, vertex.normal, R1;
MIN R0.x, R0, c[0];
MIN R0.y, R0, c[0].x;
MAX R0.x, R0, c[0].y;
MAX R0.y, R0, c[0];
ADD R0.x, -R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
MOV result.texcoord[3].z, R3.x;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[33], c[33].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[32];
END
# 83 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 85 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 17 [unity_4LightAtten0]
Vector 18 [unity_LightColor0]
Vector 19 [unity_LightColor1]
Vector 20 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_SHAr]
Vector 23 [unity_SHAg]
Vector 24 [unity_SHAb]
Vector 25 [unity_SHBr]
Vector 26 [unity_SHBg]
Vector 27 [unity_SHBb]
Vector 28 [unity_SHC]
Vector 29 [unity_Scale]
Float 30 [_FresnelFactor]
Float 31 [_EmissionFactor]
Vector 32 [_MainTex_ST]
"vs_2_0
def c33, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r3.xyz, v1, c29.w
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp3 r3.x, r3, c6
dp4 r0.x, v0, c5
add r1, -r0.x, c15
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c14
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c33.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c16
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c17
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c33.x
dp4 r2.z, r4, c24
dp4 r2.y, r4, c23
dp4 r2.x, r4, c22
mov r2.w, c33.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c33.y
mul r0, r0, r1
mul r1.xyz, r0.y, c19
mad r1.xyz, r0.x, c18, r1
mad r0.xyz, r0.z, c20, r1
mul r1, r4.xyzz, r4.yzzx
mad r0.xyz, r0.w, c21, r0
mul r0.w, r3, r3
dp4 r4.w, r1, c27
dp4 r4.z, r1, c26
dp4 r4.y, r1, c25
mad r0.w, r4.x, r4.x, -r0
add r2.xyz, r2, r4.yzww
mul r1.xyz, r0.w, c28
add r1.xyz, r2, r1
mov r2.xyz, c12
add oT4.xyz, r1, r0
dp4 r4.w, r2, c10
dp4 r4.y, r2, c8
dp4 r4.z, r2, c9
mad r2.xyz, r4.yzww, c29.w, -v0
dp3 r1.x, r2, r2
mov r0, c10
dp4 r4.w, c13, r0
mov r0, c9
rsq r2.w, r1.x
dp4 r4.z, c13, r0
mov r1, c8
dp4 r4.y, c13, r1
mul r0.xyz, r2.w, r2
dp3 r0.x, v1, r0
dp3 r0.w, r4.yzww, r4.yzww
rsq r0.w, r0.w
mul r1.xyz, r0.w, r4.yzww
mul r0.x, -r0, c30
dp3 r0.y, v1, r1
min r0.x, r0, c33
min r0.y, r0, c33.x
max r0.x, r0, c33.y
max r0.y, r0, c33
add r0.x, -r0, c33
mul oT1.x, r0, r0.y
mov oT3.z, r3.x
mov oT3.y, r3.w
mov oT3.x, r4
mad oT0.xy, v2, c32, c32.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c31
"
}
SubProgram "d3d11 " {
// Stats: 64 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedbhmknecaececknmkhdcfpicdchdghoboabaaaaaagaalaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefckmajaaaaeaaaabaaglacaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
eccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadicaaaaj
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaa
egbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaafhccabaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaa
aaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
acaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
diaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
icaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaa
acaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
aaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaaacaaaaaa
acaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaa
acaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaa
aaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
afaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaa
adaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaa
egiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
aoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
adaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaagaaaaaa
agaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaahhccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 64 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedpnhcjjnjgmcanjnfpjcloejmkejfecnhabaaaaaadabbaaaaaeaaaaaa
daaaaaaapmafaaaalaapaaaahibaaaaaebgpgodjmeafaaaameafaaaaaaacpopp
eiafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaabaaaeaaaaaaaaaa
acaaacaaaiaaafaaaaaaaaaaacaacgaaahaaanaaaaaaaaaaadaaaaaaaeaabeaa
aaaaaaaaadaaamaaajaabiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafcbaaapka
aaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaabaaaaacaaaaahiaadaaoeka
afaaaaadabaaahiaaaaaffiabnaaoekaaeaaaaaeaaaaaliabmaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiaboaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabpaaoekaaeaaaaaeaaaaahiaaaaaoeiacaaappkaaaaaoejbceaaaaac
abaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabia
aaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiacbaaaakaakaaaaadaaaaabia
aaaaaaiacbaaffkaacaaaaadaaaaabiaaaaaaaibcbaaffkaabaaaaacabaaapia
aeaaoekaafaaaaadaaaaaoiaabaaffiabnaajakaaeaaaaaeaaaaaoiabmaajaka
abaaaaiaaaaaoeiaaeaaaaaeaaaaaoiaboaajakaabaakkiaaaaaoeiaaeaaaaae
aaaaaoiabpaajakaabaappiaaaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaad
aaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffiacbaaaakaakaaaaad
aaaaaciaaaaaffiacbaaffkaafaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaafaaaaadaaaaahiaaaaaffjabjaaoeka
aeaaaaaeaaaaahiabiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabkaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiablaaoekaaaaappjaaaaaoeiaacaaaaad
abaaapiaaaaaffibagaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaad
adaaapiaaaaaaaibafaaoekaacaaaaadaaaaapiaaaaakkibahaaoekaaeaaaaae
acaaapiaadaaoeiaadaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeia
acaaoeiaahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaac
aeaaaeiaacaakkiaahaaaaacaeaaaiiaacaappiaabaaaaacafaaaciacbaaffka
aeaaaaaeacaaapiaacaaoeiaaiaaoekaafaaffiaafaaaaadafaaahiaacaaoeja
caaappkaafaaaaadagaaahiaafaaffiabjaaoekaaeaaaaaeafaaaliabiaakeka
afaaaaiaagaakeiaaeaaaaaeafaaahiabkaaoekaafaakkiaafaapeiaafaaaaad
abaaapiaabaaoeiaafaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeia
aeaaaaaeaaaaapiaaaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeia
aaaaoeiaalaaaaadaaaaapiaaaaaoeiacbaaaakaagaaaaacabaaabiaacaaaaia
agaaaaacabaaaciaacaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiia
acaappiaafaaaaadaaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffia
akaaoekaaeaaaaaeabaaahiaajaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
alaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaamaaoekaaaaappiaaaaaoeia
abaaaaacafaaaiiacbaaffkaajaaaaadabaaabiaanaaoekaafaaoeiaajaaaaad
abaaaciaaoaaoekaafaaoeiaajaaaaadabaaaeiaapaaoekaafaaoeiaafaaaaad
acaaapiaafaacjiaafaakeiaajaaaaadadaaabiabaaaoekaacaaoeiaajaaaaad
adaaaciabbaaoekaacaaoeiaajaaaaadadaaaeiabcaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaae
aaaaaiiaafaaaaiaafaaaaiaaaaappibabaaaaacabaaahoaafaaoeiaaeaaaaae
abaaahiabdaaoekaaaaappiaabaaoeiaacaaaaadacaaahoaaaaaoeiaabaaoeia
afaaaaadaaaaapiaaaaaffjabfaaoekaaeaaaaaeaaaaapiabeaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabgaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
bhaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaafdeieefc
kmajaaaaeaaaabaaglacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaac
agaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaa
acaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaa
abaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaa
diaaaaaheccabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaa
fgafbaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaa
aeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaia
ebaaaaaaacaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaa
kgakbaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaa
adaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaan
pcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaadaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 88 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
Float 32 [_FresnelFactor]
Float 33 [_EmissionFactor]
Vector 34 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[35] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..34] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[31].w;
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP3 R3.x, R3, c[7];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MUL R1, R4.xyzz, R4.yzzx;
MAD R0.xyz, R0.w, c[23], R0;
MUL R0.w, R3, R3;
DP4 R5.z, R1, c[29];
DP4 R5.y, R1, c[28];
DP4 R5.x, R1, c[27];
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R5;
MAD R0.w, R4.x, R4.x, -R0;
MUL R4.yzw, R0.w, c[30].xxyz;
ADD R2.xyz, R2, R4.yzww;
ADD result.texcoord[4].xyz, R2, R0;
DP4 R5.z, R1, c[11];
DP4 R5.x, R1, c[9];
DP4 R5.y, R1, c[10];
MAD R1.xyz, R5, c[31].w, -vertex.position;
DP3 R0.w, R1, R1;
RSQ R1.w, R0.w;
MOV R0, c[15];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MUL R1.xyz, R1.w, R1;
DP3 R0.x, vertex.normal, R1;
DP3 R0.y, R2, R2;
RSQ R0.y, R0.y;
MUL R1.xyz, R0.y, R2;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL R0.x, -R0, c[32];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[3].z, R3.x;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[34], c[34].zwzw;
MOV result.texcoord[2].x, c[33];
END
# 88 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 90 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
Float 32 [_FresnelFactor]
Float 33 [_EmissionFactor]
Vector 34 [_MainTex_ST]
"vs_2_0
def c35, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r3.xyz, v1, c31.w
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp3 r3.x, r3, c6
dp4 r0.x, v0, c5
add r1, -r0.x, c17
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c16
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c35.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c18
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c19
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c35.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c35.y
mul r0, r0, r1
mul r1.xyz, r0.y, c21
mad r1.xyz, r0.x, c20, r1
mad r0.xyz, r0.z, c22, r1
mul r1, r4.xyzz, r4.yzzx
mad r0.xyz, r0.w, c23, r0
mul r0.w, r3, r3
dp4 r5.z, r1, c29
dp4 r5.y, r1, c28
dp4 r5.x, r1, c27
mov r1.w, c35.x
mov r1.xyz, c12
dp4 r2.z, r4, c26
dp4 r2.y, r4, c25
dp4 r2.x, r4, c24
add r2.xyz, r2, r5
mad r0.w, r4.x, r4.x, -r0
mul r4.yzw, r0.w, c30.xxyz
add r2.xyz, r2, r4.yzww
dp4 r5.z, r1, c10
dp4 r5.x, r1, c8
dp4 r5.y, r1, c9
mad r1.xyz, r5, c31.w, -v0
dp3 r0.w, r1, r1
rsq r1.w, r0.w
add oT4.xyz, r2, r0
mov r0, c10
dp4 r5.z, c15, r0
mov r0, c9
dp4 r5.y, c15, r0
mul r2.xyz, r1.w, r1
mov r1, c8
dp4 r5.x, c15, r1
dp3 r0.y, r5, r5
rsq r0.y, r0.y
mul r1.xyz, r0.y, r5
dp3 r0.y, v1, r1
min r0.y, r0, c35.x
max r1.w, r0.y, c35.y
dp3 r0.x, v1, r2
mul r0.x, -r0, c32
min r0.x, r0, c35
max r0.x, r0, c35.y
add r0.z, -r0.x, c35.x
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c35.z
mul r1.y, r1, c13.x
mad oT5.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
mov oT3.z, r3.x
mov oT3.y, r3.w
mov oT3.x, r4
mad oT0.xy, v2, c34, c34.zwzw
mov oT2.x, c33
"
}
SubProgram "d3d11 " {
// Stats: 67 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedkeekhlmlomakgjmneppkgcoiamiokjgpabaaaaaabaamaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefceeakaaaaeaaaabaajbacaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaiaaaaaaaaaaaaaibcaabaaa
abaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaa
abaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaal
ocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaa
agijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaa
baaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaaf
bcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaa
abaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaa
jgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
ajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaa
aaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaa
acaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaa
bbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaa
bbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaai
bcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaai
ccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaai
ecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaa
abaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaaj
pcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaadaaaaaa
diaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaah
pcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaa
agaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaaj
pcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaaeaaaaaa
dcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaa
afaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaa
egaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaa
agaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaa
adaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaa
afaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaak
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaa
diaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaahaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaabaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaa
kgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 67 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedfibonjhenbfanjdmjciekkkikabcloomabaaaaaacmbcaaaaaeaaaaaa
daaaaaaaeiagaaaajebaaaaafmbbaaaaebgpgodjbaagaaaabaagaaaaaaacpopp
jeafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaiaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaa
acaaacaaaiaaagaaaaaaaaaaacaacgaaahaaaoaaaaaaaaaaadaaaaaaaeaabfaa
aaaaaaaaadaaamaaajaabjaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafccaaapka
aaaaaaaaaaaaiadpaaaaaadpaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaabaaaaacaaaaahiaadaaoeka
afaaaaadabaaahiaaaaaffiaboaaoekaaeaaaaaeaaaaaliabnaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabpaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiacaaaoekaaeaaaaaeaaaaahiaaaaaoeiacbaappkaaaaaoejbceaaaaac
abaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabia
aaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiaccaaaakaakaaaaadaaaaabia
aaaaaaiaccaaffkaacaaaaadaaaaabiaaaaaaaibccaaffkaabaaaaacabaaapia
afaaoekaafaaaaadaaaaaoiaabaaffiaboaajakaaeaaaaaeaaaaaoiabnaajaka
abaaaaiaaaaaoeiaaeaaaaaeaaaaaoiabpaajakaabaakkiaaaaaoeiaaeaaaaae
aaaaaoiacaaajakaabaappiaaaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaad
aaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffiaccaaaakaakaaaaad
aaaaaciaaaaaffiaccaaffkaafaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaafaaaaadaaaaahiaaaaaffjabkaaoeka
aeaaaaaeaaaaahiabjaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiablaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiabmaaoekaaaaappjaaaaaoeiaacaaaaad
abaaapiaaaaaffibahaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaad
adaaapiaaaaaaaibagaaoekaacaaaaadaaaaapiaaaaakkibaiaaoekaaeaaaaae
acaaapiaadaaoeiaadaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeia
acaaoeiaahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaac
aeaaaeiaacaakkiaahaaaaacaeaaaiiaacaappiaabaaaaacafaaaciaccaaffka
aeaaaaaeacaaapiaacaaoeiaajaaoekaafaaffiaafaaaaadafaaahiaacaaoeja
cbaappkaafaaaaadagaaahiaafaaffiabkaaoekaaeaaaaaeafaaaliabjaakeka
afaaaaiaagaakeiaaeaaaaaeafaaahiablaaoekaafaakkiaafaapeiaafaaaaad
abaaapiaabaaoeiaafaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeia
aeaaaaaeaaaaapiaaaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeia
aaaaoeiaalaaaaadaaaaapiaaaaaoeiaccaaaakaagaaaaacabaaabiaacaaaaia
agaaaaacabaaaciaacaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiia
acaappiaafaaaaadaaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffia
alaaoekaaeaaaaaeabaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
amaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappiaaaaaoeia
abaaaaacafaaaiiaccaaffkaajaaaaadabaaabiaaoaaoekaafaaoeiaajaaaaad
abaaaciaapaaoekaafaaoeiaajaaaaadabaaaeiabaaaoekaafaaoeiaafaaaaad
acaaapiaafaacjiaafaakeiaajaaaaadadaaabiabbaaoekaacaaoeiaajaaaaad
adaaaciabcaaoekaacaaoeiaajaaaaadadaaaeiabdaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaae
aaaaaiiaafaaaaiaafaaaaiaaaaappibabaaaaacabaaahoaafaaoeiaaeaaaaae
abaaahiabeaaoekaaaaappiaabaaoeiaacaaaaadacaaahoaaaaaoeiaabaaoeia
afaaaaadaaaaapiaaaaaffjabgaaoekaaeaaaaaeaaaaapiabfaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabhaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
biaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaaeaaaakaafaaaaad
abaaaiiaabaaaaiaccaakkkaafaaaaadabaaafiaaaaapeiaccaakkkaacaaaaad
adaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacadaaamoaaaaaoeiaabaaaaacaaaaaioa
abaaffkappppaaaafdeieefceeakaaaaeaaaabaajbacaaaafjaaaaaeegiocaaa
aaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaa
abaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacahaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaa
abaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaiaaaaaaaaaaaaai
bcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaj
ocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaa
dcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaa
eeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaaegbcbaaa
acaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaa
bkiacaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaf
hccabaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaa
bbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaa
bbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaa
bbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaah
icaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaa
adaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaa
diaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaaj
pcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaacaaaaaa
aaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaa
aeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaa
egaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaa
abaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaa
egaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaa
egaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaa
acaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaak
pcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaa
adaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaa
ahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
aiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaah
hccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 13 math, 1 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_Color]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
DP3 R1.w, fragment.texcoord[3], c[0];
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R1.xyz, R0, c[2];
MUL R2.xyz, R0, fragment.texcoord[2].x;
MUL R0.xyz, R1, fragment.texcoord[4];
MUL R1.xyz, R1, c[1];
MAX R1.w, R1, c[3].x;
MUL R1.xyz, R1.w, R1;
MAD R0.xyz, R1, c[3].y, R0;
MUL R1.xyz, R2, fragment.texcoord[1].x;
ADD result.color.xyz, R0, R1;
MUL result.color.w, R0, c[2];
END
# 13 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 13 math, 1 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_Color]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c3, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3.xyz
dcl t4.xyz
texld r1, t0, s0
mul_pp r2.xyz, r1, c2
mul_pp r3.xyz, r2, t4
dp3_pp r0.x, t3, c0
mul r1.xyz, r1, t2.x
mul_pp r2.xyz, r2, c1
max_pp r0.x, r0, c3
mul_pp r0.xyz, r0.x, r2
mad_pp r2.xyz, r0, c3.y, r3
mul r0.x, r1.w, t1
mul r0.w, r0.x, c2
mul r1.xyz, r1, t1.x
add_pp r0.xyz, r2, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 10 math, 1 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Vector 48 [_Color]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedcbadfacilkkfofjgdnjomgdmbgohnckgabaaaaaabeadaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpeabaaaa
eaaaaaaahnaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaad
icbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaaibcaabaaaaaaaaaaa
egbcbaaaacaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaa
abaaaaaaagijcaaaaaaaaaaaadaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaa
abaaaaaaogbpbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaaabaaaaaa
kgbkbaaaabaaaaaaegacbaaaaaaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
abaaaaaadkiacaaaaaaaaaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 10 math, 1 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Vector 48 [_Color]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedonapcmfeedkbkhgbacohmgpogigiiobjabaaaaaajaaeaaaaaeaaaaaa
daaaaaaakiabaaaakeadaaaafmaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
ceabaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaaabaaaaaaabaaacaa
aaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioeka
aiaaaaadabaaciiaabaaoelaacaaoekaalaaaaadacaaciiaabaappiaadaaaaka
acaaaaadabaacbiaacaappiaacaappiaafaaaaadabaacoiaaaaabliaabaablka
afaaaaadacaachiaabaabliaaaaaoekaafaaaaadabaacoiaabaaoeiaacaablla
aeaaaaaeabaachiaacaaoeiaabaaaaiaabaabliaafaaaaadaaaaahiaaaaaoeia
aaaapplaafaaaaadaaaaaiiaaaaappiaaaaakklaafaaaaadacaaciiaaaaappia
abaappkaaeaaaaaeacaachiaaaaaoeiaaaaakklaabaaoeiaabaaaaacaaaicpia
acaaoeiappppaaaafdeieefcpeabaaaaeaaaaaaahnaaaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaabaaaaaaibcaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaabaaaaaa
aaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaa
aaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaaadaaaaaa
diaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaacaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadcaaaaaj
hccabaaaaaaaaaaajgahbaaaabaaaaaakgbkbaaaabaaaaaaegacbaaaaaaaaaaa
diaaaaaiiccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaa
doaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 10 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[3], texture[1], 2D;
MUL R2.xyz, R0, fragment.texcoord[2].x;
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R1, R0;
MUL R1.xyz, R2, fragment.texcoord[1].x;
MAD result.color.xyz, R0, c[1].x, R1;
MUL result.color.w, R0, c[0];
END
# 10 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 9 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3.xy
texld r1, t0, s0
texld r0, t3, s1
mul_pp r2.xyz, r1, c0
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, r2
mul r1.xyz, r1, t2.x
mul r2.x, r1.w, t1
mul r1.xyz, r1, t1.x
mul r0.w, r2.x, c0
mad_pp r0.xyz, r0, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 7 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecednmddbfllinpemiekeiaicheomjlggnagabaaaaaalmacaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaad
dcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaah
pcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaa
akaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 7 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlkdldckcihibdnkghgidjfpmheiejbfpabaaaaaaaaaeaaaaaeaaaaaa
daaaaaaahaabaaaacmadaaaammadaaaaebgpgodjdiabaaaadiabaaaaaaacpppp
aaabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaacpiaabaaoelaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaad
aaaaciiaaaaappiaabaaaakaafaaaaadaaaachiaaaaaoeiaaaaappiaafaaaaad
acaaahiaabaaoeiaaaaapplaafaaaaadacaachiaacaaoeiaaaaakklaafaaaaad
abaachiaabaaoeiaaaaaoekaafaaaaadaaaaaiiaabaappiaaaaakklaafaaaaad
adaaciiaaaaappiaaaaappkaaeaaaaaeadaachiaabaaoeiaaaaaoeiaacaaoeia
abaaaaacaaaicpiaadaaoeiappppaaaafdeieefcleabaaaaeaaaaaaagnaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaa
gcbaaaadicbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaa
ogbpbaaaabaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaa
abaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaa
adaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
jgahbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
// Stats: 10 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[3], texture[1], 2D;
MUL R2.xyz, R0, fragment.texcoord[2].x;
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R1, R0;
MUL R1.xyz, R2, fragment.texcoord[1].x;
MAD result.color.xyz, R0, c[1].x, R1;
MUL result.color.w, R0, c[0];
END
# 10 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 9 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3.xy
texld r1, t0, s0
texld r0, t3, s1
mul_pp r2.xyz, r1, c0
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, r2
mul r1.xyz, r1, t2.x
mul r2.x, r1.w, t1
mul r1.xyz, r1, t1.x
mul r0.w, r2.x, c0
mad_pp r0.xyz, r0, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 7 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecednmddbfllinpemiekeiaicheomjlggnagabaaaaaalmacaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaad
dcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaah
pcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaa
akaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 7 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlkdldckcihibdnkghgidjfpmheiejbfpabaaaaaaaaaeaaaaaeaaaaaa
daaaaaaahaabaaaacmadaaaammadaaaaebgpgodjdiabaaaadiabaaaaaaacpppp
aaabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaacpiaabaaoelaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaad
aaaaciiaaaaappiaabaaaakaafaaaaadaaaachiaaaaaoeiaaaaappiaafaaaaad
acaaahiaabaaoeiaaaaapplaafaaaaadacaachiaacaaoeiaaaaakklaafaaaaad
abaachiaabaaoeiaaaaaoekaafaaaaadaaaaaiiaabaappiaaaaakklaafaaaaad
adaaciiaaaaappiaaaaappkaaeaaaaaeadaachiaabaaoeiaaaaaoeiaacaaoeia
abaaaaacaaaicpiaadaaoeiappppaaaafdeieefcleabaaaaeaaaaaaagnaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaa
gcbaaaadicbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaa
ogbpbaaaabaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaa
abaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaa
adaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
jgahbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
// Stats: 15 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TXP R1.x, fragment.texcoord[5], texture[1], 2D;
MUL R1.yzw, R0.xxyz, c[2].xxyz;
DP3 R2.w, fragment.texcoord[3], c[0];
MAX R2.w, R2, c[3].x;
MUL R0.xyz, R0, fragment.texcoord[2].x;
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R2.xyz, R1.yzww, c[1];
MUL R1.x, R2.w, R1;
MUL R2.xyz, R1.x, R2;
MUL R1.xyz, R1.yzww, fragment.texcoord[4];
MAD R1.xyz, R2, c[3].y, R1;
MUL R0.xyz, R0, fragment.texcoord[1].x;
ADD result.color.xyz, R1, R0;
MUL result.color.w, R0, c[2];
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 14 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c3, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3.xyz
dcl t4.xyz
dcl t5
texld r1, t0, s0
texldp r4, t5, s1
mul_pp r0.xyz, r1, c2
mul r1.xyz, r1, t2.x
mul_pp r2.xyz, r0, c1
mul_pp r3.xyz, r0, t4
dp3_pp r0.x, t3, c0
max_pp r0.x, r0, c3
mul_pp r0.x, r0, r4
mul_pp r0.xyz, r0.x, r2
mad_pp r2.xyz, r0, c3.y, r3
mul r0.x, r1.w, t1
mul r0.w, r0.x, c2
mul r1.xyz, r1, t1.x
add_pp r0.xyz, r2, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 11 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedbgemkgahpedhfkccepbgpameakoppogpabaaaaaajeadaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfmacaaaaeaaaaaaajhaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabaaaaaaiccaabaaaaaaaaaaa
egbcbaaaacaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaa
aaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaa
abaaaaaaagijcaaaaaaaaaaaahaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaa
abaaaaaaogbpbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaaabaaaaaa
kgbkbaaaabaaaaaaegacbaaaaaaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
abaaaaaadkiacaaaaaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 11 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedfdnpmneankipfgehgkgoodbeglfabjbeabaaaaaagmafaaaaaeaaaaaa
daaaaaaaaeacaaaagiaeaaaadiafaaaaebgpgodjmmabaaaammabaaaaaaacpppp
hmabaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaaabaaaaaa
abaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkaagaaaaacaaaaaiiaadaapplaafaaaaadaaaaadia
aaaappiaadaaoelaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpia
aaaaoelaabaioekaaiaaaaadaaaacciaabaaoelaacaaoekaafaaaaadaaaacbia
aaaaaaiaaaaaffiafiaaaaaeaaaacbiaaaaaffiaaaaaaaiaadaaaakaacaaaaad
aaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaabaablkaafaaaaad
acaachiaaaaabliaaaaaoekaafaaaaadaaaacoiaaaaaoeiaacaabllaaeaaaaae
aaaachiaacaaoeiaaaaaaaiaaaaabliaafaaaaadabaaahiaabaaoeiaaaaappla
afaaaaadaaaaaiiaabaappiaaaaakklaafaaaaadacaaciiaaaaappiaabaappka
aeaaaaaeacaachiaabaaoeiaaaaakklaaaaaoeiaabaaaaacaaaicpiaacaaoeia
ppppaaaafdeieefcfmacaaaaeaaaaaaajhaaaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaa
abaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaaeaaaaaapgbpbaaa
aeaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaabaaaaaaiccaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaa
abaaaaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaa
ahaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
dcaaaaajhccabaaaaaaaaaaajgahbaaaabaaaaaakgbkbaaaabaaaaaaegacbaaa
aaaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaa
ahaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 16 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[3], texture[2], 2D;
TXP R3.x, fragment.texcoord[4], texture[1], 2D;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[1].x;
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R2.xyz, R2, c[1].y;
MUL R3.xyz, R1, R3.x;
MIN R1.xyz, R1, R2;
MUL R2.xyz, R0, fragment.texcoord[2].x;
MAX R1.xyz, R1, R3;
MUL R2.xyz, R2, fragment.texcoord[1].x;
MUL R0.xyz, R0, c[0];
MAD result.color.xyz, R0, R1, R2;
MUL result.color.w, R0, c[0];
END
# 16 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 14 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 8.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3.xy
dcl t4
texld r1, t0, s0
texldp r3, t4, s1
texld r0, t3, s2
mul_pp r2.xyz, r0, r3.x
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c1.x
mul_pp r2.xyz, r2, c1.y
min_pp r2.xyz, r0, r2
mul_pp r0.xyz, r0, r3.x
max_pp r0.xyz, r2, r0
mul r2.xyz, r1, t2.x
mul r3.x, r1.w, t1
mul r0.w, r3.x, c0
mul r2.xyz, r2, t1.x
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 13 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedajaglcadalpbfbjimlgghknmbanngcgmabaaaaaamiadaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckiacaaaa
eaaaaaaakkaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaa
abaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaa
abaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaa
diaaaaaiiccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaahaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 13 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecednbaffbbjlmkpfflhaplglkddhaemdjdaabaaaaaakeafaaaaaeaaaaaa
daaaaaaaaiacaaaaliaeaaaahaafaaaaebgpgodjnaabaaaanaabaaaaaaacpppp
jeabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaadlabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
acaapplaafaaaaadaaaaadiaaaaappiaacaaoelaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadabaacpiaabaaoelaacaioekaecaaaaadacaacpiaaaaaoela
abaioekaacaaaaadaaaacciaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaablia
aaaaffiaafaaaaadabaaciiaabaappiaabaaaakaafaaaaadabaachiaabaaoeia
abaappiaakaaaaadadaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaia
abaaoeiaalaaaaadabaachiaadaaoeiaaaaaoeiaafaaaaadaaaaahiaacaaoeia
aaaapplaafaaaaadaaaachiaaaaaoeiaaaaakklaafaaaaadacaachiaacaaoeia
aaaaoekaafaaaaadaaaaaiiaacaappiaaaaakklaafaaaaadadaaciiaaaaappia
aaaappkaaeaaaaaeadaachiaacaaoeiaabaaoeiaaaaaoeiaabaaaaacaaaicpia
adaaoeiappppaaaafdeieefckiacaaaaeaaaaaaakkaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaa
ddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaa
aaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahpcaabaaa
abaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
abaaaaaadkiacaaaaaaaaaaaahaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaiaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
// Stats: 16 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[3], texture[2], 2D;
TXP R3.x, fragment.texcoord[4], texture[1], 2D;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[1].x;
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R2.xyz, R2, c[1].y;
MUL R3.xyz, R1, R3.x;
MIN R1.xyz, R1, R2;
MUL R2.xyz, R0, fragment.texcoord[2].x;
MAX R1.xyz, R1, R3;
MUL R2.xyz, R2, fragment.texcoord[1].x;
MUL R0.xyz, R0, c[0];
MAD result.color.xyz, R0, R1, R2;
MUL result.color.w, R0, c[0];
END
# 16 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 14 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 8.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3.xy
dcl t4
texld r1, t0, s0
texldp r3, t4, s1
texld r0, t3, s2
mul_pp r2.xyz, r0, r3.x
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c1.x
mul_pp r2.xyz, r2, c1.y
min_pp r2.xyz, r0, r2
mul_pp r0.xyz, r0, r3.x
max_pp r0.xyz, r2, r0
mul r2.xyz, r1, t2.x
mul r3.x, r1.w, t1
mul r0.w, r3.x, c0
mul r2.xyz, r2, t1.x
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 13 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedajaglcadalpbfbjimlgghknmbanngcgmabaaaaaamiadaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckiacaaaa
eaaaaaaakkaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaa
abaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaa
abaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaa
diaaaaaiiccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaahaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 13 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecednbaffbbjlmkpfflhaplglkddhaemdjdaabaaaaaakeafaaaaaeaaaaaa
daaaaaaaaiacaaaaliaeaaaahaafaaaaebgpgodjnaabaaaanaabaaaaaaacpppp
jeabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaadlabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
acaapplaafaaaaadaaaaadiaaaaappiaacaaoelaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadabaacpiaabaaoelaacaioekaecaaaaadacaacpiaaaaaoela
abaioekaacaaaaadaaaacciaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaablia
aaaaffiaafaaaaadabaaciiaabaappiaabaaaakaafaaaaadabaachiaabaaoeia
abaappiaakaaaaadadaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaia
abaaoeiaalaaaaadabaachiaadaaoeiaaaaaoeiaafaaaaadaaaaahiaacaaoeia
aaaapplaafaaaaadaaaachiaaaaaoeiaaaaakklaafaaaaadacaachiaacaaoeia
aaaaoekaafaaaaadaaaaaiiaacaappiaaaaakklaafaaaaadadaaciiaaaaappia
aaaappkaaeaaaaaeadaachiaacaaoeiaabaaoeiaaaaaoeiaabaaaaacaaaicpia
adaaoeiappppaaaafdeieefckiacaaaaeaaaaaaakkaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaa
ddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaa
aaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaahaaaaaadiaaaaahpcaabaaa
abaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
abaaaaaadkiacaaaaaaaaaaaahaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaiaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 39 avg math (29..43)
 //    d3d11_9x : 39 avg math (29..43)
 //        d3d9 : 44 avg math (38..47)
 //      opengl : 42 avg math (36..45)
 // Stats for Fragment shader:
 //       d3d11 : 9 avg math (6..16), 2 avg texture (1..3)
 //    d3d11_9x : 9 avg math (6..16), 2 avg texture (1..3)
 //        d3d9 : 13 avg math (9..19), 2 avg texture (1..3)
 //      opengl : 14 avg math (9..20), 2 avg texture (1..3)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "RenderType"="Diffuse" }
  ZWrite Off
  Fog { Mode Off }
  Blend One One
Program "vp" {
SubProgram "opengl " {
// Stats: 44 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Float 20 [_FresnelFactor]
Float 21 [_EmissionFactor]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[17];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[18];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[20];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
DP4 R0.z, vertex.position, c[7];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R1.xyz, R2, c[19].w, -vertex.position;
DP3 R1.w, R1, R1;
RSQ R0.w, R1.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.y, vertex.normal, R1;
MUL R1.xyz, vertex.normal, c[19].w;
MIN R0.y, R0, c[0].x;
DP4 R0.w, vertex.position, c[8];
MAX R0.y, R0, c[0];
ADD R0.x, -R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[21];
END
# 44 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 46 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Float 19 [_FresnelFactor]
Float 20 [_EmissionFactor]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.w, c22.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r2.xyz, r0, c18.w, -v0
mov r1, c8
mov r0, c10
dp4 r3.z, c17, r0
mov r0, c9
dp4 r3.x, c17, r1
dp4 r3.y, c17, r0
mad r0.xyz, r3, c18.w, -v0
dp3 r1.w, r0, r0
dp3 r2.w, r2, r2
rsq r0.w, r2.w
mul r1.xyz, r0.w, r2
dp3 r0.w, v1, r1
rsq r1.w, r1.w
mul r1.xyz, r1.w, r0
mul r0.x, -r0.w, c19
dp3 r0.y, v1, r1
mul r1.xyz, v1, c18.w
min r0.x, r0, c22
min r0.y, r0, c22.x
max r0.x, r0, c22.y
dp4 r0.z, v0, c6
dp4 r0.w, v0, c7
max r0.y, r0, c22
add r0.x, -r0, c22
mul oT1.x, r0, r0.y
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c17
mad oT0.xy, v2, c21, c21.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c20
"
}
SubProgram "d3d11 " {
// Stats: 43 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedckafealjmgoekigclpggoiddcddnlnhdabaaaaaamaaiaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcpeagaaaaeaaaabaalnabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
dicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaa
aiaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaa
adaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaafgaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaagbjbaiaebaaaaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaa
abaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaa
diaaaaaheccabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaiaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 43 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedmdolahhkmacjfjgkkjbfhgecnkoghlpaabaaaaaameamaaaaaeaaaaaa
daaaaaaadaaeaaaacmalaaaapealaaaaebgpgodjpiadaaaapiadaaaaaaacpopp
iiadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaacaaafaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaabaaaiaaaaaaaaaaadaaaaaaaeaaajaaaaaaaaaaadaaamaaajaaanaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaaaaaaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaae
aaaaahiaaaaaoeiabfaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibafaaaakaalaaaaad
aaaaabiaaaaaaaiabgaaaakaakaaaaadaaaaabiaaaaaaaiabgaaffkaacaaaaad
aaaaabiaaaaaaaibbgaaffkaabaaaaacabaaapiaaiaaoekaafaaaaadaaaaaoia
abaaffiabcaajakaaeaaaaaeaaaaaoiabbaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiabdaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiabeaajakaabaappia
aaaaoeiaaeaaaaaeaaaaaoiaaaaaoeiabfaappkaaaaajajbceaaaaacabaaahia
aaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffia
bgaaaakaakaaaaadaaaaaciaaaaaffiabgaaffkaafaaaaadaaaaaeoaaaaaffia
aaaaaaiaaeaaaaaeaaaaadoaadaaoejaagaaoekaagaaookaafaaaaadaaaaahia
acaaoejabfaappkaafaaaaadabaaahiaaaaaffiaaoaaoekaaeaaaaaeaaaaalia
anaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoaapaaoekaaaaakkiaaaaapeia
afaaaaadaaaaahiaaaaaffjaaoaaoekaaeaaaaaeaaaaahiaanaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
baaaoekaaaaappjaaaaaoeiaacaaaaadacaaahoaaaaaoeibaiaaoekaafaaaaad
aaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
aaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahia
abaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeia
aeaaaaaeadaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffja
akaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
alaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaaioaafaaffkappppaaaafdeieefcpeagaaaaeaaaabaalnabaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaakiacaaaaaaaaaaaaiaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaa
acaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaafgaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaagbjbaiaebaaaaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaa
acaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaa
bkiacaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
// Stats: 36 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Float 16 [_FresnelFactor]
Float 17 [_EmissionFactor]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[19] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[14];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[16];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP3 R0.w, R2, R2;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R2;
DP3 R0.y, vertex.normal, R1;
MUL R1.xyz, vertex.normal, c[15].w;
MIN R0.y, R0, c[0].x;
ADD R0.x, -R0, c[0];
MAX R0.y, R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MOV result.texcoord[4].xyz, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[17];
END
# 36 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 38 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Float 15 [_FresnelFactor]
Float 16 [_EmissionFactor]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.w, c18.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r1.xyz, r0, c14.w, -v0
dp3 r0.x, r1, r1
rsq r1.w, r0.x
mov r0, c10
dp4 r3.z, c13, r0
mov r0, c9
mul r2.xyz, r1.w, r1
dp4 r3.y, c13, r0
mov r1, c8
dp4 r3.x, c13, r1
dp3 r0.y, r3, r3
rsq r0.y, r0.y
mul r1.xyz, r0.y, r3
dp3 r0.y, v1, r1
mul r1.xyz, v1, c14.w
dp3 r0.x, v1, r2
mul r0.x, -r0, c15
min r0.x, r0, c18
max r0.x, r0, c18.y
min r0.y, r0, c18.x
add r0.x, -r0, c18
max r0.y, r0, c18
mul oT1.x, r0, r0.y
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mov oT4.xyz, c13
mad oT0.xy, v2, c17, c17.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c16
"
}
SubProgram "d3d11 " {
// Stats: 29 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedpialifbpglbjimchofibngjgmnajlpdhabaaaaaajmagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcoiaeaaaaeaaaabaadkabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
eccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadicaaaaj
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaa
egbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaaghccabaaaadaaaaaaegiccaaaacaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 29 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecednocjbejleklbfhgcabddhonjoflmgibcabaaaaaakeajaaaaaeaaaaaa
daaaaaaadeadaaaaceaiaaaaomaiaaaaebgpgodjpmacaaaapmacaaaaaaacpopp
imacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaabaaaeaaaaaaaaaa
adaaaaaaaeaaafaaaaaaaaaaadaaamaaadaaajaaaaaaaaaaadaabaaaafaaamaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbbaaapkaaaaaaaaaaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaabaaaaacaaaaahiaadaaoekaafaaaaadabaaahiaaaaaffia
anaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
aoaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaae
aaaaahiaaaaaoeiabaaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibabaaaakaalaaaaad
aaaaabiaaaaaaaiabbaaaakaakaaaaadaaaaabiaaaaaaaiabbaaffkaacaaaaad
aaaaabiaaaaaaaibbbaaffkaabaaaaacabaaapiaaeaaoekaafaaaaadaaaaaoia
abaaffiaanaajakaaeaaaaaeaaaaaoiaamaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiaaoaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiaapaajakaabaappia
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiabbaaaakaakaaaaadaaaaaciaaaaaffiabbaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaafaaaaadaaaaahiaacaaoejabaaappkaafaaaaadabaaahiaaaaaffia
akaaoekaaeaaaaaeaaaaaliaajaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
alaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaae
aaaaapiaafaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaaioa
abaaffkaabaaaaacacaaahoaaeaaoekappppaaaafdeieefcoiaeaaaaeaaaabaa
dkabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaa
aaaaaaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaa
agijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaa
aaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaafgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaah
ccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaa
abaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaadaaaaaaegiccaaaacaaaaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
// Stats: 45 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Float 20 [_FresnelFactor]
Float 21 [_EmissionFactor]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[17];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[18];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[20];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
DP4 R0.z, vertex.position, c[7];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R1.xyz, R2, c[19].w, -vertex.position;
DP3 R1.w, R1, R1;
RSQ R0.w, R1.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.y, vertex.normal, R1;
MUL R1.xyz, vertex.normal, c[19].w;
MIN R0.y, R0, c[0].x;
DP4 R0.w, vertex.position, c[8];
MAX R0.y, R0, c[0];
ADD R0.x, -R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[5].w, R0, c[16];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[21];
END
# 45 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 47 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Float 19 [_FresnelFactor]
Float 20 [_EmissionFactor]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.w, c22.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r2.xyz, r0, c18.w, -v0
mov r1, c8
mov r0, c10
dp4 r3.z, c17, r0
mov r0, c9
dp4 r3.x, c17, r1
dp4 r3.y, c17, r0
mad r0.xyz, r3, c18.w, -v0
dp3 r1.w, r0, r0
dp3 r2.w, r2, r2
rsq r0.w, r2.w
mul r1.xyz, r0.w, r2
dp3 r0.w, v1, r1
rsq r1.w, r1.w
mul r1.xyz, r1.w, r0
mul r0.x, -r0.w, c19
dp3 r0.y, v1, r1
mul r1.xyz, v1, c18.w
min r0.x, r0, c22
min r0.y, r0, c22.x
max r0.x, r0, c22.y
dp4 r0.z, v0, c6
dp4 r0.w, v0, c7
max r0.y, r0, c22
add r0.x, -r0, c22
mul oT1.x, r0, r0.y
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT5.w, r0, c15
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c17
mad oT0.xy, v2, c21, c21.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c20
"
}
SubProgram "d3d11 " {
// Stats: 43 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedmndnhbfjpneapgandhbnbdlklgikipenabaaaaaamaaiaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcpeagaaaaeaaaabaalnabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
dicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaa
aiaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaa
adaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaafgaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaagbjbaiaebaaaaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaa
abaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaa
diaaaaaheccabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaiaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaa
aeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaeaaaaaa
egiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 43 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedckbmphdnphffkfhbmdhaocadifepfkdpabaaaaaameamaaaaaeaaaaaa
daaaaaaadaaeaaaacmalaaaapealaaaaebgpgodjpiadaaaapiadaaaaaaacpopp
iiadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaacaaafaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaabaaaiaaaaaaaaaaadaaaaaaaeaaajaaaaaaaaaaadaaamaaajaaanaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaaaaaaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaae
aaaaahiaaaaaoeiabfaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibafaaaakaalaaaaad
aaaaabiaaaaaaaiabgaaaakaakaaaaadaaaaabiaaaaaaaiabgaaffkaacaaaaad
aaaaabiaaaaaaaibbgaaffkaabaaaaacabaaapiaaiaaoekaafaaaaadaaaaaoia
abaaffiabcaajakaaeaaaaaeaaaaaoiabbaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiabdaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiabeaajakaabaappia
aaaaoeiaaeaaaaaeaaaaaoiaaaaaoeiabfaappkaaaaajajbceaaaaacabaaahia
aaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffia
bgaaaakaakaaaaadaaaaaciaaaaaffiabgaaffkaafaaaaadaaaaaeoaaaaaffia
aaaaaaiaaeaaaaaeaaaaadoaadaaoejaagaaoekaagaaookaafaaaaadaaaaahia
acaaoejabfaappkaafaaaaadabaaahiaaaaaffiaaoaaoekaaeaaaaaeaaaaalia
anaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoaapaaoekaaaaakkiaaaaapeia
afaaaaadaaaaahiaaaaaffjaaoaaoekaaeaaaaaeaaaaahiaanaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
baaaoekaaaaappjaaaaaoeiaacaaaaadacaaahoaaaaaoeibaiaaoekaafaaaaad
aaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
aaaappjaaaaaoeiaafaaaaadabaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapia
abaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaadaaoekaaaaakkiaabaaoeia
aeaaaaaeadaaapoaaeaaoekaaaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffja
akaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
alaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaaioaafaaffkappppaaaafdeieefcpeagaaaaeaaaabaalnabaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaakiacaaaaaaaaaaaaiaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaa
acaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaafgaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaagbjbaiaebaaaaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaa
acaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaa
bkiacaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaaeaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
// Stats: 44 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Float 20 [_FresnelFactor]
Float 21 [_EmissionFactor]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[17];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[18];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[20];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
DP4 R0.z, vertex.position, c[7];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R1.xyz, R2, c[19].w, -vertex.position;
DP3 R1.w, R1, R1;
RSQ R0.w, R1.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.y, vertex.normal, R1;
MUL R1.xyz, vertex.normal, c[19].w;
MIN R0.y, R0, c[0].x;
DP4 R0.w, vertex.position, c[8];
MAX R0.y, R0, c[0];
ADD R0.x, -R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[21];
END
# 44 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 46 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Float 19 [_FresnelFactor]
Float 20 [_EmissionFactor]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.w, c22.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r2.xyz, r0, c18.w, -v0
mov r1, c8
mov r0, c10
dp4 r3.z, c17, r0
mov r0, c9
dp4 r3.x, c17, r1
dp4 r3.y, c17, r0
mad r0.xyz, r3, c18.w, -v0
dp3 r1.w, r0, r0
dp3 r2.w, r2, r2
rsq r0.w, r2.w
mul r1.xyz, r0.w, r2
dp3 r0.w, v1, r1
rsq r1.w, r1.w
mul r1.xyz, r1.w, r0
mul r0.x, -r0.w, c19
dp3 r0.y, v1, r1
mul r1.xyz, v1, c18.w
min r0.x, r0, c22
min r0.y, r0, c22.x
max r0.x, r0, c22.y
dp4 r0.z, v0, c6
dp4 r0.w, v0, c7
max r0.y, r0, c22
add r0.x, -r0, c22
mul oT1.x, r0, r0.y
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c17
mad oT0.xy, v2, c21, c21.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c20
"
}
SubProgram "d3d11 " {
// Stats: 43 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedckafealjmgoekigclpggoiddcddnlnhdabaaaaaamaaiaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcpeagaaaaeaaaabaalnabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
dicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaa
aiaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaa
adaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaafgaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaagbjbaiaebaaaaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaa
abaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaa
diaaaaaheccabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaiaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 43 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedmdolahhkmacjfjgkkjbfhgecnkoghlpaabaaaaaameamaaaaaeaaaaaa
daaaaaaadaaeaaaacmalaaaapealaaaaebgpgodjpiadaaaapiadaaaaaaacpopp
iiadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaacaaafaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaabaaaiaaaaaaaaaaadaaaaaaaeaaajaaaaaaaaaaadaaamaaajaaanaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaaaaaaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaae
aaaaahiaaaaaoeiabfaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibafaaaakaalaaaaad
aaaaabiaaaaaaaiabgaaaakaakaaaaadaaaaabiaaaaaaaiabgaaffkaacaaaaad
aaaaabiaaaaaaaibbgaaffkaabaaaaacabaaapiaaiaaoekaafaaaaadaaaaaoia
abaaffiabcaajakaaeaaaaaeaaaaaoiabbaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiabdaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiabeaajakaabaappia
aaaaoeiaaeaaaaaeaaaaaoiaaaaaoeiabfaappkaaaaajajbceaaaaacabaaahia
aaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffia
bgaaaakaakaaaaadaaaaaciaaaaaffiabgaaffkaafaaaaadaaaaaeoaaaaaffia
aaaaaaiaaeaaaaaeaaaaadoaadaaoejaagaaoekaagaaookaafaaaaadaaaaahia
acaaoejabfaappkaafaaaaadabaaahiaaaaaffiaaoaaoekaaeaaaaaeaaaaalia
anaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoaapaaoekaaaaakkiaaaaapeia
afaaaaadaaaaahiaaaaaffjaaoaaoekaaeaaaaaeaaaaahiaanaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
baaaoekaaaaappjaaaaaoeiaacaaaaadacaaahoaaaaaoeibaiaaoekaafaaaaad
aaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
aaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahia
abaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeia
aeaaaaaeadaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffja
akaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
alaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaaioaafaaffkappppaaaafdeieefcpeagaaaaeaaaabaalnabaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaakiacaaaaaaaaaaaaiaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaa
acaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaafgaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaagbjbaiaebaaaaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaa
acaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaagiccabaaaabaaaaaa
bkiacaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
// Stats: 42 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Float 20 [_FresnelFactor]
Float 21 [_EmissionFactor]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[17];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[18];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[20];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP3 R1.x, R2, R2;
RSQ R0.w, R1.x;
MUL R1.xyz, R0.w, R2;
DP3 R0.y, vertex.normal, R1;
MUL R1.xyz, vertex.normal, c[19].w;
MIN R0.y, R0, c[0].x;
MAX R0.y, R0, c[0];
ADD R0.x, -R0, c[0];
MUL result.texcoord[1].x, R0, R0.y;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MOV result.texcoord[4].xyz, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[2].x, c[21];
END
# 42 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 44 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Float 19 [_FresnelFactor]
Float 20 [_EmissionFactor]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c16
mov r1.w, c22.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r2.xyz, r0, c18.w, -v0
dp3 r1.x, r2, r2
mov r0, c10
dp4 r3.z, c17, r0
mov r0, c9
rsq r2.w, r1.x
dp4 r3.y, c17, r0
mul r0.xyz, r2.w, r2
dp3 r0.x, v1, r0
mov r1, c8
dp4 r3.x, c17, r1
dp3 r0.w, r3, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r3
dp3 r0.y, v1, r1
mul r1.xyz, v1, c18.w
mul r0.x, -r0, c19
min r0.x, r0, c22
min r0.y, r0, c22.x
max r0.x, r0, c22.y
max r0.y, r0, c22
add r0.x, -r0, c22
mul oT1.x, r0, r0.y
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mov oT4.xyz, c17
mad oT0.xy, v2, c21, c21.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT2.x, c20
"
}
SubProgram "d3d11 " {
// Stats: 37 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcnkdiefpolineofcmffdkknhadeeomeeabaaaaaapaahaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcceagaaaaeaaaabaaijabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaaddccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
dicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaa
aiaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaa
adaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaafgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaa
aaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaheccabaaaabaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaag
iccabaaaabaaaaaabkiacaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaghccabaaaadaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaa
aaaaaaaadcaaaaakdccabaaaaeaaaaaaegiacaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 37 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Float 128 [_FresnelFactor]
Float 132 [_EmissionFactor]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefieceddmcbilgbpkflphpohmjccklhpeaffknbabaaaaaajaalaaaaaeaaaaaa
daaaaaaammadaaaapiajaaaamaakaaaaebgpgodjjeadaaaajeadaaaaaaacpopp
ceadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaacaaafaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaabaaaiaaaaaaaaaaadaaaaaaaeaaajaaaaaaaaaaadaaamaaajaaanaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaaaaaaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaae
aaaaahiaaaaaoeiabfaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibafaaaakaalaaaaad
aaaaabiaaaaaaaiabgaaaakaakaaaaadaaaaabiaaaaaaaiabgaaffkaacaaaaad
aaaaabiaaaaaaaibbgaaffkaabaaaaacabaaapiaaiaaoekaafaaaaadaaaaaoia
abaaffiabcaajakaaeaaaaaeaaaaaoiabbaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiabdaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiabeaajakaabaappia
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiabgaaaakaakaaaaadaaaaaciaaaaaffiabgaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaagaaoeka
agaaookaafaaaaadaaaaahiaacaaoejabfaappkaafaaaaadabaaahiaaaaaffia
aoaaoekaaeaaaaaeaaaaaliaanaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
apaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaae
aaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaadia
aaaaffiaacaaoekaaeaaaaaeaaaaadiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaadiaadaaoekaaaaakkiaaaaaoeiaaeaaaaaeadaaadoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapiaajaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaamaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaaioaafaaffkaabaaaaac
acaaahoaaiaaoekappppaaaafdeieefcceagaaaaeaaaabaaijabaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
eccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
akiacaaaaaaaaaaaaiaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
fgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaa
jgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaa
bacaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaah
eccabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaiaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaadaaaaaaegiccaaaacaaaaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
dcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaa
abaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaabaaaaaaaaaaadcaaaaakdccabaaaaeaaaaaaegiacaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 14 math, 2 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[4];
MUL R0.xyz, R0, c[1];
DP3 R1.x, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[2];
MOV result.color.w, c[2].x;
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 14 math, 2 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r1, t0, s0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
mul_pp r1.xyz, r1, c1
mul_pp r1.xyz, r1, c0
mov_pp r0.w, c2.x
texld r2, r0, s1
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, t3, r0
max_pp r0.x, r0, c2
mul_pp r0.x, r0, r2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 10 math, 2 textures
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedephoophoedhkjjcjgojmjjbdjkoccbgkabaaaaaaeeadaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaaaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcamacaaaaeaaaaaaaidaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaa
aaaaaaaaagaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaa
abaaaaaaagijcaaaaaaaaaaaahaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 10 math, 2 textures
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhhldplclkjjmnncdnijdnhbbeojdjjobabaaaaaanaaeaaaaaeaaaaaa
daaaaaaaliabaaaammadaaaajmaeaaaaebgpgodjiaabaaaaiaabaaaaaaacpppp
dmabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
aiaaaaadaaaaaiiaadaaoelaadaaoelaabaaaaacaaaaadiaaaaappiaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaaaaaoelaabaioekaceaaaaac
acaachiaacaaoelaaiaaaaadabaaciiaabaaoelaacaaoeiaafaaaaadaaaacbia
aaaaaaiaabaappiafiaaaaaeabaaciiaabaappiaaaaaaaiaacaaaakaacaaaaad
abaaciiaabaappiaabaappiaafaaaaadaaaachiaabaaoeiaabaaoekaafaaaaad
aaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaabaappiaaaaaoeiaabaaaaac
aaaaaiiaacaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcamacaaaa
eaaaaaaaidaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaa
aaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaiocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaaahaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaaaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 9 math, 1 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, fragment.texcoord[4];
MUL R0.xyz, R0, c[1];
DP3 R0.w, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[0];
MAX R0.w, R0, c[2].x;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
MOV result.color.w, c[2].x;
END
# 9 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 9 math, 1 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
texld r1, t0, s0
mov_pp r0.xyz, t4
dp3_pp r0.x, t3, r0
mul_pp r1.xyz, r1, c1
mul_pp r1.xyz, r1, c0
max_pp r0.x, r0, c2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.y
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 6 math, 1 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgddapokjabibkhkldpnfbphifamjjmmeabaaaaaahiacaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfiabaaaa
eaaaaaaafgaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
acaaaaaaegbcbaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 6 math, 1 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbpomlbpknoiplgghblcgiopnpkjklpnlabaaaaaakiadaaaaaeaaaaaa
daaaaaaafmabaaaalmacaaaaheadaaaaebgpgodjceabaaaaceabaaaaaaacpppp
oeaaaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaaaaacppppfbaaaaaf
acaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaja
aaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioekaafaaaaadaaaachiaaaaaoeia
abaaoekaafaaaaadaaaachiaaaaaoeiaaaaaoekaabaaaaacabaaahiaabaaoela
aiaaaaadaaaaciiaabaaoeiaacaaoelaalaaaaadabaacbiaaaaappiaacaaaaka
acaaaaadaaaaciiaabaaaaiaabaaaaiaafaaaaadaaaachiaaaaappiaaaaaoeia
abaaaaacaaaaaiiaacaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
fiabaaaaeaaaaaaafgaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaad
aagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaacaaaaaaegbcbaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaaaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaiaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 20 math, 3 textures
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
RCP R0.x, fragment.texcoord[5].w;
MAD R1.xy, fragment.texcoord[5], R0.x, c[2].y;
DP3 R1.z, fragment.texcoord[5], fragment.texcoord[5];
MOV result.color.w, c[2].x;
TEX R0.w, R1, texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, R1.z, texture[2], 2D;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[3], R1;
SLT R1.y, c[2].x, fragment.texcoord[5].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R0, c[1];
MAX R0.w, R1.x, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].z;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 19 math, 3 textures
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c2, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5
texld r2, t0, s0
dp3 r0.x, t5, t5
rcp r1.x, t5.w
mov r0.xy, r0.x
mad r1.xy, t5, r1.x, c2.x
mul_pp r2.xyz, r2, c1
mul_pp r2.xyz, r2, c0
texld r0, r0, s2
texld r1, r1, s1
cmp r1.x, -t5.z, c2.y, c2.z
mul_pp r3.x, r1, r1.w
dp3_pp r1.x, t4, t4
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t4
dp3_pp r1.x, t3, r1
mul_pp r0.x, r3, r0
max_pp r1.x, r1, c2.y
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c2.w
mov_pp r0.w, c2.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 16 math, 3 textures
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedoilefmhkeihiblhokcgllmicpokifikiabaaaaaadiaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaaaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaaadaaaaeaaaaaaamaaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaaeaaaaaapgbpbaaa
aeaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaaeaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
abaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
baaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagbjbaaaadaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaa
jgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaa
ahaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 16 math, 3 textures
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedndohgleibfkjlgpglhmmmcagckeajcjeabaaaaaaceagaaaaaeaaaaaa
daaaaaaabiacaaaacaafaaaapaafaaaaebgpgodjoaabaaaaoaabaaaaaaacpppp
jiabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaabaaaaaa
acababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaadaapplaaeaaaaae
aaaaadiaadaaoelaaaaappiaacaaaakaaiaaaaadabaaaiiaadaaoelaadaaoela
abaaaaacabaaadiaabaappiaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaabaaoeiaabaioekaecaaaaadacaacpiaaaaaoelaacaioekaafaaaaad
acaaciiaaaaappiaabaaaaiafiaaaaaeacaaciiaadaakklbacaaffkaacaappia
ceaaaaacaaaachiaacaaoelaaiaaaaadaaaacbiaabaaoelaaaaaoeiaalaaaaad
abaacbiaaaaaaaiaacaaffkaafaaaaadacaaciiaacaappiaabaaaaiaacaaaaad
acaaciiaacaappiaacaappiaafaaaaadaaaachiaacaaoeiaabaaoekaafaaaaad
aaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaacaappiaaaaaoeiaabaaaaac
aaaaaiiaacaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcaaadaaaa
eaaaaaaamaaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaa
aaaaaaaaabeaaaaaaaaaaaaackbabaaaaeaaaaaaabaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagbjbaaaadaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaacaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaa
agaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaa
agijcaaaaaaaaaaaahaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaiaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
// Stats: 16 math, 3 textures
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[5], texture[2], CUBE;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[4];
MUL R0.xyz, R0, c[1];
DP3 R1.x, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[2].x;
TEX R0.w, R0.w, texture[1], 2D;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[2].x;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 15 math, 3 textures
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r2, t5, s2
texld r1, t0, s0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
dp3_pp r2.x, t4, t4
rsq_pp r2.x, r2.x
mul_pp r2.xyz, r2.x, t4
mul_pp r1.xyz, r1, c1
dp3_pp r2.x, t3, r2
mul_pp r1.xyz, r1, c0
max_pp r2.x, r2, c2
texld r0, r0, s1
mul r0.x, r0, r2.w
mul_pp r0.x, r2, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.y
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 11 math, 3 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmmfjhgcgkaimlnolhlcggcgfkbkcibhhabaaaaaakaadaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaaaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgiacaaaaeaaaaaaajkaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaaeaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaa
abaaaaaadkaabaaaacaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaa
fgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaa
agijcaaaaaaaaaaaahaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 11 math, 3 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddpbggagdbeghddnlfilokakbdgpppjihabaaaaaafiafaaaaaeaaaaaa
daaaaaaaoeabaaaafeaeaaaaceafaaaaebgpgodjkmabaaaakmabaaaaaaacpppp
geabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaaiaaaaadaaaaaiiaadaaoelaadaaoela
abaaaaacaaaaadiaaaaappiaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaad
abaaapiaadaaoelaaaaioekaecaaaaadacaacpiaaaaaoelaacaioekaafaaaaad
acaaciiaaaaaaaiaabaappiaceaaaaacaaaachiaacaaoelaaiaaaaadaaaacbia
abaaoelaaaaaoeiaalaaaaadabaacbiaaaaaaaiaacaaaakaafaaaaadacaaciia
acaappiaabaaaaiaacaaaaadacaaciiaacaappiaacaappiaafaaaaadaaaachia
acaaoeiaabaaoekaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachia
acaappiaaaaaoeiaabaaaaacaaaaaiiaacaaaakaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcgiacaaaaeaaaaaaajkaaaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbcbaaaaeaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaa
apaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaaahaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaeaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 11 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.w, fragment.texcoord[5], texture[1], 2D;
MOV R1.xyz, fragment.texcoord[4];
MUL R0.xyz, R0, c[1];
DP3 R1.x, fragment.texcoord[3], R1;
MAX R1.x, R1, c[2];
MUL R0.xyz, R0, c[0];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
MOV result.color.w, c[2].x;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xy
texld r0, t5, s1
texld r1, t0, s0
mov_pp r0.xyz, t4
dp3_pp r0.x, t3, r0
mul_pp r1.xyz, r1, c1
max_pp r0.x, r0, c2
mul_pp r0.x, r0, r0.w
mul_pp r1.xyz, r1, c0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.y
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 6 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpibdaodcikmdcmbijcdidfegedhkkegoabaaaaaanmacaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaaaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckeabaaaaeaaaaaaagjaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaaddcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaa
egbcbaaaadaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaaeaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaapgapbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaaa
aaaaaaaaahaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 6 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedldeeeghflghcobkicnefiedifppabommabaaaaaaemaeaaaaaeaaaaaa
daaaaaaajmabaaaaeiadaaaabiaeaaaaebgpgodjgeabaaaageabaaaaaaacpppp
caabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
ecaaaaadaaaacpiaadaaoelaaaaioekaecaaaaadabaacpiaaaaaoelaabaioeka
abaaaaacaaaaahiaabaaoelaaiaaaaadabaaciiaaaaaoeiaacaaoelaafaaaaad
aaaacbiaaaaappiaabaappiafiaaaaaeabaaciiaabaappiaaaaaaaiaacaaaaka
acaaaaadabaaciiaabaappiaabaappiaafaaaaadaaaachiaabaaoeiaabaaoeka
afaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaabaappiaaaaaoeia
abaaaaacaaaaaiiaacaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
keabaaaaeaaaaaaagjaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaaddcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaacaaaaaaegbcbaaaadaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
aeaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaa
agaabaaaaaaaaaaapgapbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaa
agajbaaaabaaaaaaagijcaaaaaaaaaaaahaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaaaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaaaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 29 math
 //    d3d11_9x : 29 math
 //        d3d9 : 37 math
 //      opengl : 35 math
 // Stats for Fragment shader:
 //       d3d11 : 1 math
 //    d3d11_9x : 1 math
 //        d3d9 : 3 math
 //      opengl : 2 math
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Transparent" "RenderType"="Diffuse" }
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
// Stats: 35 math
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Float 16 [_FresnelFactor]
Float 17 [_EmissionFactor]
"!!ARBvp1.0
PARAM c[18] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MOV R1, c[14];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[16];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R1.xyz, -vertex.position, c[14].w, R2;
DP3 R0.w, R1, R1;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R1;
DP3 R0.y, vertex.normal, R1;
MUL R1.xyz, vertex.normal, c[15].w;
MIN R0.y, R0, c[0].x;
ADD R0.x, -R0, c[0];
MAX R0.y, R0, c[0];
MUL result.texcoord[0].x, R0, R0.y;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, c[17];
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 37 math
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Float 15 [_FresnelFactor]
Float 16 [_EmissionFactor]
"vs_2_0
def c17, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.xyz, c12
mov r1.w, c17.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r2.xyz, r0, c14.w, -v0
dp3 r1.x, r2, r2
mov r0, c10
rsq r2.w, r1.x
mov r1, c8
dp4 r3.x, c13, r1
dp4 r3.z, c13, r0
mov r0, c9
dp4 r3.y, c13, r0
mad r0.xyz, -v0, c13.w, r3
mul r1.xyz, r2.w, r2
dp3 r0.w, v1, r1
dp3 r1.w, r0, r0
rsq r1.x, r1.w
mul r1.xyz, r1.x, r0
dp3 r0.y, v1, r1
mul r1.xyz, v1, c14.w
mul r0.w, -r0, c15.x
min r0.x, r0.w, c17
max r0.x, r0, c17.y
min r0.y, r0, c17.x
add r0.x, -r0, c17
max r0.y, r0, c17
mul oT0.x, r0, r0.y
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, c16
"
}
SubProgram "d3d11 " {
// Stats: 29 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 80
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedpjcejnnecjagchiobdcfajgjmjenbdklabaaaaaadaagaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
kmaeaaaaeaaaabaaclabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaa
gfaaaaadcccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
akiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
fgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaa
agbjbaiaebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
baaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaa
jgahbaaaaaaaaaaadiaaaaahbccabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadgaaaaagcccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 29 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 80
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefieceddjafmjpnlniepcdheokjimgkiikfohpbabaaaaaacaajaaaaaeaaaaaa
daaaaaaabmadaaaanaahaaaajiaiaaaaebgpgodjoeacaaaaoeacaaaaaaacpopp
heacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaamaaadaaaiaaaaaaaaaaadaabaaaafaaalaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbaaaapkaaaaaaaaaaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaalia
alaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaanaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaaeaaaaahiaaaaaoeiaapaappka
aaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeia
afaaaaadaaaaabiaaaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiabaaaaaka
akaaaaadaaaaabiaaaaaaaiabaaaffkaacaaaaadaaaaabiaaaaaaaibbaaaffka
abaaaaacabaaapiaadaaoekaafaaaaadaaaaaoiaabaaffiaamaajakaaeaaaaae
aaaaaoiaalaajakaabaaaaiaaaaaoeiaaeaaaaaeaaaaaoiaanaajakaabaakkia
aaaaoeiaaeaaaaaeaaaaaoiaaoaajakaabaappiaaaaaoeiaaeaaaaaeaaaaaoia
aaaajajaadaappkbaaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaacia
acaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffiabaaaaakaakaaaaadaaaaacia
aaaaffiabaaaffkaafaaaaadaaaaaboaaaaaffiaaaaaaaiaafaaaaadaaaaahia
acaaoejaapaappkaafaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaalia
aiaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoaakaaoekaaaaakkiaaaaapeia
afaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
ahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaaaaacoaabaaffkappppaaaafdeieefc
kmaeaaaaeaaaabaaclabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaa
gfaaaaadcccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadicaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
akiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
fgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaaaaaaaaaa
agbjbaiaebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaaaaaaaaa
baaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaaegbcbaaaacaaaaaa
jgahbaaaaaaaaaaadiaaaaahbccabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadgaaaaagcccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacanaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 2 math
"!!ARBfp1.0
PARAM c[1] = { { 0, 0.5 } };
MAD result.color.xyz, fragment.texcoord[2], c[0].y, c[0].y;
MOV result.color.w, c[0].x;
END
# 2 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 3 math
"ps_2_0
def c0, 0.50000000, 0.00000000, 0, 0
dcl t2.xyz
mad_pp r0.xyz, t2, c0.x, c0.x
mov_pp r0.w, c0.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 1 math
"ps_4_0
eefiecedleinfhodomnncpcjikigkippoenkdlcoabaaaaaageabaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaabaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcheaaaaaaeaaaaaaabnaaaaaagcbaaaadhcbabaaa
acaaaaaagfaaaaadpccabaaaaaaaaaaadcaaaaaphccabaaaaaaaaaaaegbcbaaa
acaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 1 math
"ps_4_0_level_9_1
eefiecediikdaaekmdallcdcmkchjjopiiigcjpbabaaaaaaomabaaaaaeaaaaaa
daaaaaaaleaaaaaadaabaaaaliabaaaaebgpgodjhmaaaaaahmaaaaaaaaacpppp
fiaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
abaachlaaeaaaaaeaaaachiaabaaoelaaaaaaakaaaaaaakaabaaaaacaaaaciia
aaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcheaaaaaaeaaaaaaa
bnaaaaaagcbaaaadhcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaadcaaaaap
hccabaaaaaaaaaaaegbcbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaabaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaacaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 38 avg math (30..44)
 //    d3d11_9x : 38 avg math (30..44)
 //        d3d9 : 48 avg math (40..57)
 //      opengl : 46 avg math (38..55)
 // Stats for Fragment shader:
 //       d3d11 : 10 avg math (7..16), 3 avg texture (2..4)
 //    d3d11_9x : 10 avg math (7..16), 3 avg texture (2..4)
 //        d3d9 : 12 avg math (8..20), 3 avg texture (2..4)
 //      opengl : 14 avg math (9..23), 3 avg texture (2..4)
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Transparent" "RenderType"="Diffuse" }
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
// Stats: 55 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Float 24 [_FresnelFactor]
Float 25 [_EmissionFactor]
Vector 26 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[27] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..26] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[23].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
ADD R1.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[22];
ADD result.texcoord[4].xyz, R1, R2;
MOV R1, c[15];
MOV R0.w, c[0].x;
MOV R0.xyz, c[13];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[23].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[24];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R1.xyz, -vertex.position, c[15].w, R2;
DP3 R0.w, R1, R1;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R1;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MOV result.texcoord[2].x, c[25];
END
# 55 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 57 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Float 24 [_FresnelFactor]
Float 25 [_EmissionFactor]
Vector 26 [_MainTex_ST]
"vs_2_0
def c27, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c23.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
mov r0.y, r2.w
dp3 r0.z, r1, c6
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.x
dp4 r2.z, r0, c18
dp4 r2.y, r0, c17
dp4 r2.x, r0, c16
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c21
dp4 r3.y, r1, c20
dp4 r3.x, r1, c19
mad r0.w, r0.x, r0.x, -r0.y
add r0.xyz, r2, r3
mul r1.xyz, r0.w, c22
add oT4.xyz, r0, r1
mov r2.w, c27.x
mov r2.xyz, c12
dp4 r3.z, r2, c10
dp4 r3.x, r2, c8
dp4 r3.y, r2, c9
mad r2.xyz, r3, c23.w, -v0
dp3 r1.x, r2, r2
mov r0, c10
rsq r2.w, r1.x
mov r1, c8
dp4 r3.x, c15, r1
dp4 r3.z, c15, r0
mov r0, c9
dp4 r3.y, c15, r0
mad r0.xyz, -v0, c15.w, r3
mul r1.xyz, r2.w, r2
dp3 r0.w, v1, r1
dp3 r1.w, r0, r0
rsq r1.x, r1.w
mul r1.xyz, r1.x, r0
mul r0.w, -r0, c24.x
min r0.x, r0.w, c27
dp3 r0.y, v1, r1
max r0.x, r0, c27.y
add r0.z, -r0.x, c27.x
min r0.y, r0, c27.x
max r1.w, r0.y, c27.y
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c27.z
mul r1.y, r1, c13.x
mad oT3.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mad oT0.xy, v2, c26, c26.zwzw
mov oT2.x, c25
"
}
SubProgram "d3d11 " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedfcmcnolfnmoiknjacjpenmkahcfbgdjlabaaaaaaleaiaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcaaahaaaaeaaaabaamaabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
eccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaa
abaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaa
egbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
acaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaa
egakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedlbbmplokpdmehnhoojhladmlbbiiomgcabaaaaaaoaamaaaaaeaaaaaa
daaaaaaafiaeaaaagaalaaaaciamaaaaebgpgodjcaaeaaaacaaeaaaaaaacpopp
keadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaa
acaacgaaahaaagaaaaaaaaaaadaaaaaaaeaaanaaaaaaaaaaadaaamaaadaabbaa
aaaaaaaaadaabaaaafaabeaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapka
aaaaaaaaaaaaiadpaaaaaadpaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaabaaaaacaaaaahiaadaaoeka
afaaaaadabaaahiaaaaaffiabfaaoekaaeaaaaaeaaaaaliabeaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabhaaoekaaeaaaaaeaaaaahiaaaaaoeiabiaappkaaaaaoejbceaaaaac
abaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabia
aaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiabjaaaakaakaaaaadaaaaabia
aaaaaaiabjaaffkaacaaaaadaaaaabiaaaaaaaibbjaaffkaabaaaaacabaaapia
afaaoekaafaaaaadaaaaaoiaabaaffiabfaajakaaeaaaaaeaaaaaoiabeaajaka
abaaaaiaaaaaoeiaaeaaaaaeaaaaaoiabgaajakaabaakkiaaaaaoeiaaeaaaaae
aaaaaoiabhaajakaabaappiaaaaaoeiaaeaaaaaeaaaaaoiaaaaajajaafaappkb
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiabjaaaakaakaaaaadaaaaaciaaaaaffiabjaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaaeaaaaka
afaaaaadabaaaiiaabaaaaiabjaakkkaafaaaaadabaaafiaaaaapeiabjaakkka
acaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoejabiaappka
afaaaaadacaaahiaabaaffiabcaaoekaaeaaaaaeabaaaliabbaakekaabaaaaia
acaakeiaaeaaaaaeabaaahiabdaaoekaabaakkiaabaapeiaabaaaaacabaaaiia
bjaaffkaajaaaaadacaaabiaagaaoekaabaaoeiaajaaaaadacaaaciaahaaoeka
abaaoeiaajaaaaadacaaaeiaaiaaoekaabaaoeiaafaaaaadadaaapiaabaacjia
abaakeiaajaaaaadaeaaabiaajaaoekaadaaoeiaajaaaaadaeaaaciaakaaoeka
adaaoeiaajaaaaadaeaaaeiaalaaoekaadaaoeiaacaaaaadacaaahiaacaaoeia
aeaaoeiaafaaaaadabaaaciaabaaffiaabaaffiaaeaaaaaeabaaabiaabaaaaia
abaaaaiaabaaffibaeaaaaaeacaaahoaamaaoekaabaaaaiaacaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
abaaamoaaaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaafdeieefcaaahaaaa
eaaaabaamaabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaaj
bcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaa
pgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaa
jgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaa
acaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaa
bacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaah
eccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
acaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 47 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_ShadowFadeCenterAndType]
Vector 21 [unity_Scale]
Float 22 [_FresnelFactor]
Float 23 [_EmissionFactor]
Vector 24 [unity_LightmapST]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1, 0, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..25] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[17];
DP4 R0.z, R1, c[15];
DP4 R0.x, R1, c[13];
DP4 R0.y, R1, c[14];
MOV R1, c[19];
MAD R0.xyz, R0, c[21].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[22];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
DP4 R0.x, vertex.position, c[5];
DP4 R2.z, R1, c[15];
DP4 R2.x, R1, c[13];
DP4 R2.y, R1, c[14];
MAD R1.xyz, -vertex.position, c[19].w, R2;
DP3 R0.w, R1, R1;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R1;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.y, vertex.position, c[6];
DP4 R0.z, vertex.position, c[7];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[18].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[20].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[20];
MOV result.texcoord[3].zw, R0;
MUL result.texcoord[5].xyz, R1, c[20].w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[24], c[24].zwzw;
MUL result.texcoord[5].w, -R0.x, R0.y;
MOV result.texcoord[2].x, c[23];
END
# 47 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 49 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_ShadowFadeCenterAndType]
Vector 21 [unity_Scale]
Float 22 [_FresnelFactor]
Float 23 [_EmissionFactor]
Vector 24 [unity_LightmapST]
Vector 25 [_MainTex_ST]
"vs_2_0
def c26, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c16
mov r1.w, c26.x
dp4 r0.z, r1, c14
dp4 r0.x, r1, c12
dp4 r0.y, r1, c13
mad r2.xyz, r0, c21.w, -v0
dp3 r1.x, r2, r2
mov r0, c14
rsq r2.w, r1.x
mov r1, c12
dp4 r3.x, c19, r1
dp4 r3.z, c19, r0
mov r0, c13
dp4 r3.y, c19, r0
mad r0.xyz, -v0, c19.w, r3
mul r1.xyz, r2.w, r2
dp3 r0.w, v1, r1
dp3 r1.w, r0, r0
rsq r1.x, r1.w
mul r1.xyz, r1.x, r0
mul r0.w, -r0, c22.x
min r0.x, r0.w, c26
dp3 r0.y, v1, r1
max r0.x, r0, c26.y
add r0.z, -r0.x, c26.x
min r0.y, r0, c26.x
max r1.w, r0.y, c26.y
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c26.z
mul r1.y, r1, c17.x
mad oT3.xy, r1.z, c18.zwzw, r1
mov oPos, r0
mov r0.x, c20.w
add r0.y, c26.x, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c20
mov oT3.zw, r0
mul oT5.xyz, r1, c20.w
mad oT0.xy, v2, c25, c25.zwzw
mad oT4.xy, v3, c24, c24.zwzw
mul oT5.w, -r0.x, r0.y
mov oT2.x, c23
"
}
SubProgram "d3d11 " {
// Stats: 42 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
BindCB  "UnityPerDraw" 4
"vs_4_0
eefiecedaeadfpkphkgphenebcijdbkddhickgkaabaaaaaanaaiaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcaeahaaaaeaaaabaambabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabkaaaaaafjaaaaaeegiocaaaaeaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaeaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaeaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaeaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaeaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaaeaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaaeaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
aeaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaaeaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaagijcaaaaeaaaaaabbaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaaeaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaaeaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
aeaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaa
abaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaa
egbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
acaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaaeaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaeaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaeaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaeaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaa
aaaaaaaackiacaaaaeaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
aeaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaaeaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaaeaaaaaaahaaaaaadkbabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaadaaaaaa
bjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 42 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
BindCB  "UnityPerDraw" 4
"vs_4_0_level_9_1
eefiecedekcfihhcpikmnocnhjmfmibomhnjohcmabaaaaaaoiamaaaaaeaaaaaa
daaaaaaaeeaeaaaafaalaaaabiamaaaaebgpgodjamaeaaaaamaeaaaaaaacpopp
jmadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
adaaabaaaaaaaaaaabaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaabjaaabaaahaaaaaaaaaaaeaaaaaaaiaaaiaaaaaaaaaaaeaaamaaajaabaaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapkaaaaaaaaaaaaaiadpaaaaaadp
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaahiaaeaaoeka
afaaaaadabaaahiaaaaaffiabfaaoekaaeaaaaaeaaaaaliabeaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabhaaoekaaeaaaaaeaaaaahiaaaaaoeiabiaappkaaaaaoejbceaaaaac
abaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabia
aaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiabjaaaakaakaaaaadaaaaabia
aaaaaaiabjaaffkaacaaaaadaaaaabiaaaaaaaibbjaaffkaabaaaaacabaaapia
agaaoekaafaaaaadaaaaaoiaabaaffiabfaajakaaeaaaaaeaaaaaoiabeaajaka
abaaaaiaaaaaoeiaaeaaaaaeaaaaaoiabgaajakaabaakkiaaaaaoeiaaeaaaaae
aaaaaoiabhaajakaabaappiaaaaaoeiaaeaaaaaeaaaaaoiaaaaajajaagaappkb
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiabjaaaakaakaaaaadaaaaaciaaaaaffiabjaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaafaaaaka
afaaaaadabaaaiiaabaaaaiabjaakkkaafaaaaadabaaafiaaaaapeiabjaakkka
acaaaaadabaaadoaabaakkiaabaaomiaaeaaaaaeacaaadoaaeaaoejaacaaoeka
acaaookaafaaaaadabaaahiaaaaaffjabbaaoekaaeaaaaaeabaaahiabaaaoeka
aaaaaajaabaaoeiaaeaaaaaeabaaahiabcaaoekaaaaakkjaabaaoeiaaeaaaaae
abaaahiabdaaoekaaaaappjaabaaoeiaacaaaaadabaaahiaabaaoeiaahaaoekb
afaaaaadadaaahoaabaaoeiaahaappkaafaaaaadabaaabiaaaaaffjaanaakkka
aeaaaaaeabaaabiaamaakkkaaaaaaajaabaaaaiaaeaaaaaeabaaabiaaoaakkka
aaaakkjaabaaaaiaaeaaaaaeabaaabiaapaakkkaaaaappjaabaaaaiaabaaaaac
abaaaciabjaaffkaacaaaaadabaaaciaabaaffiaahaappkbafaaaaadadaaaioa
abaaffiaabaaaaibaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeiaabaaaaacaaaaaioaabaaffka
ppppaaaafdeieefcaeahaaaaeaaaabaambabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabkaaaaaafjaaaaaeegiocaaaaeaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaeaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaeaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaeaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaeaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaaeaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaaeaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
aeaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaaeaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaagijcaaaaeaaaaaabbaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaaeaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaaeaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
aeaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaa
abaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaa
egbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
acaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaaeaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaeaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaeaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaeaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaa
aaaaaaaackiacaaaaeaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
aeaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaaeaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaaeaaaaaaahaaaaaadkbabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaadaaaaaa
bjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 38 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [_WorldSpaceLightPos0]
Vector 12 [unity_Scale]
Float 13 [_FresnelFactor]
Float 14 [_EmissionFactor]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[17] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[9];
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
MOV R1, c[11];
MAD R0.xyz, R0, c[12].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[13];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
MAD R1.xyz, -vertex.position, c[11].w, R2;
DP3 R0.w, R1, R1;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R1;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[10].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MOV result.texcoord[2].x, c[14];
END
# 38 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [_WorldSpaceLightPos0]
Vector 12 [unity_Scale]
Float 13 [_FresnelFactor]
Float 14 [_EmissionFactor]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"vs_2_0
def c17, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c8
mov r1.w, c17.x
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
mad r2.xyz, r0, c12.w, -v0
dp3 r1.x, r2, r2
mov r0, c6
rsq r2.w, r1.x
mov r1, c4
dp4 r3.x, c11, r1
dp4 r3.z, c11, r0
mov r0, c5
dp4 r3.y, c11, r0
mad r0.xyz, -v0, c11.w, r3
mul r1.xyz, r2.w, r2
dp3 r0.w, v1, r1
dp3 r1.w, r0, r0
rsq r1.x, r1.w
mul r1.xyz, r1.x, r0
mul r0.w, -r0, c13.x
min r0.x, r0.w, c17
dp3 r0.y, v1, r1
max r0.x, r0, c17.y
add r0.z, -r0.x, c17.x
min r0.y, r0, c17.x
max r1.w, r0.y, c17.y
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.z
mul r1.y, r1, c9.x
mad oT3.xy, r1.z, c10.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mad oT0.xy, v2, c16, c16.zwzw
mad oT4.xy, v3, c15, c15.zwzw
mov oT2.x, c14
"
}
SubProgram "d3d11 " {
// Stats: 30 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefieceddhfdohfekiehelccdojldlpoadcpmldpabaaaaaaoeagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcdaafaaaaeaaaabaaemabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagiaaaaacadaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaaj
bcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaa
pgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaa
jgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaa
acaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaa
bacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaah
eccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
acaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 30 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedfpilhigmfcnkljpllceemjdliaolloecabaaaaaaamakaaaaaeaaaaaa
daaaaaaafeadaaaaimaiaaaafeajaaaaebgpgodjbmadaaaabmadaaaaaaacpopp
liacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
adaaabaaaaaaaaaaabaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaabaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaaaaaaaaaiadpaaaaaadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaahiaaeaaoekaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
anaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaae
aaaaahiaaaaaoeiaapaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibabaaaakaalaaaaad
aaaaabiaaaaaaaiabaaaaakaakaaaaadaaaaabiaaaaaaaiabaaaffkaacaaaaad
aaaaabiaaaaaaaibbaaaffkaabaaaaacabaaapiaagaaoekaafaaaaadaaaaaoia
abaaffiaamaajakaaeaaaaaeaaaaaoiaalaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiaanaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiaaoaajakaabaappia
aaaaoeiaaeaaaaaeaaaaaoiaaaaajajaagaappkbaaaaoeiaceaaaaacabaaahia
aaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffia
baaaaakaakaaaaadaaaaaciaaaaaffiabaaaffkaafaaaaadaaaaaeoaaaaaffia
aaaaaaiaaeaaaaaeaaaaadoaadaaoejaadaaoekaadaaookaafaaaaadaaaaapia
aaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaafaaaakaafaaaaadabaaaiiaabaaaaia
baaakkkaafaaaaadabaaafiaaaaapeiabaaakkkaacaaaaadabaaadoaabaakkia
abaaomiaaeaaaaaeacaaadoaaeaaoejaacaaoekaacaaookaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoa
aaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaafdeieefcdaafaaaaeaaaabaa
emabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadicaaaajbcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaa
aaaaaaaaaeaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaa
agijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagbjbaia
ebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaabaaaaaah
bcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaa
acaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaa
agaabaaaacaaaaaabacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaajgahbaaa
abaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaa
aeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaal
dccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 55 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Float 24 [_FresnelFactor]
Float 25 [_EmissionFactor]
Vector 26 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[27] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..26] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[23].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
ADD R1.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[22];
ADD result.texcoord[4].xyz, R1, R2;
MOV R1, c[15];
MOV R0.w, c[0].x;
MOV R0.xyz, c[13];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[23].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[24];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R1.xyz, -vertex.position, c[15].w, R2;
DP3 R0.w, R1, R1;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R1;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MOV result.texcoord[2].x, c[25];
END
# 55 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 57 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Float 24 [_FresnelFactor]
Float 25 [_EmissionFactor]
Vector 26 [_MainTex_ST]
"vs_2_0
def c27, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c23.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
mov r0.y, r2.w
dp3 r0.z, r1, c6
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.x
dp4 r2.z, r0, c18
dp4 r2.y, r0, c17
dp4 r2.x, r0, c16
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c21
dp4 r3.y, r1, c20
dp4 r3.x, r1, c19
mad r0.w, r0.x, r0.x, -r0.y
add r0.xyz, r2, r3
mul r1.xyz, r0.w, c22
add oT4.xyz, r0, r1
mov r2.w, c27.x
mov r2.xyz, c12
dp4 r3.z, r2, c10
dp4 r3.x, r2, c8
dp4 r3.y, r2, c9
mad r2.xyz, r3, c23.w, -v0
dp3 r1.x, r2, r2
mov r0, c10
rsq r2.w, r1.x
mov r1, c8
dp4 r3.x, c15, r1
dp4 r3.z, c15, r0
mov r0, c9
dp4 r3.y, c15, r0
mad r0.xyz, -v0, c15.w, r3
mul r1.xyz, r2.w, r2
dp3 r0.w, v1, r1
dp3 r1.w, r0, r0
rsq r1.x, r1.w
mul r1.xyz, r1.x, r0
mul r0.w, -r0, c24.x
min r0.x, r0.w, c27
dp3 r0.y, v1, r1
max r0.x, r0, c27.y
add r0.z, -r0.x, c27.x
min r0.y, r0, c27.x
max r1.w, r0.y, c27.y
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c27.z
mul r1.y, r1, c13.x
mad oT3.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mad oT0.xy, v2, c26, c26.zwzw
mov oT2.x, c25
"
}
SubProgram "d3d11 " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedfcmcnolfnmoiknjacjpenmkahcfbgdjlabaaaaaaleaiaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcaaahaaaaeaaaabaamaabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
eccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaa
abaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaa
egbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
acaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaa
egakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedlbbmplokpdmehnhoojhladmlbbiiomgcabaaaaaaoaamaaaaaeaaaaaa
daaaaaaafiaeaaaagaalaaaaciamaaaaebgpgodjcaaeaaaacaaeaaaaaaacpopp
keadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaa
acaacgaaahaaagaaaaaaaaaaadaaaaaaaeaaanaaaaaaaaaaadaaamaaadaabbaa
aaaaaaaaadaabaaaafaabeaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapka
aaaaaaaaaaaaiadpaaaaaadpaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaabaaaaacaaaaahiaadaaoeka
afaaaaadabaaahiaaaaaffiabfaaoekaaeaaaaaeaaaaaliabeaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabhaaoekaaeaaaaaeaaaaahiaaaaaoeiabiaappkaaaaaoejbceaaaaac
abaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabia
aaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiabjaaaakaakaaaaadaaaaabia
aaaaaaiabjaaffkaacaaaaadaaaaabiaaaaaaaibbjaaffkaabaaaaacabaaapia
afaaoekaafaaaaadaaaaaoiaabaaffiabfaajakaaeaaaaaeaaaaaoiabeaajaka
abaaaaiaaaaaoeiaaeaaaaaeaaaaaoiabgaajakaabaakkiaaaaaoeiaaeaaaaae
aaaaaoiabhaajakaabaappiaaaaaoeiaaeaaaaaeaaaaaoiaaaaajajaafaappkb
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiabjaaaakaakaaaaadaaaaaciaaaaaffiabjaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaaeaaaaka
afaaaaadabaaaiiaabaaaaiabjaakkkaafaaaaadabaaafiaaaaapeiabjaakkka
acaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoejabiaappka
afaaaaadacaaahiaabaaffiabcaaoekaaeaaaaaeabaaaliabbaakekaabaaaaia
acaakeiaaeaaaaaeabaaahiabdaaoekaabaakkiaabaapeiaabaaaaacabaaaiia
bjaaffkaajaaaaadacaaabiaagaaoekaabaaoeiaajaaaaadacaaaciaahaaoeka
abaaoeiaajaaaaadacaaaeiaaiaaoekaabaaoeiaafaaaaadadaaapiaabaacjia
abaakeiaajaaaaadaeaaabiaajaaoekaadaaoeiaajaaaaadaeaaaciaakaaoeka
adaaoeiaajaaaaadaeaaaeiaalaaoekaadaaoeiaacaaaaadacaaahiaacaaoeia
aeaaoeiaafaaaaadabaaaciaabaaffiaabaaffiaaeaaaaaeabaaabiaabaaaaia
abaaaaiaabaaffibaeaaaaaeacaaahoaamaaoekaabaaaaiaacaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
abaaamoaaaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaafdeieefcaaahaaaa
eaaaabaamaabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaaj
bcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaa
pgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaa
jgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaa
acaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaa
bacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaah
eccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
acaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 47 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_ShadowFadeCenterAndType]
Vector 21 [unity_Scale]
Float 22 [_FresnelFactor]
Float 23 [_EmissionFactor]
Vector 24 [unity_LightmapST]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1, 0, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..25] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[17];
DP4 R0.z, R1, c[15];
DP4 R0.x, R1, c[13];
DP4 R0.y, R1, c[14];
MOV R1, c[19];
MAD R0.xyz, R0, c[21].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[22];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
DP4 R0.x, vertex.position, c[5];
DP4 R2.z, R1, c[15];
DP4 R2.x, R1, c[13];
DP4 R2.y, R1, c[14];
MAD R1.xyz, -vertex.position, c[19].w, R2;
DP3 R0.w, R1, R1;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R1;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.y, vertex.position, c[6];
DP4 R0.z, vertex.position, c[7];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[18].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[20].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[20];
MOV result.texcoord[3].zw, R0;
MUL result.texcoord[5].xyz, R1, c[20].w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[24], c[24].zwzw;
MUL result.texcoord[5].w, -R0.x, R0.y;
MOV result.texcoord[2].x, c[23];
END
# 47 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 49 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_ShadowFadeCenterAndType]
Vector 21 [unity_Scale]
Float 22 [_FresnelFactor]
Float 23 [_EmissionFactor]
Vector 24 [unity_LightmapST]
Vector 25 [_MainTex_ST]
"vs_2_0
def c26, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c16
mov r1.w, c26.x
dp4 r0.z, r1, c14
dp4 r0.x, r1, c12
dp4 r0.y, r1, c13
mad r2.xyz, r0, c21.w, -v0
dp3 r1.x, r2, r2
mov r0, c14
rsq r2.w, r1.x
mov r1, c12
dp4 r3.x, c19, r1
dp4 r3.z, c19, r0
mov r0, c13
dp4 r3.y, c19, r0
mad r0.xyz, -v0, c19.w, r3
mul r1.xyz, r2.w, r2
dp3 r0.w, v1, r1
dp3 r1.w, r0, r0
rsq r1.x, r1.w
mul r1.xyz, r1.x, r0
mul r0.w, -r0, c22.x
min r0.x, r0.w, c26
dp3 r0.y, v1, r1
max r0.x, r0, c26.y
add r0.z, -r0.x, c26.x
min r0.y, r0, c26.x
max r1.w, r0.y, c26.y
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c26.z
mul r1.y, r1, c17.x
mad oT3.xy, r1.z, c18.zwzw, r1
mov oPos, r0
mov r0.x, c20.w
add r0.y, c26.x, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c20
mov oT3.zw, r0
mul oT5.xyz, r1, c20.w
mad oT0.xy, v2, c25, c25.zwzw
mad oT4.xy, v3, c24, c24.zwzw
mul oT5.w, -r0.x, r0.y
mov oT2.x, c23
"
}
SubProgram "d3d11 " {
// Stats: 42 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
BindCB  "UnityPerDraw" 4
"vs_4_0
eefiecedaeadfpkphkgphenebcijdbkddhickgkaabaaaaaanaaiaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcaeahaaaaeaaaabaambabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabkaaaaaafjaaaaaeegiocaaaaeaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaeaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaeaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaeaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaeaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaaeaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaaeaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
aeaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaaeaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaagijcaaaaeaaaaaabbaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaaeaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaaeaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
aeaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaa
abaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaa
egbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
acaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaaeaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaeaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaeaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaeaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaa
aaaaaaaackiacaaaaeaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
aeaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaaeaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaaeaaaaaaahaaaaaadkbabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaadaaaaaa
bjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 42 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
BindCB  "UnityPerDraw" 4
"vs_4_0_level_9_1
eefiecedekcfihhcpikmnocnhjmfmibomhnjohcmabaaaaaaoiamaaaaaeaaaaaa
daaaaaaaeeaeaaaafaalaaaabiamaaaaebgpgodjamaeaaaaamaeaaaaaaacpopp
jmadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
adaaabaaaaaaaaaaabaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaabjaaabaaahaaaaaaaaaaaeaaaaaaaiaaaiaaaaaaaaaaaeaaamaaajaabaaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapkaaaaaaaaaaaaaiadpaaaaaadp
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaahiaaeaaoeka
afaaaaadabaaahiaaaaaffiabfaaoekaaeaaaaaeaaaaaliabeaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabhaaoekaaeaaaaaeaaaaahiaaaaaoeiabiaappkaaaaaoejbceaaaaac
abaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabia
aaaaaaibabaaaakaalaaaaadaaaaabiaaaaaaaiabjaaaakaakaaaaadaaaaabia
aaaaaaiabjaaffkaacaaaaadaaaaabiaaaaaaaibbjaaffkaabaaaaacabaaapia
agaaoekaafaaaaadaaaaaoiaabaaffiabfaajakaaeaaaaaeaaaaaoiabeaajaka
abaaaaiaaaaaoeiaaeaaaaaeaaaaaoiabgaajakaabaakkiaaaaaoeiaaeaaaaae
aaaaaoiabhaajakaabaappiaaaaaoeiaaeaaaaaeaaaaaoiaaaaajajaagaappkb
aaaaoeiaceaaaaacabaaahiaaaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeia
alaaaaadaaaaaciaaaaaffiabjaaaakaakaaaaadaaaaaciaaaaaffiabjaaffka
afaaaaadaaaaaeoaaaaaffiaaaaaaaiaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaafaaaaka
afaaaaadabaaaiiaabaaaaiabjaakkkaafaaaaadabaaafiaaaaapeiabjaakkka
acaaaaadabaaadoaabaakkiaabaaomiaaeaaaaaeacaaadoaaeaaoejaacaaoeka
acaaookaafaaaaadabaaahiaaaaaffjabbaaoekaaeaaaaaeabaaahiabaaaoeka
aaaaaajaabaaoeiaaeaaaaaeabaaahiabcaaoekaaaaakkjaabaaoeiaaeaaaaae
abaaahiabdaaoekaaaaappjaabaaoeiaacaaaaadabaaahiaabaaoeiaahaaoekb
afaaaaadadaaahoaabaaoeiaahaappkaafaaaaadabaaabiaaaaaffjaanaakkka
aeaaaaaeabaaabiaamaakkkaaaaaaajaabaaaaiaaeaaaaaeabaaabiaaoaakkka
aaaakkjaabaaaaiaaeaaaaaeabaaabiaapaakkkaaaaappjaabaaaaiaabaaaaac
abaaaciabjaaffkaacaaaaadabaaaciaabaaffiaahaappkbafaaaaadadaaaioa
abaaffiaabaaaaibaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeiaabaaaaacaaaaaioaabaaffka
ppppaaaafdeieefcaeahaaaaeaaaabaambabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabkaaaaaafjaaaaaeegiocaaaaeaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaeaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaeaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaeaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaeaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaaeaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaaeaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
aeaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaeaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaaeaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaajbcaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaibcaabaaaabaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaagijcaaaaeaaaaaabbaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaaeaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaaeaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
aeaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaa
abaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaabacaaaahccaabaaaabaaaaaa
egbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadgaaaaagiccabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
acaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaaeaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaeaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaeaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaeaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaa
aaaaaaaackiacaaaaeaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
aeaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaaeaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaaeaaaaaaahaaaaaadkbabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaadaaaaaa
bjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaealaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaiahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 38 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [_WorldSpaceLightPos0]
Vector 12 [unity_Scale]
Float 13 [_FresnelFactor]
Float 14 [_EmissionFactor]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[17] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.w, c[0].x;
MOV R1.xyz, c[9];
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
MOV R1, c[11];
MAD R0.xyz, R0, c[12].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
MUL R0.x, -R0, c[13];
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[0].y;
ADD R0.z, -R0.x, c[0].x;
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
MAD R1.xyz, -vertex.position, c[11].w, R2;
DP3 R0.w, R1, R1;
RSQ R0.y, R0.w;
MUL R1.xyz, R0.y, R1;
DP3 R0.y, vertex.normal, R1;
MIN R0.y, R0, c[0].x;
MAX R1.w, R0.y, c[0].y;
MUL result.texcoord[1].x, R0.z, R1.w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[10].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MOV result.texcoord[2].x, c[14];
END
# 38 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [_WorldSpaceLightPos0]
Vector 12 [unity_Scale]
Float 13 [_FresnelFactor]
Float 14 [_EmissionFactor]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"vs_2_0
def c17, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c8
mov r1.w, c17.x
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
mad r2.xyz, r0, c12.w, -v0
dp3 r1.x, r2, r2
mov r0, c6
rsq r2.w, r1.x
mov r1, c4
dp4 r3.x, c11, r1
dp4 r3.z, c11, r0
mov r0, c5
dp4 r3.y, c11, r0
mad r0.xyz, -v0, c11.w, r3
mul r1.xyz, r2.w, r2
dp3 r0.w, v1, r1
dp3 r1.w, r0, r0
rsq r1.x, r1.w
mul r1.xyz, r1.x, r0
mul r0.w, -r0, c13.x
min r0.x, r0.w, c17
dp3 r0.y, v1, r1
max r0.x, r0, c17.y
add r0.z, -r0.x, c17.x
min r0.y, r0, c17.x
max r1.w, r0.y, c17.y
mul oT1.x, r0.z, r1.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.z
mul r1.y, r1, c9.x
mad oT3.xy, r1.z, c10.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mad oT0.xy, v2, c16, c16.zwzw
mad oT4.xy, v3, c15, c15.zwzw
mov oT2.x, c14
"
}
SubProgram "d3d11 " {
// Stats: 30 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefieceddhfdohfekiehelccdojldlpoadcpmldpabaaaaaaoeagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcdaafaaaaeaaaabaaemabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagiaaaaacadaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadicaaaaj
bcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaa
aaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaagijcaaaadaaaaaa
bbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaal
ocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
fgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagbjbaiaebaaaaaaaaaaaaaa
pgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaabaaaaaahbcaabaaaacaaaaaa
jgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaaacaaaaaaakaabaaa
acaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagaabaaaacaaaaaa
bacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaajgahbaaaabaaaaaadiaaaaah
eccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
acaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 30 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Float 64 [_FresnelFactor]
Float 68 [_EmissionFactor]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedfpilhigmfcnkljpllceemjdliaolloecabaaaaaaamakaaaaaeaaaaaa
daaaaaaafeadaaaaimaiaaaafeajaaaaebgpgodjbmadaaaabmadaaaaaaacpopp
liacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
adaaabaaaaaaaaaaabaaaeaaacaaaeaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaabaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaaaaaaaaaiadpaaaaaadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaahiaaeaaoekaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
anaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaae
aaaaahiaaaaaoeiaapaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaad
aaaaabiaacaaoejaabaaoeiaafaaaaadaaaaabiaaaaaaaibabaaaakaalaaaaad
aaaaabiaaaaaaaiabaaaaakaakaaaaadaaaaabiaaaaaaaiabaaaffkaacaaaaad
aaaaabiaaaaaaaibbaaaffkaabaaaaacabaaapiaagaaoekaafaaaaadaaaaaoia
abaaffiaamaajakaaeaaaaaeaaaaaoiaalaajakaabaaaaiaaaaaoeiaaeaaaaae
aaaaaoiaanaajakaabaakkiaaaaaoeiaaeaaaaaeaaaaaoiaaoaajakaabaappia
aaaaoeiaaeaaaaaeaaaaaoiaaaaajajaagaappkbaaaaoeiaceaaaaacabaaahia
aaaapjiaaiaaaaadaaaaaciaacaaoejaabaaoeiaalaaaaadaaaaaciaaaaaffia
baaaaakaakaaaaadaaaaaciaaaaaffiabaaaffkaafaaaaadaaaaaeoaaaaaffia
aaaaaaiaaeaaaaaeaaaaadoaadaaoejaadaaoekaadaaookaafaaaaadaaaaapia
aaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaafaaaakaafaaaaadabaaaiiaabaaaaia
baaakkkaafaaaaadabaaafiaaaaapeiabaaakkkaacaaaaadabaaadoaabaakkia
abaaomiaaeaaaaaeacaaadoaaeaaoejaacaaoekaacaaookaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoa
aaaaoeiaabaaaaacaaaaaioaabaaffkappppaaaafdeieefcdaafaaaaeaaaabaa
emabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadicaaaajbcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaakiacaaa
aaaaaaaaaeaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaiadpdiaaaaajocaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaa
agijcaaaadaaaaaabbaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaa
abaaaaaaagijcaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaafgaobaaa
abaaaaaadcaaaaalocaabaaaabaaaaaaagijcaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaafgaobaaaabaaaaaadcaaaaalocaabaaaabaaaaaaagbjbaia
ebaaaaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaafgaobaaaabaaaaaabaaaaaah
bcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafbcaabaaa
acaaaaaaakaabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaa
agaabaaaacaaaaaabacaaaahccaabaaaabaaaaaaegbcbaaaacaaaaaajgahbaaa
abaaaaaadiaaaaaheccabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadgaaaaagiccabaaaabaaaaaabkiacaaaaaaaaaaa
aeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaal
dccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaealaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 12 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"!!ARBfp1.0
PARAM c[1] = { program.local[0] };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R1.xyz, fragment.texcoord[3], texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R2.xyz, R0, fragment.texcoord[2].x;
MUL R0.w, R0, fragment.texcoord[1].x;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
ADD R1.xyz, -R1, fragment.texcoord[4];
MUL R2.xyz, R2, fragment.texcoord[1].x;
MUL R0.xyz, R0, c[0];
MAD result.color.xyz, R0, R1, R2;
MUL result.color.w, R0, c[0];
END
# 12 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 11 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3
dcl t4.xyz
texldp r1, t3, s1
texld r0, t0, s0
mul r2.xyz, r0, t2.x
mul r3.x, r0.w, t1
log_pp r1.x, r1.x
log_pp r1.z, r1.z
log_pp r1.y, r1.y
add_pp r1.xyz, -r1, t4
mul r0.w, r3.x, c0
mul r2.xyz, r2, t1.x
mul_pp r0.xyz, r0, c0
mad_pp r0.xyz, r0, r1, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 112
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefieceddkkbhmdgdknkbgpfjfhbfmeidlkpmjmlabaaaaaapiacaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcniabaaaa
eaaaaaaahgaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
ecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
cpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahpcaabaaa
abaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
abaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 112
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedleopeofbbhbeammafoipibocgjlkbdkoabaaaaaagaaeaaaaaeaaaaaa
daaaaaaajeabaaaaheadaaaacmaeaaaaebgpgodjfmabaaaafmabaaaaaaacpppp
ceabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkaagaaaaacaaaaaiiaabaapplaafaaaaad
aaaaadiaaaaappiaabaaoelaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaad
abaacpiaaaaaoelaaaaioekaapaaaaacacaacbiaaaaaaaiaapaaaaacacaaccia
aaaaffiaapaaaaacacaaceiaaaaakkiaacaaaaadaaaachiaacaaoeibacaaoela
afaaaaadacaaahiaabaaoeiaaaaapplaafaaaaadacaachiaacaaoeiaaaaakkla
afaaaaadabaachiaabaaoeiaaaaaoekaafaaaaadaaaaaiiaabaappiaaaaakkla
afaaaaadadaaciiaaaaappiaaaaappkaaeaaaaaeadaachiaabaaoeiaaaaaoeia
acaaoeiaabaaaaacaaaicpiaadaaoeiappppaaaafdeieefcniabaaaaeaaaaaaa
hgaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaa
abaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaaf
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaaegbcbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahpcaabaaaabaaaaaa
dgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaa
abaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaaabaaaaaa
dkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaaeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aiaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
// Stats: 23 math, 4 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Color]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[4], texture[3], 2D;
TEX R2, fragment.texcoord[4], texture[2], 2D;
TXP R3.xyz, fragment.texcoord[3], texture[1], 2D;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[2].x;
DP4 R2.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R1.w, R2.w;
RCP R1.w, R1.w;
MUL R0.w, R0, fragment.texcoord[1].x;
MAD R2.xyz, R2, c[2].x, -R1;
MAD_SAT R1.w, R1, c[1].z, c[1];
MAD R1.xyz, R1.w, R2, R1;
LG2 R2.x, R3.x;
LG2 R2.y, R3.y;
LG2 R2.z, R3.z;
ADD R1.xyz, -R2, R1;
MUL R2.xyz, R0, fragment.texcoord[2].x;
MUL R2.xyz, R2, fragment.texcoord[1].x;
MUL R0.xyz, R0, c[0];
MAD result.color.xyz, R0, R1, R2;
MUL result.color.w, R0, c[0];
END
# 23 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 20 math, 4 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Color]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3
dcl t4.xy
dcl t5
texld r1, t0, s0
texldp r2, t3, s1
texld r0, t4, s2
texld r3, t4, s3
mul_pp r4.xyz, r0.w, r0
dp4 r0.x, t5, t5
mul_pp r3.xyz, r3.w, r3
mul_pp r3.xyz, r3, c2.x
rsq r0.x, r0.x
rcp r0.x, r0.x
mad_pp r4.xyz, r4, c2.x, -r3
mad_sat r0.x, r0, c1.z, c1.w
mad_pp r0.xyz, r0.x, r4, r3
mul r3.xyz, r1, t2.x
log_pp r2.x, r2.x
log_pp r2.y, r2.y
log_pp r2.z, r2.z
add_pp r2.xyz, -r2, r0
mul r0.x, r1.w, t1
mul r0.w, r0.x, c0
mul r0.xyz, r3, t1.x
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r2, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 16 math, 4 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 144
Vector 48 [_Color]
Vector 112 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlalflolnailbalolaogmiififfbeihloabaaaaaajiaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgaadaaaaeaaaaaaaniaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabbaaaaah
bcaabaaaaaaaaaaaegbobaaaaeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadccaaaalbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckiacaaaaaaaaaaaahaaaaaadkiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaa
aaaaaaaaagajbaaaabaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaajgahbaiaebaaaaaaaaaaaaaadcaaaaaj
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
cpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahpcaabaaa
abaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
abaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 16 math, 4 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 144
Vector 48 [_Color]
Vector 112 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedimdbcinhepeemhgmebiemebkkcboclababaaaaaaaeahaaaaaeaaaaaa
daaaaaaajiacaaaaaaagaaaanaagaaaaebgpgodjgaacaaaagaacaaaaaaacpppp
beacaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaaaaaaaaa
abababaaacacacaaadadadaaaaaaadaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaaadlabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
agaaaaacaaaaaiiaabaapplaafaaaaadaaaaadiaaaaappiaabaaoelaecaaaaad
abaacpiaacaaoelaadaioekaecaaaaadacaacpiaacaaoelaacaioekaecaaaaad
aaaacpiaaaaaoeiaabaioekaecaaaaadadaacpiaaaaaoelaaaaioekaajaaaaad
aaaaaiiaadaaoelaadaaoelaahaaaaacaaaaaiiaaaaappiaagaaaaacaaaaaiia
aaaappiaaeaaaaaeaaaadiiaaaaappiaabaakkkaabaappkaafaaaaadabaaciia
abaappiaacaaaakaafaaaaadabaachiaabaaoeiaabaappiaafaaaaadabaaciia
acaappiaacaaaakaaeaaaaaeacaachiaabaappiaacaaoeiaabaaoeibaeaaaaae
abaachiaaaaappiaacaaoeiaabaaoeiaapaaaaacacaacbiaaaaaaaiaapaaaaac
acaacciaaaaaffiaapaaaaacacaaceiaaaaakkiaacaaaaadaaaachiaabaaoeia
acaaoeibafaaaaadabaaahiaadaaoeiaaaaapplaafaaaaadabaachiaabaaoeia
aaaakklaafaaaaadacaachiaadaaoeiaaaaaoekaafaaaaadaaaaaiiaadaappia
aaaakklaafaaaaadadaaciiaaaaappiaaaaappkaaeaaaaaeadaachiaacaaoeia
aaaaoeiaabaaoeiaabaaaaacaaaicpiaadaaoeiappppaaaafdeieefcgaadaaaa
eaaaaaaaniaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaa
gcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaaddcbabaaa
adaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaabbaaaaahbcaabaaaaaaaaaaaegbobaaaaeaaaaaaegbobaaaaeaaaaaa
elaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadccaaaalbcaabaaaaaaaaaaa
akaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaadkiacaaaaaaaaaaaahaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeb
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
diaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaak
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaajgahbaiaebaaaaaa
aaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
jgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaacaaaaaapgbpbaaa
acaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaah
ocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaa
aaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaab
ejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaiaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
// Stats: 14 math, 3 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.xyz, fragment.texcoord[3], texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[4], texture[2], 2D;
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R1.xyz, R1.w, R1;
LG2 R2.x, R2.x;
LG2 R2.z, R2.z;
LG2 R2.y, R2.y;
MAD R2.xyz, R1, c[1].x, -R2;
MUL R1.xyz, R0, fragment.texcoord[2].x;
MUL R1.xyz, R1, fragment.texcoord[1].x;
MUL R0.xyz, R0, c[0];
MAD result.color.xyz, R0, R2, R1;
MUL result.color.w, R0, c[0];
END
# 14 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 12 math, 3 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3
dcl t4.xy
texldp r2, t3, s1
texld r1, t0, s0
texld r0, t4, s2
mul_pp r0.xyz, r0.w, r0
mul r3.x, r1.w, t1
log_pp r2.x, r2.x
log_pp r2.z, r2.z
log_pp r2.y, r2.y
mad_pp r0.xyz, r0, c1.x, -r2
mul r2.xyz, r1, t2.x
mul r0.w, r3.x, c0
mul r2.xyz, r2, t1.x
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 9 math, 3 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 144
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpjeckhnjmpfdmkblecopclaamkfpkfkmabaaaaaafmadaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdmacaaaa
eaaaaaaaipaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaa
abaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaaf
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
adaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaah
pcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaa
akaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 9 math, 3 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 144
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedplangldehbnoglpkpppafepjagffciiaabaaaaaabaafaaaaaeaaaaaa
daaaaaaaoaabaaaaceaeaaaanmaeaaaaebgpgodjkiabaaaakiabaaaaaaacpppp
gmabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaadlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
abaapplaafaaaaadaaaaadiaaaaappiaabaaoelaecaaaaadaaaacpiaaaaaoeia
abaioekaecaaaaadabaacpiaacaaoelaacaioekaecaaaaadacaacpiaaaaaoela
aaaioekaapaaaaacadaacbiaaaaaaaiaapaaaaacadaacciaaaaaffiaapaaaaac
adaaceiaaaaakkiaafaaaaadabaaciiaabaappiaabaaaakaaeaaaaaeaaaachia
abaappiaabaaoeiaadaaoeibafaaaaadabaaahiaacaaoeiaaaaapplaafaaaaad
abaachiaabaaoeiaaaaakklaafaaaaadacaachiaacaaoeiaaaaaoekaafaaaaad
aaaaaiiaacaappiaaaaakklaafaaaaadadaaciiaaaaappiaaaaappkaaeaaaaae
adaachiaacaaoeiaaaaaoeiaabaaoeiaabaaaaacaaaicpiaadaaoeiappppaaaa
fdeieefcdmacaaaaeaaaaaaaipaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaa
acaaaaaagcbaaaaddcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaa
diaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaai
iccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaa
doaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 9 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"!!ARBfp1.0
PARAM c[1] = { program.local[0] };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TXP R1.xyz, fragment.texcoord[3], texture[1], 2D;
MUL R2.xyz, R0, fragment.texcoord[2].x;
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R0.xyz, R0, c[0];
MUL R2.xyz, R2, fragment.texcoord[1].x;
ADD R1.xyz, R1, fragment.texcoord[4];
MAD result.color.xyz, R0, R1, R2;
MUL result.color.w, R0, c[0];
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 8 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3
dcl t4.xyz
texld r1, t0, s0
texldp r0, t3, s1
mul r2.x, r1.w, t1
mul r0.w, r2.x, c0
mul_pp r2.xyz, r1, c0
mul r1.xyz, r1, t2.x
mul r1.xyz, r1, t1.x
add_pp r0.xyz, r0, t4
mad_pp r0.xyz, r2, r0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 7 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 112
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpjfopondgoknbkklbfejjjnhocdnoihdabaaaaaaoaacaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaabaaaa
eaaaaaaahaaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
ecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaadaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaah
ocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaa
aaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 7 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 112
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkdimdnbbmnaikghaicfecdflobnkgakbabaaaaaaceaeaaaaaeaaaaaa
daaaaaaahaabaaaadiadaaaapaadaaaaebgpgodjdiabaaaadiabaaaaaaacpppp
aaabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkaagaaaaacaaaaaiiaabaapplaafaaaaad
aaaaadiaaaaappiaabaaoelaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaad
abaacpiaaaaaoelaaaaioekaacaaaaadaaaachiaaaaaoeiaacaaoelaafaaaaad
acaaahiaabaaoeiaaaaapplaafaaaaadacaachiaacaaoeiaaaaakklaafaaaaad
abaachiaabaaoeiaaaaaoekaafaaaaadaaaaaiiaabaappiaaaaakklaafaaaaad
adaaciiaaaaappiaaaaappkaaeaaaaaeadaachiaabaaoeiaaaaaoeiaacaaoeia
abaaaaacaaaicpiaadaaoeiappppaaaafdeieefcmaabaaaaeaaaaaaahaaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaa
gcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahpcaabaaa
abaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
abaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaiaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
// Stats: 20 math, 4 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Color]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[4], texture[3], 2D;
TEX R2, fragment.texcoord[4], texture[2], 2D;
TXP R3.xyz, fragment.texcoord[3], texture[1], 2D;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[2].x;
DP4 R2.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R1.w, R2.w;
RCP R1.w, R1.w;
MUL R0.w, R0, fragment.texcoord[1].x;
MAD R2.xyz, R2, c[2].x, -R1;
MAD_SAT R1.w, R1, c[1].z, c[1];
MAD R1.xyz, R1.w, R2, R1;
MUL R2.xyz, R0, fragment.texcoord[2].x;
ADD R1.xyz, R3, R1;
MUL R2.xyz, R2, fragment.texcoord[1].x;
MUL R0.xyz, R0, c[0];
MAD result.color.xyz, R0, R1, R2;
MUL result.color.w, R0, c[0];
END
# 20 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 17 math, 4 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Color]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3
dcl t4.xy
dcl t5
texldp r2, t3, s1
texld r1, t0, s0
texld r0, t4, s2
texld r3, t4, s3
mul_pp r4.xyz, r0.w, r0
dp4 r0.x, t5, t5
mul_pp r3.xyz, r3.w, r3
mul_pp r3.xyz, r3, c2.x
rsq r0.x, r0.x
rcp r0.x, r0.x
mad_pp r4.xyz, r4, c2.x, -r3
mad_sat r0.x, r0, c1.z, c1.w
mad_pp r0.xyz, r0.x, r4, r3
mul r3.xyz, r1, t2.x
add_pp r2.xyz, r2, r0
mul r0.x, r1.w, t1
mul r0.w, r0.x, c0
mul r0.xyz, r3, t1.x
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r2, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 15 math, 4 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 144
Vector 48 [_Color]
Vector 112 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkdgdjkahmmehkabkddjjegklmdjigdejabaaaaaaiaaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceiadaaaaeaaaaaaancaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabbaaaaah
bcaabaaaaaaaaaaaegbobaaaaeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadccaaaalbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckiacaaaaaaaaaaaahaaaaaadkiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaa
aaaaaaaaagajbaaaabaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaajgahbaiaebaaaaaaaaaaaaaadcaaaaaj
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
diaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaadiaaaaah
ocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaaiiccabaaa
aaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 15 math, 4 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 144
Vector 48 [_Color]
Vector 112 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedipplbjflcnifmlnldgjhbmhpmpkhjjonabaaaaaamiagaaaaaeaaaaaa
daaaaaaaheacaaaameafaaaajeagaaaaebgpgodjdmacaaaadmacaaaaaaacpppp
paabaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaaaaaaaaa
abababaaacacacaaadadadaaaaaaadaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaaadlabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
agaaaaacaaaaaiiaabaapplaafaaaaadaaaaadiaaaaappiaabaaoelaecaaaaad
abaacpiaacaaoelaadaioekaecaaaaadacaacpiaacaaoelaacaioekaecaaaaad
aaaacpiaaaaaoeiaabaioekaecaaaaadadaacpiaaaaaoelaaaaioekaajaaaaad
aaaaaiiaadaaoelaadaaoelaahaaaaacaaaaaiiaaaaappiaagaaaaacaaaaaiia
aaaappiaaeaaaaaeaaaadiiaaaaappiaabaakkkaabaappkaafaaaaadabaaciia
abaappiaacaaaakaafaaaaadabaachiaabaaoeiaabaappiaafaaaaadabaaciia
acaappiaacaaaakaaeaaaaaeacaachiaabaappiaacaaoeiaabaaoeibaeaaaaae
abaachiaaaaappiaacaaoeiaabaaoeiaacaaaaadaaaachiaaaaaoeiaabaaoeia
afaaaaadabaaahiaadaaoeiaaaaapplaafaaaaadabaachiaabaaoeiaaaaakkla
afaaaaadacaachiaadaaoeiaaaaaoekaafaaaaadaaaaaiiaadaappiaaaaakkla
afaaaaadadaaciiaaaaappiaaaaappkaaeaaaaaeadaachiaacaaoeiaaaaaoeia
abaaoeiaabaaaaacaaaicpiaadaaoeiappppaaaafdeieefceiadaaaaeaaaaaaa
ncaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaad
icbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadpcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
bbaaaaahbcaabaaaaaaaaaaaegbobaaaaeaaaaaaegbobaaaaeaaaaaaelaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadccaaaalbcaabaaaaaaaaaaaakaabaaa
aaaaaaaackiacaaaaaaaaaaaahaaaaaadkiacaaaaaaaaaaaahaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
diaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaajgahbaiaebaaaaaaaaaaaaaa
dcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaajgahbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaa
diaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaai
iccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaa
doaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapalaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 11 math, 3 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[4], texture[2], 2D;
TXP R2.xyz, fragment.texcoord[3], texture[1], 2D;
MUL R1.xyz, R1.w, R1;
MAD R2.xyz, R1, c[1].x, R2;
MUL R1.xyz, R0, fragment.texcoord[2].x;
MUL R0.w, R0, fragment.texcoord[1].x;
MUL R1.xyz, R1, fragment.texcoord[1].x;
MUL R0.xyz, R0, c[0];
MAD result.color.xyz, R0, R2, R1;
MUL result.color.w, R0, c[0];
END
# 11 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 9 math, 3 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.x
dcl t3
dcl t4.xy
texldp r2, t3, s1
texld r1, t0, s0
texld r0, t4, s2
mul_pp r0.xyz, r0.w, r0
mad_pp r0.xyz, r0, c1.x, r2
mul r2.xyz, r1, t2.x
mul r3.x, r1.w, t1
mul r0.w, r3.x, c0
mul r2.xyz, r2, t1.x
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math, 3 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 144
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecednhabkmnkmmdolobgbeimdakniepdpfgpabaaaaaaeeadaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aeaeaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaadaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcceacaaaa
eaaaaaaaijaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadecbabaaa
abaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaaj
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaaabaaaaaa
diaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaadiaaaaai
iccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math, 3 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 144
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgmpikpnhjbiabhongcckaghpjnamnjhdabaaaaaaneaeaaaaaeaaaaaa
daaaaaaalmabaaaaoiadaaaakaaeaaaaebgpgodjieabaaaaieabaaaaaaacpppp
eiabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaadlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
abaapplaafaaaaadaaaaadiaaaaappiaabaaoelaecaaaaadaaaacpiaaaaaoeia
abaioekaecaaaaadabaacpiaacaaoelaacaioekaecaaaaadacaacpiaaaaaoela
aaaioekaafaaaaadaaaaciiaabaappiaabaaaakaaeaaaaaeaaaachiaaaaappia
abaaoeiaaaaaoeiaafaaaaadabaaahiaacaaoeiaaaaapplaafaaaaadabaachia
abaaoeiaaaaakklaafaaaaadacaachiaacaaoeiaaaaaoekaafaaaaadaaaaaiia
acaappiaaaaakklaafaaaaadadaaciiaaaaappiaaaaappkaaeaaaaaeadaachia
acaaoeiaaaaaoeiaabaaoeiaabaaaaacaaaicpiaadaaoeiappppaaaafdeieefc
ceacaaaaeaaaaaaaijaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
ecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeb
dcaaaaajhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaadiaaaaahpcaabaaaabaaaaaadgajbaaaabaaaaaaogbpbaaa
abaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaakgbkbaaaabaaaaaa
diaaaaaiiccabaaaaaaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaadaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaajgahbaaa
abaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
adaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}