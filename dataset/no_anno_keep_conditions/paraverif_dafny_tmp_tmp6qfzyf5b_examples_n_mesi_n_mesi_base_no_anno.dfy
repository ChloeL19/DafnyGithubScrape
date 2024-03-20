//(*  Title:      HOL/Auth/n_mesi_base.dfy
 //   Author:    Jiang Hongjian, ShangHai Key Laboratory of Trustworthy Computing, East China Normal University
 //   Copyright    2020 ShangHai Key Laboratory of Trustworthy Computing, East China Normal University
//*)

//header{*The n_mesi Protocol Case Study*} 

//theory n_mesi_base imports paraTheory
//begin

//section{*Main definitions of dafny  file*}

//subsection{* Definitions of Constants*}

datatype location = M| E| S| I
type client=nat
type boolean=bool


