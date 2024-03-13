/*
 * MIT License
 *
 * Copyright (c) 2022 Reto Achermann, The University of British Columbia
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * SPDX-License-Identifier: MIT
 */

module MachineTypes {

    /// native types for unsigned integers
    newtype{:nativeType "ulong"}  uint64 = i:nat | 0 <= i <= 0xffff_ffff_ffff_ffff
    newtype{:nativeType "uint"}   uint32 = i:nat | 0 <= i <= 0xffff_ffff
    newtype{:nativeType "ushort"} uint16 = i:nat | 0 <= i <= 0xffff
    newtype{:nativeType "byte"}   uint8  = i:nat | 0 <= i <= 0xff


    // Size limits for the unsigned integer machine types
    // const UINT64_MAX := 0xffff_ffff_ffff_ffff
    // const UINT32_MAX := 0xffff_ffff
    // const UINT16_MAX := 0xffff
    // const UINT8_MAX  := 0xff

    function UINT64_MAX() : nat { 0xffff_ffff_ffff_ffff }
    function UINT64_MAX() : nat { 0xffff_ffff_ffff_ffff }
    function UINT32_MAX() : nat { 0xffff_ffff }
    function UINT32_MAX() : nat { 0xffff_ffff }
    function UINT16_MAX() : nat { 0xffff }
    function UINT16_MAX() : nat { 0xffff }
    function UINT8_MAX()  : nat { 0xff }
    function UINT8_MAX()  : nat { 0xff }

    // the word size
    function WORD_SIZE() : nat { 64 }
    function WORD_SIZE() : nat { 64 }
}
