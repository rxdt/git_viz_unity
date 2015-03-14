// Compiled shader for Web Player, uncompressed size: 153.2KB

Shader "Odissey/Odissey B" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _CoronaFactor ("Corona Dumping", Range(0.01,10)) = 1
 _HardnessFactor ("Hardness", Range(1,10)) = 1
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 35 avg math (22..60)
 //    d3d11_9x : 35 avg math (22..60)
 //        d3d9 : 48 avg math (30..81)
 //      opengl : 42 avg math (24..75)
 // Stats for Fragment shader:
 //       d3d11 : 8 math
 //    d3d11_9x : 8 math
 //        d3d9 : 10 math
 //      opengl : 7 math
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
// Stats: 45 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
Float 22 [_CoronaFactor]
Float 23 [_HardnessFactor]
"!!ARBvp1.0
PARAM c[24] = { { 1, 4 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MUL R1.xyz, vertex.normal, c[21].w;
MAD R2.xyz, R0, c[21].w, -vertex.position;
DP3 R3.w, R1, c[6];
DP3 R2.w, R1, c[7];
DP3 R0.x, R1, c[5];
MOV R0.y, R3.w;
MOV R0.z, R2.w;
MOV R0.w, c[0].x;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R3.z, R0, c[16];
DP4 R3.y, R0, c[15];
DP4 R3.x, R0, c[14];
DP4 R0.w, R1, c[19];
DP4 R0.y, R1, c[17];
DP4 R0.z, R1, c[18];
ADD R1.xyz, R3, R0.yzww;
DP3 R0.y, R2, R2;
RSQ R0.y, R0.y;
MUL R2.xyz, R0.y, R2;
MUL R0.z, R3.w, R3.w;
MAD R0.z, R0.x, R0.x, -R0;
MUL R3.xyz, R0.z, c[20];
DP3 R0.z, vertex.normal, R2;
ADD R0.w, -R0.z, c[0].x;
MOV R0.y, c[0];
ADD result.texcoord[5].xyz, R1, R3;
MUL R1.x, R0.y, c[23];
ABS R0.y, R0.w;
MUL result.texcoord[0].x, R0.w, R0.w;
POW R0.w, R0.y, R1.x;
POW result.texcoord[1].x, R0.y, c[22].x;
ADD result.texcoord[2].x, -R0.w, c[0];
MOV result.texcoord[3].x, R0.z;
MOV result.texcoord[4].z, R2.w;
MOV result.texcoord[4].y, R3.w;
MOV result.texcoord[4].x, R0;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 45 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 52 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_SHAr]
Vector 14 [unity_SHAg]
Vector 15 [unity_SHAb]
Vector 16 [unity_SHBr]
Vector 17 [unity_SHBg]
Vector 18 [unity_SHBb]
Vector 19 [unity_SHC]
Vector 20 [unity_Scale]
Float 21 [_CoronaFactor]
Float 22 [_HardnessFactor]
"vs_2_0
def c23, 1.00000000, 4.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.w, c23.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mul r1.xyz, v1, c20.w
mad r2.xyz, r0, c20.w, -v0
dp3 r3.w, r1, c5
dp3 r4.x, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r4.x
mov r0.w, c23.x
mul r1, r0.xyzz, r0.yzzx
dp4 r3.z, r0, c15
dp4 r3.y, r0, c14
dp4 r3.x, r0, c13
dp4 r0.w, r1, c18
dp4 r0.y, r1, c16
dp4 r0.z, r1, c17
add r1.xyz, r3, r0.yzww
dp3 r2.w, r2, r2
rsq r0.y, r2.w
mul r2.xyz, r0.y, r2
dp3 r0.y, v1, r2
mul r0.z, r3.w, r3.w
mad r0.z, r0.x, r0.x, -r0
mul r2.xyz, r0.z, c19
add r0.z, -r0.y, c23.x
mul oT0.x, r0.z, r0.z
mov r0.w, c22.x
abs r0.z, r0
add oT5.xyz, r1, r2
mul r0.w, c23.y, r0
pow r1, r0.z, r0.w
pow r2, r0.z, c21.x
mov r0.z, r2.x
mov r0.w, r1.x
mov oT1.x, r0.z
add oT2.x, -r0.w, c23
mov oT3.x, r0.y
mov oT4.z, r4.x
mov oT4.y, r3.w
mov oT4.x, r0
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 36 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 80
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
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
eefieceddkkffklcbelnbgcndbeeedbadingngdbabaaaaaagaahaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcjeafaaaaeaaaabaagfabaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
bccabaaaabaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
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
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaabaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaafcccabaaa
abaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
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
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 36 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 80
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
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
eefiecednipaldcngmpllfhcpcihgkcdbpbghheoabaaaaaakiakaaaaaeaaaaaa
daaaaaaaheadaaaabaajaaaaniajaaaaebgpgodjdmadaaaadmadaaaaaaacpopp
mmacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabaaaafaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaiadpaaaaiaeaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeaaaaalia
bbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaaeaaaaahiaaaaaoeiabfaappka
aaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeia
acaaaaadaaaaaciaaaaaaaibbgaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaad
aaaaaboaaaaaffiaaaaaffiacdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabia
aaaaaaiaafaaaaadaaaaadiaaaaaaaiaabaaoekaaoaaaaacaaaaacoaaaaaaaia
afaaaaadaaaaabiaaaaaffiabgaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaad
aaaaaeoaaaaaaaibbgaaaakaafaaaaadaaaaahiaacaaoejabfaappkaafaaaaad
abaaahiaaaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiabaaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabgaaaaka
ajaaaaadabaaabiaadaaoekaaaaaoeiaajaaaaadabaaaciaaeaaoekaaaaaoeia
ajaaaaadabaaaeiaafaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeia
ajaaaaadadaaabiaagaaoekaacaaoeiaajaaaaadadaaaciaahaaoekaacaaoeia
ajaaaaadadaaaeiaaiaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeia
afaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaia
aaaappibabaaaaacabaaahoaaaaaoeiaaeaaaaaeacaaahoaajaaoekaaaaappia
abaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcjeafaaaaeaaaabaa
gfabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaagfaaaaadcccabaaa
abaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaadiaaaaai
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
aaaaaaaadgaaaaaficcabaaaabaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaa
abaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaa
akaabaiaibaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egiacaaaaaaaaaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiaeabjaaaaafcccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaaf
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaaaaaaaaaegbcbaaa
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
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacanaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaealaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 24 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Float 15 [_CoronaFactor]
Float 16 [_HardnessFactor]
Vector 17 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[18] = { { 1, 4 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[14].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, vertex.normal, R0;
ADD R0.z, -R0.y, c[0].x;
MOV R0.x, c[0].y;
MUL R0.w, R0.x, c[16].x;
ABS R0.x, R0.z;
MUL result.texcoord[0].x, R0.z, R0.z;
POW R0.z, R0.x, R0.w;
POW result.texcoord[1].x, R0.x, c[15].x;
ADD result.texcoord[2].x, -R0.z, c[0];
MOV result.texcoord[3].x, R0.y;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[17], c[17].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 30 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Float 14 [_CoronaFactor]
Float 15 [_HardnessFactor]
Vector 16 [unity_LightmapST]
"vs_2_0
def c17, 1.00000000, 4.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord1 v2
mov r1.w, c17.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c13.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r2.x, v1, r0
add r0.x, -r2, c17
mov r0.y, c15.x
abs r2.y, r0.x
pow r1, r2.y, c14.x
mul oT0.x, r0, r0
mul r2.z, c17.y, r0.y
pow r0, r2.y, r2.z
mov r0.y, r1.x
mov oT1.x, r0.y
add oT2.x, -r0, c17
mov oT3.x, r2
mad oT4.xy, v2, c16, c16.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 22 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
Vector 80 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedkcobbojgfddmjfkoaalnanffeoeioibkabaaaaaaeiafaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjeadaaaaeaaaabaaofaaaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadbccabaaaabaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaa
abaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaac
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaabaaaaaaakaabaaaaaaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaag
bcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaafcccabaaaabaaaaaaakaabaaa
aaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaieccabaaa
abaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdcaaaaaldccabaaa
acaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 22 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
Vector 80 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjneelhgifdnnbhfbfgjlcbpokmdffmffabaaaaaaiaahaaaaaeaaaaaa
daaaaaaageacaaaaaaagaaaamiagaaaaebgpgodjcmacaaaacmacaaaaaaacpopp
neabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaeaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaabaaaafaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaiadp
aaaaiaeaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaahiaadaaoekaafaaaaad
abaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiaakaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeia
alaaoekaaeaaaaaeaaaaahiaaaaaoeiaamaappkaaaaaoejbceaaaaacabaaahia
aaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaacaaaaadaaaaaciaaaaaaaib
anaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaadaaaaaboaaaaaffiaaaaaffia
cdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaadia
aaaaaaiaabaaoekaaoaaaaacaaaaacoaaaaaaaiaafaaaaadaaaaabiaaaaaffia
anaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaadaaaaaeoaaaaaaaibanaaaaka
aeaaaaaeabaaadoaaeaaoejaacaaoekaacaaookaafaaaaadaaaaapiaaaaaffja
afaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
ppppaaaafdeieefcjeadaaaaeaaaabaaofaaaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaa
abaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaabaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaa
abaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaa
akaabaiaibaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egiacaaaaaaaaaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiaeabjaaaaafcccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaaf
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdcaaaaaldccabaaaacaaaaaaegbabaaa
aeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaabaoaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaacanaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaiahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 24 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Float 15 [_CoronaFactor]
Float 16 [_HardnessFactor]
Vector 17 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[18] = { { 1, 4 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[14].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, vertex.normal, R0;
ADD R0.z, -R0.y, c[0].x;
MOV R0.x, c[0].y;
MUL R0.w, R0.x, c[16].x;
ABS R0.x, R0.z;
MUL result.texcoord[0].x, R0.z, R0.z;
POW R0.z, R0.x, R0.w;
POW result.texcoord[1].x, R0.x, c[15].x;
ADD result.texcoord[2].x, -R0.z, c[0];
MOV result.texcoord[3].x, R0.y;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[17], c[17].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 30 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Float 14 [_CoronaFactor]
Float 15 [_HardnessFactor]
Vector 16 [unity_LightmapST]
"vs_2_0
def c17, 1.00000000, 4.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord1 v2
mov r1.w, c17.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c13.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r2.x, v1, r0
add r0.x, -r2, c17
mov r0.y, c15.x
abs r2.y, r0.x
pow r1, r2.y, c14.x
mul oT0.x, r0, r0
mul r2.z, c17.y, r0.y
pow r0, r2.y, r2.z
mov r0.y, r1.x
mov oT1.x, r0.y
add oT2.x, -r0, c17
mov oT3.x, r2
mad oT4.xy, v2, c16, c16.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 22 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
Vector 80 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedkcobbojgfddmjfkoaalnanffeoeioibkabaaaaaaeiafaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjeadaaaaeaaaabaaofaaaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadbccabaaaabaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaa
abaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaac
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaabaaaaaaakaabaaaaaaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaag
bcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaafcccabaaaabaaaaaaakaabaaa
aaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaieccabaaa
abaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdcaaaaaldccabaaa
acaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 22 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
Vector 80 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjneelhgifdnnbhfbfgjlcbpokmdffmffabaaaaaaiaahaaaaaeaaaaaa
daaaaaaageacaaaaaaagaaaamiagaaaaebgpgodjcmacaaaacmacaaaaaaacpopp
neabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaeaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaabaaaafaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaiadp
aaaaiaeaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaahiaadaaoekaafaaaaad
abaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiaakaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeia
alaaoekaaeaaaaaeaaaaahiaaaaaoeiaamaappkaaaaaoejbceaaaaacabaaahia
aaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeiaacaaaaadaaaaaciaaaaaaaib
anaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaadaaaaaboaaaaaffiaaaaaffia
cdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaadia
aaaaaaiaabaaoekaaoaaaaacaaaaacoaaaaaaaiaafaaaaadaaaaabiaaaaaffia
anaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaadaaaaaeoaaaaaaaibanaaaaka
aeaaaaaeabaaadoaaeaaoejaacaaoekaacaaookaafaaaaadaaaaapiaaaaaffja
afaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
ppppaaaafdeieefcjeadaaaaeaaaabaaofaaaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaa
abaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaad
iccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaabaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaa
abaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaa
akaabaiaibaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egiacaaaaaaaaaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiaeabjaaaaafcccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaaf
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdcaaaaaldccabaaaacaaaaaaegbabaaa
aeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaabaoaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaacanaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaiahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 75 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
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
Float 30 [_CoronaFactor]
Float 31 [_HardnessFactor]
"!!ARBvp1.0
PARAM c[32] = { { 1, 4, 0 },
		state.matrix.mvp,
		program.local[5..31] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[29].w;
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP3 R3.x, R3, c[7];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[15];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[14];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[16];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[17];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[24];
DP4 R2.y, R4, c[23];
DP4 R2.x, R4, c[22];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[19];
MAD R1.xyz, R0.x, c[18], R1;
MAD R0.xyz, R0.z, c[20], R1;
MAD R1.xyz, R0.w, c[21], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R4.w, R0, c[27];
DP4 R4.y, R0, c[25];
DP4 R4.z, R0, c[26];
ADD R2.xyz, R2, R4.yzww;
MOV R0.w, c[0].x;
MOV R0.xyz, c[13];
DP4 R4.w, R0, c[11];
DP4 R4.y, R0, c[9];
DP4 R4.z, R0, c[10];
MAD R0.xyz, R4.yzww, c[29].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, vertex.normal, R0;
ADD R0.z, -R0.y, c[0].x;
MOV R0.x, c[0].y;
MUL R0.w, R0.x, c[31].x;
ABS R0.x, R0.z;
MAD R1.w, R4.x, R4.x, -R1;
MUL R4.yzw, R1.w, c[28].xxyz;
ADD R2.xyz, R2, R4.yzww;
MUL result.texcoord[0].x, R0.z, R0.z;
POW R0.z, R0.x, R0.w;
ADD result.texcoord[5].xyz, R2, R1;
POW result.texcoord[1].x, R0.x, c[30].x;
ADD result.texcoord[2].x, -R0.z, c[0];
MOV result.texcoord[3].x, R0.y;
MOV result.texcoord[4].z, R3.x;
MOV result.texcoord[4].y, R3.w;
MOV result.texcoord[4].x, R4;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 75 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 81 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_4LightPosX0]
Vector 14 [unity_4LightPosY0]
Vector 15 [unity_4LightPosZ0]
Vector 16 [unity_4LightAtten0]
Vector 17 [unity_LightColor0]
Vector 18 [unity_LightColor1]
Vector 19 [unity_LightColor2]
Vector 20 [unity_LightColor3]
Vector 21 [unity_SHAr]
Vector 22 [unity_SHAg]
Vector 23 [unity_SHAb]
Vector 24 [unity_SHBr]
Vector 25 [unity_SHBg]
Vector 26 [unity_SHBb]
Vector 27 [unity_SHC]
Vector 28 [unity_Scale]
Float 29 [_CoronaFactor]
Float 30 [_HardnessFactor]
"vs_2_0
def c31, 1.00000000, 4.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v1
mul r3.xyz, v1, c28.w
dp3 r5.x, r3, c6
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp4 r0.x, v0, c5
add r1, -r0.x, c14
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c13
mul r1, r1, r1
mov r4.z, r5.x
mov r4.w, c31.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c15
mov r4.y, r3.w
mad r1, r0, r0, r1
mad r0, r5.x, r0, r2
mul r2, r1, c16
dp4 r3.z, r4, c23
dp4 r3.y, r4, c22
dp4 r3.x, r4, c21
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c31.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c31.z
mul r0, r0, r1
mul r1.xyz, r0.y, c18
mad r1.xyz, r0.x, c17, r1
mad r0.xyz, r0.z, c19, r1
mad r2.xyz, r0.w, c20, r0
mul r1.w, r3, r3
mov r0.w, c31.x
mov r0.xyz, c12
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mul r0, r4.xyzz, r4.yzzx
mad r1.xyz, r1, c28.w, -v0
dp4 r4.w, r0, c26
dp4 r4.y, r0, c24
dp4 r4.z, r0, c25
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r2.w, v1, r1
add r0.w, -r2, c31.x
add r0.xyz, r3, r4.yzww
mad r1.w, r4.x, r4.x, -r1
mul r3.xyz, r1.w, c27
add r0.xyz, r0, r3
add oT5.xyz, r0, r2
mov r0.x, c30
abs r2.x, r0.w
pow r1, r2.x, c29.x
mul oT0.x, r0.w, r0.w
mul r2.y, c31, r0.x
pow r0, r2.x, r2.y
mov r0.y, r1.x
mov oT1.x, r0.y
add oT2.x, -r0, c31
mov oT3.x, r2.w
mov oT4.z, r5.x
mov oT4.y, r3.w
mov oT4.x, r4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 60 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 80
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
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
eefiecedbncgpbknhfgakpppboanafndffokkbhoabaaaaaalaakaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcoeaiaaaaeaaaabaadjacaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
bccabaaaabaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
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
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaabaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaafcccabaaa
abaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
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
aaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 60 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 80
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
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
eefieceddfljpdmgfhekkhjmgcpepmlafahlaogfabaaaaaapaapaaaaaeaaaaaa
daaaaaaagmafaaaafiaoaaaacaapaaaaebgpgodjdeafaaaadeafaaaaaaacpopp
meaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaacaaaiaaadaaaaaaaaaa
acaacgaaahaaalaaaaaaaaaaadaaaaaaaeaabcaaaaaaaaaaadaaamaaajaabgaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbpaaapkaaaaaiadpaaaaiaeaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiablaaoekaaeaaaaaeaaaaalia
bkaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabmaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabnaaoekaaeaaaaaeaaaaahiaaaaaoeiaboaappka
aaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeia
acaaaaadaaaaaciaaaaaaaibbpaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaad
aaaaaboaaaaaffiaaaaaffiacdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabia
aaaaaaiaafaaaaadaaaaadiaaaaaaaiaabaaoekaaoaaaaacaaaaacoaaaaaaaia
afaaaaadaaaaabiaaaaaffiabpaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaad
aaaaaeoaaaaaaaibbpaaaakaafaaaaadaaaaahiaaaaaffjabhaaoekaaeaaaaae
aaaaahiabgaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabiaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiabjaaoekaaaaappjaaaaaoeiaacaaaaadabaaapia
aaaaffibaeaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaadadaaapia
aaaaaaibadaaoekaacaaaaadaaaaapiaaaaakkibafaaoekaaeaaaaaeacaaapia
adaaoeiaadaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeiaacaaoeia
ahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaacaeaaaeia
acaakkiaahaaaaacaeaaaiiaacaappiaabaaaaacafaaabiabpaaaakaaeaaaaae
acaaapiaacaaoeiaagaaoekaafaaaaiaafaaaaadafaaahiaacaaoejaboaappka
afaaaaadagaaahiaafaaffiabhaaoekaaeaaaaaeafaaaliabgaakekaafaaaaia
agaakeiaaeaaaaaeafaaahiabiaaoekaafaakkiaafaapeiaafaaaaadabaaapia
abaaoeiaafaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeiaaeaaaaae
aaaaapiaaaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeiaaaaaoeia
alaaaaadaaaaapiaaaaaoeiabpaakkkaagaaaaacabaaabiaacaaaaiaagaaaaac
abaaaciaacaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiiaacaappia
afaaaaadaaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffiaaiaaoeka
aeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaajaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappiaaaaaoeiaabaaaaac
afaaaiiabpaaaakaajaaaaadabaaabiaalaaoekaafaaoeiaajaaaaadabaaacia
amaaoekaafaaoeiaajaaaaadabaaaeiaanaaoekaafaaoeiaafaaaaadacaaapia
afaacjiaafaakeiaajaaaaadadaaabiaaoaaoekaacaaoeiaajaaaaadadaaacia
apaaoekaacaaoeiaajaaaaadadaaaeiabaaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaaeaaaaaiia
afaaaaiaafaaaaiaaaaappibabaaaaacabaaahoaafaaoeiaaeaaaaaeabaaahia
bbaaoekaaaaappiaabaaoeiaacaaaaadacaaahoaaaaaoeiaabaaoeiaafaaaaad
aaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiabeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabfaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcoeaiaaaaeaaaabaadjacaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadbccabaaaabaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaad
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
baaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaabaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaa
aeaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaea
bjaaaaafcccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
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
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaj
pcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaadaaaaaa
diaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaa
afaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaaj
pcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaaeaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaa
afaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaa
acaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaacaaaaaa
afaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaa
kgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaa
adaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaacanaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaealaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaiahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 7 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.050000001, 0, 16 } };
TEMP R0;
POW R0.x, fragment.texcoord[2].x, c[1].z;
MUL R0.x, R0, fragment.texcoord[0];
MUL R0.x, fragment.texcoord[1], R0;
ADD R0.y, fragment.texcoord[3].x, -c[1].x;
CMP R0.x, -R0.y, R0, c[1].y;
MUL result.color.xyz, fragment.texcoord[1].x, c[0];
MUL result.color.w, R0.x, c[0];
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
"ps_2_0
def c1, 16.00000000, -0.05000000, 0.00000000, 0
dcl t0.x
dcl t1.x
dcl t2.x
dcl t3.x
pow r0.y, t2.x, c1.x
mul r0.x, r0.y, t0
mul r0.x, t1, r0
add r1.x, t3, c1.y
cmp r0.x, -r1, c1.z, r0
mul r0.w, r0.x, c0
mul r0.xyz, t1.x, c0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
ConstBuffer "$Globals" 80
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhkaheogimcjpkjdphhiibpebeemkjcopabaaaaaajeacaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaababaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acacaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfmabaaaaeaaaaaaafhaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaagcbaaaadbcbabaaaabaaaaaagcbaaaad
ccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaaaaaaaaaa
ckbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkiacaaaaaaaaaaaadaaaaaabnaaaaahccaabaaaaaaaaaaaabeaaaaa
mnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaafgbfbaaa
abaaaaaaegiccaaaaaaaaaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
ConstBuffer "$Globals" 80
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgandeaeffjjmlmpngkfmhhebpcjddhcbabaaaaaahmadaaaaaeaaaaaa
daaaaaaabeabaaaahiacaaaaeiadaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaadaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiaebmnmmemdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplacaaaaaadaaaaaiiaaaaakklaabaaaaka
afaaaaadaaaaabiaaaaappiaaaaaaalaafaaaaadaaaaabiaaaaaaaiaaaaaffla
afaaaaadaaaacbiaaaaaaaiaaaaappkaacaaaaadaaaaaciaaaaapplbabaaffka
fiaaaaaeaaaaciiaaaaaffiaabaakkkaaaaaaaiaafaaaaadaaaachiaaaaaffla
aaaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmabaaaaeaaaaaaa
fhaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaagcbaaaadbcbabaaaabaaaaaa
gcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaa
aaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaabnaaaaahccaabaaaaaaaaaaa
abeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaa
fgbfbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadoaaaaabejfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaababaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacacaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaeaeaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 7 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.050000001, 0, 16 } };
TEMP R0;
POW R0.x, fragment.texcoord[2].x, c[1].z;
MUL R0.x, R0, fragment.texcoord[0];
MUL R0.x, fragment.texcoord[1], R0;
ADD R0.y, fragment.texcoord[3].x, -c[1].x;
CMP R0.x, -R0.y, R0, c[1].y;
MUL result.color.xyz, fragment.texcoord[1].x, c[0];
MUL result.color.w, R0.x, c[0];
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
"ps_2_0
def c1, 16.00000000, -0.05000000, 0.00000000, 0
dcl t0.x
dcl t1.x
dcl t2.x
dcl t3.x
pow r0.y, t2.x, c1.x
mul r0.x, r0.y, t0
mul r0.x, t1, r0
add r1.x, t3, c1.y
cmp r0.x, -r1, c1.z, r0
mul r0.w, r0.x, c0
mul r0.xyz, t1.x, c0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
ConstBuffer "$Globals" 96
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlkfmfffpigficmlnfincdbmcbekmgeibabaaaaaahmacaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaababaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acacaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfmabaaaa
eaaaaaaafhaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaagcbaaaadbcbabaaa
abaaaaaagcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaad
icbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaaf
bcaabaaaaaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaabnaaaaahccaabaaa
aaaaaaaaabeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaa
aaaaaaaafgbfbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
ConstBuffer "$Globals" 96
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkfnblolbgnagpandkgjmdmpfgknaiefdabaaaaaageadaaaaaeaaaaaa
daaaaaaabeabaaaahiacaaaadaadaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaadaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiaebmnmmemdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplacaaaaaadaaaaaiiaaaaakklaabaaaaka
afaaaaadaaaaabiaaaaappiaaaaaaalaafaaaaadaaaaabiaaaaaaaiaaaaaffla
afaaaaadaaaacbiaaaaaaaiaaaaappkaacaaaaadaaaaaciaaaaapplbabaaffka
fiaaaaaeaaaaciiaaaaaffiaabaakkkaaaaaaaiaafaaaaadaaaachiaaaaaffla
aaaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmabaaaaeaaaaaaa
fhaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaagcbaaaadbcbabaaaabaaaaaa
gcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaa
aaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaabnaaaaahccaabaaaaaaaaaaa
abeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaa
fgbfbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaababaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacacaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaeaeaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
// Stats: 7 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Color]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.050000001, 0, 16 } };
TEMP R0;
POW R0.x, fragment.texcoord[2].x, c[1].z;
MUL R0.x, R0, fragment.texcoord[0];
MUL R0.x, fragment.texcoord[1], R0;
ADD R0.y, fragment.texcoord[3].x, -c[1].x;
CMP R0.x, -R0.y, R0, c[1].y;
MUL result.color.xyz, fragment.texcoord[1].x, c[0];
MUL result.color.w, R0.x, c[0];
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Color]
"ps_2_0
def c1, 16.00000000, -0.05000000, 0.00000000, 0
dcl t0.x
dcl t1.x
dcl t2.x
dcl t3.x
pow r0.y, t2.x, c1.x
mul r0.x, r0.y, t0
mul r0.x, t1, r0
add r1.x, t3, c1.y
cmp r0.x, -r1, c1.z, r0
mul r0.w, r0.x, c0
mul r0.xyz, t1.x, c0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
ConstBuffer "$Globals" 96
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlkfmfffpigficmlnfincdbmcbekmgeibabaaaaaahmacaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaababaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acacaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfmabaaaa
eaaaaaaafhaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaagcbaaaadbcbabaaa
abaaaaaagcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaad
icbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaaf
bcaabaaaaaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaabnaaaaahccaabaaa
aaaaaaaaabeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaa
aaaaaaaafgbfbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
ConstBuffer "$Globals" 96
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkfnblolbgnagpandkgjmdmpfgknaiefdabaaaaaageadaaaaaeaaaaaa
daaaaaaabeabaaaahiacaaaadaadaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaadaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiaebmnmmemdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplacaaaaaadaaaaaiiaaaaakklaabaaaaka
afaaaaadaaaaabiaaaaappiaaaaaaalaafaaaaadaaaaabiaaaaaaaiaaaaaffla
afaaaaadaaaacbiaaaaaaaiaaaaappkaacaaaaadaaaaaciaaaaapplbabaaffka
fiaaaaaeaaaaciiaaaaaffiaabaakkkaaaaaaaiaafaaaaadaaaachiaaaaaffla
aaaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmabaaaaeaaaaaaa
fhaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaagcbaaaadbcbabaaaabaaaaaa
gcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaa
aaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaabnaaaaahccaabaaaaaaaaaaa
abeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaa
fgbfbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaababaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacacaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaeaeaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 34 avg math (25..38)
 //    d3d11_9x : 34 avg math (25..38)
 //        d3d9 : 39 avg math (34..42)
 //      opengl : 33 avg math (28..36)
 // Stats for Fragment shader:
 //       d3d11 : 8 math
 //    d3d11_9x : 8 math
 //        d3d9 : 10 math
 //      opengl : 7 math
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Fog { Mode Off }
  Blend SrcAlpha One
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
// Stats: 35 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Float 20 [_CoronaFactor]
Float 21 [_HardnessFactor]
"!!ARBvp1.0
PARAM c[22] = { { 1, 4 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MUL R1.xyz, vertex.normal, c[19].w;
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, vertex.normal, R0;
ADD R0.z, -R0.y, c[0].x;
MOV R0.x, c[0].y;
MUL R0.w, R0.x, c[21].x;
ABS R0.x, R0.z;
MUL result.texcoord[0].x, R0.z, R0.z;
POW R0.z, R0.x, R0.w;
POW result.texcoord[1].x, R0.x, c[20].x;
ADD result.texcoord[2].x, -R0.z, c[0];
MOV result.texcoord[3].x, R0.y;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[6].z, R0, c[15];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
DP3 result.texcoord[4].z, R1, c[7];
DP3 result.texcoord[4].y, R1, c[6];
DP3 result.texcoord[4].x, R1, c[5];
ADD result.texcoord[5].xyz, -R0, c[18];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 41 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Float 19 [_CoronaFactor]
Float 20 [_HardnessFactor]
"vs_2_0
def c21, 1.00000000, 4.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.w, c21.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r2.x, v1, r0
add r0.x, -r2, c21
mov r0.y, c20.x
abs r2.y, r0.x
pow r1, r2.y, c19.x
mul oT0.x, r0, r0
mul r2.z, c21.y, r0.y
pow r0, r2.y, r2.z
mov r0.y, r1.x
mul r1.xyz, v1, c18.w
mov oT1.x, r0.y
add oT2.x, -r0, c21
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oT3.x, r2
dp4 oT6.z, r0, c14
dp4 oT6.y, r0, c13
dp4 oT6.x, r0, c12
dp3 oT4.z, r1, c6
dp3 oT4.y, r1, c5
dp3 oT4.x, r1, c4
add oT5.xyz, -r0, c17
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 38 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 128 [_CoronaFactor]
Float 132 [_HardnessFactor]
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
eefiecedcgclpcgdglkieenfoaimhboleimhppbkabaaaaaaoeahaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
aaagaaaaeaaaabaaiaabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaa
gfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
abaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaiaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaaf
cccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 38 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 128 [_CoronaFactor]
Float 132 [_HardnessFactor]
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
eefiecedkoaoljfpndcekpbpgknhjhjbiffceldpabaaaaaafaalaaaaaeaaaaaa
daaaaaaajiadaaaakaajaaaagiakaaaaebgpgodjgaadaaaagaadaaaaaaacpopp
paacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkaaaaaiadpaaaaiaeaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaalia
baaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahiaaaaaoeiabeaappka
aaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeia
acaaaaadaaaaaciaaaaaaaibbfaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaad
aaaaaboaaaaaffiaaaaaffiacdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabia
aaaaaaiaafaaaaadaaaaadiaaaaaaaiaafaaoekaaoaaaaacaaaaacoaaaaaaaia
afaaaaadaaaaabiaaaaaffiabfaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaad
aaaaaeoaaaaaaaibbfaaaakaafaaaaadaaaaahiaacaaoejabeaappkaafaaaaad
abaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeia
aeaaaaaeabaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
anaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
aoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaappjaaaaaoeia
acaaaaadacaaahoaaaaaoeibahaaoekaafaaaaadaaaaapiaaaaaffjaanaaoeka
aeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcaaagaaaa
eaaaabaaiaabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaagfaaaaad
cccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
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
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaabaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaiaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaafcccabaaa
abaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
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
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaabaoaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaacanaaaa
neaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaaneaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaiahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
neaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 28 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Float 16 [_CoronaFactor]
Float 17 [_HardnessFactor]
"!!ARBvp1.0
PARAM c[18] = { { 1, 4 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MUL R1.xyz, vertex.normal, c[15].w;
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, vertex.normal, R0;
ADD R0.z, -R0.x, c[0].x;
MOV R0.y, c[0];
MUL R0.w, R0.y, c[17].x;
ABS R0.y, R0.z;
MUL result.texcoord[0].x, R0.z, R0.z;
POW R0.z, R0.y, R0.w;
POW result.texcoord[1].x, R0.y, c[16].x;
ADD result.texcoord[2].x, -R0.z, c[0];
MOV result.texcoord[3].x, R0;
DP3 result.texcoord[4].z, R1, c[7];
DP3 result.texcoord[4].y, R1, c[6];
DP3 result.texcoord[4].x, R1, c[5];
MOV result.texcoord[5].xyz, c[14];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Float 15 [_CoronaFactor]
Float 16 [_HardnessFactor]
"vs_2_0
def c17, 1.00000000, 4.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.w, c17.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c14.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r2.x, v1, r0
add r0.x, -r2, c17
mov r0.y, c16.x
abs r2.y, r0.x
pow r1, r2.y, c15.x
mul oT0.x, r0, r0
mul r2.z, c17.y, r0.y
pow r0, r2.y, r2.z
mov r0.y, r1.x
mov oT1.x, r0.y
add oT2.x, -r0, c17
mul r0.xyz, v1, c14.w
mov oT3.x, r2
dp3 oT4.z, r0, c6
dp3 oT4.y, r0, c5
dp3 oT4.x, r0, c4
mov oT5.xyz, c13
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 25 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 80
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
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
eefiecedcllcjjilgagmbafjgiidmhldlpkljdlhabaaaaaaomafaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefccaaeaaaaeaaaabaaaiabaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
bccabaaaabaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaa
gfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
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
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaabaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaafcccabaaa
abaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaadaaaaaaegiccaaa
acaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 25 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 80
Float 64 [_CoronaFactor]
Float 68 [_HardnessFactor]
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
eefiecedobnbmagbkjociggcnmfdlgolblekpdidabaaaaaahaaiaaaaaeaaaaaa
daaaaaaalaacaaaaniagaaaakaahaaaaebgpgodjhiacaaaahiacaaaaaaacpopp
aiacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaamaaadaaaiaaaaaaaaaaadaabaaaafaaalaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbaaaapkaaaaaiadpaaaaiaeaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaalia
alaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaanaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaaeaaaaahiaaaaaoeiaapaappka
aaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeia
acaaaaadaaaaaciaaaaaaaibbaaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaad
aaaaaboaaaaaffiaaaaaffiacdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabia
aaaaaaiaafaaaaadaaaaadiaaaaaaaiaabaaoekaaoaaaaacaaaaacoaaaaaaaia
afaaaaadaaaaabiaaaaaffiabaaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaad
aaaaaeoaaaaaaaibbaaaaakaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaad
abaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaiaabaakeia
aeaaaaaeabaaahoaakaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffja
afaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacacaaahoaadaaoekappppaaaafdeieefccaaeaaaaeaaaabaaaiabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaagfaaaaadcccabaaaabaaaaaa
gfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
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
dgaaaaaficcabaaaabaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaia
ibaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaa
aaaaaaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaiaeabjaaaaafcccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaag
hccabaaaadaaaaaaegiccaaaacaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaacanaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaealaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaiahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 36 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Float 20 [_CoronaFactor]
Float 21 [_HardnessFactor]
"!!ARBvp1.0
PARAM c[22] = { { 1, 4 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MUL R1.xyz, vertex.normal, c[19].w;
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, vertex.normal, R0;
ADD R0.z, -R0.y, c[0].x;
MOV R0.x, c[0].y;
MUL R0.w, R0.x, c[21].x;
ABS R0.x, R0.z;
MUL result.texcoord[0].x, R0.z, R0.z;
POW R0.z, R0.x, R0.w;
POW result.texcoord[1].x, R0.x, c[20].x;
ADD result.texcoord[2].x, -R0.z, c[0];
MOV result.texcoord[3].x, R0.y;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[6].w, R0, c[16];
DP4 result.texcoord[6].z, R0, c[15];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
DP3 result.texcoord[4].z, R1, c[7];
DP3 result.texcoord[4].y, R1, c[6];
DP3 result.texcoord[4].x, R1, c[5];
ADD result.texcoord[5].xyz, -R0, c[18];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 36 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 42 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Float 19 [_CoronaFactor]
Float 20 [_HardnessFactor]
"vs_2_0
def c21, 1.00000000, 4.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.w, c21.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r2.x, v1, r0
add r0.x, -r2, c21
mov r0.y, c20.x
abs r2.y, r0.x
pow r1, r2.y, c19.x
mul oT0.x, r0, r0
mul r2.z, c21.y, r0.y
pow r0, r2.y, r2.z
mov r0.y, r1.x
mul r1.xyz, v1, c18.w
mov oT1.x, r0.y
add oT2.x, -r0, c21
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oT3.x, r2
dp4 oT6.w, r0, c15
dp4 oT6.z, r0, c14
dp4 oT6.y, r0, c13
dp4 oT6.x, r0, c12
dp3 oT4.z, r1, c6
dp3 oT4.y, r1, c5
dp3 oT4.x, r1, c4
add oT5.xyz, -r0, c17
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 38 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 128 [_CoronaFactor]
Float 132 [_HardnessFactor]
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
eefiecedddgofbdgelncdndlnmkijllgbibplinhabaaaaaaoeahaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
aaagaaaaeaaaabaaiaabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaa
gfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
abaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaiaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaaf
cccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aeaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 38 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 128 [_CoronaFactor]
Float 132 [_HardnessFactor]
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
eefiecedmldlfdifankdepeegjdnmbbdmdekeonjabaaaaaafaalaaaaaeaaaaaa
daaaaaaajiadaaaakaajaaaagiakaaaaebgpgodjgaadaaaagaadaaaaaaacpopp
paacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkaaaaaiadpaaaaiaeaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaalia
baaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahiaaaaaoeiabeaappka
aaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeia
acaaaaadaaaaaciaaaaaaaibbfaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaad
aaaaaboaaaaaffiaaaaaffiacdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabia
aaaaaaiaafaaaaadaaaaadiaaaaaaaiaafaaoekaaoaaaaacaaaaacoaaaaaaaia
afaaaaadaaaaabiaaaaaffiabfaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaad
aaaaaeoaaaaaaaibbfaaaakaafaaaaadaaaaahiaacaaoejabeaappkaafaaaaad
abaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeia
aeaaaaaeabaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
anaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
aoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaappjaaaaaoeia
acaaaaadacaaahoaaaaaoeibahaaoekaafaaaaadaaaaapiaaaaaffjaanaaoeka
aeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaad
abaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaapoaaeaaoeka
aaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcaaagaaaa
eaaaabaaiaabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaagfaaaaad
cccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
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
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaabaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaiaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaafcccabaaa
abaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
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
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaabaoaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaacanaaaa
neaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaaneaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaiahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
neaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 35 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Float 20 [_CoronaFactor]
Float 21 [_HardnessFactor]
"!!ARBvp1.0
PARAM c[22] = { { 1, 4 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MUL R1.xyz, vertex.normal, c[19].w;
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, vertex.normal, R0;
ADD R0.z, -R0.y, c[0].x;
MOV R0.x, c[0].y;
MUL R0.w, R0.x, c[21].x;
ABS R0.x, R0.z;
MUL result.texcoord[0].x, R0.z, R0.z;
POW R0.z, R0.x, R0.w;
POW result.texcoord[1].x, R0.x, c[20].x;
ADD result.texcoord[2].x, -R0.z, c[0];
MOV result.texcoord[3].x, R0.y;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[6].z, R0, c[15];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
DP3 result.texcoord[4].z, R1, c[7];
DP3 result.texcoord[4].y, R1, c[6];
DP3 result.texcoord[4].x, R1, c[5];
ADD result.texcoord[5].xyz, -R0, c[18];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 41 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Float 19 [_CoronaFactor]
Float 20 [_HardnessFactor]
"vs_2_0
def c21, 1.00000000, 4.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.w, c21.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r2.x, v1, r0
add r0.x, -r2, c21
mov r0.y, c20.x
abs r2.y, r0.x
pow r1, r2.y, c19.x
mul oT0.x, r0, r0
mul r2.z, c21.y, r0.y
pow r0, r2.y, r2.z
mov r0.y, r1.x
mul r1.xyz, v1, c18.w
mov oT1.x, r0.y
add oT2.x, -r0, c21
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oT3.x, r2
dp4 oT6.z, r0, c14
dp4 oT6.y, r0, c13
dp4 oT6.x, r0, c12
dp3 oT4.z, r1, c6
dp3 oT4.y, r1, c5
dp3 oT4.x, r1, c4
add oT5.xyz, -r0, c17
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 38 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 128 [_CoronaFactor]
Float 132 [_HardnessFactor]
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
eefiecedcgclpcgdglkieenfoaimhboleimhppbkabaaaaaaoeahaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
aaagaaaaeaaaabaaiaabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaa
gfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
abaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaiaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaaf
cccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 38 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 128 [_CoronaFactor]
Float 132 [_HardnessFactor]
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
eefiecedkoaoljfpndcekpbpgknhjhjbiffceldpabaaaaaafaalaaaaaeaaaaaa
daaaaaaajiadaaaakaajaaaagiakaaaaebgpgodjgaadaaaagaadaaaaaaacpopp
paacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkaaaaaiadpaaaaiaeaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaalia
baaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahiaaaaaoeiabeaappka
aaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeia
acaaaaadaaaaaciaaaaaaaibbfaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaad
aaaaaboaaaaaffiaaaaaffiacdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabia
aaaaaaiaafaaaaadaaaaadiaaaaaaaiaafaaoekaaoaaaaacaaaaacoaaaaaaaia
afaaaaadaaaaabiaaaaaffiabfaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaad
aaaaaeoaaaaaaaibbfaaaakaafaaaaadaaaaahiaacaaoejabeaappkaafaaaaad
abaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeia
aeaaaaaeabaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
anaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
aoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaappjaaaaaoeia
acaaaaadacaaahoaaaaaoeibahaaoekaafaaaaadaaaaapiaaaaaffjaanaaoeka
aeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcaaagaaaa
eaaaabaaiaabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaagfaaaaad
cccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaaabaaaaaa
gfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
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
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaabaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaiaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaafcccabaaa
abaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
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
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaabaoaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaacanaaaa
neaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaealaaaaneaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaaiahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
neaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Float 20 [_CoronaFactor]
Float 21 [_HardnessFactor]
"!!ARBvp1.0
PARAM c[22] = { { 1, 4 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MUL R1.xyz, vertex.normal, c[19].w;
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, vertex.normal, R0;
ADD R0.z, -R0.y, c[0].x;
MOV R0.x, c[0].y;
MUL R0.w, R0.x, c[21].x;
ABS R0.x, R0.z;
MUL result.texcoord[0].x, R0.z, R0.z;
POW R0.z, R0.x, R0.w;
POW result.texcoord[1].x, R0.x, c[20].x;
ADD result.texcoord[2].x, -R0.z, c[0];
MOV result.texcoord[3].x, R0.y;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
DP3 result.texcoord[4].z, R1, c[7];
DP3 result.texcoord[4].y, R1, c[6];
DP3 result.texcoord[4].x, R1, c[5];
MOV result.texcoord[5].xyz, c[18];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 40 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Float 19 [_CoronaFactor]
Float 20 [_HardnessFactor]
"vs_2_0
def c21, 1.00000000, 4.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.w, c21.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r2.x, v1, r0
add r0.x, -r2, c21
mov r0.y, c20.x
abs r2.y, r0.x
pow r1, r2.y, c19.x
mul oT0.x, r0, r0
mul r2.z, c21.y, r0.y
pow r0, r2.y, r2.z
mov r0.y, r1.x
mul r1.xyz, v1, c18.w
mov oT1.x, r0.y
add oT2.x, -r0, c21
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov oT3.x, r2
dp4 oT6.y, r0, c13
dp4 oT6.x, r0, c12
dp3 oT4.z, r1, c6
dp3 oT4.y, r1, c5
dp3 oT4.x, r1, c4
mov oT5.xyz, c17
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 128 [_CoronaFactor]
Float 132 [_HardnessFactor]
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
eefiecedkekijkkknlngfcojfifdngccfdabpkdeabaaaaaaeaahaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
fmafaaaaeaaaabaafhabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadbccabaaaabaaaaaa
gfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaaabaaaaaagfaaaaadiccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
dccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
abaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaaabaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaaiaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeabjaaaaaf
cccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaadaaaaaa
egiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaa
aeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakdccabaaaaeaaaaaa
egiacaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaabaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 33 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 128 [_CoronaFactor]
Float 132 [_HardnessFactor]
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
eefiecedoohopiepencciighhibihpbfoodnffdhabaaaaaafmakaaaaaeaaaaaa
daaaaaaaeiadaaaakmaiaaaaheajaaaaebgpgodjbaadaaaabaadaaaaaaacpopp
kaacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkaaaaaiadpaaaaiaeaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaalia
baaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahiaaaaaoeiabeaappka
aaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoejaabaaoeia
acaaaaadaaaaaciaaaaaaaibbfaaaakaabaaaaacaaaaaioaaaaaaaiaafaaaaad
aaaaaboaaaaaffiaaaaaffiacdaaaaacaaaaabiaaaaaffiaapaaaaacaaaaabia
aaaaaaiaafaaaaadaaaaadiaaaaaaaiaafaaoekaaoaaaaacaaaaacoaaaaaaaia
afaaaaadaaaaabiaaaaaffiabfaaffkaaoaaaaacaaaaabiaaaaaaaiaacaaaaad
aaaaaeoaaaaaaaibbfaaaakaafaaaaadaaaaahiaacaaoejabeaappkaafaaaaad
abaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeia
aeaaaaaeabaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffja
anaaoekaaeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
aoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeia
afaaaaadabaaadiaaaaaffiaacaaoekaaeaaaaaeaaaaadiaabaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaadiaadaaoekaaaaakkiaaaaaoeiaaeaaaaaeadaaadoa
aeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaae
aaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaahoa
ahaaoekappppaaaafdeieefcfmafaaaaeaaaabaafhabaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadbccabaaaabaaaaaagfaaaaadcccabaaaabaaaaaagfaaaaadeccabaaa
abaaaaaagfaaaaadiccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
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
aaaaaaaadgaaaaaficcabaaaabaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaa
abaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaagbcaabaaaaaaaaaaa
akaabaiaibaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egiacaaaaaaaaaaaaiaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiaeabjaaaaafcccabaaaabaaaaaaakaabaaaaaaaaaaabjaaaaaf
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaieccabaaaabaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaaghccabaaaadaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaa
dcaaaaakdccabaaaaeaaaaaaegiacaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaabaoaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaacanaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
aealaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiahaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 7 math
Keywords { "POINT" }
Vector 0 [_Color]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.050000001, 0, 16 } };
TEMP R0;
POW R0.x, fragment.texcoord[2].x, c[1].z;
MUL R0.x, R0, fragment.texcoord[0];
MUL R0.x, fragment.texcoord[1], R0;
ADD R0.y, fragment.texcoord[3].x, -c[1].x;
CMP R0.x, -R0.y, R0, c[1].y;
MUL result.color.xyz, fragment.texcoord[1].x, c[0];
MUL result.color.w, R0.x, c[0];
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "POINT" }
Vector 0 [_Color]
"ps_2_0
def c1, 16.00000000, -0.05000000, 0.00000000, 0
dcl t0.x
dcl t1.x
dcl t2.x
dcl t3.x
pow r0.y, t2.x, c1.x
mul r0.x, r0.y, t0
mul r0.x, t1, r0
add r1.x, t3, c1.y
cmp r0.x, -r1, c1.z, r0
mul r0.w, r0.x, c0
mul r0.xyz, t1.x, c0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Keywords { "POINT" }
ConstBuffer "$Globals" 144
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcogdioljjckpecpcpbpaegaodnccaimdabaaaaaakmacaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaababaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acacaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcfmabaaaaeaaaaaaafhaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaagcbaaaadbcbabaaaabaaaaaagcbaaaadccbabaaaabaaaaaa
gcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaaaaaaaaaackbabaaaabaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaebbjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
aaaaaaaaahaaaaaabnaaaaahccaabaaaaaaaaaaaabeaaaaamnmmemdndkbabaaa
abaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaafgbfbaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math
Keywords { "POINT" }
ConstBuffer "$Globals" 144
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcindeobebpbokdpekmillcanenklnefcabaaaaaajeadaaaaaeaaaaaa
daaaaaaabeabaaaahiacaaaagaadaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaahaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiaebmnmmemdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplacaaaaaadaaaaaiiaaaaakklaabaaaaka
afaaaaadaaaaabiaaaaappiaaaaaaalaafaaaaadaaaaabiaaaaaaaiaaaaaffla
afaaaaadaaaacbiaaaaaaaiaaaaappkaacaaaaadaaaaaciaaaaapplbabaaffka
fiaaaaaeaaaaciiaaaaaffiaabaakkkaaaaaaaiaafaaaaadaaaachiaaaaaffla
aaaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmabaaaaeaaaaaaa
fhaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaagcbaaaadbcbabaaaabaaaaaa
gcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaa
aaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaabnaaaaahccaabaaaaaaaaaaa
abeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaa
fgbfbaaaabaaaaaaegiccaaaaaaaaaaaahaaaaaadoaaaaabejfdeheooaaaaaaa
aiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
neaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaababaaaaneaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacacaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaeaeaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaa
neaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaaneaaaaaaafaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 7 math
Keywords { "DIRECTIONAL" }
Vector 0 [_Color]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.050000001, 0, 16 } };
TEMP R0;
POW R0.x, fragment.texcoord[2].x, c[1].z;
MUL R0.x, R0, fragment.texcoord[0];
MUL R0.x, fragment.texcoord[1], R0;
ADD R0.y, fragment.texcoord[3].x, -c[1].x;
CMP R0.x, -R0.y, R0, c[1].y;
MUL result.color.xyz, fragment.texcoord[1].x, c[0];
MUL result.color.w, R0.x, c[0];
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "DIRECTIONAL" }
Vector 0 [_Color]
"ps_2_0
def c1, 16.00000000, -0.05000000, 0.00000000, 0
dcl t0.x
dcl t1.x
dcl t2.x
dcl t3.x
pow r0.y, t2.x, c1.x
mul r0.x, r0.y, t0
mul r0.x, t1, r0
add r1.x, t3, c1.y
cmp r0.x, -r1, c1.z, r0
mul r0.w, r0.x, c0
mul r0.xyz, t1.x, c0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Keywords { "DIRECTIONAL" }
ConstBuffer "$Globals" 80
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhkaheogimcjpkjdphhiibpebeemkjcopabaaaaaajeacaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaababaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acacaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfmabaaaaeaaaaaaafhaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaagcbaaaadbcbabaaaabaaaaaagcbaaaad
ccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaaaaaaaaaa
ckbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkiacaaaaaaaaaaaadaaaaaabnaaaaahccaabaaaaaaaaaaaabeaaaaa
mnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaafgbfbaaa
abaaaaaaegiccaaaaaaaaaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math
Keywords { "DIRECTIONAL" }
ConstBuffer "$Globals" 80
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgandeaeffjjmlmpngkfmhhebpcjddhcbabaaaaaahmadaaaaaeaaaaaa
daaaaaaabeabaaaahiacaaaaeiadaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaadaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiaebmnmmemdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplacaaaaaadaaaaaiiaaaaakklaabaaaaka
afaaaaadaaaaabiaaaaappiaaaaaaalaafaaaaadaaaaabiaaaaaaaiaaaaaffla
afaaaaadaaaacbiaaaaaaaiaaaaappkaacaaaaadaaaaaciaaaaapplbabaaffka
fiaaaaaeaaaaciiaaaaaffiaabaakkkaaaaaaaiaafaaaaadaaaachiaaaaaffla
aaaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmabaaaaeaaaaaaa
fhaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaagcbaaaadbcbabaaaabaaaaaa
gcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaa
aaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaabnaaaaahccaabaaaaaaaaaaa
abeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaa
fgbfbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadoaaaaabejfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaababaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacacaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaeaeaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 7 math
Keywords { "SPOT" }
Vector 0 [_Color]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.050000001, 0, 16 } };
TEMP R0;
POW R0.x, fragment.texcoord[2].x, c[1].z;
MUL R0.x, R0, fragment.texcoord[0];
MUL R0.x, fragment.texcoord[1], R0;
ADD R0.y, fragment.texcoord[3].x, -c[1].x;
CMP R0.x, -R0.y, R0, c[1].y;
MUL result.color.xyz, fragment.texcoord[1].x, c[0];
MUL result.color.w, R0.x, c[0];
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "SPOT" }
Vector 0 [_Color]
"ps_2_0
def c1, 16.00000000, -0.05000000, 0.00000000, 0
dcl t0.x
dcl t1.x
dcl t2.x
dcl t3.x
pow r0.y, t2.x, c1.x
mul r0.x, r0.y, t0
mul r0.x, t1, r0
add r1.x, t3, c1.y
cmp r0.x, -r1, c1.z, r0
mul r0.w, r0.x, c0
mul r0.xyz, t1.x, c0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Keywords { "SPOT" }
ConstBuffer "$Globals" 144
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgecfhkikiffdpmgjfoclnhbkaendckbjabaaaaaakmacaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaababaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acacaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcfmabaaaaeaaaaaaafhaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaagcbaaaadbcbabaaaabaaaaaagcbaaaadccbabaaaabaaaaaa
gcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaaaaaaaaaackbabaaaabaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaebbjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
aaaaaaaaahaaaaaabnaaaaahccaabaaaaaaaaaaaabeaaaaamnmmemdndkbabaaa
abaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaafgbfbaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math
Keywords { "SPOT" }
ConstBuffer "$Globals" 144
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedaafnmlgabhekdgfmcbanopgbknppibonabaaaaaajeadaaaaaeaaaaaa
daaaaaaabeabaaaahiacaaaagaadaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaahaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiaebmnmmemdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplacaaaaaadaaaaaiiaaaaakklaabaaaaka
afaaaaadaaaaabiaaaaappiaaaaaaalaafaaaaadaaaaabiaaaaaaaiaaaaaffla
afaaaaadaaaacbiaaaaaaaiaaaaappkaacaaaaadaaaaaciaaaaapplbabaaffka
fiaaaaaeaaaaciiaaaaaffiaabaakkkaaaaaaaiaafaaaaadaaaachiaaaaaffla
aaaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmabaaaaeaaaaaaa
fhaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaagcbaaaadbcbabaaaabaaaaaa
gcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaa
aaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaabnaaaaahccaabaaaaaaaaaaa
abeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaa
fgbfbaaaabaaaaaaegiccaaaaaaaaaaaahaaaaaadoaaaaabejfdeheooaaaaaaa
aiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
neaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaababaaaaneaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacacaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaeaeaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaa
neaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaaneaaaaaaafaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 7 math
Keywords { "POINT_COOKIE" }
Vector 0 [_Color]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.050000001, 0, 16 } };
TEMP R0;
POW R0.x, fragment.texcoord[2].x, c[1].z;
MUL R0.x, R0, fragment.texcoord[0];
MUL R0.x, fragment.texcoord[1], R0;
ADD R0.y, fragment.texcoord[3].x, -c[1].x;
CMP R0.x, -R0.y, R0, c[1].y;
MUL result.color.xyz, fragment.texcoord[1].x, c[0];
MUL result.color.w, R0.x, c[0];
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "POINT_COOKIE" }
Vector 0 [_Color]
"ps_2_0
def c1, 16.00000000, -0.05000000, 0.00000000, 0
dcl t0.x
dcl t1.x
dcl t2.x
dcl t3.x
pow r0.y, t2.x, c1.x
mul r0.x, r0.y, t0
mul r0.x, t1, r0
add r1.x, t3, c1.y
cmp r0.x, -r1, c1.z, r0
mul r0.w, r0.x, c0
mul r0.xyz, t1.x, c0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Keywords { "POINT_COOKIE" }
ConstBuffer "$Globals" 144
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcogdioljjckpecpcpbpaegaodnccaimdabaaaaaakmacaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaababaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acacaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcfmabaaaaeaaaaaaafhaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaagcbaaaadbcbabaaaabaaaaaagcbaaaadccbabaaaabaaaaaa
gcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaaaaaaaaaackbabaaaabaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaebbjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
aaaaaaaaahaaaaaabnaaaaahccaabaaaaaaaaaaaabeaaaaamnmmemdndkbabaaa
abaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaafgbfbaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math
Keywords { "POINT_COOKIE" }
ConstBuffer "$Globals" 144
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcindeobebpbokdpekmillcanenklnefcabaaaaaajeadaaaaaeaaaaaa
daaaaaaabeabaaaahiacaaaagaadaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaahaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiaebmnmmemdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplacaaaaaadaaaaaiiaaaaakklaabaaaaka
afaaaaadaaaaabiaaaaappiaaaaaaalaafaaaaadaaaaabiaaaaaaaiaaaaaffla
afaaaaadaaaacbiaaaaaaaiaaaaappkaacaaaaadaaaaaciaaaaapplbabaaffka
fiaaaaaeaaaaciiaaaaaffiaabaakkkaaaaaaaiaafaaaaadaaaachiaaaaaffla
aaaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmabaaaaeaaaaaaa
fhaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaagcbaaaadbcbabaaaabaaaaaa
gcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaa
aaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaabnaaaaahccaabaaaaaaaaaaa
abeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaa
fgbfbaaaabaaaaaaegiccaaaaaaaaaaaahaaaaaadoaaaaabejfdeheooaaaaaaa
aiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
neaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaababaaaaneaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacacaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaeaeaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaa
neaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaaneaaaaaaafaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
// Stats: 7 math
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_Color]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.050000001, 0, 16 } };
TEMP R0;
POW R0.x, fragment.texcoord[2].x, c[1].z;
MUL R0.x, R0, fragment.texcoord[0];
MUL R0.x, fragment.texcoord[1], R0;
ADD R0.y, fragment.texcoord[3].x, -c[1].x;
CMP R0.x, -R0.y, R0, c[1].y;
MUL result.color.xyz, fragment.texcoord[1].x, c[0];
MUL result.color.w, R0.x, c[0];
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_Color]
"ps_2_0
def c1, 16.00000000, -0.05000000, 0.00000000, 0
dcl t0.x
dcl t1.x
dcl t2.x
dcl t3.x
pow r0.y, t2.x, c1.x
mul r0.x, r0.y, t0
mul r0.x, t1, r0
add r1.x, t3, c1.y
cmp r0.x, -r1, c1.z, r0
mul r0.w, r0.x, c0
mul r0.xyz, t1.x, c0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math
Keywords { "DIRECTIONAL_COOKIE" }
ConstBuffer "$Globals" 144
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmiibpgfhhjeaoefckoppafifbfcmpkgbabaaaaaakmacaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaababaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
acacaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaaeaeaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcfmabaaaaeaaaaaaafhaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaagcbaaaadbcbabaaaabaaaaaagcbaaaadccbabaaaabaaaaaa
gcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaaaaaaaaaackbabaaaabaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaebbjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
aaaaaaaaahaaaaaabnaaaaahccaabaaaaaaaaaaaabeaaaaamnmmemdndkbabaaa
abaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaafgbfbaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math
Keywords { "DIRECTIONAL_COOKIE" }
ConstBuffer "$Globals" 144
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpkngmcabkhdcepjbpbbdlgcdfljfnhebabaaaaaajeadaaaaaeaaaaaa
daaaaaaabeabaaaahiacaaaagaadaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaahaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiaebmnmmemdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplacaaaaaadaaaaaiiaaaaakklaabaaaaka
afaaaaadaaaaabiaaaaappiaaaaaaalaafaaaaadaaaaabiaaaaaaaiaaaaaffla
afaaaaadaaaacbiaaaaaaaiaaaaappkaacaaaaadaaaaaciaaaaapplbabaaffka
fiaaaaaeaaaaciiaaaaaffiaabaakkkaaaaaaaiaafaaaaadaaaachiaaaaaffla
aaaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmabaaaaeaaaaaaa
fhaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaagcbaaaadbcbabaaaabaaaaaa
gcbaaaadccbabaaaabaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaacpaaaaafbcaabaaa
aaaaaaaackbabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiaebbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkbabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaabnaaaaahccaabaaaaaaaaaaa
abeaaaaamnmmemdndkbabaaaabaaaaaadhaaaaajiccabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaa
fgbfbaaaabaaaaaaegiccaaaaaaaaaaaahaaaaaadoaaaaabejfdeheooaaaaaaa
aiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
neaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaababaaaaneaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaacacaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaaeaeaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaaiaiaaaa
neaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaaneaaaaaaafaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaaaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaadaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}