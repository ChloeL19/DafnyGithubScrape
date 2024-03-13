class CrashableMem<T> {
class CrashableMem<T> {
    var mem_ : array<T>;
    method read(off : int) returns (r : T)
    {
        return mem_[off];
    }

    method write(off : int, val : T)
    {
        mem_[off] := val;
    }
}

datatype GhostState = GS(
    num_entry : int,
    log : seq<int>,

    mem_len : int,
    mem : seq<int>,
    old_mem : seq<int>,
    ideal_mem : seq<int>,
    countdown : int,
    first_log_pos : map<int, int>
)

datatype GhostOp = WriteMem(off : int, val : int)
                 | WriteLog(off : int, val : int)
predicate ghost_state_inv(s : GhostState) {
predicate ghost_state_inv(s : GhostState) {
    0 <= s.num_entry * 2 < |s.log|
    && |s.log| > 0
    && |s.mem| == s.mem_len && |s.ideal_mem| == s.mem_len && |s.old_mem| == s.mem_len
    && s.countdown >= 0
}

function init_ghost_state(log : seq<int>, mem : seq<int>, countdown : int) : GhostState
{
    GS(0, log[..], |mem|, mem[..], mem[..], mem[..], countdown, map[])
}

function mem_write(s : GhostState, off: int, val: int) : GhostState
{
    var new_mem := s.mem[off := val];
    var new_ideal_mem := s.ideal_mem[off := val];
    s.(mem := new_mem,
       ideal_mem := new_ideal_mem)
}

function log_write(s : GhostState, off : int, val: int) : GhostState
{
     s.(log := s.log[off := val])
}

predicate valid_op(s : GhostState, op : GhostOp)
{
    match op
    case WriteMem(off, val) => 0 <= off < |s.mem|
    case WriteLog(off, val) => 0 <= off < |s.log|
}

function countdown (s : GhostState) : GhostState
{
    if s.countdown > 0 then
        s.(countdown := s.countdown - 1)
    else
        s
}

function normal_step (s : GhostState, op : GhostOp) : GhostState
{
    match op
    case WriteMem(off, val) => mem_write(s, off, val)
    case WriteLog(off, val) => log_write(s, off, val)
}

function ghost_step (s : GhostState, op : GhostOp) : (GhostState, bool)
{
    if s.countdown > 0 then
        var s' := normal_step(s, op);
        (s'.(countdown := s.countdown - 1), true)
    else
        (s, false)
}

function mem_write_step (s : GhostState, off : int, val : int) : (GhostState, bool)
{
    ghost_step(s, WriteMem(off, val))
}

function log_write_step (s : GhostState, off : int, val : int) : (GhostState, bool)
{
    ghost_step(s, WriteLog(off, val))
}

function set_num_entry (s : GhostState, n : int) : (GhostState, bool)
{
    if s.countdown > 0 then
        (s.(num_entry := n,
            countdown := s.countdown - 1),
        true)
    else
        (s, false)
}

predicate crashed (s : GhostState)
{
    s.countdown <= 0
}

predicate old_mem_equiv (s : GhostState)
{
    (forall o :: !(o in s.first_log_pos) && 0 <= o < |s.mem| ==> s.mem[o] == s.old_mem[o])
}

predicate ghost_tx_inv (s : GhostState)
{
    ghost_state_inv(s) &&
    (forall o :: o in s.first_log_pos ==> 0 <= o < s.mem_len) &&
    (forall o :: o in s.first_log_pos ==> 0 <= s.first_log_pos[o] < s.num_entry) &&
    (forall o :: o in s.first_log_pos ==> 0 <= s.first_log_pos[o] * 2 + 1 < |s.log|) &&
    (forall o :: o in s.first_log_pos ==> s.log[s.first_log_pos[o] * 2] == o) &&
    (forall o :: o in s.first_log_pos ==> s.log[s.first_log_pos[o] * 2 + 1] == s.old_mem[o]) &&
    (forall o :: o in s.first_log_pos ==> forall i :: 0 <= i < s.first_log_pos[o] ==> s.log[i * 2] != o) &&
    (forall i :: 0 <= i < s.num_entry ==> s.log[i * 2] in s.first_log_pos)
}

function ghost_begin_tx (s : GhostState) : GhostState
{
    var (s', f) := set_num_entry(s, 0);
    var s' := s'.(first_log_pos := map[], old_mem := s.mem[..]);
    s'
}

function ghost_commit_tx (s : GhostState) : (GhostState, bool)
{
    var s' := s;
    var (s', f) := set_num_entry(s', 0);
    var s' := if f then s'.(first_log_pos := map[]) else s';
    (s', f)
}

function ghost_tx_write (s0 : GhostState, off : int, val : int) : GhostState
{
    var s := s0;
    var log_idx := s.num_entry;
    var log_off := log_idx * 2;
    var old_val := s.mem[off];
    var (s, f) := log_write_step(s, log_off, off);
    var (s, f) := log_write_step(s, log_off + 1, old_val);
    var (s, f) := set_num_entry(s, log_idx + 1);
    var s := if f && !(off in s.first_log_pos)
             then s.(first_log_pos := s.first_log_pos[off := log_idx])
             else s;
    var (s, f) := mem_write_step(s, off, val);
    s
}

function reverse_recovery (s0 : GhostState, idx : int) : GhostState
{
    if idx == 0 then
        assert old_mem_equiv(s0);
        s0
    else
        var s := s0;
        var i := idx - 1;
        var off := s.log[i * 2];
        var val := s.log[i * 2 + 1];
        var s := s.(mem := s.mem[off := val]);
        assert off in s.first_log_pos;
        var s := reverse_recovery(s, idx - 1);
        assert i == idx - 1;
        assert forall o :: o in s.first_log_pos && 0 <= s.first_log_pos[o] < i ==>
                   s.mem[o] == s.old_mem[o];
        assert forall o :: o in s.first_log_pos && s.first_log_pos[o] == i ==>
                   o == off && val == s.old_mem[o];
        assert forall o :: o in s.first_log_pos && s.first_log_pos[o] == i ==>
                   s.mem[o] == val;
        assert old_mem_equiv(s);
        s
}

function ghost_recover (s0 : GhostState) : GhostState
{
    var s := reverse_recovery(s0, s0.num_entry);
    assert (old_mem_equiv(s));
    assert (forall o :: o in s.first_log_pos ==> s.mem[o] == s0.old_mem[o]);
    assert forall i :: 0 <= i < |s.mem| ==> s.mem[i] == s0.old_mem[i];
    s.(num_entry := 0)
}


class UndoLog {
class UndoLog {
    var log_ : array<int>;
    var mem_ : array<int>;

    var impl_countdown : int;
    ghost var gs : GhostState;

    constructor () {}
    constructor () {}

    predicate ghost_state_equiv(gs : GhostState)
    {
        log_.Length > 0 &&
        mem_[..] == gs.mem &&
        log_[1..] == gs.log &&
        log_[0] == gs.num_entry &&
        impl_countdown == gs.countdown
    }
    predicate state_inv()
    {
        log_.Length > 1 && 0 <= log_[0] && (log_[0] * 2) < log_.Length
        && log_.Length < 0xffffffff && mem_ != log_
        && forall i : int :: 0 <= i < log_[0] ==> 0 <= log_[i * 2 + 1] < mem_.Length
        && impl_countdown >= 0
    }

    method init(log_size : int, mem_size : int, countdown : int)
    {
        log_ := new int[log_size];
        mem_ := new int[mem_size];
        log_[0] := 0;

        impl_countdown := countdown;
        gs := GS(0, log_[1..], mem_size, mem_[..], mem_[..], mem_[..], countdown, map[]);
    }

    method impl_countdown_dec()
    {
        impl_countdown := impl_countdown - 1;
    }

    method write_mem(off : int, val : int)
    {
        if (impl_countdown > 0) {
            mem_[off] := val;
            impl_countdown := impl_countdown - 1;
        }
    }

    method write_log(off : int, val : int)
    {
        if (impl_countdown > 0) {
            log_[off] := val;
            impl_countdown := impl_countdown - 1;
        }
    }

    method begin_tx()
    {
        write_log(0, 0);

        gs := ghost_begin_tx(gs);
        assert state_inv();
    }

    method commit_tx()
    {
        write_log(0, 0);

        gs := ghost_commit_tx(gs).0;
    }

    method tx_write(offset: int, val : int)
    {
        var log_idx := log_[0];
        var log_off := log_idx * 2;
        ghost var old_gs := gs;
        write_log(log_off + 1, offset);
        gs := log_write_step(gs, log_off, offset).0;
        assert log_off + 1 > 0;
        assert ghost_state_equiv(gs);
        assert mem_ != log_;
        var old_val := mem_[offset];
        assert old_val == gs.mem[offset];
        write_log(log_off + 2, old_val);
        
        gs := log_write_step(gs, log_off + 1, old_val).0;

        assert ghost_tx_inv(gs);
        assert log_[0] == gs.num_entry;
        assert log_.Length == |gs.log| + 1;
        assert 0 <= gs.num_entry * 2 < |gs.log|;
        
        write_log(0, log_idx + 1);

        ghost var (s, f) := set_num_entry(gs, log_idx + 1);
        s := if f && !(offset in s.first_log_pos)
             then s.(first_log_pos := s.first_log_pos[offset := log_idx])
             else s;
        gs := s;
        write_mem(offset, val);
        gs := mem_write_step(gs, offset, val).0;

        assert gs == ghost_tx_write(old_gs, offset, val);
    }

    // we assume that recover won't crash (though this code works when recover can fail)
    method recover()
    {
        var log_len := log_[0];
        assert log_len == gs.num_entry;
        if (log_len > 0) {
            var i := log_len - 1;

            ghost var gs0 := gs;
            while i >= 0
                modifies mem_;
                modifies this;
                invariant log_ == old(log_);
                invariant mem_ == old(mem_);
                invariant unchanged(log_);
                invariant -1 <= i < log_len;
                invariant |gs.log| == |gs0.log|;
                invariant ghost_state_equiv(gs);
                invariant ghost_tx_inv(gs);
                invariant old_mem_equiv(gs);
                invariant reverse_recovery(gs0, log_len) == reverse_recovery(gs, i + 1);
                decreases i;
            {
                assert ghost_state_equiv(gs);
                assert 0 <= i < log_[0];
                var o := i * 2 + 1;
                var off := log_[o];
                var val := log_[o + 1];
                mem_[off] := val;
                assert 0 <= off < mem_.Length;

                assert gs.log[i * 2] == off;
                assert gs.log[i * 2 + 1] == val;
                gs := gs.(mem := gs.mem[off := val]);
                i := i - 1;
            }
            assert ghost_state_equiv(gs);
        } else {
            assert ghost_state_equiv(gs);
        }
        log_[0] := 0;
        gs := ghost_recover(old(gs));
        assert ghost_state_equiv(gs);
    }
}

lemma crash_safe_single_tx(init_log : seq<int>, init_mem : seq<int>,
{
    var s := init_ghost_state(init_log, init_mem, countdown);

    var end_mem := init_mem;

    s := ghost_begin_tx(s);
    assert s.num_entry == 0;
    assert init_mem == s.old_mem;

    var i := 0;
    while i < |writes|
        decreases |writes| - i;
        invariant 0 <= i <= |writes|;
        invariant s.mem_len == |init_mem|;
        invariant s.mem_len == |end_mem|;
        invariant 0 <= s.num_entry <= i;
        invariant |init_log| == |s.log|;
        invariant i * 2 < |s.log|;
        invariant 0 <= s.num_entry * 2 < |s.log|;
        invariant ghost_tx_inv(s);
        invariant old_mem_equiv(s);
        invariant init_mem == s.old_mem;
        invariant !crashed(s) ==> forall i :: 0 <= i < |s.mem| ==> s.mem[i] == end_mem[i];
    {
        assert 0 <= i < |writes|;
        assert 0 <= writes[i].0 < s.mem_len;
        assert 0 <= s.num_entry * 2 + 2 < |s.log|;
        s := ghost_tx_write(s, writes[i].0, writes[i].1);

        end_mem := end_mem[writes[i].0 := writes[i].1];

        assert !crashed(s) ==> s.mem[writes[i].0] == writes[i].1;
        i := i + 1;
    }

    assert ghost_tx_inv(s);
    assert old_mem_equiv(s);

    var (s', c) := ghost_commit_tx(s);
    assert c ==> !crashed(s);

    if (c) {
        assert !crashed(s);
        assert s.mem == end_mem;
    } else {
        var recovered := ghost_recover(s');
        assert recovered.mem == init_mem;
    }
}
