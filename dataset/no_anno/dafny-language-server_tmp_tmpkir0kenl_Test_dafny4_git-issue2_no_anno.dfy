// RUN: %dafny /rprint:"%t.rprint" /print:"%t.print" /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

type sp_state
type operand = int

function sp_op_const(c:int) : int { c }

predicate {:opaque} InBounds(s:sp_state, o:operand, v:int)
{
    0 <= o < 0x1_0000_0000
}

lemma lemma_K_InBounds()
{ reveal_InBounds(); }




