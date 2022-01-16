module mod_mean

use mod_math, only: divide, add

implicit none

public :: mean
private

contains

subroutine mean(a,b)
  real(8),dimension(:),intent(inout) :: a
  real(8),intent(inout) :: b

  real(8) :: temp

  real(8) :: n
  integer(8) :: i

  n = real(size(a),8)

  b = 0.0
  do i = 1,int(n)
    call add(b,a(i),temp)
    b = temp
  enddo

  call divide(b,n,temp)
  b = temp

end subroutine mean
end module mod_mean
