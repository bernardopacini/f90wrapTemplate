module mod_math

implicit none

public :: divide, add, subtract
private

contains

subroutine divide(a,b,c)
  real(8),intent(inout) :: a
  real(8),intent(inout) :: b
  real(8),intent(inout) :: c

  c = a / b

end subroutine divide

subroutine add(a,b,c)
  real(8),intent(inout) :: a
  real(8),intent(inout) :: b
  real(8),intent(inout) :: c

  c = a + b

end subroutine add

subroutine subtract(a,b,c)
  real(8),intent(inout) :: a
  real(8),intent(inout) :: b
  real(8),intent(inout) :: c

  c = a - b

end subroutine subtract
end module mod_math
