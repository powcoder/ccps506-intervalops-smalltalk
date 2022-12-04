| io fail pass |

io := IntervalOps new.
fail := [:t | Transcript show: 'Failed '; show: t; cr].
pass := [:t | Transcript show: 'Passed '; show: t; cr].
Transcript clear.

"expand_1" (#() = (io expand: '')) ifFalse: [fail value: 'expand_1'] ifTrue: [pass value: 'expand_1'].
"expand_2" (#(42) = (io expand: '42')) ifFalse: [fail value: 'expand_2'] ifTrue: [pass value: 'expand_2'].
"expand_3" (#(4 5) = (io expand: '4-5')) ifFalse: [fail value: 'expand_3'] ifTrue: [pass value: 'expand_3'].
"expand_4" (#(4 5 6 10 11 12 16) = (io expand: '4-6,10-12,16')) ifFalse: [fail value: 'expand_4'] ifTrue: [pass value: 'expand_4'].
"expand_5" (#(1 3 4 5 12 13 14 9999) = (io expand: '1,3-5,12-14,9999')) ifFalse: [fail value: 'expand_5'] ifTrue: [pass value: 'expand_5'].

"collapse_1" ('' = (io collapse: #())) ifFalse: [fail value: 'collapse_1'] ifTrue: [pass value: 'collapse_1'].
"collapse_2" ('1-2,4-6,8-9,12' = (io collapse: #(1 2 4 5 6 8 9 12))) ifFalse: [fail value: 'collapse_2'] ifTrue: [pass value: 'collapse_2'].
"collapse_3" ('1-9' = (io collapse: #(1 2 3 4 5 6 7 8 9))) ifFalse: [fail value: 'collapse_3'] ifTrue: [pass value: 'collapse_3'].
"collapse_4" ('2,4,6,8,10' = (io collapse: #(2 4 6 8 10))) ifFalse: [fail value: 'collapse_4'] ifTrue: [pass value: 'collapse_4'].

"union_1" ('1-6' = (io union: '2,4,6' and: '1,3,5')) ifFalse: [fail value: 'union_1'] ifTrue: [pass value: 'union_1'].
"union_2" ('1-6' = (io union: '1-3' and: '4-6')) ifFalse: [fail value: 'union_2'] ifTrue: [pass value: 'union_2'].
"union_3" ('1-10' = (io union: '1-9' and: '10')) ifFalse: [fail value: 'union_3'] ifTrue: [pass value: 'union_3'].
"union_4" ('1,3-6,10-14,16' = (io union: '4-6,10-12,16' and: '1,3-5,12-14')) ifFalse: [fail value: 'union_4'] ifTrue: [pass value: 'union_4'].

"intersection_1" ('' = (io intersection: '2,4,6' and: '1,3,5')) ifFalse: [fail value: 'intersection_1'] ifTrue: [pass value: 'intersection_1'].
"intersection_2" ('4,6' = (io intersection: '2,4,6' and: '4-8')) ifFalse: [fail value: 'intersection_2'] ifTrue: [pass value: 'intersection_2'].
"intersection_3" ('4-5,12' = (io intersection: '4-6,10-12,16' and: '1,3-5,12-14')) ifFalse: [fail value: 'intersection_3'] ifTrue: [pass value: 'intersection_3'].

"difference_1" ('1-3,9' = (io difference: '1-5,7-9' and: '4-8')) ifFalse: [fail value: 'difference_1'] ifTrue: [pass value: 'difference_1'].
"difference_2" ('6' = (io difference: '4-8' and: '1-5,7-9')) ifFalse: [fail value: 'difference_2'] ifTrue: [pass value: 'difference_2'].
"difference_3" ('' = (io difference: '' and: '10')) ifFalse: [fail value: 'difference_3'] ifTrue: [pass value: 'difference_3'].

"is_disjoint_1" (true = (io is_disjoint: '4-7' and: '1-3,8-9')) ifFalse: [fail value: 'is_disjoint_1'] ifTrue: [pass value: 'is_disjoint_1'].
"is_disjoint_2" (false = (io is_disjoint: '4-6,10-12,16' and: '1,3-5,12-14')) ifFalse: [fail value: 'is_disjoint_2'] ifTrue: [pass value: 'is_disjoint_2'].
"is_disjoint_3" (true = (io is_disjoint: '' and: '10')) ifFalse: [fail value: 'is_disjoint_3'] ifTrue: [pass value: 'is_disjoint_3'].

"is_subset_1" (true = (io is_subset: '1-5,7-9' and: '1-9')) ifFalse: [fail value: 'is_subset_1'] ifTrue: [pass value: 'is_subset_1'].
"is_subset_2" (false = (io is_subset: '4-6,10-12,16' and: '1,3-5,12-14')) ifFalse: [fail value: 'is_subset_2'] ifTrue: [pass value: 'is_subset_2'].
"is_subset_3" (true = (io is_subset: '' and: '10')) ifFalse: [fail value: 'is_subset_3'] ifTrue: [pass value: 'is_subset_3'].
