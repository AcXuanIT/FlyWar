Shader "Shader Graphs/SG_Weapon" {
	Properties {
		[NoScaleOffset] Texture2D_683E1ECD ("Texture2D", 2D) = "white" {}
		_Dissolve ("Dissolve", Range(0, 1)) = 1
		_ConditionValue ("ConditionValue", Range(0, 1)) = 0
		_ConditionColor ("ConditionColor", Vector) = (1,0,0.09661579,1)
		_HitValue ("HitValue", Float) = 0
		[NoScaleOffset] Texture2D_ECAB87BD ("SkinMasks", 2D) = "white" {}
		_SkinColorA ("SkinColorA", Vector) = (0.2458615,0.6177973,0.8018868,1)
		_SkinColorB ("SkinColorB", Vector) = (0.007843138,0.7803922,0.5843138,1)
		[NoScaleOffset] Cubemap_7533E2EB ("ShaderOverlayHDRI", Cube) = "" {}
		[NoScaleOffset] _SampleReflectedCubemap_dfb9dd6c93bd71819ab2675d6996f696_Cube_1_Cubemap ("Cubemap", Cube) = "" {}
		[HideInInspector] _QueueOffset ("_QueueOffset", Float) = 0
		[HideInInspector] _QueueControl ("_QueueControl", Float) = -1
		[HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
	Fallback "Hidden/Shader Graph/FallbackError"
	//CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
}