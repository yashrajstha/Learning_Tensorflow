       ŁK"	   ôRiÖAbrain.Event:2ečš#
     ÇAĂá	š9ôRiÖA"
\
data/center_wordsPlaceholder*
dtype0*
shape:*
_output_shapes	
:
d
data/target_wordsPlaceholder*
dtype0*
shape:	*
_output_shapes
:	
v
%embedding_matrix/random_uniform/shapeConst*
dtype0*
valueB"PĂ     *
_output_shapes
:
h
#embedding_matrix/random_uniform/minConst*
dtype0*
valueB
 *  ż*
_output_shapes
: 
h
#embedding_matrix/random_uniform/maxConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
ˇ
-embedding_matrix/random_uniform/RandomUniformRandomUniform%embedding_matrix/random_uniform/shape*
dtype0*
seed2 *

seed *
T0*!
_output_shapes
:Đ

#embedding_matrix/random_uniform/subSub#embedding_matrix/random_uniform/max#embedding_matrix/random_uniform/min*
T0*
_output_shapes
: 
Ş
#embedding_matrix/random_uniform/mulMul-embedding_matrix/random_uniform/RandomUniform#embedding_matrix/random_uniform/sub*
T0*!
_output_shapes
:Đ

embedding_matrix/random_uniformAdd#embedding_matrix/random_uniform/mul#embedding_matrix/random_uniform/min*
T0*!
_output_shapes
:Đ

embedding_matrix/embed_matrix
VariableV2*
dtype0*
shape:Đ*
	container *
shared_name *!
_output_shapes
:Đ
ő
$embedding_matrix/embed_matrix/AssignAssignembedding_matrix/embed_matrixembedding_matrix/random_uniform*
validate_shape(*0
_class&
$"loc:@embedding_matrix/embed_matrix*
use_locking(*
T0*!
_output_shapes
:Đ
Ť
"embedding_matrix/embed_matrix/readIdentityembedding_matrix/embed_matrix*0
_class&
$"loc:@embedding_matrix/embed_matrix*
T0*!
_output_shapes
:Đ
Ö

loss/embedGather"embedding_matrix/embed_matrix/readdata/center_words*
validate_indices(*
Tparams0*
Tindices0*0
_class&
$"loc:@embedding_matrix/embed_matrix* 
_output_shapes
:

l
loss/truncated_normal/shapeConst*
dtype0*
valueB"PĂ     *
_output_shapes
:
_
loss/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
a
loss/truncated_normal/stddevConst*
dtype0*
valueB
 *óľ=*
_output_shapes
: 
§
%loss/truncated_normal/TruncatedNormalTruncatedNormalloss/truncated_normal/shape*
dtype0*
seed2 *

seed *
T0*!
_output_shapes
:Đ

loss/truncated_normal/mulMul%loss/truncated_normal/TruncatedNormalloss/truncated_normal/stddev*
T0*!
_output_shapes
:Đ

loss/truncated_normalAddloss/truncated_normal/mulloss/truncated_normal/mean*
T0*!
_output_shapes
:Đ

loss/nce_weight
VariableV2*
dtype0*
shape:Đ*
	container *
shared_name *!
_output_shapes
:Đ
Á
loss/nce_weight/AssignAssignloss/nce_weightloss/truncated_normal*
validate_shape(*"
_class
loc:@loss/nce_weight*
use_locking(*
T0*!
_output_shapes
:Đ

loss/nce_weight/readIdentityloss/nce_weight*"
_class
loc:@loss/nce_weight*
T0*!
_output_shapes
:Đ
[

loss/zerosConst*
dtype0*
valueBĐ*    *
_output_shapes

:Đ
}
loss/nce_bias
VariableV2*
dtype0*
shape:Đ*
	container *
shared_name *
_output_shapes

:Đ
Ť
loss/nce_bias/AssignAssignloss/nce_bias
loss/zeros*
validate_shape(* 
_class
loc:@loss/nce_bias*
use_locking(*
T0*
_output_shapes

:Đ
v
loss/nce_bias/readIdentityloss/nce_bias* 
_class
loc:@loss/nce_bias*
T0*
_output_shapes

:Đ
f
loss/nce_loss/CastCastdata/target_words*

DstT0	*

SrcT0*
_output_shapes
:	
n
loss/nce_loss/Reshape/shapeConst*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:

loss/nce_loss/ReshapeReshapeloss/nce_loss/Castloss/nce_loss/Reshape/shape*
_output_shapes	
:*
T0	*
Tshape0
ä
(loss/nce_loss/LogUniformCandidateSamplerLogUniformCandidateSamplerloss/nce_loss/Cast*
num_sampled@*+
_output_shapes
:@:	:@*
	range_maxĐ*
seed2 *

seed *
num_true*
unique(
y
loss/nce_loss/StopGradientStopGradient(loss/nce_loss/LogUniformCandidateSampler*
T0	*
_output_shapes
:@

loss/nce_loss/StopGradient_1StopGradient*loss/nce_loss/LogUniformCandidateSampler:1*
T0*
_output_shapes
:	
}
loss/nce_loss/StopGradient_2StopGradient*loss/nce_loss/LogUniformCandidateSampler:2*
T0*
_output_shapes
:@
[
loss/nce_loss/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Š
loss/nce_loss/concatConcatV2loss/nce_loss/Reshapeloss/nce_loss/StopGradientloss/nce_loss/concat/axis*
N*

Tidx0*
_output_shapes	
:Ŕ*
T0	
Ń
loss/nce_loss/embedding_lookupGatherloss/nce_weight/readloss/nce_loss/concat*
validate_indices(*
Tparams0*
Tindices0	*"
_class
loc:@loss/nce_weight* 
_output_shapes
:
Ŕ
^
loss/nce_loss/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
k
!loss/nce_loss/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
m
#loss/nce_loss/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
m
#loss/nce_loss/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ż
loss/nce_loss/strided_sliceStridedSliceloss/nce_loss/Shape!loss/nce_loss/strided_slice/stack#loss/nce_loss/strided_slice/stack_1#loss/nce_loss/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
`
loss/nce_loss/stack/1Const*
dtype0*
valueB :
˙˙˙˙˙˙˙˙˙*
_output_shapes
: 

loss/nce_loss/stackPackloss/nce_loss/strided_sliceloss/nce_loss/stack/1*
N*
T0*
_output_shapes
:*

axis 
j
loss/nce_loss/Slice/beginConst*
dtype0*
valueB"        *
_output_shapes
:
´
loss/nce_loss/SliceSliceloss/nce_loss/embedding_lookuploss/nce_loss/Slice/beginloss/nce_loss/stack*
Index0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
`
loss/nce_loss/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
m
#loss/nce_loss/strided_slice_1/stackConst*
dtype0*
valueB: *
_output_shapes
:
o
%loss/nce_loss/strided_slice_1/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
É
loss/nce_loss/strided_slice_1StridedSliceloss/nce_loss/Shape_1#loss/nce_loss/strided_slice_1/stack%loss/nce_loss/strided_slice_1/stack_1%loss/nce_loss/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Y
loss/nce_loss/stack_1/1Const*
dtype0*
value	B : *
_output_shapes
: 

loss/nce_loss/stack_1Packloss/nce_loss/strided_slice_1loss/nce_loss/stack_1/1*
N*
T0*
_output_shapes
:*

axis 
k
loss/nce_loss/Slice_1/sizeConst*
dtype0*
valueB"˙˙˙˙˙˙˙˙*
_output_shapes
:
ą
loss/nce_loss/Slice_1Sliceloss/nce_loss/embedding_lookuploss/nce_loss/stack_1loss/nce_loss/Slice_1/size*
Index0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

loss/nce_loss/MatMulMatMul
loss/embedloss/nce_loss/Slice_1*
transpose_b(*
transpose_a( *
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ę
 loss/nce_loss/embedding_lookup_1Gatherloss/nce_bias/readloss/nce_loss/concat*
validate_indices(*
Tparams0*
Tindices0	* 
_class
loc:@loss/nce_bias*
_output_shapes	
:Ŕ
`
loss/nce_loss/Shape_2Const*
dtype0*
valueB:*
_output_shapes
:
e
loss/nce_loss/Slice_2/beginConst*
dtype0*
valueB: *
_output_shapes
:
§
loss/nce_loss/Slice_2Slice loss/nce_loss/embedding_lookup_1loss/nce_loss/Slice_2/beginloss/nce_loss/Shape_2*
Index0*
T0*
_output_shapes	
:
`
loss/nce_loss/Shape_3Const*
dtype0*
valueB:*
_output_shapes
:
m
loss/nce_loss/Slice_3/sizeConst*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:
Ľ
loss/nce_loss/Slice_3Slice loss/nce_loss/embedding_lookup_1loss/nce_loss/Shape_3loss/nce_loss/Slice_3/size*
Index0*
T0*
_output_shapes
:@
h
loss/nce_loss/Shape_4Shapeloss/nce_loss/Slice*
out_type0*
T0*
_output_shapes
:
m
#loss/nce_loss/strided_slice_2/stackConst*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Í
loss/nce_loss/strided_slice_2StridedSliceloss/nce_loss/Shape_4#loss/nce_loss/strided_slice_2/stack%loss/nce_loss/strided_slice_2/stack_1%loss/nce_loss/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
p
loss/nce_loss/concat_1/values_0Const*
dtype0*
valueB"˙˙˙˙   *
_output_shapes
:
]
loss/nce_loss/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
š
loss/nce_loss/concat_1ConcatV2loss/nce_loss/concat_1/values_0loss/nce_loss/strided_slice_2loss/nce_loss/concat_1/axis*
N*

Tidx0*
_output_shapes
:*
T0
^
loss/nce_loss/ExpandDims/dimConst*
dtype0*
value	B :*
_output_shapes
: 

loss/nce_loss/ExpandDims
ExpandDims
loss/embedloss/nce_loss/ExpandDims/dim*

Tdim0*
T0*$
_output_shapes
:

loss/nce_loss/Reshape_1Reshapeloss/nce_loss/Sliceloss/nce_loss/concat_1*4
_output_shapes"
 :˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
z
loss/nce_loss/MulMulloss/nce_loss/ExpandDimsloss/nce_loss/Reshape_1*
T0*$
_output_shapes
:
r
loss/nce_loss/concat_2/values_0Const*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:
]
loss/nce_loss/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
š
loss/nce_loss/concat_2ConcatV2loss/nce_loss/concat_2/values_0loss/nce_loss/strided_slice_2loss/nce_loss/concat_2/axis*
N*

Tidx0*
_output_shapes
:*
T0

loss/nce_loss/Reshape_2Reshapeloss/nce_loss/Mulloss/nce_loss/concat_2*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
l
loss/nce_loss/Shape_5Shapeloss/nce_loss/Reshape_2*
out_type0*
T0*
_output_shapes
:
m
#loss/nce_loss/strided_slice_3/stackConst*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_3/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_3/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
É
loss/nce_loss/strided_slice_3StridedSliceloss/nce_loss/Shape_5#loss/nce_loss/strided_slice_3/stack%loss/nce_loss/strided_slice_3/stack_1%loss/nce_loss/strided_slice_3/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Y
loss/nce_loss/stack_2/1Const*
dtype0*
value	B :*
_output_shapes
: 

loss/nce_loss/stack_2Packloss/nce_loss/strided_slice_3loss/nce_loss/stack_2/1*
N*
T0*
_output_shapes
:*

axis 
]
loss/nce_loss/ones/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
}
loss/nce_loss/onesFillloss/nce_loss/stack_2loss/nce_loss/ones/Const*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ľ
loss/nce_loss/MatMul_1MatMulloss/nce_loss/Reshape_2loss/nce_loss/ones*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
p
loss/nce_loss/Reshape_3/shapeConst*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:

loss/nce_loss/Reshape_3Reshapeloss/nce_loss/MatMul_1loss/nce_loss/Reshape_3/shape*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
n
loss/nce_loss/Reshape_4/shapeConst*
dtype0*
valueB"˙˙˙˙   *
_output_shapes
:

loss/nce_loss/Reshape_4Reshapeloss/nce_loss/Reshape_3loss/nce_loss/Reshape_4/shape*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
n
loss/nce_loss/Reshape_5/shapeConst*
dtype0*
valueB"˙˙˙˙   *
_output_shapes
:

loss/nce_loss/Reshape_5Reshapeloss/nce_loss/Slice_2loss/nce_loss/Reshape_5/shape*
_output_shapes
:	*
T0*
Tshape0
t
loss/nce_loss/addAddloss/nce_loss/Reshape_4loss/nce_loss/Reshape_5*
T0*
_output_shapes
:	
q
loss/nce_loss/add_1Addloss/nce_loss/MatMulloss/nce_loss/Slice_3*
T0*
_output_shapes
:	@
`
loss/nce_loss/LogLogloss/nce_loss/StopGradient_1*
T0*
_output_shapes
:	
h
loss/nce_loss/subSubloss/nce_loss/addloss/nce_loss/Log*
T0*
_output_shapes
:	
]
loss/nce_loss/Log_1Logloss/nce_loss/StopGradient_2*
T0*
_output_shapes
:@
n
loss/nce_loss/sub_1Subloss/nce_loss/add_1loss/nce_loss/Log_1*
T0*
_output_shapes
:	@
]
loss/nce_loss/concat_3/axisConst*
dtype0*
value	B :*
_output_shapes
: 
Ś
loss/nce_loss/concat_3ConcatV2loss/nce_loss/subloss/nce_loss/sub_1loss/nce_loss/concat_3/axis*
N*

Tidx0*
_output_shapes
:	A*
T0
n
loss/nce_loss/ones_like/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
b
loss/nce_loss/ones_like/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

loss/nce_loss/ones_likeFillloss/nce_loss/ones_like/Shapeloss/nce_loss/ones_like/Const*
T0*
_output_shapes
:	
\
loss/nce_loss/truediv/yConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
|
loss/nce_loss/truedivRealDivloss/nce_loss/ones_likeloss/nce_loss/truediv/y*
T0*
_output_shapes
:	
o
loss/nce_loss/zeros_likeConst*
dtype0*
valueB	@*    *
_output_shapes
:	@
]
loss/nce_loss/concat_4/axisConst*
dtype0*
value	B :*
_output_shapes
: 
Ż
loss/nce_loss/concat_4ConcatV2loss/nce_loss/truedivloss/nce_loss/zeros_likeloss/nce_loss/concat_4/axis*
N*

Tidx0*
_output_shapes
:	A*
T0
u
loss/sampled_losses/zeros_likeConst*
dtype0*
valueB	A*    *
_output_shapes
:	A

 loss/sampled_losses/GreaterEqualGreaterEqualloss/nce_loss/concat_3loss/sampled_losses/zeros_like*
T0*
_output_shapes
:	A
¨
loss/sampled_losses/SelectSelect loss/sampled_losses/GreaterEqualloss/nce_loss/concat_3loss/sampled_losses/zeros_like*
T0*
_output_shapes
:	A
`
loss/sampled_losses/NegNegloss/nce_loss/concat_3*
T0*
_output_shapes
:	A
Ł
loss/sampled_losses/Select_1Select loss/sampled_losses/GreaterEqualloss/sampled_losses/Negloss/nce_loss/concat_3*
T0*
_output_shapes
:	A
x
loss/sampled_losses/mulMulloss/nce_loss/concat_3loss/nce_loss/concat_4*
T0*
_output_shapes
:	A
}
loss/sampled_losses/subSubloss/sampled_losses/Selectloss/sampled_losses/mul*
T0*
_output_shapes
:	A
f
loss/sampled_losses/ExpExploss/sampled_losses/Select_1*
T0*
_output_shapes
:	A
e
loss/sampled_losses/Log1pLog1ploss/sampled_losses/Exp*
T0*
_output_shapes
:	A
x
loss/sampled_lossesAddloss/sampled_losses/subloss/sampled_losses/Log1p*
T0*
_output_shapes
:	A
[

loss/ShapeConst*
dtype0*
valueB"   A   *
_output_shapes
:
b
loss/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
d
loss/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
d
loss/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

loss/strided_sliceStridedSlice
loss/Shapeloss/strided_slice/stackloss/strided_slice/stack_1loss/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
N
loss/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
n

loss/stackPackloss/strided_sliceloss/stack/1*
N*
T0*
_output_shapes
:*

axis 
T
loss/ones/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
`
	loss/onesFill
loss/stackloss/ones/Const*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

loss/MatMulMatMulloss/sampled_losses	loss/ones*
transpose_b( *
transpose_a( *
T0*
_output_shapes
:	
e
loss/Reshape/shapeConst*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:
l
loss/ReshapeReshapeloss/MatMulloss/Reshape/shape*
_output_shapes	
:*
T0*
Tshape0
T

loss/ConstConst*
dtype0*
valueB: *
_output_shapes
:
i
	loss/lossMeanloss/Reshape
loss/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
T
gradients/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
p
&gradients/loss/loss_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:

 gradients/loss/loss_grad/ReshapeReshapegradients/Fill&gradients/loss/loss_grad/Reshape/shape*
_output_shapes
:*
T0*
Tshape0
r
'gradients/loss/loss_grad/Tile/multiplesConst*
dtype0*
valueB:*
_output_shapes
:
¨
gradients/loss/loss_grad/TileTile gradients/loss/loss_grad/Reshape'gradients/loss/loss_grad/Tile/multiples*

Tmultiples0*
T0*
_output_shapes	
:
i
gradients/loss/loss_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
c
 gradients/loss/loss_grad/Shape_1Const*
dtype0*
valueB *
_output_shapes
: 
h
gradients/loss/loss_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
Ł
gradients/loss/loss_grad/ProdProdgradients/loss/loss_grad/Shapegradients/loss/loss_grad/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
j
 gradients/loss/loss_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
Š
gradients/loss/loss_grad/Prod_1Prod gradients/loss/loss_grad/Shape_1 gradients/loss/loss_grad/Const_1*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
d
"gradients/loss/loss_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 

 gradients/loss/loss_grad/MaximumMaximumgradients/loss/loss_grad/Prod_1"gradients/loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 

!gradients/loss/loss_grad/floordivFloorDivgradients/loss/loss_grad/Prod gradients/loss/loss_grad/Maximum*
T0*
_output_shapes
: 
x
gradients/loss/loss_grad/CastCast!gradients/loss/loss_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 

 gradients/loss/loss_grad/truedivRealDivgradients/loss/loss_grad/Tilegradients/loss/loss_grad/Cast*
T0*
_output_shapes	
:
r
!gradients/loss/Reshape_grad/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
Ť
#gradients/loss/Reshape_grad/ReshapeReshape gradients/loss/loss_grad/truediv!gradients/loss/Reshape_grad/Shape*
_output_shapes
:	*
T0*
Tshape0
´
!gradients/loss/MatMul_grad/MatMulMatMul#gradients/loss/Reshape_grad/Reshape	loss/ones*
transpose_b(*
transpose_a( *
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
ś
#gradients/loss/MatMul_grad/MatMul_1MatMulloss/sampled_losses#gradients/loss/Reshape_grad/Reshape*
transpose_b( *
transpose_a(*
T0*
_output_shapes

:A
}
+gradients/loss/MatMul_grad/tuple/group_depsNoOp"^gradients/loss/MatMul_grad/MatMul$^gradients/loss/MatMul_grad/MatMul_1
đ
3gradients/loss/MatMul_grad/tuple/control_dependencyIdentity!gradients/loss/MatMul_grad/MatMul,^gradients/loss/MatMul_grad/tuple/group_deps*4
_class*
(&loc:@gradients/loss/MatMul_grad/MatMul*
T0*
_output_shapes
:	A
ő
5gradients/loss/MatMul_grad/tuple/control_dependency_1Identity#gradients/loss/MatMul_grad/MatMul_1,^gradients/loss/MatMul_grad/tuple/group_deps*6
_class,
*(loc:@gradients/loss/MatMul_grad/MatMul_1*
T0*
_output_shapes

:A
y
(gradients/loss/sampled_losses_grad/ShapeConst*
dtype0*
valueB"   A   *
_output_shapes
:
{
*gradients/loss/sampled_losses_grad/Shape_1Const*
dtype0*
valueB"   A   *
_output_shapes
:
ä
8gradients/loss/sampled_losses_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/loss/sampled_losses_grad/Shape*gradients/loss/sampled_losses_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ü
&gradients/loss/sampled_losses_grad/SumSum3gradients/loss/MatMul_grad/tuple/control_dependency8gradients/loss/sampled_losses_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
ż
*gradients/loss/sampled_losses_grad/ReshapeReshape&gradients/loss/sampled_losses_grad/Sum(gradients/loss/sampled_losses_grad/Shape*
_output_shapes
:	A*
T0*
Tshape0
ŕ
(gradients/loss/sampled_losses_grad/Sum_1Sum3gradients/loss/MatMul_grad/tuple/control_dependency:gradients/loss/sampled_losses_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
Ĺ
,gradients/loss/sampled_losses_grad/Reshape_1Reshape(gradients/loss/sampled_losses_grad/Sum_1*gradients/loss/sampled_losses_grad/Shape_1*
_output_shapes
:	A*
T0*
Tshape0

3gradients/loss/sampled_losses_grad/tuple/group_depsNoOp+^gradients/loss/sampled_losses_grad/Reshape-^gradients/loss/sampled_losses_grad/Reshape_1

;gradients/loss/sampled_losses_grad/tuple/control_dependencyIdentity*gradients/loss/sampled_losses_grad/Reshape4^gradients/loss/sampled_losses_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/sampled_losses_grad/Reshape*
T0*
_output_shapes
:	A

=gradients/loss/sampled_losses_grad/tuple/control_dependency_1Identity,gradients/loss/sampled_losses_grad/Reshape_14^gradients/loss/sampled_losses_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/sampled_losses_grad/Reshape_1*
T0*
_output_shapes
:	A
}
,gradients/loss/sampled_losses/sub_grad/ShapeConst*
dtype0*
valueB"   A   *
_output_shapes
:

.gradients/loss/sampled_losses/sub_grad/Shape_1Const*
dtype0*
valueB"   A   *
_output_shapes
:
đ
<gradients/loss/sampled_losses/sub_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients/loss/sampled_losses/sub_grad/Shape.gradients/loss/sampled_losses/sub_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ě
*gradients/loss/sampled_losses/sub_grad/SumSum;gradients/loss/sampled_losses_grad/tuple/control_dependency<gradients/loss/sampled_losses/sub_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
Ë
.gradients/loss/sampled_losses/sub_grad/ReshapeReshape*gradients/loss/sampled_losses/sub_grad/Sum,gradients/loss/sampled_losses/sub_grad/Shape*
_output_shapes
:	A*
T0*
Tshape0
đ
,gradients/loss/sampled_losses/sub_grad/Sum_1Sum;gradients/loss/sampled_losses_grad/tuple/control_dependency>gradients/loss/sampled_losses/sub_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0

*gradients/loss/sampled_losses/sub_grad/NegNeg,gradients/loss/sampled_losses/sub_grad/Sum_1*
T0*
_output_shapes
:
Ď
0gradients/loss/sampled_losses/sub_grad/Reshape_1Reshape*gradients/loss/sampled_losses/sub_grad/Neg.gradients/loss/sampled_losses/sub_grad/Shape_1*
_output_shapes
:	A*
T0*
Tshape0
Ł
7gradients/loss/sampled_losses/sub_grad/tuple/group_depsNoOp/^gradients/loss/sampled_losses/sub_grad/Reshape1^gradients/loss/sampled_losses/sub_grad/Reshape_1
˘
?gradients/loss/sampled_losses/sub_grad/tuple/control_dependencyIdentity.gradients/loss/sampled_losses/sub_grad/Reshape8^gradients/loss/sampled_losses/sub_grad/tuple/group_deps*A
_class7
53loc:@gradients/loss/sampled_losses/sub_grad/Reshape*
T0*
_output_shapes
:	A
¨
Agradients/loss/sampled_losses/sub_grad/tuple/control_dependency_1Identity0gradients/loss/sampled_losses/sub_grad/Reshape_18^gradients/loss/sampled_losses/sub_grad/tuple/group_deps*C
_class9
75loc:@gradients/loss/sampled_losses/sub_grad/Reshape_1*
T0*
_output_shapes
:	A
ł
.gradients/loss/sampled_losses/Log1p_grad/add/xConst>^gradients/loss/sampled_losses_grad/tuple/control_dependency_1*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Ś
,gradients/loss/sampled_losses/Log1p_grad/addAdd.gradients/loss/sampled_losses/Log1p_grad/add/xloss/sampled_losses/Exp*
T0*
_output_shapes
:	A

3gradients/loss/sampled_losses/Log1p_grad/Reciprocal
Reciprocal,gradients/loss/sampled_losses/Log1p_grad/add*
T0*
_output_shapes
:	A
Ń
,gradients/loss/sampled_losses/Log1p_grad/mulMul=gradients/loss/sampled_losses_grad/tuple/control_dependency_13gradients/loss/sampled_losses/Log1p_grad/Reciprocal*
T0*
_output_shapes
:	A

4gradients/loss/sampled_losses/Select_grad/zeros_likeConst*
dtype0*
valueB	A*    *
_output_shapes
:	A
ý
0gradients/loss/sampled_losses/Select_grad/SelectSelect loss/sampled_losses/GreaterEqual?gradients/loss/sampled_losses/sub_grad/tuple/control_dependency4gradients/loss/sampled_losses/Select_grad/zeros_like*
T0*
_output_shapes
:	A
˙
2gradients/loss/sampled_losses/Select_grad/Select_1Select loss/sampled_losses/GreaterEqual4gradients/loss/sampled_losses/Select_grad/zeros_like?gradients/loss/sampled_losses/sub_grad/tuple/control_dependency*
T0*
_output_shapes
:	A
Ş
:gradients/loss/sampled_losses/Select_grad/tuple/group_depsNoOp1^gradients/loss/sampled_losses/Select_grad/Select3^gradients/loss/sampled_losses/Select_grad/Select_1
Ź
Bgradients/loss/sampled_losses/Select_grad/tuple/control_dependencyIdentity0gradients/loss/sampled_losses/Select_grad/Select;^gradients/loss/sampled_losses/Select_grad/tuple/group_deps*C
_class9
75loc:@gradients/loss/sampled_losses/Select_grad/Select*
T0*
_output_shapes
:	A
˛
Dgradients/loss/sampled_losses/Select_grad/tuple/control_dependency_1Identity2gradients/loss/sampled_losses/Select_grad/Select_1;^gradients/loss/sampled_losses/Select_grad/tuple/group_deps*E
_class;
97loc:@gradients/loss/sampled_losses/Select_grad/Select_1*
T0*
_output_shapes
:	A
}
,gradients/loss/sampled_losses/mul_grad/ShapeConst*
dtype0*
valueB"   A   *
_output_shapes
:

.gradients/loss/sampled_losses/mul_grad/Shape_1Const*
dtype0*
valueB"   A   *
_output_shapes
:
đ
<gradients/loss/sampled_losses/mul_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients/loss/sampled_losses/mul_grad/Shape.gradients/loss/sampled_losses/mul_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ś
*gradients/loss/sampled_losses/mul_grad/mulMulAgradients/loss/sampled_losses/sub_grad/tuple/control_dependency_1loss/nce_loss/concat_4*
T0*
_output_shapes
:	A
Ű
*gradients/loss/sampled_losses/mul_grad/SumSum*gradients/loss/sampled_losses/mul_grad/mul<gradients/loss/sampled_losses/mul_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
Ë
.gradients/loss/sampled_losses/mul_grad/ReshapeReshape*gradients/loss/sampled_losses/mul_grad/Sum,gradients/loss/sampled_losses/mul_grad/Shape*
_output_shapes
:	A*
T0*
Tshape0
¸
,gradients/loss/sampled_losses/mul_grad/mul_1Mulloss/nce_loss/concat_3Agradients/loss/sampled_losses/sub_grad/tuple/control_dependency_1*
T0*
_output_shapes
:	A
á
,gradients/loss/sampled_losses/mul_grad/Sum_1Sum,gradients/loss/sampled_losses/mul_grad/mul_1>gradients/loss/sampled_losses/mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
Ń
0gradients/loss/sampled_losses/mul_grad/Reshape_1Reshape,gradients/loss/sampled_losses/mul_grad/Sum_1.gradients/loss/sampled_losses/mul_grad/Shape_1*
_output_shapes
:	A*
T0*
Tshape0
Ł
7gradients/loss/sampled_losses/mul_grad/tuple/group_depsNoOp/^gradients/loss/sampled_losses/mul_grad/Reshape1^gradients/loss/sampled_losses/mul_grad/Reshape_1
˘
?gradients/loss/sampled_losses/mul_grad/tuple/control_dependencyIdentity.gradients/loss/sampled_losses/mul_grad/Reshape8^gradients/loss/sampled_losses/mul_grad/tuple/group_deps*A
_class7
53loc:@gradients/loss/sampled_losses/mul_grad/Reshape*
T0*
_output_shapes
:	A
¨
Agradients/loss/sampled_losses/mul_grad/tuple/control_dependency_1Identity0gradients/loss/sampled_losses/mul_grad/Reshape_18^gradients/loss/sampled_losses/mul_grad/tuple/group_deps*C
_class9
75loc:@gradients/loss/sampled_losses/mul_grad/Reshape_1*
T0*
_output_shapes
:	A
˘
*gradients/loss/sampled_losses/Exp_grad/mulMul,gradients/loss/sampled_losses/Log1p_grad/mulloss/sampled_losses/Exp*
T0*
_output_shapes
:	A

6gradients/loss/sampled_losses/Select_1_grad/zeros_likeConst*
dtype0*
valueB	A*    *
_output_shapes
:	A
ě
2gradients/loss/sampled_losses/Select_1_grad/SelectSelect loss/sampled_losses/GreaterEqual*gradients/loss/sampled_losses/Exp_grad/mul6gradients/loss/sampled_losses/Select_1_grad/zeros_like*
T0*
_output_shapes
:	A
î
4gradients/loss/sampled_losses/Select_1_grad/Select_1Select loss/sampled_losses/GreaterEqual6gradients/loss/sampled_losses/Select_1_grad/zeros_like*gradients/loss/sampled_losses/Exp_grad/mul*
T0*
_output_shapes
:	A
°
<gradients/loss/sampled_losses/Select_1_grad/tuple/group_depsNoOp3^gradients/loss/sampled_losses/Select_1_grad/Select5^gradients/loss/sampled_losses/Select_1_grad/Select_1
´
Dgradients/loss/sampled_losses/Select_1_grad/tuple/control_dependencyIdentity2gradients/loss/sampled_losses/Select_1_grad/Select=^gradients/loss/sampled_losses/Select_1_grad/tuple/group_deps*E
_class;
97loc:@gradients/loss/sampled_losses/Select_1_grad/Select*
T0*
_output_shapes
:	A
ş
Fgradients/loss/sampled_losses/Select_1_grad/tuple/control_dependency_1Identity4gradients/loss/sampled_losses/Select_1_grad/Select_1=^gradients/loss/sampled_losses/Select_1_grad/tuple/group_deps*G
_class=
;9loc:@gradients/loss/sampled_losses/Select_1_grad/Select_1*
T0*
_output_shapes
:	A
Ą
*gradients/loss/sampled_losses/Neg_grad/NegNegDgradients/loss/sampled_losses/Select_1_grad/tuple/control_dependency*
T0*
_output_shapes
:	A

gradients/AddNAddNBgradients/loss/sampled_losses/Select_grad/tuple/control_dependency?gradients/loss/sampled_losses/mul_grad/tuple/control_dependencyFgradients/loss/sampled_losses/Select_1_grad/tuple/control_dependency_1*gradients/loss/sampled_losses/Neg_grad/Neg*C
_class9
75loc:@gradients/loss/sampled_losses/Select_grad/Select*
T0*
_output_shapes
:	A*
N
l
*gradients/loss/nce_loss/concat_3_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 

)gradients/loss/nce_loss/concat_3_grad/modFloorModloss/nce_loss/concat_3/axis*gradients/loss/nce_loss/concat_3_grad/Rank*
T0*
_output_shapes
: 
|
+gradients/loss/nce_loss/concat_3_grad/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
~
-gradients/loss/nce_loss/concat_3_grad/Shape_1Const*
dtype0*
valueB"   @   *
_output_shapes
:
ô
2gradients/loss/nce_loss/concat_3_grad/ConcatOffsetConcatOffset)gradients/loss/nce_loss/concat_3_grad/mod+gradients/loss/nce_loss/concat_3_grad/Shape-gradients/loss/nce_loss/concat_3_grad/Shape_1* 
_output_shapes
::*
N
Ü
+gradients/loss/nce_loss/concat_3_grad/SliceSlicegradients/AddN2gradients/loss/nce_loss/concat_3_grad/ConcatOffset+gradients/loss/nce_loss/concat_3_grad/Shape*
Index0*
T0*
_output_shapes
:	
â
-gradients/loss/nce_loss/concat_3_grad/Slice_1Slicegradients/AddN4gradients/loss/nce_loss/concat_3_grad/ConcatOffset:1-gradients/loss/nce_loss/concat_3_grad/Shape_1*
Index0*
T0*
_output_shapes
:	@

6gradients/loss/nce_loss/concat_3_grad/tuple/group_depsNoOp,^gradients/loss/nce_loss/concat_3_grad/Slice.^gradients/loss/nce_loss/concat_3_grad/Slice_1

>gradients/loss/nce_loss/concat_3_grad/tuple/control_dependencyIdentity+gradients/loss/nce_loss/concat_3_grad/Slice7^gradients/loss/nce_loss/concat_3_grad/tuple/group_deps*>
_class4
20loc:@gradients/loss/nce_loss/concat_3_grad/Slice*
T0*
_output_shapes
:	
 
@gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency_1Identity-gradients/loss/nce_loss/concat_3_grad/Slice_17^gradients/loss/nce_loss/concat_3_grad/tuple/group_deps*@
_class6
42loc:@gradients/loss/nce_loss/concat_3_grad/Slice_1*
T0*
_output_shapes
:	@
w
&gradients/loss/nce_loss/sub_grad/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
y
(gradients/loss/nce_loss/sub_grad/Shape_1Const*
dtype0*
valueB"      *
_output_shapes
:
Ţ
6gradients/loss/nce_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/loss/nce_loss/sub_grad/Shape(gradients/loss/nce_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ă
$gradients/loss/nce_loss/sub_grad/SumSum>gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency6gradients/loss/nce_loss/sub_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
š
(gradients/loss/nce_loss/sub_grad/ReshapeReshape$gradients/loss/nce_loss/sub_grad/Sum&gradients/loss/nce_loss/sub_grad/Shape*
_output_shapes
:	*
T0*
Tshape0
ç
&gradients/loss/nce_loss/sub_grad/Sum_1Sum>gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency8gradients/loss/nce_loss/sub_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
v
$gradients/loss/nce_loss/sub_grad/NegNeg&gradients/loss/nce_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
˝
*gradients/loss/nce_loss/sub_grad/Reshape_1Reshape$gradients/loss/nce_loss/sub_grad/Neg(gradients/loss/nce_loss/sub_grad/Shape_1*
_output_shapes
:	*
T0*
Tshape0

1gradients/loss/nce_loss/sub_grad/tuple/group_depsNoOp)^gradients/loss/nce_loss/sub_grad/Reshape+^gradients/loss/nce_loss/sub_grad/Reshape_1

9gradients/loss/nce_loss/sub_grad/tuple/control_dependencyIdentity(gradients/loss/nce_loss/sub_grad/Reshape2^gradients/loss/nce_loss/sub_grad/tuple/group_deps*;
_class1
/-loc:@gradients/loss/nce_loss/sub_grad/Reshape*
T0*
_output_shapes
:	

;gradients/loss/nce_loss/sub_grad/tuple/control_dependency_1Identity*gradients/loss/nce_loss/sub_grad/Reshape_12^gradients/loss/nce_loss/sub_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/sub_grad/Reshape_1*
T0*
_output_shapes
:	
y
(gradients/loss/nce_loss/sub_1_grad/ShapeConst*
dtype0*
valueB"   @   *
_output_shapes
:
t
*gradients/loss/nce_loss/sub_1_grad/Shape_1Const*
dtype0*
valueB:@*
_output_shapes
:
ä
8gradients/loss/nce_loss/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/loss/nce_loss/sub_1_grad/Shape*gradients/loss/nce_loss/sub_1_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
é
&gradients/loss/nce_loss/sub_1_grad/SumSum@gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency_18gradients/loss/nce_loss/sub_1_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
ż
*gradients/loss/nce_loss/sub_1_grad/ReshapeReshape&gradients/loss/nce_loss/sub_1_grad/Sum(gradients/loss/nce_loss/sub_1_grad/Shape*
_output_shapes
:	@*
T0*
Tshape0
í
(gradients/loss/nce_loss/sub_1_grad/Sum_1Sum@gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency_1:gradients/loss/nce_loss/sub_1_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
z
&gradients/loss/nce_loss/sub_1_grad/NegNeg(gradients/loss/nce_loss/sub_1_grad/Sum_1*
T0*
_output_shapes
:
ž
,gradients/loss/nce_loss/sub_1_grad/Reshape_1Reshape&gradients/loss/nce_loss/sub_1_grad/Neg*gradients/loss/nce_loss/sub_1_grad/Shape_1*
_output_shapes
:@*
T0*
Tshape0

3gradients/loss/nce_loss/sub_1_grad/tuple/group_depsNoOp+^gradients/loss/nce_loss/sub_1_grad/Reshape-^gradients/loss/nce_loss/sub_1_grad/Reshape_1

;gradients/loss/nce_loss/sub_1_grad/tuple/control_dependencyIdentity*gradients/loss/nce_loss/sub_1_grad/Reshape4^gradients/loss/nce_loss/sub_1_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/sub_1_grad/Reshape*
T0*
_output_shapes
:	@

=gradients/loss/nce_loss/sub_1_grad/tuple/control_dependency_1Identity,gradients/loss/nce_loss/sub_1_grad/Reshape_14^gradients/loss/nce_loss/sub_1_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/nce_loss/sub_1_grad/Reshape_1*
T0*
_output_shapes
:@
}
&gradients/loss/nce_loss/add_grad/ShapeShapeloss/nce_loss/Reshape_4*
out_type0*
T0*
_output_shapes
:
y
(gradients/loss/nce_loss/add_grad/Shape_1Const*
dtype0*
valueB"      *
_output_shapes
:
Ţ
6gradients/loss/nce_loss/add_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/loss/nce_loss/add_grad/Shape(gradients/loss/nce_loss/add_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ţ
$gradients/loss/nce_loss/add_grad/SumSum9gradients/loss/nce_loss/sub_grad/tuple/control_dependency6gradients/loss/nce_loss/add_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
Á
(gradients/loss/nce_loss/add_grad/ReshapeReshape$gradients/loss/nce_loss/add_grad/Sum&gradients/loss/nce_loss/add_grad/Shape*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
â
&gradients/loss/nce_loss/add_grad/Sum_1Sum9gradients/loss/nce_loss/sub_grad/tuple/control_dependency8gradients/loss/nce_loss/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
ż
*gradients/loss/nce_loss/add_grad/Reshape_1Reshape&gradients/loss/nce_loss/add_grad/Sum_1(gradients/loss/nce_loss/add_grad/Shape_1*
_output_shapes
:	*
T0*
Tshape0

1gradients/loss/nce_loss/add_grad/tuple/group_depsNoOp)^gradients/loss/nce_loss/add_grad/Reshape+^gradients/loss/nce_loss/add_grad/Reshape_1

9gradients/loss/nce_loss/add_grad/tuple/control_dependencyIdentity(gradients/loss/nce_loss/add_grad/Reshape2^gradients/loss/nce_loss/add_grad/tuple/group_deps*;
_class1
/-loc:@gradients/loss/nce_loss/add_grad/Reshape*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

;gradients/loss/nce_loss/add_grad/tuple/control_dependency_1Identity*gradients/loss/nce_loss/add_grad/Reshape_12^gradients/loss/nce_loss/add_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/add_grad/Reshape_1*
T0*
_output_shapes
:	
|
(gradients/loss/nce_loss/add_1_grad/ShapeShapeloss/nce_loss/MatMul*
out_type0*
T0*
_output_shapes
:
t
*gradients/loss/nce_loss/add_1_grad/Shape_1Const*
dtype0*
valueB:@*
_output_shapes
:
ä
8gradients/loss/nce_loss/add_1_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/loss/nce_loss/add_1_grad/Shape*gradients/loss/nce_loss/add_1_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ä
&gradients/loss/nce_loss/add_1_grad/SumSum;gradients/loss/nce_loss/sub_1_grad/tuple/control_dependency8gradients/loss/nce_loss/add_1_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
Č
*gradients/loss/nce_loss/add_1_grad/ReshapeReshape&gradients/loss/nce_loss/add_1_grad/Sum(gradients/loss/nce_loss/add_1_grad/Shape*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
č
(gradients/loss/nce_loss/add_1_grad/Sum_1Sum;gradients/loss/nce_loss/sub_1_grad/tuple/control_dependency:gradients/loss/nce_loss/add_1_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
Ŕ
,gradients/loss/nce_loss/add_1_grad/Reshape_1Reshape(gradients/loss/nce_loss/add_1_grad/Sum_1*gradients/loss/nce_loss/add_1_grad/Shape_1*
_output_shapes
:@*
T0*
Tshape0

3gradients/loss/nce_loss/add_1_grad/tuple/group_depsNoOp+^gradients/loss/nce_loss/add_1_grad/Reshape-^gradients/loss/nce_loss/add_1_grad/Reshape_1

;gradients/loss/nce_loss/add_1_grad/tuple/control_dependencyIdentity*gradients/loss/nce_loss/add_1_grad/Reshape4^gradients/loss/nce_loss/add_1_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/add_1_grad/Reshape*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

=gradients/loss/nce_loss/add_1_grad/tuple/control_dependency_1Identity,gradients/loss/nce_loss/add_1_grad/Reshape_14^gradients/loss/nce_loss/add_1_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/nce_loss/add_1_grad/Reshape_1*
T0*
_output_shapes
:@

,gradients/loss/nce_loss/Reshape_4_grad/ShapeShapeloss/nce_loss/Reshape_3*
out_type0*
T0*
_output_shapes
:
Ţ
.gradients/loss/nce_loss/Reshape_4_grad/ReshapeReshape9gradients/loss/nce_loss/add_grad/tuple/control_dependency,gradients/loss/nce_loss/Reshape_4_grad/Shape*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
w
,gradients/loss/nce_loss/Reshape_5_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
Ř
.gradients/loss/nce_loss/Reshape_5_grad/ReshapeReshape;gradients/loss/nce_loss/add_grad/tuple/control_dependency_1,gradients/loss/nce_loss/Reshape_5_grad/Shape*
_output_shapes	
:*
T0*
Tshape0
Ů
*gradients/loss/nce_loss/MatMul_grad/MatMulMatMul;gradients/loss/nce_loss/add_1_grad/tuple/control_dependencyloss/nce_loss/Slice_1*
transpose_b( *
transpose_a( *
T0* 
_output_shapes
:

Ř
,gradients/loss/nce_loss/MatMul_grad/MatMul_1MatMul;gradients/loss/nce_loss/add_1_grad/tuple/control_dependency
loss/embed*
transpose_b( *
transpose_a(*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

4gradients/loss/nce_loss/MatMul_grad/tuple/group_depsNoOp+^gradients/loss/nce_loss/MatMul_grad/MatMul-^gradients/loss/nce_loss/MatMul_grad/MatMul_1

<gradients/loss/nce_loss/MatMul_grad/tuple/control_dependencyIdentity*gradients/loss/nce_loss/MatMul_grad/MatMul5^gradients/loss/nce_loss/MatMul_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/MatMul_grad/MatMul*
T0* 
_output_shapes
:

Ł
>gradients/loss/nce_loss/MatMul_grad/tuple/control_dependency_1Identity,gradients/loss/nce_loss/MatMul_grad/MatMul_15^gradients/loss/nce_loss/MatMul_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/nce_loss/MatMul_grad/MatMul_1*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
k
)gradients/loss/nce_loss/Slice_3_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 
t
*gradients/loss/nce_loss/Slice_3_grad/ShapeConst*
dtype0*
valueB:@*
_output_shapes
:
n
,gradients/loss/nce_loss/Slice_3_grad/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
Ĺ
*gradients/loss/nce_loss/Slice_3_grad/stackPack)gradients/loss/nce_loss/Slice_3_grad/Rank,gradients/loss/nce_loss/Slice_3_grad/stack/1*
N*
T0*
_output_shapes
:*

axis 
ą
,gradients/loss/nce_loss/Slice_3_grad/ReshapeReshapeloss/nce_loss/Shape_3*gradients/loss/nce_loss/Slice_3_grad/stack*
_output_shapes

:*
T0*
Tshape0
w
,gradients/loss/nce_loss/Slice_3_grad/Shape_1Const*
dtype0*
valueB:Ŕ*
_output_shapes
:
Ž
(gradients/loss/nce_loss/Slice_3_grad/subSub,gradients/loss/nce_loss/Slice_3_grad/Shape_1*gradients/loss/nce_loss/Slice_3_grad/Shape*
T0*
_output_shapes
:

*gradients/loss/nce_loss/Slice_3_grad/sub_1Sub(gradients/loss/nce_loss/Slice_3_grad/subloss/nce_loss/Shape_3*
T0*
_output_shapes
:
Č
.gradients/loss/nce_loss/Slice_3_grad/Reshape_1Reshape*gradients/loss/nce_loss/Slice_3_grad/sub_1*gradients/loss/nce_loss/Slice_3_grad/stack*
_output_shapes

:*
T0*
Tshape0
r
0gradients/loss/nce_loss/Slice_3_grad/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 

+gradients/loss/nce_loss/Slice_3_grad/concatConcatV2,gradients/loss/nce_loss/Slice_3_grad/Reshape.gradients/loss/nce_loss/Slice_3_grad/Reshape_10gradients/loss/nce_loss/Slice_3_grad/concat/axis*
N*

Tidx0*
_output_shapes

:*
T0
Ň
(gradients/loss/nce_loss/Slice_3_grad/PadPad=gradients/loss/nce_loss/add_1_grad/tuple/control_dependency_1+gradients/loss/nce_loss/Slice_3_grad/concat*
	Tpaddings0*
T0*
_output_shapes	
:Ŕ

,gradients/loss/nce_loss/Reshape_3_grad/ShapeShapeloss/nce_loss/MatMul_1*
out_type0*
T0*
_output_shapes
:
×
.gradients/loss/nce_loss/Reshape_3_grad/ReshapeReshape.gradients/loss/nce_loss/Reshape_4_grad/Reshape,gradients/loss/nce_loss/Reshape_3_grad/Shape*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
k
)gradients/loss/nce_loss/Slice_2_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 
u
*gradients/loss/nce_loss/Slice_2_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
n
,gradients/loss/nce_loss/Slice_2_grad/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
Ĺ
*gradients/loss/nce_loss/Slice_2_grad/stackPack)gradients/loss/nce_loss/Slice_2_grad/Rank,gradients/loss/nce_loss/Slice_2_grad/stack/1*
N*
T0*
_output_shapes
:*

axis 
ˇ
,gradients/loss/nce_loss/Slice_2_grad/ReshapeReshapeloss/nce_loss/Slice_2/begin*gradients/loss/nce_loss/Slice_2_grad/stack*
_output_shapes

:*
T0*
Tshape0
w
,gradients/loss/nce_loss/Slice_2_grad/Shape_1Const*
dtype0*
valueB:Ŕ*
_output_shapes
:
Ž
(gradients/loss/nce_loss/Slice_2_grad/subSub,gradients/loss/nce_loss/Slice_2_grad/Shape_1*gradients/loss/nce_loss/Slice_2_grad/Shape*
T0*
_output_shapes
:

*gradients/loss/nce_loss/Slice_2_grad/sub_1Sub(gradients/loss/nce_loss/Slice_2_grad/subloss/nce_loss/Slice_2/begin*
T0*
_output_shapes
:
Č
.gradients/loss/nce_loss/Slice_2_grad/Reshape_1Reshape*gradients/loss/nce_loss/Slice_2_grad/sub_1*gradients/loss/nce_loss/Slice_2_grad/stack*
_output_shapes

:*
T0*
Tshape0
r
0gradients/loss/nce_loss/Slice_2_grad/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 

+gradients/loss/nce_loss/Slice_2_grad/concatConcatV2,gradients/loss/nce_loss/Slice_2_grad/Reshape.gradients/loss/nce_loss/Slice_2_grad/Reshape_10gradients/loss/nce_loss/Slice_2_grad/concat/axis*
N*

Tidx0*
_output_shapes

:*
T0
Ă
(gradients/loss/nce_loss/Slice_2_grad/PadPad.gradients/loss/nce_loss/Reshape_5_grad/Reshape+gradients/loss/nce_loss/Slice_2_grad/concat*
	Tpaddings0*
T0*
_output_shapes	
:Ŕ
k
)gradients/loss/nce_loss/Slice_1_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 

*gradients/loss/nce_loss/Slice_1_grad/ShapeShapeloss/nce_loss/Slice_1*
out_type0*
T0*
_output_shapes
:
n
,gradients/loss/nce_loss/Slice_1_grad/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
Ĺ
*gradients/loss/nce_loss/Slice_1_grad/stackPack)gradients/loss/nce_loss/Slice_1_grad/Rank,gradients/loss/nce_loss/Slice_1_grad/stack/1*
N*
T0*
_output_shapes
:*

axis 
ą
,gradients/loss/nce_loss/Slice_1_grad/ReshapeReshapeloss/nce_loss/stack_1*gradients/loss/nce_loss/Slice_1_grad/stack*
_output_shapes

:*
T0*
Tshape0
}
,gradients/loss/nce_loss/Slice_1_grad/Shape_1Const*
dtype0*
valueB"Ŕ      *
_output_shapes
:
Ž
(gradients/loss/nce_loss/Slice_1_grad/subSub,gradients/loss/nce_loss/Slice_1_grad/Shape_1*gradients/loss/nce_loss/Slice_1_grad/Shape*
T0*
_output_shapes
:

*gradients/loss/nce_loss/Slice_1_grad/sub_1Sub(gradients/loss/nce_loss/Slice_1_grad/subloss/nce_loss/stack_1*
T0*
_output_shapes
:
Č
.gradients/loss/nce_loss/Slice_1_grad/Reshape_1Reshape*gradients/loss/nce_loss/Slice_1_grad/sub_1*gradients/loss/nce_loss/Slice_1_grad/stack*
_output_shapes

:*
T0*
Tshape0
r
0gradients/loss/nce_loss/Slice_1_grad/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 

+gradients/loss/nce_loss/Slice_1_grad/concatConcatV2,gradients/loss/nce_loss/Slice_1_grad/Reshape.gradients/loss/nce_loss/Slice_1_grad/Reshape_10gradients/loss/nce_loss/Slice_1_grad/concat/axis*
N*

Tidx0*
_output_shapes

:*
T0
Ř
(gradients/loss/nce_loss/Slice_1_grad/PadPad>gradients/loss/nce_loss/MatMul_grad/tuple/control_dependency_1+gradients/loss/nce_loss/Slice_1_grad/concat*
	Tpaddings0*
T0* 
_output_shapes
:
Ŕ
Ű
,gradients/loss/nce_loss/MatMul_1_grad/MatMulMatMul.gradients/loss/nce_loss/Reshape_3_grad/Reshapeloss/nce_loss/ones*
transpose_b(*
transpose_a( *
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
Ů
.gradients/loss/nce_loss/MatMul_1_grad/MatMul_1MatMulloss/nce_loss/Reshape_2.gradients/loss/nce_loss/Reshape_3_grad/Reshape*
transpose_b( *
transpose_a(*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

6gradients/loss/nce_loss/MatMul_1_grad/tuple/group_depsNoOp-^gradients/loss/nce_loss/MatMul_1_grad/MatMul/^gradients/loss/nce_loss/MatMul_1_grad/MatMul_1
­
>gradients/loss/nce_loss/MatMul_1_grad/tuple/control_dependencyIdentity,gradients/loss/nce_loss/MatMul_1_grad/MatMul7^gradients/loss/nce_loss/MatMul_1_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/nce_loss/MatMul_1_grad/MatMul*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
Ş
@gradients/loss/nce_loss/MatMul_1_grad/tuple/control_dependency_1Identity.gradients/loss/nce_loss/MatMul_1_grad/MatMul_17^gradients/loss/nce_loss/MatMul_1_grad/tuple/group_deps*A
_class7
53loc:@gradients/loss/nce_loss/MatMul_1_grad/MatMul_1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ř
gradients/AddN_1AddN(gradients/loss/nce_loss/Slice_3_grad/Pad(gradients/loss/nce_loss/Slice_2_grad/Pad*;
_class1
/-loc:@gradients/loss/nce_loss/Slice_3_grad/Pad*
T0*
_output_shapes	
:Ŕ*
N
Ł
5gradients/loss/nce_loss/embedding_lookup_1_grad/ShapeConst*
dtype0	* 
_class
loc:@loss/nce_bias*
valueB	RĐ*
_output_shapes
:
Ě
7gradients/loss/nce_loss/embedding_lookup_1_grad/ToInt32Cast5gradients/loss/nce_loss/embedding_lookup_1_grad/Shape*

DstT0* 
_class
loc:@loss/nce_bias*

SrcT0	*
_output_shapes
:
w
4gradients/loss/nce_loss/embedding_lookup_1_grad/SizeConst*
dtype0*
value
B :Ŕ*
_output_shapes
: 

>gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims/dimConst*
dtype0*
value	B : *
_output_shapes
: 
ď
:gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims
ExpandDims4gradients/loss/nce_loss/embedding_lookup_1_grad/Size>gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:

Cgradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:

Egradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stack_1Const*
dtype0*
valueB: *
_output_shapes
:

Egradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
í
=gradients/loss/nce_loss/embedding_lookup_1_grad/strided_sliceStridedSlice7gradients/loss/nce_loss/embedding_lookup_1_grad/ToInt32Cgradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stackEgradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stack_1Egradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
}
;gradients/loss/nce_loss/embedding_lookup_1_grad/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
´
6gradients/loss/nce_loss/embedding_lookup_1_grad/concatConcatV2:gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims=gradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice;gradients/loss/nce_loss/embedding_lookup_1_grad/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
Ŕ
7gradients/loss/nce_loss/embedding_lookup_1_grad/ReshapeReshapegradients/AddN_16gradients/loss/nce_loss/embedding_lookup_1_grad/concat*
_output_shapes	
:Ŕ*
T0*
Tshape0
Ę
9gradients/loss/nce_loss/embedding_lookup_1_grad/Reshape_1Reshapeloss/nce_loss/concat:gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims*
_output_shapes	
:Ŕ*
T0	*
Tshape0
x
'gradients/loss/nce_loss/ones_grad/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
Ő
%gradients/loss/nce_loss/ones_grad/SumSum@gradients/loss/nce_loss/MatMul_1_grad/tuple/control_dependency_1'gradients/loss/nce_loss/ones_grad/Const*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0

,gradients/loss/nce_loss/Reshape_2_grad/ShapeConst*
dtype0*!
valueB"         *
_output_shapes
:
ä
.gradients/loss/nce_loss/Reshape_2_grad/ReshapeReshape>gradients/loss/nce_loss/MatMul_1_grad/tuple/control_dependency,gradients/loss/nce_loss/Reshape_2_grad/Shape*$
_output_shapes
:*
T0*
Tshape0
{
&gradients/loss/nce_loss/Mul_grad/ShapeConst*
dtype0*!
valueB"         *
_output_shapes
:

(gradients/loss/nce_loss/Mul_grad/Shape_1Shapeloss/nce_loss/Reshape_1*
out_type0*
T0*
_output_shapes
:
Ţ
6gradients/loss/nce_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/loss/nce_loss/Mul_grad/Shape(gradients/loss/nce_loss/Mul_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ł
$gradients/loss/nce_loss/Mul_grad/mulMul.gradients/loss/nce_loss/Reshape_2_grad/Reshapeloss/nce_loss/Reshape_1*
T0*$
_output_shapes
:
É
$gradients/loss/nce_loss/Mul_grad/SumSum$gradients/loss/nce_loss/Mul_grad/mul6gradients/loss/nce_loss/Mul_grad/BroadcastGradientArgs*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
ž
(gradients/loss/nce_loss/Mul_grad/ReshapeReshape$gradients/loss/nce_loss/Mul_grad/Sum&gradients/loss/nce_loss/Mul_grad/Shape*$
_output_shapes
:*
T0*
Tshape0
Ś
&gradients/loss/nce_loss/Mul_grad/mul_1Mulloss/nce_loss/ExpandDims.gradients/loss/nce_loss/Reshape_2_grad/Reshape*
T0*$
_output_shapes
:
Ď
&gradients/loss/nce_loss/Mul_grad/Sum_1Sum&gradients/loss/nce_loss/Mul_grad/mul_18gradients/loss/nce_loss/Mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
Ô
*gradients/loss/nce_loss/Mul_grad/Reshape_1Reshape&gradients/loss/nce_loss/Mul_grad/Sum_1(gradients/loss/nce_loss/Mul_grad/Shape_1*4
_output_shapes"
 :˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*
T0*
Tshape0

1gradients/loss/nce_loss/Mul_grad/tuple/group_depsNoOp)^gradients/loss/nce_loss/Mul_grad/Reshape+^gradients/loss/nce_loss/Mul_grad/Reshape_1

9gradients/loss/nce_loss/Mul_grad/tuple/control_dependencyIdentity(gradients/loss/nce_loss/Mul_grad/Reshape2^gradients/loss/nce_loss/Mul_grad/tuple/group_deps*;
_class1
/-loc:@gradients/loss/nce_loss/Mul_grad/Reshape*
T0*$
_output_shapes
:
Ľ
;gradients/loss/nce_loss/Mul_grad/tuple/control_dependency_1Identity*gradients/loss/nce_loss/Mul_grad/Reshape_12^gradients/loss/nce_loss/Mul_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/Mul_grad/Reshape_1*
T0*4
_output_shapes"
 :˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
~
-gradients/loss/nce_loss/ExpandDims_grad/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
Ý
/gradients/loss/nce_loss/ExpandDims_grad/ReshapeReshape9gradients/loss/nce_loss/Mul_grad/tuple/control_dependency-gradients/loss/nce_loss/ExpandDims_grad/Shape* 
_output_shapes
:
*
T0*
Tshape0

,gradients/loss/nce_loss/Reshape_1_grad/ShapeShapeloss/nce_loss/Slice*
out_type0*
T0*
_output_shapes
:
í
.gradients/loss/nce_loss/Reshape_1_grad/ReshapeReshape;gradients/loss/nce_loss/Mul_grad/tuple/control_dependency_1,gradients/loss/nce_loss/Reshape_1_grad/Shape*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*
T0*
Tshape0
ú
gradients/AddN_2AddN<gradients/loss/nce_loss/MatMul_grad/tuple/control_dependency/gradients/loss/nce_loss/ExpandDims_grad/Reshape*=
_class3
1/loc:@gradients/loss/nce_loss/MatMul_grad/MatMul*
T0* 
_output_shapes
:
*
N
Ş
gradients/loss/embed_grad/ShapeConst*
dtype0	*0
_class&
$"loc:@embedding_matrix/embed_matrix*%
valueB	"PĂ             *
_output_shapes
:
°
!gradients/loss/embed_grad/ToInt32Castgradients/loss/embed_grad/Shape*

DstT0*0
_class&
$"loc:@embedding_matrix/embed_matrix*

SrcT0	*
_output_shapes
:
a
gradients/loss/embed_grad/SizeConst*
dtype0*
value
B :*
_output_shapes
: 
j
(gradients/loss/embed_grad/ExpandDims/dimConst*
dtype0*
value	B : *
_output_shapes
: 
­
$gradients/loss/embed_grad/ExpandDims
ExpandDimsgradients/loss/embed_grad/Size(gradients/loss/embed_grad/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:
w
-gradients/loss/embed_grad/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
y
/gradients/loss/embed_grad/strided_slice/stack_1Const*
dtype0*
valueB: *
_output_shapes
:
y
/gradients/loss/embed_grad/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

'gradients/loss/embed_grad/strided_sliceStridedSlice!gradients/loss/embed_grad/ToInt32-gradients/loss/embed_grad/strided_slice/stack/gradients/loss/embed_grad/strided_slice/stack_1/gradients/loss/embed_grad/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
g
%gradients/loss/embed_grad/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ü
 gradients/loss/embed_grad/concatConcatV2$gradients/loss/embed_grad/ExpandDims'gradients/loss/embed_grad/strided_slice%gradients/loss/embed_grad/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0

!gradients/loss/embed_grad/ReshapeReshapegradients/AddN_2 gradients/loss/embed_grad/concat* 
_output_shapes
:
*
T0*
Tshape0

#gradients/loss/embed_grad/Reshape_1Reshapedata/center_words$gradients/loss/embed_grad/ExpandDims*
_output_shapes	
:*
T0*
Tshape0
i
'gradients/loss/nce_loss/Slice_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 
{
(gradients/loss/nce_loss/Slice_grad/ShapeShapeloss/nce_loss/Slice*
out_type0*
T0*
_output_shapes
:
l
*gradients/loss/nce_loss/Slice_grad/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
ż
(gradients/loss/nce_loss/Slice_grad/stackPack'gradients/loss/nce_loss/Slice_grad/Rank*gradients/loss/nce_loss/Slice_grad/stack/1*
N*
T0*
_output_shapes
:*

axis 
ą
*gradients/loss/nce_loss/Slice_grad/ReshapeReshapeloss/nce_loss/Slice/begin(gradients/loss/nce_loss/Slice_grad/stack*
_output_shapes

:*
T0*
Tshape0
{
*gradients/loss/nce_loss/Slice_grad/Shape_1Const*
dtype0*
valueB"Ŕ      *
_output_shapes
:
¨
&gradients/loss/nce_loss/Slice_grad/subSub*gradients/loss/nce_loss/Slice_grad/Shape_1(gradients/loss/nce_loss/Slice_grad/Shape*
T0*
_output_shapes
:

(gradients/loss/nce_loss/Slice_grad/sub_1Sub&gradients/loss/nce_loss/Slice_grad/subloss/nce_loss/Slice/begin*
T0*
_output_shapes
:
Â
,gradients/loss/nce_loss/Slice_grad/Reshape_1Reshape(gradients/loss/nce_loss/Slice_grad/sub_1(gradients/loss/nce_loss/Slice_grad/stack*
_output_shapes

:*
T0*
Tshape0
p
.gradients/loss/nce_loss/Slice_grad/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
ý
)gradients/loss/nce_loss/Slice_grad/concatConcatV2*gradients/loss/nce_loss/Slice_grad/Reshape,gradients/loss/nce_loss/Slice_grad/Reshape_1.gradients/loss/nce_loss/Slice_grad/concat/axis*
N*

Tidx0*
_output_shapes

:*
T0
Ä
&gradients/loss/nce_loss/Slice_grad/PadPad.gradients/loss/nce_loss/Reshape_1_grad/Reshape)gradients/loss/nce_loss/Slice_grad/concat*
	Tpaddings0*
T0* 
_output_shapes
:
Ŕ
Ű
gradients/AddN_3AddN(gradients/loss/nce_loss/Slice_1_grad/Pad&gradients/loss/nce_loss/Slice_grad/Pad*;
_class1
/-loc:@gradients/loss/nce_loss/Slice_1_grad/Pad*
T0* 
_output_shapes
:
Ŕ*
N
°
3gradients/loss/nce_loss/embedding_lookup_grad/ShapeConst*
dtype0	*"
_class
loc:@loss/nce_weight*%
valueB	"PĂ             *
_output_shapes
:
Ę
5gradients/loss/nce_loss/embedding_lookup_grad/ToInt32Cast3gradients/loss/nce_loss/embedding_lookup_grad/Shape*

DstT0*"
_class
loc:@loss/nce_weight*

SrcT0	*
_output_shapes
:
u
2gradients/loss/nce_loss/embedding_lookup_grad/SizeConst*
dtype0*
value
B :Ŕ*
_output_shapes
: 
~
<gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
value	B : *
_output_shapes
: 
é
8gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims
ExpandDims2gradients/loss/nce_loss/embedding_lookup_grad/Size<gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:

Agradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:

Cgradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
valueB: *
_output_shapes
:

Cgradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ĺ
;gradients/loss/nce_loss/embedding_lookup_grad/strided_sliceStridedSlice5gradients/loss/nce_loss/embedding_lookup_grad/ToInt32Agradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stackCgradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stack_1Cgradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
{
9gradients/loss/nce_loss/embedding_lookup_grad/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ź
4gradients/loss/nce_loss/embedding_lookup_grad/concatConcatV28gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims;gradients/loss/nce_loss/embedding_lookup_grad/strided_slice9gradients/loss/nce_loss/embedding_lookup_grad/concat/axis*
N*

Tidx0*
_output_shapes
:*
T0
Á
5gradients/loss/nce_loss/embedding_lookup_grad/ReshapeReshapegradients/AddN_34gradients/loss/nce_loss/embedding_lookup_grad/concat* 
_output_shapes
:
Ŕ*
T0*
Tshape0
Ć
7gradients/loss/nce_loss/embedding_lookup_grad/Reshape_1Reshapeloss/nce_loss/concat8gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims*
_output_shapes	
:Ŕ*
T0	*
Tshape0
b
GradientDescent/learning_rateConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Ţ
8GradientDescent/update_embedding_matrix/embed_matrix/mulMul!gradients/loss/embed_grad/ReshapeGradientDescent/learning_rate*0
_class&
$"loc:@embedding_matrix/embed_matrix*
T0* 
_output_shapes
:

Ě
?GradientDescent/update_embedding_matrix/embed_matrix/ScatterSub
ScatterSubembedding_matrix/embed_matrix#gradients/loss/embed_grad/Reshape_18GradientDescent/update_embedding_matrix/embed_matrix/mul*
Tindices0*
use_locking( *
T0*!
_output_shapes
:Đ*0
_class&
$"loc:@embedding_matrix/embed_matrix
Ö
*GradientDescent/update_loss/nce_weight/mulMul5gradients/loss/nce_loss/embedding_lookup_grad/ReshapeGradientDescent/learning_rate*"
_class
loc:@loss/nce_weight*
T0* 
_output_shapes
:
Ŕ
¨
1GradientDescent/update_loss/nce_weight/ScatterSub
ScatterSubloss/nce_weight7gradients/loss/nce_loss/embedding_lookup_grad/Reshape_1*GradientDescent/update_loss/nce_weight/mul*
Tindices0	*
use_locking( *
T0*!
_output_shapes
:Đ*"
_class
loc:@loss/nce_weight
Ď
(GradientDescent/update_loss/nce_bias/mulMul7gradients/loss/nce_loss/embedding_lookup_1_grad/ReshapeGradientDescent/learning_rate* 
_class
loc:@loss/nce_bias*
T0*
_output_shapes	
:Ŕ

/GradientDescent/update_loss/nce_bias/ScatterSub
ScatterSubloss/nce_bias9gradients/loss/nce_loss/embedding_lookup_1_grad/Reshape_1(GradientDescent/update_loss/nce_bias/mul*
Tindices0	*
use_locking( *
T0*
_output_shapes

:Đ* 
_class
loc:@loss/nce_bias
ż
GradientDescentNoOp@^GradientDescent/update_embedding_matrix/embed_matrix/ScatterSub2^GradientDescent/update_loss/nce_weight/ScatterSub0^GradientDescent/update_loss/nce_bias/ScatterSub
c
initNoOp%^embedding_matrix/embed_matrix/Assign^loss/nce_weight/Assign^loss/nce_bias/Assign"řĹ)ü     LhÜ	6&ôRiÖAJďˇ
÷
9
Add
x"T
y"T
z"T"
Ttype:
2	
S
AddN
inputs"T*N
sum"T"
Nint(0"
Ttype:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
I
ConcatOffset

concat_dim
shape*N
offset*N"
Nint(0
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
+
Exp
x"T
y"T"
Ttype:	
2
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
4
Fill
dims

value"T
output"T"	
Ttype
>
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
7
FloorMod
x"T
y"T
z"T"
Ttype:
2	

Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	
?
GreaterEqual
x"T
y"T
z
"
Ttype:
2		
.
Identity

input"T
output"T"	
Ttype
+
Log
x"T
y"T"
Ttype:	
2
-
Log1p
x"T
y"T"
Ttype:	
2
ô
LogUniformCandidateSampler
true_classes	
sampled_candidates	
true_expected_count
sampled_expected_count"
num_trueint(0"
num_sampledint(0"
uniquebool"
	range_maxint(0"
seedint "
seed2int 
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
<
Mul
x"T
y"T
z"T"
Ttype:
2	
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
_
Pad

input"T
paddings"	Tpaddings
output"T"	
Ttype"
	Tpaddingstype0:
2	
C
Placeholder
output"dtype"
dtypetype"
shapeshape:

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
4

Reciprocal
x"T
y"T"
Ttype:
	2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
˘

ScatterSub
ref"T
indices"Tindices
updates"T

output_ref"T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( 
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
2
StopGradient

input"T
output"T"	
Ttype
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
5
Sub
x"T
y"T
z"T"
Ttype:
	2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring *1.3.02v1.3.0-rc2-20-g0787eee
\
data/center_wordsPlaceholder*
dtype0*
shape:*
_output_shapes	
:
d
data/target_wordsPlaceholder*
dtype0*
shape:	*
_output_shapes
:	
v
%embedding_matrix/random_uniform/shapeConst*
dtype0*
valueB"PĂ     *
_output_shapes
:
h
#embedding_matrix/random_uniform/minConst*
dtype0*
valueB
 *  ż*
_output_shapes
: 
h
#embedding_matrix/random_uniform/maxConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
ˇ
-embedding_matrix/random_uniform/RandomUniformRandomUniform%embedding_matrix/random_uniform/shape*
dtype0*
seed2 *

seed *
T0*!
_output_shapes
:Đ

#embedding_matrix/random_uniform/subSub#embedding_matrix/random_uniform/max#embedding_matrix/random_uniform/min*
T0*
_output_shapes
: 
Ş
#embedding_matrix/random_uniform/mulMul-embedding_matrix/random_uniform/RandomUniform#embedding_matrix/random_uniform/sub*
T0*!
_output_shapes
:Đ

embedding_matrix/random_uniformAdd#embedding_matrix/random_uniform/mul#embedding_matrix/random_uniform/min*
T0*!
_output_shapes
:Đ

embedding_matrix/embed_matrix
VariableV2*
dtype0*
shape:Đ*
shared_name *
	container *!
_output_shapes
:Đ
ő
$embedding_matrix/embed_matrix/AssignAssignembedding_matrix/embed_matrixembedding_matrix/random_uniform*
validate_shape(*0
_class&
$"loc:@embedding_matrix/embed_matrix*
use_locking(*
T0*!
_output_shapes
:Đ
Ť
"embedding_matrix/embed_matrix/readIdentityembedding_matrix/embed_matrix*0
_class&
$"loc:@embedding_matrix/embed_matrix*
T0*!
_output_shapes
:Đ
Ö

loss/embedGather"embedding_matrix/embed_matrix/readdata/center_words*
validate_indices(*
Tparams0*
Tindices0*0
_class&
$"loc:@embedding_matrix/embed_matrix* 
_output_shapes
:

l
loss/truncated_normal/shapeConst*
dtype0*
valueB"PĂ     *
_output_shapes
:
_
loss/truncated_normal/meanConst*
dtype0*
valueB
 *    *
_output_shapes
: 
a
loss/truncated_normal/stddevConst*
dtype0*
valueB
 *óľ=*
_output_shapes
: 
§
%loss/truncated_normal/TruncatedNormalTruncatedNormalloss/truncated_normal/shape*
dtype0*
seed2 *

seed *
T0*!
_output_shapes
:Đ

loss/truncated_normal/mulMul%loss/truncated_normal/TruncatedNormalloss/truncated_normal/stddev*
T0*!
_output_shapes
:Đ

loss/truncated_normalAddloss/truncated_normal/mulloss/truncated_normal/mean*
T0*!
_output_shapes
:Đ

loss/nce_weight
VariableV2*
dtype0*
shape:Đ*
shared_name *
	container *!
_output_shapes
:Đ
Á
loss/nce_weight/AssignAssignloss/nce_weightloss/truncated_normal*
validate_shape(*"
_class
loc:@loss/nce_weight*
use_locking(*
T0*!
_output_shapes
:Đ

loss/nce_weight/readIdentityloss/nce_weight*"
_class
loc:@loss/nce_weight*
T0*!
_output_shapes
:Đ
[

loss/zerosConst*
dtype0*
valueBĐ*    *
_output_shapes

:Đ
}
loss/nce_bias
VariableV2*
dtype0*
shape:Đ*
shared_name *
	container *
_output_shapes

:Đ
Ť
loss/nce_bias/AssignAssignloss/nce_bias
loss/zeros*
validate_shape(* 
_class
loc:@loss/nce_bias*
use_locking(*
T0*
_output_shapes

:Đ
v
loss/nce_bias/readIdentityloss/nce_bias* 
_class
loc:@loss/nce_bias*
T0*
_output_shapes

:Đ
f
loss/nce_loss/CastCastdata/target_words*

DstT0	*

SrcT0*
_output_shapes
:	
n
loss/nce_loss/Reshape/shapeConst*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:

loss/nce_loss/ReshapeReshapeloss/nce_loss/Castloss/nce_loss/Reshape/shape*
Tshape0*
T0	*
_output_shapes	
:
ä
(loss/nce_loss/LogUniformCandidateSamplerLogUniformCandidateSamplerloss/nce_loss/Cast*
num_sampled@*+
_output_shapes
:@:	:@*
	range_maxĐ*
seed2 *

seed *
num_true*
unique(
y
loss/nce_loss/StopGradientStopGradient(loss/nce_loss/LogUniformCandidateSampler*
T0	*
_output_shapes
:@

loss/nce_loss/StopGradient_1StopGradient*loss/nce_loss/LogUniformCandidateSampler:1*
T0*
_output_shapes
:	
}
loss/nce_loss/StopGradient_2StopGradient*loss/nce_loss/LogUniformCandidateSampler:2*
T0*
_output_shapes
:@
[
loss/nce_loss/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Š
loss/nce_loss/concatConcatV2loss/nce_loss/Reshapeloss/nce_loss/StopGradientloss/nce_loss/concat/axis*
_output_shapes	
:Ŕ*

Tidx0*
T0	*
N
Ń
loss/nce_loss/embedding_lookupGatherloss/nce_weight/readloss/nce_loss/concat*
validate_indices(*
Tparams0*
Tindices0	*"
_class
loc:@loss/nce_weight* 
_output_shapes
:
Ŕ
^
loss/nce_loss/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
k
!loss/nce_loss/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
m
#loss/nce_loss/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
m
#loss/nce_loss/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ż
loss/nce_loss/strided_sliceStridedSliceloss/nce_loss/Shape!loss/nce_loss/strided_slice/stack#loss/nce_loss/strided_slice/stack_1#loss/nce_loss/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
`
loss/nce_loss/stack/1Const*
dtype0*
valueB :
˙˙˙˙˙˙˙˙˙*
_output_shapes
: 

loss/nce_loss/stackPackloss/nce_loss/strided_sliceloss/nce_loss/stack/1*
_output_shapes
:*

axis *
T0*
N
j
loss/nce_loss/Slice/beginConst*
dtype0*
valueB"        *
_output_shapes
:
´
loss/nce_loss/SliceSliceloss/nce_loss/embedding_lookuploss/nce_loss/Slice/beginloss/nce_loss/stack*
Index0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
`
loss/nce_loss/Shape_1Const*
dtype0*
valueB:*
_output_shapes
:
m
#loss/nce_loss/strided_slice_1/stackConst*
dtype0*
valueB: *
_output_shapes
:
o
%loss/nce_loss/strided_slice_1/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
É
loss/nce_loss/strided_slice_1StridedSliceloss/nce_loss/Shape_1#loss/nce_loss/strided_slice_1/stack%loss/nce_loss/strided_slice_1/stack_1%loss/nce_loss/strided_slice_1/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Y
loss/nce_loss/stack_1/1Const*
dtype0*
value	B : *
_output_shapes
: 

loss/nce_loss/stack_1Packloss/nce_loss/strided_slice_1loss/nce_loss/stack_1/1*
_output_shapes
:*

axis *
T0*
N
k
loss/nce_loss/Slice_1/sizeConst*
dtype0*
valueB"˙˙˙˙˙˙˙˙*
_output_shapes
:
ą
loss/nce_loss/Slice_1Sliceloss/nce_loss/embedding_lookuploss/nce_loss/stack_1loss/nce_loss/Slice_1/size*
Index0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

loss/nce_loss/MatMulMatMul
loss/embedloss/nce_loss/Slice_1*
transpose_b(*
transpose_a( *
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ę
 loss/nce_loss/embedding_lookup_1Gatherloss/nce_bias/readloss/nce_loss/concat*
validate_indices(*
Tparams0*
Tindices0	* 
_class
loc:@loss/nce_bias*
_output_shapes	
:Ŕ
`
loss/nce_loss/Shape_2Const*
dtype0*
valueB:*
_output_shapes
:
e
loss/nce_loss/Slice_2/beginConst*
dtype0*
valueB: *
_output_shapes
:
§
loss/nce_loss/Slice_2Slice loss/nce_loss/embedding_lookup_1loss/nce_loss/Slice_2/beginloss/nce_loss/Shape_2*
Index0*
T0*
_output_shapes	
:
`
loss/nce_loss/Shape_3Const*
dtype0*
valueB:*
_output_shapes
:
m
loss/nce_loss/Slice_3/sizeConst*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:
Ľ
loss/nce_loss/Slice_3Slice loss/nce_loss/embedding_lookup_1loss/nce_loss/Shape_3loss/nce_loss/Slice_3/size*
Index0*
T0*
_output_shapes
:@
h
loss/nce_loss/Shape_4Shapeloss/nce_loss/Slice*
out_type0*
T0*
_output_shapes
:
m
#loss/nce_loss/strided_slice_2/stackConst*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_2/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
Í
loss/nce_loss/strided_slice_2StridedSliceloss/nce_loss/Shape_4#loss/nce_loss/strided_slice_2/stack%loss/nce_loss/strided_slice_2/stack_1%loss/nce_loss/strided_slice_2/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask 
p
loss/nce_loss/concat_1/values_0Const*
dtype0*
valueB"˙˙˙˙   *
_output_shapes
:
]
loss/nce_loss/concat_1/axisConst*
dtype0*
value	B : *
_output_shapes
: 
š
loss/nce_loss/concat_1ConcatV2loss/nce_loss/concat_1/values_0loss/nce_loss/strided_slice_2loss/nce_loss/concat_1/axis*
_output_shapes
:*

Tidx0*
T0*
N
^
loss/nce_loss/ExpandDims/dimConst*
dtype0*
value	B :*
_output_shapes
: 

loss/nce_loss/ExpandDims
ExpandDims
loss/embedloss/nce_loss/ExpandDims/dim*

Tdim0*
T0*$
_output_shapes
:

loss/nce_loss/Reshape_1Reshapeloss/nce_loss/Sliceloss/nce_loss/concat_1*
Tshape0*
T0*4
_output_shapes"
 :˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
z
loss/nce_loss/MulMulloss/nce_loss/ExpandDimsloss/nce_loss/Reshape_1*
T0*$
_output_shapes
:
r
loss/nce_loss/concat_2/values_0Const*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:
]
loss/nce_loss/concat_2/axisConst*
dtype0*
value	B : *
_output_shapes
: 
š
loss/nce_loss/concat_2ConcatV2loss/nce_loss/concat_2/values_0loss/nce_loss/strided_slice_2loss/nce_loss/concat_2/axis*
_output_shapes
:*

Tidx0*
T0*
N

loss/nce_loss/Reshape_2Reshapeloss/nce_loss/Mulloss/nce_loss/concat_2*
Tshape0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
l
loss/nce_loss/Shape_5Shapeloss/nce_loss/Reshape_2*
out_type0*
T0*
_output_shapes
:
m
#loss/nce_loss/strided_slice_3/stackConst*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_3/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
o
%loss/nce_loss/strided_slice_3/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
É
loss/nce_loss/strided_slice_3StridedSliceloss/nce_loss/Shape_5#loss/nce_loss/strided_slice_3/stack%loss/nce_loss/strided_slice_3/stack_1%loss/nce_loss/strided_slice_3/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
Y
loss/nce_loss/stack_2/1Const*
dtype0*
value	B :*
_output_shapes
: 

loss/nce_loss/stack_2Packloss/nce_loss/strided_slice_3loss/nce_loss/stack_2/1*
_output_shapes
:*

axis *
T0*
N
]
loss/nce_loss/ones/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
}
loss/nce_loss/onesFillloss/nce_loss/stack_2loss/nce_loss/ones/Const*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ľ
loss/nce_loss/MatMul_1MatMulloss/nce_loss/Reshape_2loss/nce_loss/ones*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
p
loss/nce_loss/Reshape_3/shapeConst*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:

loss/nce_loss/Reshape_3Reshapeloss/nce_loss/MatMul_1loss/nce_loss/Reshape_3/shape*
Tshape0*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
n
loss/nce_loss/Reshape_4/shapeConst*
dtype0*
valueB"˙˙˙˙   *
_output_shapes
:

loss/nce_loss/Reshape_4Reshapeloss/nce_loss/Reshape_3loss/nce_loss/Reshape_4/shape*
Tshape0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
n
loss/nce_loss/Reshape_5/shapeConst*
dtype0*
valueB"˙˙˙˙   *
_output_shapes
:

loss/nce_loss/Reshape_5Reshapeloss/nce_loss/Slice_2loss/nce_loss/Reshape_5/shape*
Tshape0*
T0*
_output_shapes
:	
t
loss/nce_loss/addAddloss/nce_loss/Reshape_4loss/nce_loss/Reshape_5*
T0*
_output_shapes
:	
q
loss/nce_loss/add_1Addloss/nce_loss/MatMulloss/nce_loss/Slice_3*
T0*
_output_shapes
:	@
`
loss/nce_loss/LogLogloss/nce_loss/StopGradient_1*
T0*
_output_shapes
:	
h
loss/nce_loss/subSubloss/nce_loss/addloss/nce_loss/Log*
T0*
_output_shapes
:	
]
loss/nce_loss/Log_1Logloss/nce_loss/StopGradient_2*
T0*
_output_shapes
:@
n
loss/nce_loss/sub_1Subloss/nce_loss/add_1loss/nce_loss/Log_1*
T0*
_output_shapes
:	@
]
loss/nce_loss/concat_3/axisConst*
dtype0*
value	B :*
_output_shapes
: 
Ś
loss/nce_loss/concat_3ConcatV2loss/nce_loss/subloss/nce_loss/sub_1loss/nce_loss/concat_3/axis*
_output_shapes
:	A*

Tidx0*
T0*
N
n
loss/nce_loss/ones_like/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
b
loss/nce_loss/ones_like/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 

loss/nce_loss/ones_likeFillloss/nce_loss/ones_like/Shapeloss/nce_loss/ones_like/Const*
T0*
_output_shapes
:	
\
loss/nce_loss/truediv/yConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
|
loss/nce_loss/truedivRealDivloss/nce_loss/ones_likeloss/nce_loss/truediv/y*
T0*
_output_shapes
:	
o
loss/nce_loss/zeros_likeConst*
dtype0*
valueB	@*    *
_output_shapes
:	@
]
loss/nce_loss/concat_4/axisConst*
dtype0*
value	B :*
_output_shapes
: 
Ż
loss/nce_loss/concat_4ConcatV2loss/nce_loss/truedivloss/nce_loss/zeros_likeloss/nce_loss/concat_4/axis*
_output_shapes
:	A*

Tidx0*
T0*
N
u
loss/sampled_losses/zeros_likeConst*
dtype0*
valueB	A*    *
_output_shapes
:	A

 loss/sampled_losses/GreaterEqualGreaterEqualloss/nce_loss/concat_3loss/sampled_losses/zeros_like*
T0*
_output_shapes
:	A
¨
loss/sampled_losses/SelectSelect loss/sampled_losses/GreaterEqualloss/nce_loss/concat_3loss/sampled_losses/zeros_like*
T0*
_output_shapes
:	A
`
loss/sampled_losses/NegNegloss/nce_loss/concat_3*
T0*
_output_shapes
:	A
Ł
loss/sampled_losses/Select_1Select loss/sampled_losses/GreaterEqualloss/sampled_losses/Negloss/nce_loss/concat_3*
T0*
_output_shapes
:	A
x
loss/sampled_losses/mulMulloss/nce_loss/concat_3loss/nce_loss/concat_4*
T0*
_output_shapes
:	A
}
loss/sampled_losses/subSubloss/sampled_losses/Selectloss/sampled_losses/mul*
T0*
_output_shapes
:	A
f
loss/sampled_losses/ExpExploss/sampled_losses/Select_1*
T0*
_output_shapes
:	A
e
loss/sampled_losses/Log1pLog1ploss/sampled_losses/Exp*
T0*
_output_shapes
:	A
x
loss/sampled_lossesAddloss/sampled_losses/subloss/sampled_losses/Log1p*
T0*
_output_shapes
:	A
[

loss/ShapeConst*
dtype0*
valueB"   A   *
_output_shapes
:
b
loss/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
d
loss/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
d
loss/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

loss/strided_sliceStridedSlice
loss/Shapeloss/strided_slice/stackloss/strided_slice/stack_1loss/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask
N
loss/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
n

loss/stackPackloss/strided_sliceloss/stack/1*
_output_shapes
:*

axis *
T0*
N
T
loss/ones/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
`
	loss/onesFill
loss/stackloss/ones/Const*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

loss/MatMulMatMulloss/sampled_losses	loss/ones*
transpose_b( *
transpose_a( *
T0*
_output_shapes
:	
e
loss/Reshape/shapeConst*
dtype0*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:
l
loss/ReshapeReshapeloss/MatMulloss/Reshape/shape*
Tshape0*
T0*
_output_shapes	
:
T

loss/ConstConst*
dtype0*
valueB: *
_output_shapes
:
i
	loss/lossMeanloss/Reshape
loss/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
R
gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
T
gradients/ConstConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
p
&gradients/loss/loss_grad/Reshape/shapeConst*
dtype0*
valueB:*
_output_shapes
:

 gradients/loss/loss_grad/ReshapeReshapegradients/Fill&gradients/loss/loss_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes
:
r
'gradients/loss/loss_grad/Tile/multiplesConst*
dtype0*
valueB:*
_output_shapes
:
¨
gradients/loss/loss_grad/TileTile gradients/loss/loss_grad/Reshape'gradients/loss/loss_grad/Tile/multiples*

Tmultiples0*
T0*
_output_shapes	
:
i
gradients/loss/loss_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
c
 gradients/loss/loss_grad/Shape_1Const*
dtype0*
valueB *
_output_shapes
: 
h
gradients/loss/loss_grad/ConstConst*
dtype0*
valueB: *
_output_shapes
:
Ł
gradients/loss/loss_grad/ProdProdgradients/loss/loss_grad/Shapegradients/loss/loss_grad/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
j
 gradients/loss/loss_grad/Const_1Const*
dtype0*
valueB: *
_output_shapes
:
Š
gradients/loss/loss_grad/Prod_1Prod gradients/loss/loss_grad/Shape_1 gradients/loss/loss_grad/Const_1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
d
"gradients/loss/loss_grad/Maximum/yConst*
dtype0*
value	B :*
_output_shapes
: 

 gradients/loss/loss_grad/MaximumMaximumgradients/loss/loss_grad/Prod_1"gradients/loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 

!gradients/loss/loss_grad/floordivFloorDivgradients/loss/loss_grad/Prod gradients/loss/loss_grad/Maximum*
T0*
_output_shapes
: 
x
gradients/loss/loss_grad/CastCast!gradients/loss/loss_grad/floordiv*

DstT0*

SrcT0*
_output_shapes
: 

 gradients/loss/loss_grad/truedivRealDivgradients/loss/loss_grad/Tilegradients/loss/loss_grad/Cast*
T0*
_output_shapes	
:
r
!gradients/loss/Reshape_grad/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
Ť
#gradients/loss/Reshape_grad/ReshapeReshape gradients/loss/loss_grad/truediv!gradients/loss/Reshape_grad/Shape*
Tshape0*
T0*
_output_shapes
:	
´
!gradients/loss/MatMul_grad/MatMulMatMul#gradients/loss/Reshape_grad/Reshape	loss/ones*
transpose_b(*
transpose_a( *
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
ś
#gradients/loss/MatMul_grad/MatMul_1MatMulloss/sampled_losses#gradients/loss/Reshape_grad/Reshape*
transpose_b( *
transpose_a(*
T0*
_output_shapes

:A
}
+gradients/loss/MatMul_grad/tuple/group_depsNoOp"^gradients/loss/MatMul_grad/MatMul$^gradients/loss/MatMul_grad/MatMul_1
đ
3gradients/loss/MatMul_grad/tuple/control_dependencyIdentity!gradients/loss/MatMul_grad/MatMul,^gradients/loss/MatMul_grad/tuple/group_deps*4
_class*
(&loc:@gradients/loss/MatMul_grad/MatMul*
T0*
_output_shapes
:	A
ő
5gradients/loss/MatMul_grad/tuple/control_dependency_1Identity#gradients/loss/MatMul_grad/MatMul_1,^gradients/loss/MatMul_grad/tuple/group_deps*6
_class,
*(loc:@gradients/loss/MatMul_grad/MatMul_1*
T0*
_output_shapes

:A
y
(gradients/loss/sampled_losses_grad/ShapeConst*
dtype0*
valueB"   A   *
_output_shapes
:
{
*gradients/loss/sampled_losses_grad/Shape_1Const*
dtype0*
valueB"   A   *
_output_shapes
:
ä
8gradients/loss/sampled_losses_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/loss/sampled_losses_grad/Shape*gradients/loss/sampled_losses_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ü
&gradients/loss/sampled_losses_grad/SumSum3gradients/loss/MatMul_grad/tuple/control_dependency8gradients/loss/sampled_losses_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
ż
*gradients/loss/sampled_losses_grad/ReshapeReshape&gradients/loss/sampled_losses_grad/Sum(gradients/loss/sampled_losses_grad/Shape*
Tshape0*
T0*
_output_shapes
:	A
ŕ
(gradients/loss/sampled_losses_grad/Sum_1Sum3gradients/loss/MatMul_grad/tuple/control_dependency:gradients/loss/sampled_losses_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
Ĺ
,gradients/loss/sampled_losses_grad/Reshape_1Reshape(gradients/loss/sampled_losses_grad/Sum_1*gradients/loss/sampled_losses_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:	A

3gradients/loss/sampled_losses_grad/tuple/group_depsNoOp+^gradients/loss/sampled_losses_grad/Reshape-^gradients/loss/sampled_losses_grad/Reshape_1

;gradients/loss/sampled_losses_grad/tuple/control_dependencyIdentity*gradients/loss/sampled_losses_grad/Reshape4^gradients/loss/sampled_losses_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/sampled_losses_grad/Reshape*
T0*
_output_shapes
:	A

=gradients/loss/sampled_losses_grad/tuple/control_dependency_1Identity,gradients/loss/sampled_losses_grad/Reshape_14^gradients/loss/sampled_losses_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/sampled_losses_grad/Reshape_1*
T0*
_output_shapes
:	A
}
,gradients/loss/sampled_losses/sub_grad/ShapeConst*
dtype0*
valueB"   A   *
_output_shapes
:

.gradients/loss/sampled_losses/sub_grad/Shape_1Const*
dtype0*
valueB"   A   *
_output_shapes
:
đ
<gradients/loss/sampled_losses/sub_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients/loss/sampled_losses/sub_grad/Shape.gradients/loss/sampled_losses/sub_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ě
*gradients/loss/sampled_losses/sub_grad/SumSum;gradients/loss/sampled_losses_grad/tuple/control_dependency<gradients/loss/sampled_losses/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
Ë
.gradients/loss/sampled_losses/sub_grad/ReshapeReshape*gradients/loss/sampled_losses/sub_grad/Sum,gradients/loss/sampled_losses/sub_grad/Shape*
Tshape0*
T0*
_output_shapes
:	A
đ
,gradients/loss/sampled_losses/sub_grad/Sum_1Sum;gradients/loss/sampled_losses_grad/tuple/control_dependency>gradients/loss/sampled_losses/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:

*gradients/loss/sampled_losses/sub_grad/NegNeg,gradients/loss/sampled_losses/sub_grad/Sum_1*
T0*
_output_shapes
:
Ď
0gradients/loss/sampled_losses/sub_grad/Reshape_1Reshape*gradients/loss/sampled_losses/sub_grad/Neg.gradients/loss/sampled_losses/sub_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:	A
Ł
7gradients/loss/sampled_losses/sub_grad/tuple/group_depsNoOp/^gradients/loss/sampled_losses/sub_grad/Reshape1^gradients/loss/sampled_losses/sub_grad/Reshape_1
˘
?gradients/loss/sampled_losses/sub_grad/tuple/control_dependencyIdentity.gradients/loss/sampled_losses/sub_grad/Reshape8^gradients/loss/sampled_losses/sub_grad/tuple/group_deps*A
_class7
53loc:@gradients/loss/sampled_losses/sub_grad/Reshape*
T0*
_output_shapes
:	A
¨
Agradients/loss/sampled_losses/sub_grad/tuple/control_dependency_1Identity0gradients/loss/sampled_losses/sub_grad/Reshape_18^gradients/loss/sampled_losses/sub_grad/tuple/group_deps*C
_class9
75loc:@gradients/loss/sampled_losses/sub_grad/Reshape_1*
T0*
_output_shapes
:	A
ł
.gradients/loss/sampled_losses/Log1p_grad/add/xConst>^gradients/loss/sampled_losses_grad/tuple/control_dependency_1*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Ś
,gradients/loss/sampled_losses/Log1p_grad/addAdd.gradients/loss/sampled_losses/Log1p_grad/add/xloss/sampled_losses/Exp*
T0*
_output_shapes
:	A

3gradients/loss/sampled_losses/Log1p_grad/Reciprocal
Reciprocal,gradients/loss/sampled_losses/Log1p_grad/add*
T0*
_output_shapes
:	A
Ń
,gradients/loss/sampled_losses/Log1p_grad/mulMul=gradients/loss/sampled_losses_grad/tuple/control_dependency_13gradients/loss/sampled_losses/Log1p_grad/Reciprocal*
T0*
_output_shapes
:	A

4gradients/loss/sampled_losses/Select_grad/zeros_likeConst*
dtype0*
valueB	A*    *
_output_shapes
:	A
ý
0gradients/loss/sampled_losses/Select_grad/SelectSelect loss/sampled_losses/GreaterEqual?gradients/loss/sampled_losses/sub_grad/tuple/control_dependency4gradients/loss/sampled_losses/Select_grad/zeros_like*
T0*
_output_shapes
:	A
˙
2gradients/loss/sampled_losses/Select_grad/Select_1Select loss/sampled_losses/GreaterEqual4gradients/loss/sampled_losses/Select_grad/zeros_like?gradients/loss/sampled_losses/sub_grad/tuple/control_dependency*
T0*
_output_shapes
:	A
Ş
:gradients/loss/sampled_losses/Select_grad/tuple/group_depsNoOp1^gradients/loss/sampled_losses/Select_grad/Select3^gradients/loss/sampled_losses/Select_grad/Select_1
Ź
Bgradients/loss/sampled_losses/Select_grad/tuple/control_dependencyIdentity0gradients/loss/sampled_losses/Select_grad/Select;^gradients/loss/sampled_losses/Select_grad/tuple/group_deps*C
_class9
75loc:@gradients/loss/sampled_losses/Select_grad/Select*
T0*
_output_shapes
:	A
˛
Dgradients/loss/sampled_losses/Select_grad/tuple/control_dependency_1Identity2gradients/loss/sampled_losses/Select_grad/Select_1;^gradients/loss/sampled_losses/Select_grad/tuple/group_deps*E
_class;
97loc:@gradients/loss/sampled_losses/Select_grad/Select_1*
T0*
_output_shapes
:	A
}
,gradients/loss/sampled_losses/mul_grad/ShapeConst*
dtype0*
valueB"   A   *
_output_shapes
:

.gradients/loss/sampled_losses/mul_grad/Shape_1Const*
dtype0*
valueB"   A   *
_output_shapes
:
đ
<gradients/loss/sampled_losses/mul_grad/BroadcastGradientArgsBroadcastGradientArgs,gradients/loss/sampled_losses/mul_grad/Shape.gradients/loss/sampled_losses/mul_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ś
*gradients/loss/sampled_losses/mul_grad/mulMulAgradients/loss/sampled_losses/sub_grad/tuple/control_dependency_1loss/nce_loss/concat_4*
T0*
_output_shapes
:	A
Ű
*gradients/loss/sampled_losses/mul_grad/SumSum*gradients/loss/sampled_losses/mul_grad/mul<gradients/loss/sampled_losses/mul_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
Ë
.gradients/loss/sampled_losses/mul_grad/ReshapeReshape*gradients/loss/sampled_losses/mul_grad/Sum,gradients/loss/sampled_losses/mul_grad/Shape*
Tshape0*
T0*
_output_shapes
:	A
¸
,gradients/loss/sampled_losses/mul_grad/mul_1Mulloss/nce_loss/concat_3Agradients/loss/sampled_losses/sub_grad/tuple/control_dependency_1*
T0*
_output_shapes
:	A
á
,gradients/loss/sampled_losses/mul_grad/Sum_1Sum,gradients/loss/sampled_losses/mul_grad/mul_1>gradients/loss/sampled_losses/mul_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
Ń
0gradients/loss/sampled_losses/mul_grad/Reshape_1Reshape,gradients/loss/sampled_losses/mul_grad/Sum_1.gradients/loss/sampled_losses/mul_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:	A
Ł
7gradients/loss/sampled_losses/mul_grad/tuple/group_depsNoOp/^gradients/loss/sampled_losses/mul_grad/Reshape1^gradients/loss/sampled_losses/mul_grad/Reshape_1
˘
?gradients/loss/sampled_losses/mul_grad/tuple/control_dependencyIdentity.gradients/loss/sampled_losses/mul_grad/Reshape8^gradients/loss/sampled_losses/mul_grad/tuple/group_deps*A
_class7
53loc:@gradients/loss/sampled_losses/mul_grad/Reshape*
T0*
_output_shapes
:	A
¨
Agradients/loss/sampled_losses/mul_grad/tuple/control_dependency_1Identity0gradients/loss/sampled_losses/mul_grad/Reshape_18^gradients/loss/sampled_losses/mul_grad/tuple/group_deps*C
_class9
75loc:@gradients/loss/sampled_losses/mul_grad/Reshape_1*
T0*
_output_shapes
:	A
˘
*gradients/loss/sampled_losses/Exp_grad/mulMul,gradients/loss/sampled_losses/Log1p_grad/mulloss/sampled_losses/Exp*
T0*
_output_shapes
:	A

6gradients/loss/sampled_losses/Select_1_grad/zeros_likeConst*
dtype0*
valueB	A*    *
_output_shapes
:	A
ě
2gradients/loss/sampled_losses/Select_1_grad/SelectSelect loss/sampled_losses/GreaterEqual*gradients/loss/sampled_losses/Exp_grad/mul6gradients/loss/sampled_losses/Select_1_grad/zeros_like*
T0*
_output_shapes
:	A
î
4gradients/loss/sampled_losses/Select_1_grad/Select_1Select loss/sampled_losses/GreaterEqual6gradients/loss/sampled_losses/Select_1_grad/zeros_like*gradients/loss/sampled_losses/Exp_grad/mul*
T0*
_output_shapes
:	A
°
<gradients/loss/sampled_losses/Select_1_grad/tuple/group_depsNoOp3^gradients/loss/sampled_losses/Select_1_grad/Select5^gradients/loss/sampled_losses/Select_1_grad/Select_1
´
Dgradients/loss/sampled_losses/Select_1_grad/tuple/control_dependencyIdentity2gradients/loss/sampled_losses/Select_1_grad/Select=^gradients/loss/sampled_losses/Select_1_grad/tuple/group_deps*E
_class;
97loc:@gradients/loss/sampled_losses/Select_1_grad/Select*
T0*
_output_shapes
:	A
ş
Fgradients/loss/sampled_losses/Select_1_grad/tuple/control_dependency_1Identity4gradients/loss/sampled_losses/Select_1_grad/Select_1=^gradients/loss/sampled_losses/Select_1_grad/tuple/group_deps*G
_class=
;9loc:@gradients/loss/sampled_losses/Select_1_grad/Select_1*
T0*
_output_shapes
:	A
Ą
*gradients/loss/sampled_losses/Neg_grad/NegNegDgradients/loss/sampled_losses/Select_1_grad/tuple/control_dependency*
T0*
_output_shapes
:	A

gradients/AddNAddNBgradients/loss/sampled_losses/Select_grad/tuple/control_dependency?gradients/loss/sampled_losses/mul_grad/tuple/control_dependencyFgradients/loss/sampled_losses/Select_1_grad/tuple/control_dependency_1*gradients/loss/sampled_losses/Neg_grad/Neg*
N*C
_class9
75loc:@gradients/loss/sampled_losses/Select_grad/Select*
T0*
_output_shapes
:	A
l
*gradients/loss/nce_loss/concat_3_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 

)gradients/loss/nce_loss/concat_3_grad/modFloorModloss/nce_loss/concat_3/axis*gradients/loss/nce_loss/concat_3_grad/Rank*
T0*
_output_shapes
: 
|
+gradients/loss/nce_loss/concat_3_grad/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
~
-gradients/loss/nce_loss/concat_3_grad/Shape_1Const*
dtype0*
valueB"   @   *
_output_shapes
:
ô
2gradients/loss/nce_loss/concat_3_grad/ConcatOffsetConcatOffset)gradients/loss/nce_loss/concat_3_grad/mod+gradients/loss/nce_loss/concat_3_grad/Shape-gradients/loss/nce_loss/concat_3_grad/Shape_1*
N* 
_output_shapes
::
Ü
+gradients/loss/nce_loss/concat_3_grad/SliceSlicegradients/AddN2gradients/loss/nce_loss/concat_3_grad/ConcatOffset+gradients/loss/nce_loss/concat_3_grad/Shape*
Index0*
T0*
_output_shapes
:	
â
-gradients/loss/nce_loss/concat_3_grad/Slice_1Slicegradients/AddN4gradients/loss/nce_loss/concat_3_grad/ConcatOffset:1-gradients/loss/nce_loss/concat_3_grad/Shape_1*
Index0*
T0*
_output_shapes
:	@

6gradients/loss/nce_loss/concat_3_grad/tuple/group_depsNoOp,^gradients/loss/nce_loss/concat_3_grad/Slice.^gradients/loss/nce_loss/concat_3_grad/Slice_1

>gradients/loss/nce_loss/concat_3_grad/tuple/control_dependencyIdentity+gradients/loss/nce_loss/concat_3_grad/Slice7^gradients/loss/nce_loss/concat_3_grad/tuple/group_deps*>
_class4
20loc:@gradients/loss/nce_loss/concat_3_grad/Slice*
T0*
_output_shapes
:	
 
@gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency_1Identity-gradients/loss/nce_loss/concat_3_grad/Slice_17^gradients/loss/nce_loss/concat_3_grad/tuple/group_deps*@
_class6
42loc:@gradients/loss/nce_loss/concat_3_grad/Slice_1*
T0*
_output_shapes
:	@
w
&gradients/loss/nce_loss/sub_grad/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
y
(gradients/loss/nce_loss/sub_grad/Shape_1Const*
dtype0*
valueB"      *
_output_shapes
:
Ţ
6gradients/loss/nce_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/loss/nce_loss/sub_grad/Shape(gradients/loss/nce_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ă
$gradients/loss/nce_loss/sub_grad/SumSum>gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency6gradients/loss/nce_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
š
(gradients/loss/nce_loss/sub_grad/ReshapeReshape$gradients/loss/nce_loss/sub_grad/Sum&gradients/loss/nce_loss/sub_grad/Shape*
Tshape0*
T0*
_output_shapes
:	
ç
&gradients/loss/nce_loss/sub_grad/Sum_1Sum>gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency8gradients/loss/nce_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
v
$gradients/loss/nce_loss/sub_grad/NegNeg&gradients/loss/nce_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
˝
*gradients/loss/nce_loss/sub_grad/Reshape_1Reshape$gradients/loss/nce_loss/sub_grad/Neg(gradients/loss/nce_loss/sub_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:	

1gradients/loss/nce_loss/sub_grad/tuple/group_depsNoOp)^gradients/loss/nce_loss/sub_grad/Reshape+^gradients/loss/nce_loss/sub_grad/Reshape_1

9gradients/loss/nce_loss/sub_grad/tuple/control_dependencyIdentity(gradients/loss/nce_loss/sub_grad/Reshape2^gradients/loss/nce_loss/sub_grad/tuple/group_deps*;
_class1
/-loc:@gradients/loss/nce_loss/sub_grad/Reshape*
T0*
_output_shapes
:	

;gradients/loss/nce_loss/sub_grad/tuple/control_dependency_1Identity*gradients/loss/nce_loss/sub_grad/Reshape_12^gradients/loss/nce_loss/sub_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/sub_grad/Reshape_1*
T0*
_output_shapes
:	
y
(gradients/loss/nce_loss/sub_1_grad/ShapeConst*
dtype0*
valueB"   @   *
_output_shapes
:
t
*gradients/loss/nce_loss/sub_1_grad/Shape_1Const*
dtype0*
valueB:@*
_output_shapes
:
ä
8gradients/loss/nce_loss/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/loss/nce_loss/sub_1_grad/Shape*gradients/loss/nce_loss/sub_1_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
é
&gradients/loss/nce_loss/sub_1_grad/SumSum@gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency_18gradients/loss/nce_loss/sub_1_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
ż
*gradients/loss/nce_loss/sub_1_grad/ReshapeReshape&gradients/loss/nce_loss/sub_1_grad/Sum(gradients/loss/nce_loss/sub_1_grad/Shape*
Tshape0*
T0*
_output_shapes
:	@
í
(gradients/loss/nce_loss/sub_1_grad/Sum_1Sum@gradients/loss/nce_loss/concat_3_grad/tuple/control_dependency_1:gradients/loss/nce_loss/sub_1_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
z
&gradients/loss/nce_loss/sub_1_grad/NegNeg(gradients/loss/nce_loss/sub_1_grad/Sum_1*
T0*
_output_shapes
:
ž
,gradients/loss/nce_loss/sub_1_grad/Reshape_1Reshape&gradients/loss/nce_loss/sub_1_grad/Neg*gradients/loss/nce_loss/sub_1_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:@

3gradients/loss/nce_loss/sub_1_grad/tuple/group_depsNoOp+^gradients/loss/nce_loss/sub_1_grad/Reshape-^gradients/loss/nce_loss/sub_1_grad/Reshape_1

;gradients/loss/nce_loss/sub_1_grad/tuple/control_dependencyIdentity*gradients/loss/nce_loss/sub_1_grad/Reshape4^gradients/loss/nce_loss/sub_1_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/sub_1_grad/Reshape*
T0*
_output_shapes
:	@

=gradients/loss/nce_loss/sub_1_grad/tuple/control_dependency_1Identity,gradients/loss/nce_loss/sub_1_grad/Reshape_14^gradients/loss/nce_loss/sub_1_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/nce_loss/sub_1_grad/Reshape_1*
T0*
_output_shapes
:@
}
&gradients/loss/nce_loss/add_grad/ShapeShapeloss/nce_loss/Reshape_4*
out_type0*
T0*
_output_shapes
:
y
(gradients/loss/nce_loss/add_grad/Shape_1Const*
dtype0*
valueB"      *
_output_shapes
:
Ţ
6gradients/loss/nce_loss/add_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/loss/nce_loss/add_grad/Shape(gradients/loss/nce_loss/add_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ţ
$gradients/loss/nce_loss/add_grad/SumSum9gradients/loss/nce_loss/sub_grad/tuple/control_dependency6gradients/loss/nce_loss/add_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
Á
(gradients/loss/nce_loss/add_grad/ReshapeReshape$gradients/loss/nce_loss/add_grad/Sum&gradients/loss/nce_loss/add_grad/Shape*
Tshape0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
â
&gradients/loss/nce_loss/add_grad/Sum_1Sum9gradients/loss/nce_loss/sub_grad/tuple/control_dependency8gradients/loss/nce_loss/add_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
ż
*gradients/loss/nce_loss/add_grad/Reshape_1Reshape&gradients/loss/nce_loss/add_grad/Sum_1(gradients/loss/nce_loss/add_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:	

1gradients/loss/nce_loss/add_grad/tuple/group_depsNoOp)^gradients/loss/nce_loss/add_grad/Reshape+^gradients/loss/nce_loss/add_grad/Reshape_1

9gradients/loss/nce_loss/add_grad/tuple/control_dependencyIdentity(gradients/loss/nce_loss/add_grad/Reshape2^gradients/loss/nce_loss/add_grad/tuple/group_deps*;
_class1
/-loc:@gradients/loss/nce_loss/add_grad/Reshape*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

;gradients/loss/nce_loss/add_grad/tuple/control_dependency_1Identity*gradients/loss/nce_loss/add_grad/Reshape_12^gradients/loss/nce_loss/add_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/add_grad/Reshape_1*
T0*
_output_shapes
:	
|
(gradients/loss/nce_loss/add_1_grad/ShapeShapeloss/nce_loss/MatMul*
out_type0*
T0*
_output_shapes
:
t
*gradients/loss/nce_loss/add_1_grad/Shape_1Const*
dtype0*
valueB:@*
_output_shapes
:
ä
8gradients/loss/nce_loss/add_1_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/loss/nce_loss/add_1_grad/Shape*gradients/loss/nce_loss/add_1_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ä
&gradients/loss/nce_loss/add_1_grad/SumSum;gradients/loss/nce_loss/sub_1_grad/tuple/control_dependency8gradients/loss/nce_loss/add_1_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
Č
*gradients/loss/nce_loss/add_1_grad/ReshapeReshape&gradients/loss/nce_loss/add_1_grad/Sum(gradients/loss/nce_loss/add_1_grad/Shape*
Tshape0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
č
(gradients/loss/nce_loss/add_1_grad/Sum_1Sum;gradients/loss/nce_loss/sub_1_grad/tuple/control_dependency:gradients/loss/nce_loss/add_1_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
Ŕ
,gradients/loss/nce_loss/add_1_grad/Reshape_1Reshape(gradients/loss/nce_loss/add_1_grad/Sum_1*gradients/loss/nce_loss/add_1_grad/Shape_1*
Tshape0*
T0*
_output_shapes
:@

3gradients/loss/nce_loss/add_1_grad/tuple/group_depsNoOp+^gradients/loss/nce_loss/add_1_grad/Reshape-^gradients/loss/nce_loss/add_1_grad/Reshape_1

;gradients/loss/nce_loss/add_1_grad/tuple/control_dependencyIdentity*gradients/loss/nce_loss/add_1_grad/Reshape4^gradients/loss/nce_loss/add_1_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/add_1_grad/Reshape*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

=gradients/loss/nce_loss/add_1_grad/tuple/control_dependency_1Identity,gradients/loss/nce_loss/add_1_grad/Reshape_14^gradients/loss/nce_loss/add_1_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/nce_loss/add_1_grad/Reshape_1*
T0*
_output_shapes
:@

,gradients/loss/nce_loss/Reshape_4_grad/ShapeShapeloss/nce_loss/Reshape_3*
out_type0*
T0*
_output_shapes
:
Ţ
.gradients/loss/nce_loss/Reshape_4_grad/ReshapeReshape9gradients/loss/nce_loss/add_grad/tuple/control_dependency,gradients/loss/nce_loss/Reshape_4_grad/Shape*
Tshape0*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
w
,gradients/loss/nce_loss/Reshape_5_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
Ř
.gradients/loss/nce_loss/Reshape_5_grad/ReshapeReshape;gradients/loss/nce_loss/add_grad/tuple/control_dependency_1,gradients/loss/nce_loss/Reshape_5_grad/Shape*
Tshape0*
T0*
_output_shapes	
:
Ů
*gradients/loss/nce_loss/MatMul_grad/MatMulMatMul;gradients/loss/nce_loss/add_1_grad/tuple/control_dependencyloss/nce_loss/Slice_1*
transpose_b( *
transpose_a( *
T0* 
_output_shapes
:

Ř
,gradients/loss/nce_loss/MatMul_grad/MatMul_1MatMul;gradients/loss/nce_loss/add_1_grad/tuple/control_dependency
loss/embed*
transpose_b( *
transpose_a(*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

4gradients/loss/nce_loss/MatMul_grad/tuple/group_depsNoOp+^gradients/loss/nce_loss/MatMul_grad/MatMul-^gradients/loss/nce_loss/MatMul_grad/MatMul_1

<gradients/loss/nce_loss/MatMul_grad/tuple/control_dependencyIdentity*gradients/loss/nce_loss/MatMul_grad/MatMul5^gradients/loss/nce_loss/MatMul_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/MatMul_grad/MatMul*
T0* 
_output_shapes
:

Ł
>gradients/loss/nce_loss/MatMul_grad/tuple/control_dependency_1Identity,gradients/loss/nce_loss/MatMul_grad/MatMul_15^gradients/loss/nce_loss/MatMul_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/nce_loss/MatMul_grad/MatMul_1*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
k
)gradients/loss/nce_loss/Slice_3_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 
t
*gradients/loss/nce_loss/Slice_3_grad/ShapeConst*
dtype0*
valueB:@*
_output_shapes
:
n
,gradients/loss/nce_loss/Slice_3_grad/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
Ĺ
*gradients/loss/nce_loss/Slice_3_grad/stackPack)gradients/loss/nce_loss/Slice_3_grad/Rank,gradients/loss/nce_loss/Slice_3_grad/stack/1*
_output_shapes
:*

axis *
T0*
N
ą
,gradients/loss/nce_loss/Slice_3_grad/ReshapeReshapeloss/nce_loss/Shape_3*gradients/loss/nce_loss/Slice_3_grad/stack*
Tshape0*
T0*
_output_shapes

:
w
,gradients/loss/nce_loss/Slice_3_grad/Shape_1Const*
dtype0*
valueB:Ŕ*
_output_shapes
:
Ž
(gradients/loss/nce_loss/Slice_3_grad/subSub,gradients/loss/nce_loss/Slice_3_grad/Shape_1*gradients/loss/nce_loss/Slice_3_grad/Shape*
T0*
_output_shapes
:

*gradients/loss/nce_loss/Slice_3_grad/sub_1Sub(gradients/loss/nce_loss/Slice_3_grad/subloss/nce_loss/Shape_3*
T0*
_output_shapes
:
Č
.gradients/loss/nce_loss/Slice_3_grad/Reshape_1Reshape*gradients/loss/nce_loss/Slice_3_grad/sub_1*gradients/loss/nce_loss/Slice_3_grad/stack*
Tshape0*
T0*
_output_shapes

:
r
0gradients/loss/nce_loss/Slice_3_grad/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 

+gradients/loss/nce_loss/Slice_3_grad/concatConcatV2,gradients/loss/nce_loss/Slice_3_grad/Reshape.gradients/loss/nce_loss/Slice_3_grad/Reshape_10gradients/loss/nce_loss/Slice_3_grad/concat/axis*
_output_shapes

:*

Tidx0*
T0*
N
Ň
(gradients/loss/nce_loss/Slice_3_grad/PadPad=gradients/loss/nce_loss/add_1_grad/tuple/control_dependency_1+gradients/loss/nce_loss/Slice_3_grad/concat*
	Tpaddings0*
T0*
_output_shapes	
:Ŕ

,gradients/loss/nce_loss/Reshape_3_grad/ShapeShapeloss/nce_loss/MatMul_1*
out_type0*
T0*
_output_shapes
:
×
.gradients/loss/nce_loss/Reshape_3_grad/ReshapeReshape.gradients/loss/nce_loss/Reshape_4_grad/Reshape,gradients/loss/nce_loss/Reshape_3_grad/Shape*
Tshape0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
k
)gradients/loss/nce_loss/Slice_2_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 
u
*gradients/loss/nce_loss/Slice_2_grad/ShapeConst*
dtype0*
valueB:*
_output_shapes
:
n
,gradients/loss/nce_loss/Slice_2_grad/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
Ĺ
*gradients/loss/nce_loss/Slice_2_grad/stackPack)gradients/loss/nce_loss/Slice_2_grad/Rank,gradients/loss/nce_loss/Slice_2_grad/stack/1*
_output_shapes
:*

axis *
T0*
N
ˇ
,gradients/loss/nce_loss/Slice_2_grad/ReshapeReshapeloss/nce_loss/Slice_2/begin*gradients/loss/nce_loss/Slice_2_grad/stack*
Tshape0*
T0*
_output_shapes

:
w
,gradients/loss/nce_loss/Slice_2_grad/Shape_1Const*
dtype0*
valueB:Ŕ*
_output_shapes
:
Ž
(gradients/loss/nce_loss/Slice_2_grad/subSub,gradients/loss/nce_loss/Slice_2_grad/Shape_1*gradients/loss/nce_loss/Slice_2_grad/Shape*
T0*
_output_shapes
:

*gradients/loss/nce_loss/Slice_2_grad/sub_1Sub(gradients/loss/nce_loss/Slice_2_grad/subloss/nce_loss/Slice_2/begin*
T0*
_output_shapes
:
Č
.gradients/loss/nce_loss/Slice_2_grad/Reshape_1Reshape*gradients/loss/nce_loss/Slice_2_grad/sub_1*gradients/loss/nce_loss/Slice_2_grad/stack*
Tshape0*
T0*
_output_shapes

:
r
0gradients/loss/nce_loss/Slice_2_grad/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 

+gradients/loss/nce_loss/Slice_2_grad/concatConcatV2,gradients/loss/nce_loss/Slice_2_grad/Reshape.gradients/loss/nce_loss/Slice_2_grad/Reshape_10gradients/loss/nce_loss/Slice_2_grad/concat/axis*
_output_shapes

:*

Tidx0*
T0*
N
Ă
(gradients/loss/nce_loss/Slice_2_grad/PadPad.gradients/loss/nce_loss/Reshape_5_grad/Reshape+gradients/loss/nce_loss/Slice_2_grad/concat*
	Tpaddings0*
T0*
_output_shapes	
:Ŕ
k
)gradients/loss/nce_loss/Slice_1_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 

*gradients/loss/nce_loss/Slice_1_grad/ShapeShapeloss/nce_loss/Slice_1*
out_type0*
T0*
_output_shapes
:
n
,gradients/loss/nce_loss/Slice_1_grad/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
Ĺ
*gradients/loss/nce_loss/Slice_1_grad/stackPack)gradients/loss/nce_loss/Slice_1_grad/Rank,gradients/loss/nce_loss/Slice_1_grad/stack/1*
_output_shapes
:*

axis *
T0*
N
ą
,gradients/loss/nce_loss/Slice_1_grad/ReshapeReshapeloss/nce_loss/stack_1*gradients/loss/nce_loss/Slice_1_grad/stack*
Tshape0*
T0*
_output_shapes

:
}
,gradients/loss/nce_loss/Slice_1_grad/Shape_1Const*
dtype0*
valueB"Ŕ      *
_output_shapes
:
Ž
(gradients/loss/nce_loss/Slice_1_grad/subSub,gradients/loss/nce_loss/Slice_1_grad/Shape_1*gradients/loss/nce_loss/Slice_1_grad/Shape*
T0*
_output_shapes
:

*gradients/loss/nce_loss/Slice_1_grad/sub_1Sub(gradients/loss/nce_loss/Slice_1_grad/subloss/nce_loss/stack_1*
T0*
_output_shapes
:
Č
.gradients/loss/nce_loss/Slice_1_grad/Reshape_1Reshape*gradients/loss/nce_loss/Slice_1_grad/sub_1*gradients/loss/nce_loss/Slice_1_grad/stack*
Tshape0*
T0*
_output_shapes

:
r
0gradients/loss/nce_loss/Slice_1_grad/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 

+gradients/loss/nce_loss/Slice_1_grad/concatConcatV2,gradients/loss/nce_loss/Slice_1_grad/Reshape.gradients/loss/nce_loss/Slice_1_grad/Reshape_10gradients/loss/nce_loss/Slice_1_grad/concat/axis*
_output_shapes

:*

Tidx0*
T0*
N
Ř
(gradients/loss/nce_loss/Slice_1_grad/PadPad>gradients/loss/nce_loss/MatMul_grad/tuple/control_dependency_1+gradients/loss/nce_loss/Slice_1_grad/concat*
	Tpaddings0*
T0* 
_output_shapes
:
Ŕ
Ű
,gradients/loss/nce_loss/MatMul_1_grad/MatMulMatMul.gradients/loss/nce_loss/Reshape_3_grad/Reshapeloss/nce_loss/ones*
transpose_b(*
transpose_a( *
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
Ů
.gradients/loss/nce_loss/MatMul_1_grad/MatMul_1MatMulloss/nce_loss/Reshape_2.gradients/loss/nce_loss/Reshape_3_grad/Reshape*
transpose_b( *
transpose_a(*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

6gradients/loss/nce_loss/MatMul_1_grad/tuple/group_depsNoOp-^gradients/loss/nce_loss/MatMul_1_grad/MatMul/^gradients/loss/nce_loss/MatMul_1_grad/MatMul_1
­
>gradients/loss/nce_loss/MatMul_1_grad/tuple/control_dependencyIdentity,gradients/loss/nce_loss/MatMul_1_grad/MatMul7^gradients/loss/nce_loss/MatMul_1_grad/tuple/group_deps*?
_class5
31loc:@gradients/loss/nce_loss/MatMul_1_grad/MatMul*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
Ş
@gradients/loss/nce_loss/MatMul_1_grad/tuple/control_dependency_1Identity.gradients/loss/nce_loss/MatMul_1_grad/MatMul_17^gradients/loss/nce_loss/MatMul_1_grad/tuple/group_deps*A
_class7
53loc:@gradients/loss/nce_loss/MatMul_1_grad/MatMul_1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ř
gradients/AddN_1AddN(gradients/loss/nce_loss/Slice_3_grad/Pad(gradients/loss/nce_loss/Slice_2_grad/Pad*
N*;
_class1
/-loc:@gradients/loss/nce_loss/Slice_3_grad/Pad*
T0*
_output_shapes	
:Ŕ
Ł
5gradients/loss/nce_loss/embedding_lookup_1_grad/ShapeConst*
dtype0	* 
_class
loc:@loss/nce_bias*
valueB	RĐ*
_output_shapes
:
Ě
7gradients/loss/nce_loss/embedding_lookup_1_grad/ToInt32Cast5gradients/loss/nce_loss/embedding_lookup_1_grad/Shape*

DstT0* 
_class
loc:@loss/nce_bias*

SrcT0	*
_output_shapes
:
w
4gradients/loss/nce_loss/embedding_lookup_1_grad/SizeConst*
dtype0*
value
B :Ŕ*
_output_shapes
: 

>gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims/dimConst*
dtype0*
value	B : *
_output_shapes
: 
ď
:gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims
ExpandDims4gradients/loss/nce_loss/embedding_lookup_1_grad/Size>gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:

Cgradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:

Egradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stack_1Const*
dtype0*
valueB: *
_output_shapes
:

Egradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
í
=gradients/loss/nce_loss/embedding_lookup_1_grad/strided_sliceStridedSlice7gradients/loss/nce_loss/embedding_lookup_1_grad/ToInt32Cgradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stackEgradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stack_1Egradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
}
;gradients/loss/nce_loss/embedding_lookup_1_grad/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
´
6gradients/loss/nce_loss/embedding_lookup_1_grad/concatConcatV2:gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims=gradients/loss/nce_loss/embedding_lookup_1_grad/strided_slice;gradients/loss/nce_loss/embedding_lookup_1_grad/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
Ŕ
7gradients/loss/nce_loss/embedding_lookup_1_grad/ReshapeReshapegradients/AddN_16gradients/loss/nce_loss/embedding_lookup_1_grad/concat*
Tshape0*
T0*
_output_shapes	
:Ŕ
Ę
9gradients/loss/nce_loss/embedding_lookup_1_grad/Reshape_1Reshapeloss/nce_loss/concat:gradients/loss/nce_loss/embedding_lookup_1_grad/ExpandDims*
Tshape0*
T0	*
_output_shapes	
:Ŕ
x
'gradients/loss/nce_loss/ones_grad/ConstConst*
dtype0*
valueB"       *
_output_shapes
:
Ő
%gradients/loss/nce_loss/ones_grad/SumSum@gradients/loss/nce_loss/MatMul_1_grad/tuple/control_dependency_1'gradients/loss/nce_loss/ones_grad/Const*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 

,gradients/loss/nce_loss/Reshape_2_grad/ShapeConst*
dtype0*!
valueB"         *
_output_shapes
:
ä
.gradients/loss/nce_loss/Reshape_2_grad/ReshapeReshape>gradients/loss/nce_loss/MatMul_1_grad/tuple/control_dependency,gradients/loss/nce_loss/Reshape_2_grad/Shape*
Tshape0*
T0*$
_output_shapes
:
{
&gradients/loss/nce_loss/Mul_grad/ShapeConst*
dtype0*!
valueB"         *
_output_shapes
:

(gradients/loss/nce_loss/Mul_grad/Shape_1Shapeloss/nce_loss/Reshape_1*
out_type0*
T0*
_output_shapes
:
Ţ
6gradients/loss/nce_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/loss/nce_loss/Mul_grad/Shape(gradients/loss/nce_loss/Mul_grad/Shape_1*
T0*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ł
$gradients/loss/nce_loss/Mul_grad/mulMul.gradients/loss/nce_loss/Reshape_2_grad/Reshapeloss/nce_loss/Reshape_1*
T0*$
_output_shapes
:
É
$gradients/loss/nce_loss/Mul_grad/SumSum$gradients/loss/nce_loss/Mul_grad/mul6gradients/loss/nce_loss/Mul_grad/BroadcastGradientArgs*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
ž
(gradients/loss/nce_loss/Mul_grad/ReshapeReshape$gradients/loss/nce_loss/Mul_grad/Sum&gradients/loss/nce_loss/Mul_grad/Shape*
Tshape0*
T0*$
_output_shapes
:
Ś
&gradients/loss/nce_loss/Mul_grad/mul_1Mulloss/nce_loss/ExpandDims.gradients/loss/nce_loss/Reshape_2_grad/Reshape*
T0*$
_output_shapes
:
Ď
&gradients/loss/nce_loss/Mul_grad/Sum_1Sum&gradients/loss/nce_loss/Mul_grad/mul_18gradients/loss/nce_loss/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
Ô
*gradients/loss/nce_loss/Mul_grad/Reshape_1Reshape&gradients/loss/nce_loss/Mul_grad/Sum_1(gradients/loss/nce_loss/Mul_grad/Shape_1*
Tshape0*
T0*4
_output_shapes"
 :˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙

1gradients/loss/nce_loss/Mul_grad/tuple/group_depsNoOp)^gradients/loss/nce_loss/Mul_grad/Reshape+^gradients/loss/nce_loss/Mul_grad/Reshape_1

9gradients/loss/nce_loss/Mul_grad/tuple/control_dependencyIdentity(gradients/loss/nce_loss/Mul_grad/Reshape2^gradients/loss/nce_loss/Mul_grad/tuple/group_deps*;
_class1
/-loc:@gradients/loss/nce_loss/Mul_grad/Reshape*
T0*$
_output_shapes
:
Ľ
;gradients/loss/nce_loss/Mul_grad/tuple/control_dependency_1Identity*gradients/loss/nce_loss/Mul_grad/Reshape_12^gradients/loss/nce_loss/Mul_grad/tuple/group_deps*=
_class3
1/loc:@gradients/loss/nce_loss/Mul_grad/Reshape_1*
T0*4
_output_shapes"
 :˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
~
-gradients/loss/nce_loss/ExpandDims_grad/ShapeConst*
dtype0*
valueB"      *
_output_shapes
:
Ý
/gradients/loss/nce_loss/ExpandDims_grad/ReshapeReshape9gradients/loss/nce_loss/Mul_grad/tuple/control_dependency-gradients/loss/nce_loss/ExpandDims_grad/Shape*
Tshape0*
T0* 
_output_shapes
:


,gradients/loss/nce_loss/Reshape_1_grad/ShapeShapeloss/nce_loss/Slice*
out_type0*
T0*
_output_shapes
:
í
.gradients/loss/nce_loss/Reshape_1_grad/ReshapeReshape;gradients/loss/nce_loss/Mul_grad/tuple/control_dependency_1,gradients/loss/nce_loss/Reshape_1_grad/Shape*
Tshape0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
ú
gradients/AddN_2AddN<gradients/loss/nce_loss/MatMul_grad/tuple/control_dependency/gradients/loss/nce_loss/ExpandDims_grad/Reshape*
N*=
_class3
1/loc:@gradients/loss/nce_loss/MatMul_grad/MatMul*
T0* 
_output_shapes
:

Ş
gradients/loss/embed_grad/ShapeConst*
dtype0	*0
_class&
$"loc:@embedding_matrix/embed_matrix*%
valueB	"PĂ             *
_output_shapes
:
°
!gradients/loss/embed_grad/ToInt32Castgradients/loss/embed_grad/Shape*

DstT0*0
_class&
$"loc:@embedding_matrix/embed_matrix*

SrcT0	*
_output_shapes
:
a
gradients/loss/embed_grad/SizeConst*
dtype0*
value
B :*
_output_shapes
: 
j
(gradients/loss/embed_grad/ExpandDims/dimConst*
dtype0*
value	B : *
_output_shapes
: 
­
$gradients/loss/embed_grad/ExpandDims
ExpandDimsgradients/loss/embed_grad/Size(gradients/loss/embed_grad/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:
w
-gradients/loss/embed_grad/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:
y
/gradients/loss/embed_grad/strided_slice/stack_1Const*
dtype0*
valueB: *
_output_shapes
:
y
/gradients/loss/embed_grad/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:

'gradients/loss/embed_grad/strided_sliceStridedSlice!gradients/loss/embed_grad/ToInt32-gradients/loss/embed_grad/strided_slice/stack/gradients/loss/embed_grad/strided_slice/stack_1/gradients/loss/embed_grad/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
g
%gradients/loss/embed_grad/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ü
 gradients/loss/embed_grad/concatConcatV2$gradients/loss/embed_grad/ExpandDims'gradients/loss/embed_grad/strided_slice%gradients/loss/embed_grad/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N

!gradients/loss/embed_grad/ReshapeReshapegradients/AddN_2 gradients/loss/embed_grad/concat*
Tshape0*
T0* 
_output_shapes
:


#gradients/loss/embed_grad/Reshape_1Reshapedata/center_words$gradients/loss/embed_grad/ExpandDims*
Tshape0*
T0*
_output_shapes	
:
i
'gradients/loss/nce_loss/Slice_grad/RankConst*
dtype0*
value	B :*
_output_shapes
: 
{
(gradients/loss/nce_loss/Slice_grad/ShapeShapeloss/nce_loss/Slice*
out_type0*
T0*
_output_shapes
:
l
*gradients/loss/nce_loss/Slice_grad/stack/1Const*
dtype0*
value	B :*
_output_shapes
: 
ż
(gradients/loss/nce_loss/Slice_grad/stackPack'gradients/loss/nce_loss/Slice_grad/Rank*gradients/loss/nce_loss/Slice_grad/stack/1*
_output_shapes
:*

axis *
T0*
N
ą
*gradients/loss/nce_loss/Slice_grad/ReshapeReshapeloss/nce_loss/Slice/begin(gradients/loss/nce_loss/Slice_grad/stack*
Tshape0*
T0*
_output_shapes

:
{
*gradients/loss/nce_loss/Slice_grad/Shape_1Const*
dtype0*
valueB"Ŕ      *
_output_shapes
:
¨
&gradients/loss/nce_loss/Slice_grad/subSub*gradients/loss/nce_loss/Slice_grad/Shape_1(gradients/loss/nce_loss/Slice_grad/Shape*
T0*
_output_shapes
:

(gradients/loss/nce_loss/Slice_grad/sub_1Sub&gradients/loss/nce_loss/Slice_grad/subloss/nce_loss/Slice/begin*
T0*
_output_shapes
:
Â
,gradients/loss/nce_loss/Slice_grad/Reshape_1Reshape(gradients/loss/nce_loss/Slice_grad/sub_1(gradients/loss/nce_loss/Slice_grad/stack*
Tshape0*
T0*
_output_shapes

:
p
.gradients/loss/nce_loss/Slice_grad/concat/axisConst*
dtype0*
value	B :*
_output_shapes
: 
ý
)gradients/loss/nce_loss/Slice_grad/concatConcatV2*gradients/loss/nce_loss/Slice_grad/Reshape,gradients/loss/nce_loss/Slice_grad/Reshape_1.gradients/loss/nce_loss/Slice_grad/concat/axis*
_output_shapes

:*

Tidx0*
T0*
N
Ä
&gradients/loss/nce_loss/Slice_grad/PadPad.gradients/loss/nce_loss/Reshape_1_grad/Reshape)gradients/loss/nce_loss/Slice_grad/concat*
	Tpaddings0*
T0* 
_output_shapes
:
Ŕ
Ű
gradients/AddN_3AddN(gradients/loss/nce_loss/Slice_1_grad/Pad&gradients/loss/nce_loss/Slice_grad/Pad*
N*;
_class1
/-loc:@gradients/loss/nce_loss/Slice_1_grad/Pad*
T0* 
_output_shapes
:
Ŕ
°
3gradients/loss/nce_loss/embedding_lookup_grad/ShapeConst*
dtype0	*"
_class
loc:@loss/nce_weight*%
valueB	"PĂ             *
_output_shapes
:
Ę
5gradients/loss/nce_loss/embedding_lookup_grad/ToInt32Cast3gradients/loss/nce_loss/embedding_lookup_grad/Shape*

DstT0*"
_class
loc:@loss/nce_weight*

SrcT0	*
_output_shapes
:
u
2gradients/loss/nce_loss/embedding_lookup_grad/SizeConst*
dtype0*
value
B :Ŕ*
_output_shapes
: 
~
<gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
value	B : *
_output_shapes
: 
é
8gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims
ExpandDims2gradients/loss/nce_loss/embedding_lookup_grad/Size<gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:

Agradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
valueB:*
_output_shapes
:

Cgradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
valueB: *
_output_shapes
:

Cgradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
ĺ
;gradients/loss/nce_loss/embedding_lookup_grad/strided_sliceStridedSlice5gradients/loss/nce_loss/embedding_lookup_grad/ToInt32Agradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stackCgradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stack_1Cgradients/loss/nce_loss/embedding_lookup_grad/strided_slice/stack_2*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
{
9gradients/loss/nce_loss/embedding_lookup_grad/concat/axisConst*
dtype0*
value	B : *
_output_shapes
: 
Ź
4gradients/loss/nce_loss/embedding_lookup_grad/concatConcatV28gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims;gradients/loss/nce_loss/embedding_lookup_grad/strided_slice9gradients/loss/nce_loss/embedding_lookup_grad/concat/axis*
_output_shapes
:*

Tidx0*
T0*
N
Á
5gradients/loss/nce_loss/embedding_lookup_grad/ReshapeReshapegradients/AddN_34gradients/loss/nce_loss/embedding_lookup_grad/concat*
Tshape0*
T0* 
_output_shapes
:
Ŕ
Ć
7gradients/loss/nce_loss/embedding_lookup_grad/Reshape_1Reshapeloss/nce_loss/concat8gradients/loss/nce_loss/embedding_lookup_grad/ExpandDims*
Tshape0*
T0	*
_output_shapes	
:Ŕ
b
GradientDescent/learning_rateConst*
dtype0*
valueB
 *  ?*
_output_shapes
: 
Ţ
8GradientDescent/update_embedding_matrix/embed_matrix/mulMul!gradients/loss/embed_grad/ReshapeGradientDescent/learning_rate*0
_class&
$"loc:@embedding_matrix/embed_matrix*
T0* 
_output_shapes
:

Ě
?GradientDescent/update_embedding_matrix/embed_matrix/ScatterSub
ScatterSubembedding_matrix/embed_matrix#gradients/loss/embed_grad/Reshape_18GradientDescent/update_embedding_matrix/embed_matrix/mul*0
_class&
$"loc:@embedding_matrix/embed_matrix*
Tindices0*
use_locking( *
T0*!
_output_shapes
:Đ
Ö
*GradientDescent/update_loss/nce_weight/mulMul5gradients/loss/nce_loss/embedding_lookup_grad/ReshapeGradientDescent/learning_rate*"
_class
loc:@loss/nce_weight*
T0* 
_output_shapes
:
Ŕ
¨
1GradientDescent/update_loss/nce_weight/ScatterSub
ScatterSubloss/nce_weight7gradients/loss/nce_loss/embedding_lookup_grad/Reshape_1*GradientDescent/update_loss/nce_weight/mul*"
_class
loc:@loss/nce_weight*
Tindices0	*
use_locking( *
T0*!
_output_shapes
:Đ
Ď
(GradientDescent/update_loss/nce_bias/mulMul7gradients/loss/nce_loss/embedding_lookup_1_grad/ReshapeGradientDescent/learning_rate* 
_class
loc:@loss/nce_bias*
T0*
_output_shapes	
:Ŕ

/GradientDescent/update_loss/nce_bias/ScatterSub
ScatterSubloss/nce_bias9gradients/loss/nce_loss/embedding_lookup_1_grad/Reshape_1(GradientDescent/update_loss/nce_bias/mul* 
_class
loc:@loss/nce_bias*
Tindices0	*
use_locking( *
T0*
_output_shapes

:Đ
ż
GradientDescentNoOp@^GradientDescent/update_embedding_matrix/embed_matrix/ScatterSub2^GradientDescent/update_loss/nce_weight/ScatterSub0^GradientDescent/update_loss/nce_bias/ScatterSub
c
initNoOp%^embedding_matrix/embed_matrix/Assign^loss/nce_weight/Assign^loss/nce_bias/Assign""
train_op

GradientDescent"
	variablesöó
m
embedding_matrix/embed_matrix:0$embedding_matrix/embed_matrix/Assign$embedding_matrix/embed_matrix/read:0
C
loss/nce_weight:0loss/nce_weight/Assignloss/nce_weight/read:0
=
loss/nce_bias:0loss/nce_bias/Assignloss/nce_bias/read:0"
trainable_variablesöó
m
embedding_matrix/embed_matrix:0$embedding_matrix/embed_matrix/Assign$embedding_matrix/embed_matrix/read:0
C
loss/nce_weight:0loss/nce_weight/Assignloss/nce_weight/read:0
=
loss/nce_bias:0loss/nce_bias/Assignloss/nce_bias/read:0Eźo