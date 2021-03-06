!        Generated by TAPENADE     (INRIA, Ecuador team)
!  Tapenade 3.16 (master) -  9 Oct 2020 17:47
!
MODULE MOD_MEAN_B
  USE MOD_MATH_B, ONLY : divide_b, add_b
  IMPLICIT NONE
  PUBLIC :: mean_b
  PRIVATE 

CONTAINS
!  Differentiation of mean in reverse (adjoint) mode (with options i4 dr8 r8):
!   gradient     of useful results: a b
!   with respect to varying inputs: a b
!   RW status of diff variables: a:incr b:in-zero
  SUBROUTINE MEAN_B(a, ad, b, bd)
    IMPLICIT NONE
    real(8), DIMENSION(:), INTENT(INOUT) :: a
    real(8), DIMENSION(:), INTENT(INOUT) :: ad
    real(8), INTENT(INOUT) :: b
    real(8), INTENT(INOUT) :: bd
    real(8) :: temp
    real(8) :: tempd
    real(8) :: n
    INTEGER*8 :: i
    INTRINSIC SIZE
    INTRINSIC REAL
    INTRINSIC INT
    INTEGER*8 :: ad_to
    n = REAL(SIZE(a), 8)
    DO i=1,INT(n)

    END DO
    CALL PUSHINTEGER8(i - 1)
    tempd = bd
    CALL DIVIDE_B(b, bd, n, temp, tempd)
    CALL POPINTEGER8(ad_to)
    DO i=ad_to,1,-1
      tempd = bd
      CALL ADD_B(b, bd, a(i), ad(i), temp, tempd)
    END DO
    bd = 0.0_8
  END SUBROUTINE MEAN_B

END MODULE MOD_MEAN_B
