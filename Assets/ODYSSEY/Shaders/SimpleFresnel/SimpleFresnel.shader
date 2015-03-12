Shader "Custom/SimpleFresnel" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Amount ("Fresnel amount", float) = 1
	}
	SubShader {
		Tags { "RenderType" = "Diffuse" }
      
		Lighting Off 
		Fog { Mode Off }
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert
		
		//uniform float fresnelFactor;
 
		sampler2D _MainTex;
		float _Amount;

		struct Input {
			float2 uv_MainTex;
			float fresnelValue;
		};
		
		void vert (inout appdata_full v, out Input o) {
		  float3 viewDirection = normalize( ObjSpaceViewDir (v.vertex) );
      	  //float3 vcoords = v.vertex.xyz;
      	  o.fresnelValue = 1 - saturate ( dot (v.normal, viewDirection) * _Amount );
        }

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = IN.fresnelValue;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
