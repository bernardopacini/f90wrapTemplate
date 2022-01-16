!        Generated by TAPENADE     (INRIA, Ecuador team)
!  Tapenade 3.16 (master) -  9 Oct 2020 17:47
!
MODULE MOD_VARIANCE_D
  USE MOD_MEAN_D, ONLY : mean_d
  USE MOD_MATH_D, ONLY : divide_d, subtract_d
  IMPLICIT NONE
  PUBLIC :: variance_d
  PRIVATE 

CONTAINS
!  Differentiation of variance in forward (tangent) mode (with options i4 dr8 r8):
!   variations   of useful results: b
!   with respect to varying inputs: a
!   RW status of diff variables: a:in b:out
  SUBROUTINE VARIANCE_D(a, ad, b, bd)
    IMPLICIT NONE
    real(8), DIMENSION(:), INTENT(INOUT) :: a
    real(8), DIMENSION(:), INTENT(INOUT) :: ad
    real(8), INTENT(INOUT) :: b
    real(8), INTENT(INOUT) :: bd
    real(8) :: meanval
    real(8) :: meanvald
    real(8) :: temp1
    real(8) :: temp1d
    real(8) :: temp2
    real(8) :: temp2d
    real(8) :: n
    INTEGER*8 :: i
    INTRINSIC SIZE
    INTRINSIC REAL
    INTRINSIC INT
    meanval = 0.0
    CALL MEAN_D(a, ad, meanval, meanvald)
    n = REAL(SIZE(a), 8)
    b = 0.0
    bd = 0.0_8
    DO i=1,INT(n)
      CALL SUBTRACT_D(a(i), ad(i), meanval, meanvald, temp1, temp1d)
      temp1d = 2*temp1*temp1d
      temp1 = temp1**2
      CALL DIVIDE_D(temp1, temp1d, n, temp2, temp2d)
      bd = bd + temp2d
      b = b + temp2
    END DO
  END SUBROUTINE VARIANCE_D

END MODULE MOD_VARIANCE_D
