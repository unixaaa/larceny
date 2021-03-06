(require 'foreign-ctools)


;;; /* Version */
(define-syntax define-opengl-constants
  (transformer 
   (lambda (exp ren cmp)
     (let ((ids (cdr exp)))
       `(,(ren 'define-c-info) (,(ren 'include<>) "OpenGL/OpenGL.h")
         ,@(map (lambda (x) `(,(ren 'ifdefconst) 
                              ,x
                              ,(ren 'uint) 
                              ,(symbol->string x)))
                ids))))))

(define-opengl-constants
  GL_VERSION_1_1 GL_VERSION_1_2 GL_VERSION_1_3 
  GL_VERSION_1_4 GL_VERSION_1_5 GL_VERSION_2_0

;;; /* AccumOp */
  GL_ACCUM GL_LOAD GL_RETURN GL_MULT GL_ADD
;;; /* AlphaFunction */
  GL_NEVER GL_LESS GL_EQUAL GL_LEQUAL GL_GREATER 
  GL_NOTEQUAL GL_GEQUAL GL_ALWAYS
;;; /* AttribMask */
 GL_CURRENT_BIT GL_POINT_BIT GL_LINE_BIT GL_POLYGON_BIT 
 GL_POLYGON_STIPPLE_BIT GL_PIXEL_MODE_BIT GL_LIGHTING_BIT GL_FOG_BIT
 GL_DEPTH_BUFFER_BIT GL_ACCUM_BUFFER_BIT GL_STENCIL_BUFFER_BIT
 GL_VIEWPORT_BIT GL_TRANSFORM_BIT GL_ENABLE_BIT GL_COLOR_BUFFER_BIT 
 GL_HINT_BIT GL_EVAL_BIT GL_LIST_BIT GL_TEXTURE_BIT
 GL_SCISSOR_BIT GL_ALL_ATTRIB_BITS

;;; /* BeginMode */
 GL_POINTS GL_LINES GL_LINE_LOOP GL_LINE_STRIP GL_TRIANGLES 
 GL_TRIANGLE_STRIP GL_TRIANGLE_FAN GL_QUADS GL_QUAD_STRIP 
 GL_POLYGON 

;;; /* BlendEquationMode */
 GL_LOGIC_OP GL_FUNC_ADD GL_MIN GL_MAX GL_FUNC_SUBTRACT
 GL_FUNC_REVERSE_SUBTRACT

;;; /* BlendingFactorDest */
 GL_ZERO GL_ONE GL_SRC_COLOR GL_ONE_MINUS_SRC_COLOR GL_SRC_ALPHA 
 GL_ONE_MINUS_SRC_ALPHA GL_DST_ALPHA GL_ONE_MINUS_DST_ALPHA 
 GL_CONSTANT_COLOR GL_ONE_MINUS_CONSTANT_COLOR GL_CONSTANT_ALPHA
 GL_ONE_MINUS_CONSTANT_ALPHA

;;; /* BlendingFactorSrc */
 GL_ZERO GL_ONE GL_DST_COLOR GL_ONE_MINUS_DST_COLOR 
 GL_SRC_ALPHA_SATURATE GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
 GL_DST_ALPHA GL_ONE_MINUS_DST_ALPHA
 GL_CONSTANT_COLOR GL_ONE_MINUS_CONSTANT_COLOR
 GL_CONSTANT_ALPHA GL_ONE_MINUS_CONSTANT_ALPHA

;;; /* Boolean */
 GL_TRUE GL_FALSE 

;;; /* ClearBufferMask */
 GL_COLOR_BUFFER_BIT GL_ACCUM_BUFFER_BIT GL_STENCIL_BUFFER_BIT
 GL_DEPTH_BUFFER_BIT

;;; /* ClientArrayType */
 GL_VERTEX_ARRAY GL_NORMAL_ARRAY GL_COLOR_ARRAY
 GL_INDEX_ARRAY GL_TEXTURE_COORD_ARRAY GL_EDGE_FLAG_ARRAY

;;; /* ClipPlaneName */
 GL_CLIP_PLANE0 GL_CLIP_PLANE1 GL_CLIP_PLANE2 
 GL_CLIP_PLANE3 GL_CLIP_PLANE4 GL_CLIP_PLANE5 

;;; /* ColorMaterialFace */
 GL_FRONT GL_BACK GL_FRONT_AND_BACK

;;; /* ColorMaterialParameter */
 GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_EMISSION GL_AMBIENT_AND_DIFFUSE

;;; /* ColorPointerType */
 GL_BYTE GL_UNSIGNED_BYTE GL_SHORT GL_UNSIGNED_SHORT
 GL_INT GL_UNSIGNED_INT GL_FLOAT GL_DOUBLE

;;; /* ColorTableParameterPName */
 GL_COLOR_TABLE_SCALE GL_COLOR_TABLE_BIAS

;;; /* ColorTableTarget */
 GL_COLOR_TABLE GL_POST_CONVOLUTION_COLOR_TABLE
 GL_POST_COLOR_MATRIX_COLOR_TABLE GL_PROXY_COLOR_TABLE
 GL_PROXY_POST_CONVOLUTION_COLOR_TABLE
 GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE

;;; /* ConvolutionBorderMode */
 GL_REDUCE GL_IGNORE_BORDER GL_CONSTANT_BORDER

;;; /* ConvolutionParameter */
 GL_CONVOLUTION_BORDER_MODE GL_CONVOLUTION_FILTER_SCALE
 GL_CONVOLUTION_FILTER_BIAS

;;; /* ConvolutionTarget */
 GL_CONVOLUTION_1D GL_CONVOLUTION_2D

;;; /* CullFaceMode */
 GL_FRONT GL_BACK GL_FRONT_AND_BACK

;;; /* DataType */
 GL_BYTE GL_UNSIGNED_BYTE GL_SHORT GL_UNSIGNED_SHORT GL_INT 
 GL_UNSIGNED_INT GL_FLOAT GL_2_BYTES GL_3_BYTES GL_4_BYTES 
 GL_DOUBLE 

;;; /* DepthFunction */
 GL_NEVER GL_LESS GL_EQUAL GL_LEQUAL GL_GREATER GL_NOTEQUAL
 GL_GEQUAL GL_ALWAYS

;;; /* DrawBufferMode */
 GL_NONE GL_FRONT_LEFT GL_FRONT_RIGHT GL_BACK_LEFT GL_BACK_RIGHT 
 GL_FRONT GL_BACK GL_LEFT GL_RIGHT GL_FRONT_AND_BACK
 GL_AUX0 GL_AUX1 GL_AUX2 GL_AUX3 

;;; /* Enable */
 GL_FOG GL_LIGHTING GL_TEXTURE_1D GL_TEXTURE_2D
 GL_LINE_STIPPLE GL_POLYGON_STIPPLE GL_CULL_FACE
 GL_ALPHA_TEST GL_BLEND GL_INDEX_LOGIC_OP
 GL_COLOR_LOGIC_OP GL_DITHER GL_STENCIL_TEST GL_DEPTH_TEST
 GL_CLIP_PLANE0 GL_CLIP_PLANE1 GL_CLIP_PLANE2 
 GL_CLIP_PLANE3 GL_CLIP_PLANE4 GL_CLIP_PLANE5
 GL_LIGHT0 GL_LIGHT1 GL_LIGHT2 GL_LIGHT3
 GL_LIGHT4 GL_LIGHT5 GL_LIGHT6 GL_LIGHT7
 GL_TEXTURE_GEN_S GL_TEXTURE_GEN_T GL_TEXTURE_GEN_R GL_TEXTURE_GEN_Q
 GL_MAP1_VERTEX_3 GL_MAP1_VERTEX_4 GL_MAP1_COLOR_4
 GL_MAP1_INDEX GL_MAP1_NORMAL
 GL_MAP1_TEXTURE_COORD_1 GL_MAP1_TEXTURE_COORD_2
 GL_MAP1_TEXTURE_COORD_3 GL_MAP1_TEXTURE_COORD_4
 GL_MAP2_VERTEX_3 GL_MAP2_VERTEX_4
 GL_MAP2_COLOR_4 GL_MAP2_INDEX GL_MAP2_NORMAL
 GL_MAP2_TEXTURE_COORD_1 GL_MAP2_TEXTURE_COORD_2
 GL_MAP2_TEXTURE_COORD_3 GL_MAP2_TEXTURE_COORD_4
 GL_POINT_SMOOTH GL_LINE_SMOOTH GL_POLYGON_SMOOTH
 GL_SCISSOR_TEST GL_COLOR_MATERIAL GL_NORMALIZE GL_AUTO_NORMAL
 GL_VERTEX_ARRAY GL_NORMAL_ARRAY GL_COLOR_ARRAY GL_INDEX_ARRAY
 GL_TEXTURE_COORD_ARRAY GL_EDGE_FLAG_ARRAY
 GL_POLYGON_OFFSET_POINT GL_POLYGON_OFFSET_LINE GL_POLYGON_OFFSET_FILL
 GL_COLOR_TABLE GL_POST_CONVOLUTION_COLOR_TABLE 
 GL_POST_COLOR_MATRIX_COLOR_TABLE
 GL_CONVOLUTION_1D GL_CONVOLUTION_2D
 GL_SEPARABLE_2D GL_HISTOGRAM
 GL_MINMAX GL_RESCALE_NORMAL GL_TEXTURE_3D

;;; /* ErrorCode */
 GL_NO_ERROR GL_INVALID_ENUM GL_INVALID_VALUE 
 GL_INVALID_OPERATION GL_STACK_OVERFLOW GL_STACK_UNDERFLOW 
 GL_OUT_OF_MEMORY GL_TABLE_TOO_LARGE

;;; /* FeedBackMode */
 GL_2D GL_3D GL_3D_COLOR GL_3D_COLOR_TEXTURE GL_4D_COLOR_TEXTURE 

;;; /* FeedBackToken */
 GL_PASS_THROUGH_TOKEN GL_POINT_TOKEN GL_LINE_TOKEN
 GL_POLYGON_TOKEN GL_BITMAP_TOKEN 
 GL_DRAW_PIXEL_TOKEN GL_COPY_PIXEL_TOKEN GL_LINE_RESET_TOKEN 

;;; /* FogMode */
 GL_LINEAR GL_EXP GL_EXP2 

;;; /* FogParameter */
 GL_FOG_COLOR GL_FOG_DENSITY GL_FOG_END 
 GL_FOG_INDEX GL_FOG_MODE GL_FOG_START

;;; /* FrontFaceDirection */
 GL_CW GL_CCW 

;;; /* GetColorTableParameterPName */
 GL_COLOR_TABLE_SCALE GL_COLOR_TABLE_BIAS GL_COLOR_TABLE_FORMAT
 GL_COLOR_TABLE_WIDTH GL_COLOR_TABLE_RED_SIZE GL_COLOR_TABLE_GREEN_SIZE
 GL_COLOR_TABLE_BLUE_SIZE GL_COLOR_TABLE_ALPHA_SIZE
 GL_COLOR_TABLE_LUMINANCE_SIZE GL_COLOR_TABLE_INTENSITY_SIZE

;;; /* GetConvolutionParameterPName */
 GL_CONVOLUTION_BORDER_COLOR GL_CONVOLUTION_BORDER_MODE
 GL_CONVOLUTION_FILTER_SCALE GL_CONVOLUTION_FILTER_BIAS
 GL_CONVOLUTION_FORMAT GL_CONVOLUTION_WIDTH
 GL_CONVOLUTION_HEIGHT GL_MAX_CONVOLUTION_WIDTH
 GL_MAX_CONVOLUTION_HEIGHT

;;; /* GetHistogramParameterPName */
 GL_HISTOGRAM_WIDTH GL_HISTOGRAM_FORMAT GL_HISTOGRAM_RED_SIZE
 GL_HISTOGRAM_GREEN_SIZE GL_HISTOGRAM_BLUE_SIZE
 GL_HISTOGRAM_ALPHA_SIZE GL_HISTOGRAM_LUMINANCE_SIZE
 GL_HISTOGRAM_SINK

;;; /* GetMapTarget */
 GL_COEFF GL_ORDER GL_DOMAIN 

;;; /* GetMinmaxParameterPName */
 GL_MINMAX_FORMAT GL_MINMAX_SINK

;;; /* GetPixelMap */
 GL_PIXEL_MAP_I_TO_I GL_PIXEL_MAP_S_TO_S GL_PIXEL_MAP_I_TO_R
 GL_PIXEL_MAP_I_TO_G GL_PIXEL_MAP_I_TO_B GL_PIXEL_MAP_I_TO_A
 GL_PIXEL_MAP_R_TO_R GL_PIXEL_MAP_G_TO_G GL_PIXEL_MAP_B_TO_B
 GL_PIXEL_MAP_A_TO_A

;;; /* GetPointerTarget */
 GL_VERTEX_ARRAY_POINTER GL_NORMAL_ARRAY_POINTER
 GL_COLOR_ARRAY_POINTER GL_INDEX_ARRAY_POINTER
 GL_TEXTURE_COORD_ARRAY_POINTER GL_EDGE_FLAG_ARRAY_POINTER

;;; /* GetTarget */
 GL_CURRENT_COLOR GL_CURRENT_INDEX GL_CURRENT_NORMAL 
 GL_CURRENT_TEXTURE_COORDS GL_CURRENT_RASTER_COLOR 
 GL_CURRENT_RASTER_INDEX GL_CURRENT_RASTER_TEXTURE_COORDS 
 GL_CURRENT_RASTER_POSITION GL_CURRENT_RASTER_POSITION_VALID 
 GL_CURRENT_RASTER_DISTANCE GL_POINT_SMOOTH 
 GL_POINT_SIZE GL_POINT_SIZE_RANGE GL_POINT_SIZE_GRANULARITY 
 GL_LINE_SMOOTH GL_LINE_WIDTH GL_LINE_WIDTH_RANGE 
 GL_LINE_WIDTH_GRANULARITY GL_LINE_STIPPLE GL_LINE_STIPPLE_PATTERN 
 GL_LINE_STIPPLE_REPEAT GL_SMOOTH_POINT_SIZE_RANGE
 GL_SMOOTH_POINT_SIZE_GRANULARITY GL_SMOOTH_LINE_WIDTH_RANGE
 GL_SMOOTH_LINE_WIDTH_GRANULARITY GL_ALIASED_POINT_SIZE_RANGE
 GL_ALIASED_LINE_WIDTH_RANGE GL_LIST_MODE GL_MAX_LIST_NESTING 
 GL_LIST_BASE GL_LIST_INDEX GL_POLYGON_MODE GL_POLYGON_SMOOTH 
 GL_POLYGON_STIPPLE GL_EDGE_FLAG GL_CULL_FACE GL_CULL_FACE_MODE 
 GL_FRONT_FACE GL_LIGHTING GL_LIGHT_MODEL_LOCAL_VIEWER 
 GL_LIGHT_MODEL_TWO_SIDE GL_LIGHT_MODEL_AMBIENT 
 GL_SHADE_MODEL GL_COLOR_MATERIAL_FACE 
 GL_COLOR_MATERIAL_PARAMETER GL_COLOR_MATERIAL 
 GL_FOG GL_FOG_INDEX GL_FOG_DENSITY GL_FOG_START GL_FOG_END 
 GL_FOG_MODE GL_FOG_COLOR GL_DEPTH_RANGE GL_DEPTH_TEST 
 GL_DEPTH_WRITEMASK GL_DEPTH_CLEAR_VALUE GL_DEPTH_FUNC 
 GL_ACCUM_CLEAR_VALUE GL_STENCIL_TEST GL_STENCIL_CLEAR_VALUE 
 GL_STENCIL_FUNC GL_STENCIL_VALUE_MASK 
 GL_STENCIL_FAIL GL_STENCIL_PASS_DEPTH_FAIL 
 GL_STENCIL_PASS_DEPTH_PASS GL_STENCIL_REF GL_STENCIL_WRITEMASK 
 GL_MATRIX_MODE GL_NORMALIZE GL_VIEWPORT 
 GL_MODELVIEW_STACK_DEPTH GL_PROJECTION_STACK_DEPTH 
 GL_TEXTURE_STACK_DEPTH GL_MODELVIEW_MATRIX GL_PROJECTION_MATRIX 
 GL_TEXTURE_MATRIX GL_ATTRIB_STACK_DEPTH GL_CLIENT_ATTRIB_STACK_DEPTH 
 GL_ALPHA_TEST GL_ALPHA_TEST_FUNC GL_ALPHA_TEST_REF 
 GL_DITHER GL_BLEND_DST GL_BLEND_SRC GL_BLEND 
 GL_LOGIC_OP_MODE GL_INDEX_LOGIC_OP GL_COLOR_LOGIC_OP 
 GL_AUX_BUFFERS GL_DRAW_BUFFER GL_READ_BUFFER GL_SCISSOR_BOX 
 GL_SCISSOR_TEST GL_INDEX_CLEAR_VALUE 
 GL_INDEX_WRITEMASK GL_COLOR_CLEAR_VALUE GL_COLOR_WRITEMASK 
 GL_INDEX_MODE GL_RGBA_MODE GL_DOUBLEBUFFER 
 GL_STEREO GL_RENDER_MODE GL_PERSPECTIVE_CORRECTION_HINT 
 GL_POINT_SMOOTH_HINT GL_LINE_SMOOTH_HINT 
 GL_POLYGON_SMOOTH_HINT GL_FOG_HINT 
 GL_TEXTURE_GEN_S GL_TEXTURE_GEN_T GL_TEXTURE_GEN_R GL_TEXTURE_GEN_Q 
 GL_PIXEL_MAP_I_TO_I GL_PIXEL_MAP_S_TO_S GL_PIXEL_MAP_I_TO_R 
 GL_PIXEL_MAP_I_TO_G GL_PIXEL_MAP_I_TO_B GL_PIXEL_MAP_I_TO_A 
 GL_PIXEL_MAP_R_TO_R GL_PIXEL_MAP_G_TO_G GL_PIXEL_MAP_B_TO_B 
 GL_PIXEL_MAP_A_TO_A GL_PIXEL_MAP_I_TO_I_SIZE GL_PIXEL_MAP_S_TO_S_SIZE 
 GL_PIXEL_MAP_I_TO_R_SIZE GL_PIXEL_MAP_I_TO_G_SIZE GL_PIXEL_MAP_I_TO_B_SIZE 
 GL_PIXEL_MAP_I_TO_A_SIZE GL_PIXEL_MAP_R_TO_R_SIZE GL_PIXEL_MAP_G_TO_G_SIZE 
 GL_PIXEL_MAP_B_TO_B_SIZE GL_PIXEL_MAP_A_TO_A_SIZE 
 GL_UNPACK_SWAP_BYTES GL_UNPACK_LSB_FIRST GL_UNPACK_ROW_LENGTH 
 GL_UNPACK_SKIP_ROWS GL_UNPACK_SKIP_PIXELS GL_UNPACK_ALIGNMENT 
 GL_PACK_SWAP_BYTES GL_PACK_LSB_FIRST GL_PACK_ROW_LENGTH 
 GL_PACK_SKIP_ROWS GL_PACK_SKIP_PIXELS GL_PACK_ALIGNMENT 
 GL_MAP_COLOR GL_MAP_STENCIL GL_INDEX_SHIFT GL_INDEX_OFFSET 
 GL_RED_SCALE GL_RED_BIAS GL_ZOOM_X GL_ZOOM_Y 
 GL_GREEN_SCALE GL_GREEN_BIAS GL_BLUE_SCALE GL_BLUE_BIAS 
 GL_ALPHA_SCALE GL_ALPHA_BIAS GL_DEPTH_SCALE GL_DEPTH_BIAS 
 GL_MAX_EVAL_ORDER GL_MAX_LIGHTS GL_MAX_CLIP_PLANES GL_MAX_TEXTURE_SIZE 
 GL_MAX_PIXEL_MAP_TABLE GL_MAX_ATTRIB_STACK_DEPTH 
 GL_MAX_MODELVIEW_STACK_DEPTH GL_MAX_NAME_STACK_DEPTH 
 GL_MAX_PROJECTION_STACK_DEPTH GL_MAX_TEXTURE_STACK_DEPTH 
 GL_MAX_VIEWPORT_DIMS GL_MAX_CLIENT_ATTRIB_STACK_DEPTH 
 GL_SUBPIXEL_BITS GL_INDEX_BITS 
 GL_RED_BITS GL_GREEN_BITS GL_BLUE_BITS GL_ALPHA_BITS GL_DEPTH_BITS 
 GL_STENCIL_BITS 
 GL_ACCUM_RED_BITS GL_ACCUM_GREEN_BITS GL_ACCUM_BLUE_BITS GL_ACCUM_ALPHA_BITS 
 GL_NAME_STACK_DEPTH 
 GL_AUTO_NORMAL 
 GL_MAP1_COLOR_4 GL_MAP1_INDEX GL_MAP1_NORMAL 
 GL_MAP1_TEXTURE_COORD_1 GL_MAP1_TEXTURE_COORD_2 
 GL_MAP1_TEXTURE_COORD_3 GL_MAP1_TEXTURE_COORD_4 
 GL_MAP1_VERTEX_3 GL_MAP1_VERTEX_4 
 GL_MAP2_COLOR_4 GL_MAP2_INDEX GL_MAP2_NORMAL 
 GL_MAP2_TEXTURE_COORD_1 GL_MAP2_TEXTURE_COORD_2 
 GL_MAP2_TEXTURE_COORD_3 GL_MAP2_TEXTURE_COORD_4 
 GL_MAP2_VERTEX_3 GL_MAP2_VERTEX_4 
 GL_MAP1_GRID_DOMAIN GL_MAP1_GRID_SEGMENTS 
 GL_MAP2_GRID_DOMAIN GL_MAP2_GRID_SEGMENTS 
 GL_TEXTURE_1D GL_TEXTURE_2D 
 GL_FEEDBACK_BUFFER_POINTER GL_FEEDBACK_BUFFER_SIZE 
 GL_FEEDBACK_BUFFER_TYPE 
 GL_SELECTION_BUFFER_POINTER GL_SELECTION_BUFFER_SIZE 
 GL_TEXTURE_BINDING_1D GL_TEXTURE_BINDING_2D GL_TEXTURE_BINDING_3D
 GL_VERTEX_ARRAY GL_NORMAL_ARRAY GL_COLOR_ARRAY GL_INDEX_ARRAY
 GL_TEXTURE_COORD_ARRAY GL_EDGE_FLAG_ARRAY
 GL_VERTEX_ARRAY_SIZE GL_VERTEX_ARRAY_TYPE
 GL_VERTEX_ARRAY_STRIDE GL_NORMAL_ARRAY_TYPE GL_NORMAL_ARRAY_STRIDE
 GL_COLOR_ARRAY_SIZE GL_COLOR_ARRAY_TYPE GL_COLOR_ARRAY_STRIDE
 GL_INDEX_ARRAY_TYPE GL_INDEX_ARRAY_STRIDE
 GL_TEXTURE_COORD_ARRAY_SIZE GL_TEXTURE_COORD_ARRAY_TYPE
 GL_TEXTURE_COORD_ARRAY_STRIDE
 GL_EDGE_FLAG_ARRAY_STRIDE GL_POLYGON_OFFSET_FACTOR GL_POLYGON_OFFSET_UNITS
 GL_COLOR_TABLE GL_POST_CONVOLUTION_COLOR_TABLE
 GL_POST_COLOR_MATRIX_COLOR_TABLE
 GL_CONVOLUTION_1D GL_CONVOLUTION_2D GL_SEPARABLE_2D
 GL_POST_CONVOLUTION_RED_SCALE GL_POST_CONVOLUTION_GREEN_SCALE
 GL_POST_CONVOLUTION_BLUE_SCALE GL_POST_CONVOLUTION_ALPHA_SCALE
 GL_POST_CONVOLUTION_RED_BIAS GL_POST_CONVOLUTION_GREEN_BIAS
 GL_POST_CONVOLUTION_BLUE_BIAS GL_POST_CONVOLUTION_ALPHA_BIAS
 GL_COLOR_MATRIX GL_COLOR_MATRIX_STACK_DEPTH
 GL_MAX_COLOR_MATRIX_STACK_DEPTH GL_POST_COLOR_MATRIX_RED_SCALE
 GL_POST_COLOR_MATRIX_GREEN_SCALE GL_POST_COLOR_MATRIX_BLUE_SCALE
 GL_POST_COLOR_MATRIX_ALPHA_SCALE GL_POST_COLOR_MATRIX_RED_BIAS
 GL_POST_COLOR_MATRIX_GREEN_BIAS GL_POST_COLOR_MATRIX_BLUE_BIAS
 GL_POST_COLOR_MATRIX_ALPHA_BIAS
 GL_HISTOGRAM GL_MINMAX GL_MAX_ELEMENTS_VERTICES GL_MAX_ELEMENTS_INDICES
 GL_RESCALE_NORMAL GL_LIGHT_MODEL_COLOR_CONTROL GL_PACK_SKIP_IMAGES
 GL_PACK_IMAGE_HEIGHT GL_UNPACK_SKIP_IMAGES GL_UNPACK_IMAGE_HEIGHT
 GL_TEXTURE_3D GL_MAX_3D_TEXTURE_SIZE GL_BLEND_COLOR GL_BLEND_EQUATION

;;; /* GetTextureParameter */
 GL_TEXTURE_MAG_FILTER GL_TEXTURE_MIN_FILTER 
 GL_TEXTURE_WRAP_S GL_TEXTURE_WRAP_T
 GL_TEXTURE_WIDTH GL_TEXTURE_HEIGHT 
 GL_TEXTURE_INTERNAL_FORMAT GL_TEXTURE_BORDER_COLOR 
 GL_TEXTURE_BORDER GL_TEXTURE_RED_SIZE
 GL_TEXTURE_GREEN_SIZE GL_TEXTURE_BLUE_SIZE GL_TEXTURE_ALPHA_SIZE
 GL_TEXTURE_LUMINANCE_SIZE GL_TEXTURE_INTENSITY_SIZE GL_TEXTURE_PRIORITY
 GL_TEXTURE_RESIDENT GL_TEXTURE_DEPTH GL_TEXTURE_WRAP_R
 GL_TEXTURE_MIN_LOD GL_TEXTURE_MAX_LOD GL_TEXTURE_BASE_LEVEL
 GL_TEXTURE_MAX_LEVEL

;;; /* HintMode */
 GL_DONT_CARE GL_FASTEST GL_NICEST 

;;; /* HintTarget */
 GL_PERSPECTIVE_CORRECTION_HINT GL_POINT_SMOOTH_HINT
 GL_LINE_SMOOTH_HINT GL_POLYGON_SMOOTH_HINT GL_FOG_HINT

;;; /* HistogramTarget */
 GL_HISTOGRAM GL_PROXY_HISTOGRAM

;;; /* IndexPointerType */
 GL_SHORT GL_INT GL_FLOAT GL_DOUBLE

;;; /* LightModelColorControl */
 GL_SINGLE_COLOR GL_SEPARATE_SPECULAR_COLOR

;;; /* LightModelParameter */
 GL_LIGHT_MODEL_AMBIENT GL_LIGHT_MODEL_LOCAL_VIEWER
 GL_LIGHT_MODEL_TWO_SIDE GL_LIGHT_MODEL_COLOR_CONTROL

;;; /* LightName */
 GL_LIGHT0 GL_LIGHT1 GL_LIGHT2 GL_LIGHT3
 GL_LIGHT4 GL_LIGHT5 GL_LIGHT6 GL_LIGHT7 

;;; /* LightParameter */
 GL_AMBIENT GL_DIFFUSE GL_SPECULAR GL_POSITION 
 GL_SPOT_DIRECTION GL_SPOT_EXPONENT GL_SPOT_CUTOFF 
 GL_CONSTANT_ATTENUATION GL_LINEAR_ATTENUATION GL_QUADRATIC_ATTENUATION 

;;; /* InterleavedArrays */
 GL_V2F GL_V3F GL_C4UB_V2F GL_C4UB_V3F GL_C3F_V3F GL_N3F_V3F
 GL_C4F_N3F_V3F GL_T2F_V3F GL_T4F_V4F GL_T2F_C4UB_V3F GL_T2F_C3F_V3F
 GL_T2F_N3F_V3F GL_T2F_C4F_N3F_V3F GL_T4F_C4F_N3F_V4F

;;; /* ListMode */
 GL_COMPILE GL_COMPILE_AND_EXECUTE 

;;; /* ListNameType */
 GL_BYTE GL_UNSIGNED_BYTE GL_SHORT GL_UNSIGNED_SHORT
 GL_INT GL_UNSIGNED_INT GL_FLOAT GL_2_BYTES GL_3_BYTES GL_4_BYTES

;;; /* LogicOp */
 GL_CLEAR GL_AND GL_AND_REVERSE GL_COPY GL_AND_INVERTED 
 GL_NOOP GL_XOR GL_OR GL_NOR GL_EQUIV GL_INVERT 
 GL_OR_REVERSE GL_COPY_INVERTED GL_OR_INVERTED 
 GL_NAND GL_SET 

;;; /* MapTarget */
 GL_MAP1_COLOR_4 GL_MAP1_INDEX GL_MAP1_NORMAL
 GL_MAP1_TEXTURE_COORD_1 GL_MAP1_TEXTURE_COORD_2
 GL_MAP1_TEXTURE_COORD_3 GL_MAP1_TEXTURE_COORD_4
 GL_MAP1_VERTEX_3 GL_MAP1_VERTEX_4 GL_MAP2_COLOR_4
 GL_MAP2_INDEX GL_MAP2_NORMAL
 GL_MAP2_TEXTURE_COORD_1 GL_MAP2_TEXTURE_COORD_2
 GL_MAP2_TEXTURE_COORD_3 GL_MAP2_TEXTURE_COORD_4
 GL_MAP2_VERTEX_3 GL_MAP2_VERTEX_4

;;; /* MaterialFace */
 GL_FRONT GL_BACK GL_FRONT_AND_BACK

;;; /* MaterialParameter */
 GL_EMISSION GL_SHININESS GL_AMBIENT_AND_DIFFUSE 
 GL_COLOR_INDEXES GL_AMBIENT GL_DIFFUSE GL_SPECULAR

;;; /* MatrixMode */
 GL_MODELVIEW GL_PROJECTION GL_TEXTURE 

;;; /* MeshMode1 */
 GL_POINT GL_LINE

;;; /* MeshMode2 */
 GL_POINT GL_LINE GL_FILL

;;; /* MinmaxTarget */
 GL_MINMAX

;;; /* NormalPointerType */
 GL_BYTE GL_SHORT GL_INT GL_FLOAT GL_DOUBLE

;;; /* PixelCopyType */
 GL_COLOR GL_DEPTH GL_STENCIL 

;;; /* PixelFormat */
 GL_COLOR_INDEX GL_STENCIL_INDEX GL_DEPTH_COMPONENT 
 GL_RED GL_GREEN GL_BLUE GL_ALPHA GL_RGB GL_RGBA 
 GL_LUMINANCE GL_LUMINANCE_ALPHA GL_ABGR

;;; /* PixelInternalFormat */
 GL_ALPHA4 GL_ALPHA8 GL_ALPHA12 GL_ALPHA16
 GL_LUMINANCE4 GL_LUMINANCE8 GL_LUMINANCE12
 GL_LUMINANCE16 GL_LUMINANCE4_ALPHA4
 GL_LUMINANCE6_ALPHA2 GL_LUMINANCE8_ALPHA8
 GL_LUMINANCE12_ALPHA4 GL_LUMINANCE12_ALPHA12
 GL_LUMINANCE16_ALPHA16
 GL_INTENSITY GL_INTENSITY4 GL_INTENSITY8
 GL_INTENSITY12 GL_INTENSITY16
 GL_R3_G3_B2 GL_RGB4 GL_RGB5 GL_RGB8 GL_RGB10 GL_RGB12 GL_RGB16
 GL_RGBA2 GL_RGBA4
 GL_RGB5_A1 GL_RGBA8 GL_RGB10_A2 GL_RGBA12 GL_RGBA16

;;; /* PixelMap */
 GL_PIXEL_MAP_I_TO_I GL_PIXEL_MAP_S_TO_S GL_PIXEL_MAP_I_TO_R
 GL_PIXEL_MAP_I_TO_G GL_PIXEL_MAP_I_TO_B GL_PIXEL_MAP_I_TO_A
 GL_PIXEL_MAP_R_TO_R GL_PIXEL_MAP_G_TO_G GL_PIXEL_MAP_B_TO_B
 GL_PIXEL_MAP_A_TO_A

;;; /* PixelStore */
 GL_UNPACK_SWAP_BYTES GL_UNPACK_LSB_FIRST GL_UNPACK_ROW_LENGTH
 GL_UNPACK_SKIP_ROWS GL_UNPACK_SKIP_PIXELS GL_UNPACK_ALIGNMENT
 GL_PACK_SWAP_BYTES GL_PACK_LSB_FIRST GL_PACK_ROW_LENGTH
 GL_PACK_SKIP_ROWS GL_PACK_SKIP_PIXELS GL_PACK_ALIGNMENT
 GL_PACK_SKIP_IMAGES GL_PACK_IMAGE_HEIGHT GL_UNPACK_SKIP_IMAGES
 GL_UNPACK_IMAGE_HEIGHT

;;; /* PixelTransfer */
 GL_MAP_COLOR GL_MAP_STENCIL GL_INDEX_SHIFT GL_INDEX_OFFSET
 GL_RED_SCALE GL_RED_BIAS GL_GREEN_SCALE GL_GREEN_BIAS
 GL_BLUE_SCALE GL_BLUE_BIAS GL_ALPHA_SCALE GL_ALPHA_BIAS
 GL_DEPTH_SCALE GL_DEPTH_BIAS GL_POST_CONVOLUTION_RED_SCALE
 GL_POST_CONVOLUTION_GREEN_SCALE GL_POST_CONVOLUTION_BLUE_SCALE
 GL_POST_CONVOLUTION_ALPHA_SCALE GL_POST_CONVOLUTION_RED_BIAS
 GL_POST_CONVOLUTION_GREEN_BIAS GL_POST_CONVOLUTION_BLUE_BIAS
 GL_POST_CONVOLUTION_ALPHA_BIAS GL_POST_COLOR_MATRIX_RED_SCALE
 GL_POST_COLOR_MATRIX_GREEN_SCALE GL_POST_COLOR_MATRIX_BLUE_SCALE
 GL_POST_COLOR_MATRIX_ALPHA_SCALE GL_POST_COLOR_MATRIX_RED_BIAS
 GL_POST_COLOR_MATRIX_GREEN_BIAS GL_POST_COLOR_MATRIX_BLUE_BIAS
 GL_POST_COLOR_MATRIX_ALPHA_BIAS

;;; /* PixelType */
 GL_BITMAP GL_BYTE GL_UNSIGNED_BYTE GL_SHORT
 GL_UNSIGNED_SHORT GL_INT GL_UNSIGNED_INT
 GL_FLOAT GL_BGR GL_BGRA
 GL_UNSIGNED_BYTE_3_3_2 GL_UNSIGNED_SHORT_4_4_4_4
 GL_UNSIGNED_SHORT_5_5_5_1 GL_UNSIGNED_INT_8_8_8_8
 GL_UNSIGNED_INT_10_10_10_2 GL_UNSIGNED_SHORT_5_6_5
 GL_UNSIGNED_BYTE_2_3_3_REV GL_UNSIGNED_SHORT_5_6_5_REV
 GL_UNSIGNED_SHORT_4_4_4_4_REV GL_UNSIGNED_SHORT_1_5_5_5_REV
 GL_UNSIGNED_INT_8_8_8_8_REV GL_UNSIGNED_INT_2_10_10_10_REV

;;; /* PolygonMode */
GL_POINT GL_LINE GL_FILL 

;;; /* ReadBufferMode */
 GL_FRONT_LEFT GL_FRONT_RIGHT GL_BACK_LEFT GL_BACK_RIGHT
 GL_FRONT GL_BACK GL_LEFT GL_RIGHT
 GL_AUX0 GL_AUX1 GL_AUX2 GL_AUX3

;;; /* RenderingMode */
 GL_RENDER GL_FEEDBACK GL_SELECT 

;;; /* SeparableTarget */
 GL_SEPARABLE_2D

;;; /* ShadingModel */
 GL_FLAT GL_SMOOTH 

;;; /* StencilFunction */
 GL_NEVER GL_LESS GL_EQUAL GL_LEQUAL
 GL_GREATER GL_NOTEQUAL GL_GEQUAL GL_ALWAYS

;;; /* StencilOp */
 GL_ZERO GL_KEEP GL_REPLACE GL_INCR GL_DECR GL_INVERT

;;; /* StringName */
 GL_VENDOR GL_RENDERER GL_VERSION GL_EXTENSIONS 

;;; /* TextureCoordName */
 GL_S GL_T GL_R GL_Q 

;;; /* TexCoordPointerType */
 GL_SHORT GL_INT GL_FLOAT GL_DOUBLE

;;; /* TextureEnvMode */
 GL_MODULATE GL_DECAL GL_BLEND GL_REPLACE

;;; /* TextureEnvParameter */
 GL_TEXTURE_ENV_MODE GL_TEXTURE_ENV_COLOR 

;;; /* TextureEnvTarget */
 GL_TEXTURE_ENV 

;;; /* TextureGenMode */
 GL_EYE_LINEAR GL_OBJECT_LINEAR GL_SPHERE_MAP 

;;; /* TextureGenParameter */
 GL_TEXTURE_GEN_MODE GL_OBJECT_PLANE GL_EYE_PLANE 

;;; /* TextureMagFilter */
 GL_NEAREST GL_LINEAR 

;;; /* TextureMinFilter */
 GL_NEAREST GL_LINEAR GL_NEAREST_MIPMAP_NEAREST 
 GL_LINEAR_MIPMAP_NEAREST GL_NEAREST_MIPMAP_LINEAR 
 GL_LINEAR_MIPMAP_LINEAR 

;;; /* TextureParameterName */
 GL_TEXTURE_MAG_FILTER GL_TEXTURE_MIN_FILTER 
 GL_TEXTURE_WRAP_S GL_TEXTURE_WRAP_T 
 GL_TEXTURE_BORDER_COLOR GL_TEXTURE_PRIORITY GL_TEXTURE_WRAP_R
 GL_TEXTURE_MIN_LOD GL_TEXTURE_MAX_LOD
 GL_TEXTURE_BASE_LEVEL GL_TEXTURE_MAX_LEVEL

;;; /* TextureTarget */
 GL_TEXTURE_1D GL_TEXTURE_2D GL_PROXY_TEXTURE_1D GL_PROXY_TEXTURE_2D
 GL_TEXTURE_3D GL_PROXY_TEXTURE_3D

;;; /* TextureWrapMode */
 GL_CLAMP GL_REPEAT GL_CLAMP_TO_EDGE

;;; /* VertexPointerType */
 GL_SHORT GL_INT GL_FLOAT GL_DOUBLE

;;; /* ClientAttribMask */
 GL_CLIENT_PIXEL_STORE_BIT
 GL_CLIENT_VERTEX_ARRAY_BIT  GL_CLIENT_ALL_ATTRIB_BITS 

;;; /* polygon_offset */
 GL_POLYGON_OFFSET_FACTOR GL_POLYGON_OFFSET_UNITS GL_POLYGON_OFFSET_POINT 
 GL_POLYGON_OFFSET_LINE  GL_POLYGON_OFFSET_FILL 

;;; /* texture */
 GL_ALPHA4 GL_ALPHA8 GL_ALPHA12 GL_ALPHA16 
 GL_LUMINANCE4 GL_LUMINANCE8 GL_LUMINANCE12 GL_LUMINANCE16 
 GL_LUMINANCE4_ALPHA4 GL_LUMINANCE6_ALPHA2 GL_LUMINANCE8_ALPHA8 
 GL_LUMINANCE12_ALPHA4 GL_LUMINANCE12_ALPHA12 GL_LUMINANCE16_ALPHA16 
 GL_INTENSITY GL_INTENSITY4 GL_INTENSITY8 GL_INTENSITY12 GL_INTENSITY16 
 GL_R3_G3_B2 GL_RGB4 GL_RGB5 GL_RGB8 GL_RGB10 GL_RGB12 GL_RGB16 
 GL_RGBA2 GL_RGBA4 GL_RGB5_A1 GL_RGBA8 GL_RGB10_A2 GL_RGBA12 
 GL_RGBA16 
 GL_TEXTURE_RED_SIZE GL_TEXTURE_GREEN_SIZE GL_TEXTURE_BLUE_SIZE 
 GL_TEXTURE_ALPHA_SIZE GL_TEXTURE_LUMINANCE_SIZE GL_TEXTURE_INTENSITY_SIZE 
 GL_PROXY_TEXTURE_1D GL_PROXY_TEXTURE_2D 

;;; /* texture_object */
 GL_TEXTURE_PRIORITY GL_TEXTURE_RESIDENT 
 GL_TEXTURE_BINDING_1D GL_TEXTURE_BINDING_2D GL_TEXTURE_BINDING_3D 

;;; /* vertex_array */
 GL_VERTEX_ARRAY GL_NORMAL_ARRAY GL_COLOR_ARRAY GL_INDEX_ARRAY 
 GL_TEXTURE_COORD_ARRAY GL_EDGE_FLAG_ARRAY GL_VERTEX_ARRAY_SIZE 
 GL_VERTEX_ARRAY_TYPE GL_VERTEX_ARRAY_STRIDE 
 GL_NORMAL_ARRAY_TYPE GL_NORMAL_ARRAY_STRIDE 
 GL_COLOR_ARRAY_SIZE GL_COLOR_ARRAY_TYPE GL_COLOR_ARRAY_STRIDE 
 GL_INDEX_ARRAY_TYPE GL_INDEX_ARRAY_STRIDE 
 GL_TEXTURE_COORD_ARRAY_SIZE GL_TEXTURE_COORD_ARRAY_TYPE 
 GL_TEXTURE_COORD_ARRAY_STRIDE GL_EDGE_FLAG_ARRAY_STRIDE 
 GL_VERTEX_ARRAY_POINTER GL_NORMAL_ARRAY_POINTER 
 GL_COLOR_ARRAY_POINTER GL_INDEX_ARRAY_POINTER 
 GL_TEXTURE_COORD_ARRAY_POINTER GL_EDGE_FLAG_ARRAY_POINTER 
 GL_V2F GL_V3F GL_C4UB_V2F GL_C4UB_V3F GL_C3F_V3F GL_N3F_V3F 
 GL_C4F_N3F_V3F GL_T2F_V3F GL_T4F_V4F GL_T2F_C4UB_V3F 
 GL_T2F_C3F_V3F GL_T2F_N3F_V3F GL_T2F_C4F_N3F_V3F GL_T4F_C4F_N3F_V4F 

;;; /* bgra */
 GL_BGR GL_BGRA 

;;; /* blend_color */
 GL_CONSTANT_COLOR GL_ONE_MINUS_CONSTANT_COLOR GL_CONSTANT_ALPHA 
 GL_ONE_MINUS_CONSTANT_ALPHA GL_BLEND_COLOR 

;;; /* blend_minmax */
 GL_FUNC_ADD GL_MIN GL_MAX GL_BLEND_EQUATION 

;;; /* blend_equation_separate */
 GL_BLEND_EQUATION_RGB GL_BLEND_EQUATION_ALPHA 

;;; /* blend_subtract */
 GL_FUNC_SUBTRACT GL_FUNC_REVERSE_SUBTRACT 

;;; /* color_matrix */
 GL_COLOR_MATRIX GL_COLOR_MATRIX_STACK_DEPTH 
 GL_MAX_COLOR_MATRIX_STACK_DEPTH GL_POST_COLOR_MATRIX_RED_SCALE 
 GL_POST_COLOR_MATRIX_GREEN_SCALE GL_POST_COLOR_MATRIX_BLUE_SCALE 
 GL_POST_COLOR_MATRIX_ALPHA_SCALE GL_POST_COLOR_MATRIX_RED_BIAS 
 GL_POST_COLOR_MATRIX_GREEN_BIAS GL_POST_COLOR_MATRIX_BLUE_BIAS 
 GL_POST_COLOR_MATRIX_ALPHA_BIAS 

;;; /* color_table */
 GL_COLOR_TABLE GL_POST_CONVOLUTION_COLOR_TABLE 
 GL_POST_COLOR_MATRIX_COLOR_TABLE GL_PROXY_COLOR_TABLE 
 GL_PROXY_POST_CONVOLUTION_COLOR_TABLE GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE 
 GL_COLOR_TABLE_SCALE GL_COLOR_TABLE_BIAS GL_COLOR_TABLE_FORMAT 
 GL_COLOR_TABLE_WIDTH GL_COLOR_TABLE_RED_SIZE GL_COLOR_TABLE_GREEN_SIZE 
 GL_COLOR_TABLE_BLUE_SIZE GL_COLOR_TABLE_ALPHA_SIZE
 GL_COLOR_TABLE_LUMINANCE_SIZE GL_COLOR_TABLE_INTENSITY_SIZE 

;;; /* convolution */
 GL_CONVOLUTION_1D GL_CONVOLUTION_2D GL_SEPARABLE_2D 
 GL_CONVOLUTION_BORDER_MODE GL_CONVOLUTION_FILTER_SCALE 
 GL_CONVOLUTION_FILTER_BIAS GL_REDUCE GL_CONVOLUTION_FORMAT 
 GL_CONVOLUTION_WIDTH GL_CONVOLUTION_HEIGHT 
 GL_MAX_CONVOLUTION_WIDTH GL_MAX_CONVOLUTION_HEIGHT 
 GL_POST_CONVOLUTION_RED_SCALE GL_POST_CONVOLUTION_GREEN_SCALE 
 GL_POST_CONVOLUTION_BLUE_SCALE GL_POST_CONVOLUTION_ALPHA_SCALE 
 GL_POST_CONVOLUTION_RED_BIAS GL_POST_CONVOLUTION_GREEN_BIAS 
 GL_POST_CONVOLUTION_BLUE_BIAS GL_POST_CONVOLUTION_ALPHA_BIAS 
 GL_CONSTANT_BORDER GL_REPLICATE_BORDER GL_CONVOLUTION_BORDER_COLOR 

;;; /* draw_range_elements */
 GL_MAX_ELEMENTS_VERTICES GL_MAX_ELEMENTS_INDICES 

;;; /* histogram */
 GL_HISTOGRAM GL_PROXY_HISTOGRAM GL_HISTOGRAM_WIDTH 
 GL_HISTOGRAM_FORMAT GL_HISTOGRAM_RED_SIZE GL_HISTOGRAM_GREEN_SIZE 
 GL_HISTOGRAM_BLUE_SIZE GL_HISTOGRAM_ALPHA_SIZE GL_HISTOGRAM_LUMINANCE_SIZE 
 GL_HISTOGRAM_SINK GL_MINMAX GL_MINMAX_FORMAT GL_MINMAX_SINK 
 GL_TABLE_TOO_LARGE 

;;; /* packed_pixels */
 GL_UNSIGNED_BYTE_3_3_2 GL_UNSIGNED_SHORT_4_4_4_4 GL_UNSIGNED_SHORT_5_5_5_1 
 GL_UNSIGNED_INT_8_8_8_8 GL_UNSIGNED_INT_10_10_10_2 GL_UNSIGNED_BYTE_2_3_3_REV 
 GL_UNSIGNED_SHORT_5_6_5 GL_UNSIGNED_SHORT_5_6_5_REV
 GL_UNSIGNED_SHORT_4_4_4_4_REV GL_UNSIGNED_SHORT_1_5_5_5_REV 
 GL_UNSIGNED_INT_8_8_8_8_REV GL_UNSIGNED_INT_2_10_10_10_REV 

;;; /* rescale_normal */
 GL_RESCALE_NORMAL 

;;; /* separate_specular_color */
 GL_LIGHT_MODEL_COLOR_CONTROL GL_SINGLE_COLOR GL_SEPARATE_SPECULAR_COLOR 

;;; /* texture3D */
 GL_PACK_SKIP_IMAGES GL_PACK_IMAGE_HEIGHT GL_UNPACK_SKIP_IMAGES 
 GL_UNPACK_IMAGE_HEIGHT GL_TEXTURE_3D GL_PROXY_TEXTURE_3D 
 GL_TEXTURE_DEPTH GL_TEXTURE_WRAP_R GL_MAX_3D_TEXTURE_SIZE 

;;; /* texture_edge_clamp */
 GL_CLAMP_TO_EDGE GL_CLAMP_TO_BORDER 

;;; /* texture_lod */
 GL_TEXTURE_MIN_LOD GL_TEXTURE_MAX_LOD GL_TEXTURE_BASE_LEVEL 
 GL_TEXTURE_MAX_LEVEL 

;;; /* GetTarget1_2 */
 GL_SMOOTH_POINT_SIZE_RANGE GL_SMOOTH_POINT_SIZE_GRANULARITY 
 GL_SMOOTH_LINE_WIDTH_RANGE GL_SMOOTH_LINE_WIDTH_GRANULARITY 
 GL_ALIASED_POINT_SIZE_RANGE GL_ALIASED_LINE_WIDTH_RANGE 

 GL_TEXTURE0 GL_TEXTURE1 GL_TEXTURE2 GL_TEXTURE3 GL_TEXTURE4 
 GL_TEXTURE5 GL_TEXTURE6 GL_TEXTURE7 GL_TEXTURE8 GL_TEXTURE9 
 GL_TEXTURE10 GL_TEXTURE11 GL_TEXTURE12 GL_TEXTURE13 GL_TEXTURE14 
 GL_TEXTURE15 GL_TEXTURE16 GL_TEXTURE17 GL_TEXTURE18 GL_TEXTURE19 
 GL_TEXTURE20 GL_TEXTURE21 GL_TEXTURE22 GL_TEXTURE23 GL_TEXTURE24 
 GL_TEXTURE25 GL_TEXTURE26 GL_TEXTURE27 GL_TEXTURE28 GL_TEXTURE29 
 GL_TEXTURE30 GL_TEXTURE31 GL_ACTIVE_TEXTURE GL_CLIENT_ACTIVE_TEXTURE 
 GL_MAX_TEXTURE_UNITS 

 GL_COMBINE GL_COMBINE_RGB GL_COMBINE_ALPHA GL_RGB_SCALE 
 GL_ADD_SIGNED GL_INTERPOLATE GL_CONSTANT GL_PRIMARY_COLOR 
 GL_PREVIOUS GL_SUBTRACT 

 GL_SRC0_RGB GL_SRC1_RGB GL_SRC2_RGB GL_SRC3_RGB GL_SRC4_RGB 
 GL_SRC5_RGB GL_SRC6_RGB GL_SRC7_RGB GL_SRC0_ALPHA 
 GL_SRC1_ALPHA GL_SRC2_ALPHA GL_SRC3_ALPHA GL_SRC4_ALPHA 
 GL_SRC5_ALPHA GL_SRC6_ALPHA GL_SRC7_ALPHA 

;;; /* Obsolete */
 GL_SOURCE0_RGB GL_SOURCE1_RGB GL_SOURCE2_RGB GL_SOURCE3_RGB 
 GL_SOURCE4_RGB GL_SOURCE5_RGB GL_SOURCE6_RGB GL_SOURCE7_RGB 
 GL_SOURCE0_ALPHA GL_SOURCE1_ALPHA GL_SOURCE2_ALPHA GL_SOURCE3_ALPHA 
 GL_SOURCE4_ALPHA GL_SOURCE5_ALPHA GL_SOURCE6_ALPHA GL_SOURCE7_ALPHA 

 GL_OPERAND0_RGB GL_OPERAND1_RGB GL_OPERAND2_RGB GL_OPERAND3_RGB 
 GL_OPERAND4_RGB GL_OPERAND5_RGB GL_OPERAND6_RGB GL_OPERAND7_RGB 
 GL_OPERAND0_ALPHA GL_OPERAND1_ALPHA GL_OPERAND2_ALPHA GL_OPERAND3_ALPHA 
 GL_OPERAND4_ALPHA GL_OPERAND5_ALPHA GL_OPERAND6_ALPHA GL_OPERAND7_ALPHA 

 GL_DOT3_RGB GL_DOT3_RGBA 

 GL_TRANSPOSE_MODELVIEW_MATRIX GL_TRANSPOSE_PROJECTION_MATRIX 
 GL_TRANSPOSE_TEXTURE_MATRIX GL_TRANSPOSE_COLOR_MATRIX 

 GL_NORMAL_MAP GL_REFLECTION_MAP GL_TEXTURE_CUBE_MAP 
 GL_TEXTURE_BINDING_CUBE_MAP 
 GL_TEXTURE_CUBE_MAP_POSITIVE_X GL_TEXTURE_CUBE_MAP_NEGATIVE_X 
 GL_TEXTURE_CUBE_MAP_POSITIVE_Y GL_TEXTURE_CUBE_MAP_NEGATIVE_Y 
 GL_TEXTURE_CUBE_MAP_POSITIVE_Z GL_TEXTURE_CUBE_MAP_NEGATIVE_Z 
 GL_PROXY_TEXTURE_CUBE_MAP GL_MAX_CUBE_MAP_TEXTURE_SIZE 

 GL_COMPRESSED_ALPHA GL_COMPRESSED_LUMINANCE 
 GL_COMPRESSED_LUMINANCE_ALPHA GL_COMPRESSED_INTENSITY 
 GL_COMPRESSED_RGB GL_COMPRESSED_RGBA 
 GL_TEXTURE_COMPRESSION_HINT GL_TEXTURE_COMPRESSED_IMAGE_SIZE 
 GL_TEXTURE_COMPRESSED GL_NUM_COMPRESSED_TEXTURE_FORMATS 
 GL_COMPRESSED_TEXTURE_FORMATS 

 GL_MULTISAMPLE GL_SAMPLE_ALPHA_TO_COVERAGE GL_SAMPLE_ALPHA_TO_ONE 
 GL_SAMPLE_COVERAGE GL_SAMPLE_BUFFERS GL_SAMPLES 
 GL_SAMPLE_COVERAGE_VALUE GL_SAMPLE_COVERAGE_INVERT GL_MULTISAMPLE_BIT 

 GL_DEPTH_COMPONENT16 GL_DEPTH_COMPONENT24 GL_DEPTH_COMPONENT32 
 GL_TEXTURE_DEPTH_SIZE GL_DEPTH_TEXTURE_MODE 

 GL_TEXTURE_COMPARE_MODE GL_TEXTURE_COMPARE_FUNC GL_COMPARE_R_TO_TEXTURE 

;;; /* occlusion_query */
 GL_QUERY_COUNTER_BITS GL_CURRENT_QUERY GL_QUERY_RESULT 
 GL_QUERY_RESULT_AVAILABLE GL_SAMPLES_PASSED 

 GL_FOG_COORD_SRC GL_FOG_COORD GL_FRAGMENT_DEPTH 
 GL_CURRENT_FOG_COORD GL_FOG_COORD_ARRAY_TYPE 
 GL_FOG_COORD_ARRAY_STRIDE GL_FOG_COORD_ARRAY_POINTER 
 GL_FOG_COORD_ARRAY 

;;; /* Obsolete */
 GL_FOG_COORDINATE_SOURCE GL_FOG_COORDINATE 
 GL_CURRENT_FOG_COORDINATE GL_FOG_COORDINATE_ARRAY_TYPE 
 GL_FOG_COORDINATE_ARRAY_STRIDE GL_FOG_COORDINATE_ARRAY_POINTER 
 GL_FOG_COORDINATE_ARRAY 

 GL_COLOR_SUM GL_CURRENT_SECONDARY_COLOR GL_SECONDARY_COLOR_ARRAY_SIZE 
 GL_SECONDARY_COLOR_ARRAY_TYPE GL_SECONDARY_COLOR_ARRAY_STRIDE 
 GL_SECONDARY_COLOR_ARRAY_POINTER GL_SECONDARY_COLOR_ARRAY 

 GL_POINT_SIZE_MIN GL_POINT_SIZE_MAX 
 GL_POINT_FADE_THRESHOLD_SIZE GL_POINT_DISTANCE_ATTENUATION 

 GL_BLEND_DST_RGB GL_BLEND_SRC_RGB GL_BLEND_DST_ALPHA 
 GL_BLEND_SRC_ALPHA 

 GL_GENERATE_MIPMAP GL_GENERATE_MIPMAP_HINT 

 GL_INCR_WRAP GL_DECR_WRAP 

 GL_MIRRORED_REPEAT 

 GL_MAX_TEXTURE_LOD_BIAS GL_TEXTURE_FILTER_CONTROL GL_TEXTURE_LOD_BIAS 

;;; /* vertex_buffer_object */
 GL_ARRAY_BUFFER GL_ELEMENT_ARRAY_BUFFER GL_ARRAY_BUFFER_BINDING 
 GL_ELEMENT_ARRAY_BUFFER_BINDING GL_VERTEX_ARRAY_BUFFER_BINDING 
 GL_NORMAL_ARRAY_BUFFER_BINDING GL_COLOR_ARRAY_BUFFER_BINDING 
 GL_INDEX_ARRAY_BUFFER_BINDING GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING 
 GL_EDGE_FLAG_ARRAY_BUFFER_BINDING GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING 
 GL_FOG_COORD_ARRAY_BUFFER_BINDING GL_WEIGHT_ARRAY_BUFFER_BINDING 
 GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING 
 GL_STREAM_DRAW GL_STREAM_READ GL_STREAM_COPY GL_STATIC_DRAW 
 GL_STATIC_READ GL_STATIC_COPY GL_DYNAMIC_DRAW GL_DYNAMIC_READ 
 GL_DYNAMIC_COPY GL_READ_ONLY GL_WRITE_ONLY GL_READ_WRITE 
 GL_BUFFER_SIZE GL_BUFFER_USAGE GL_BUFFER_ACCESS 
 GL_BUFFER_MAPPED GL_BUFFER_MAP_POINTER 
;;; /* Obsolete */
 GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING 

;;; /* OpenGL20 */
 GL_CURRENT_PROGRAM GL_SHADER_TYPE GL_DELETE_STATUS 
 GL_COMPILE_STATUS GL_LINK_STATUS GL_VALIDATE_STATUS 
 GL_INFO_LOG_LENGTH GL_ATTACHED_SHADERS GL_ACTIVE_UNIFORMS 
 GL_ACTIVE_UNIFORM_MAX_LENGTH GL_SHADER_SOURCE_LENGTH 
 GL_FLOAT_VEC2 GL_FLOAT_VEC3 GL_FLOAT_VEC4 
 GL_INT_VEC2 GL_INT_VEC3 GL_INT_VEC4 
 GL_BOOL GL_BOOL_VEC2 GL_BOOL_VEC3 GL_BOOL_VEC4 
 GL_FLOAT_MAT2 GL_FLOAT_MAT3 GL_FLOAT_MAT4 
 GL_SAMPLER_1D GL_SAMPLER_2D GL_SAMPLER_3D
 GL_SAMPLER_CUBE GL_SAMPLER_1D_SHADOW GL_SAMPLER_2D_SHADOW 
 GL_SHADING_LANGUAGE_VERSION GL_VERTEX_SHADER 
 GL_MAX_VERTEX_UNIFORM_COMPONENTS GL_MAX_VARYING_FLOATS 
 GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS 
 GL_ACTIVE_ATTRIBUTES GL_ACTIVE_ATTRIBUTE_MAX_LENGTH 
 GL_FRAGMENT_SHADER GL_MAX_FRAGMENT_UNIFORM_COMPONENTS 
 GL_FRAGMENT_SHADER_DERIVATIVE_HINT 
 GL_MAX_VERTEX_ATTRIBS GL_VERTEX_ATTRIB_ARRAY_ENABLED 
 GL_VERTEX_ATTRIB_ARRAY_SIZE GL_VERTEX_ATTRIB_ARRAY_STRIDE 
 GL_VERTEX_ATTRIB_ARRAY_TYPE GL_VERTEX_ATTRIB_ARRAY_NORMALIZED 
 GL_CURRENT_VERTEX_ATTRIB GL_VERTEX_ATTRIB_ARRAY_POINTER 
 GL_VERTEX_PROGRAM_POINT_SIZE GL_VERTEX_PROGRAM_TWO_SIDE 
 GL_MAX_TEXTURE_COORDS GL_MAX_TEXTURE_IMAGE_UNITS 
 GL_MAX_DRAW_BUFFERS 
 GL_DRAW_BUFFER0 GL_DRAW_BUFFER1 GL_DRAW_BUFFER2 GL_DRAW_BUFFER3 
 GL_DRAW_BUFFER4 GL_DRAW_BUFFER5 GL_DRAW_BUFFER6 GL_DRAW_BUFFER7 
 GL_DRAW_BUFFER8 GL_DRAW_BUFFER9 GL_DRAW_BUFFER10 GL_DRAW_BUFFER11 
 GL_DRAW_BUFFER12 GL_DRAW_BUFFER13 GL_DRAW_BUFFER14 GL_DRAW_BUFFER15 
 GL_POINT_SPRITE GL_COORD_REPLACE GL_POINT_SPRITE_COORD_ORIGIN 
 GL_LOWER_LEFT GL_UPPER_LEFT 
 GL_STENCIL_BACK_FUNC GL_STENCIL_BACK_VALUE_MASK GL_STENCIL_BACK_REF 
 GL_STENCIL_BACK_FAIL GL_STENCIL_BACK_PASS_DEPTH_FAIL
 GL_STENCIL_BACK_PASS_DEPTH_PASS GL_STENCIL_BACK_WRITEMASK 

;;; /* For compatibility with OpenGL v1.0 */
 GL_LOGIC_OP GL_TEXTURE_COMPONENTS
 )
