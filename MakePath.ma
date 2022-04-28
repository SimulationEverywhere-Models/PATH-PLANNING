[top]
components : cells

[cells]
type : cell
in : incells
out : outcells

% plane 0 is the distances 
%0- Do not pass
%1-10 distances
%100-5000 distances trasversed
%5001 definite road 
%After floating point:
%.0 no agent
%.1 expanding agent
%.2 road marker 


dim : (32,32)
delay : inertial
defaultDelayTime  : 10
border : noWrapped
neighbors : cells(-1,-1) cells(-1,0) cells(-1,1)
neighbors : cells(0,-1) cells(0,0) cells(0,1)
neighbors : cells(1,-1)  cells(1,0) cells(1,1)

initialvalue : 0
initialcellsvalue : map.val
localtransition : normal-zone
zone : arrival-zone { (0,31)..(0,31) }


[normal-zone]
%Exploring rules.
%Right, Up, Left, Down
rule : {trunc((0,-1))+ 1 + 0.1} 10 {fractional(( 0, -1)) = 0.1 and (0,0) > 1.99 and (0,0) <100}
rule : {trunc((1,0))+ 1 + 0.1} 10  {fractional(( 1, 0)) = 0.1 and (0,0) > 1.99 and (0,0) <100}
rule : {trunc((0,1))+ 1 + 0.1} 10  {fractional(( 0, 1)) = 0.1 and (0,0) > 1.99 and (0,0) <100}
rule : {trunc((-1,0))+ 1 + 0.1} 10 {fractional(( -1, 0)) = 0.1 and (0,0) > 1.99 and (0,0) <100}
%Agent dissapearing
rule : {trunc((0,0))} 10 {fractional ((0,0)) = 0.1}
%Nodes
rule : {trunc((0,-1))+ 1 + 0.1} 10 {fractional(( 0, -1)) = 0.1 and (0,0) > (0,-1)+1 and (0,0) <=5000}
rule : {trunc((0,0))} 1000 {fractional(( 0, -1)) = 0.1 and (0,0) <= (0,-1)+1 and (0,0) >100}
rule : {trunc((1,0))+ 1 + 0.1} 10 {fractional(( 1, 0)) = 0.1 and (0,0) > (1,0)+1 and (0,0) <=5000}
rule : {trunc((0,0))} 1000 {fractional(( 1, 0)) = 0.1 and (0,0) <= (1,0)+1 and (0,0) >100}
rule : {trunc((0,1))+ 1 + 0.1} 10 {fractional(( 0, 1)) = 0.1 and (0,0) > (0,1)+1 and (0,0) <=5000}
rule : {trunc((0,0))} 1000 {fractional(( 0, 1)) = 0.1 and (0,0) <= (0,1)+1 and (0,0) >100}
rule : {trunc((-1,0))+ 1 + 0.1} 10 {fractional(( -1, 0)) = 0.1 and (0,0) > (-1,0)+1 and (0,0) <=5000}
rule : {trunc((0,0))} 1000 {fractional(( 1, 0)) = 0.1 and (0,0) <= (-1,0)+1 and (0,0) >100}

%backtracking marking: left, down, right, up
rule : {trunc((0,0))+0.2} 10 {fractional(( 0, 1)) = 0.2 and (0,0) + 1 = trunc((0,1)) and (0,0) >=100 and (0,0) <5000}
rule : {trunc((0,0))+0.2} 10 {fractional(( -1, 0)) = 0.2 and (0,0) + 1 = trunc((-1,0)) and (0,0) >=100 and (0,0) <5000}
rule : {trunc((0,0))+0.2} 10 {fractional(( 0, -1)) = 0.2 and (0,0) + 1 = trunc((0,-1)) and (0,0) >=100 and (0,0) <5000}
rule : {trunc((0,0))+0.2} 10 {fractional(( 1, 0)) = 0.2 and (0,0) + 1 = trunc((1,0)) and (0,0) >=100 and (0,0) <5000}

%final path marking
rule : {5001} 10 {fractional((0,0))=0.2}


rule : {(0,0)} 100 {t}


[arrival-zone]
%Exploring arrival zone: right, up, left, down
rule : {trunc((0,-1))+ 1 + 0.2} 10 {fractional(( 0, -1)) = 0.1 and (0,0) > 1.99 and (0,0) <100}
rule : {trunc((1, 0))+ 1 + 0.2 } 10  {fractional(( 1, 0)) = 0.1 and (0,0) > 1.99 and (0,0) <100}
rule : {trunc((0,1))+ 1 + 0.2} 10  {fractional(( 0, 1)) = 0.1 and (0,0) > 1.99 and (0,0) <100}
rule : {trunc((-1,0))+ 1 + 0.2} 10 {fractional(( -1, 0)) = 0.1 and (0,0) > 1.99 and (0,0) <100}
rule : {(0,0)} 100 {t}

