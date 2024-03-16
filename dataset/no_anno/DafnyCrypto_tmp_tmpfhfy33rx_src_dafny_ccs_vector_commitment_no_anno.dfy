/*
 * Copyright 2023 ConsenSys Software Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License. You may obtain
 * a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software dis-
 * tributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

// A Vector Commitment Scheme is a cryptographic commitment scheme which
// operates over message vectors (i.e. ordered sequences of data messages).  A
// vector commitment can be opened at a specific position to prove that a given
// value resided at that position in the original vector.  Opening such a
// commitment should hide information about other elements in the vector
// (including how many elements there were).  Furthermore, such commitments are
// said to exhibit "positional binding" in that an adversay cannot open a
// commitment to two different values at the same position.
//
// The scheme is parameterised over the types of messages, commitments and
// openings.  Instances of this scheme must instantiate those types, and provide
// implemenentations of the three functions for commiting, opening and verifying
// commitments.  In addition, two key lemmas are provided which establish the
// required relationship between these functions.
//
// References:
//
// * "Vector Commitments and their Applications", Dario Catalano1 and Dario
//   Fiore.  In Proceedings of the conference on Practice and Theory of
//   Public-Key Cryptography (PKC), 2013.
//
// * "SoK: Vector Commitments", Anca Nitulescu, Protocol Labs.
abstract module VectorCommitmentScheme {
    // The type of messages held in vectors.  This must support equality
    // comparisons, and cannot be a heap reference.
    type Message(==,!new)

    // The type of a commitment in the scheme.
    type Commitment(==,!new)

    // An opening in this scheme (which corresponds to a single-element
    // inclusion proof).
    type Opening(!new)

    // Generate a committment from a given vector.
    function Commit(vec: seq<Message>) : Commitment
    // Cannot commit to an empty vector!
}
