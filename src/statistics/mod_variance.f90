module mod_variance

use mod_mean, only: mean

use mod_math, only: divide, subtract

implicit none

public :: variance
private

contains

subroutine variance(a,b)
  real(8),dimension(:),intent(inout) :: a
  real(8),intent(inout) :: b

  real(8) :: meanVal
  real(8) :: temp1
  real(8) :: temp2

  real(8) :: n
  integer(8) :: i

  meanVal = 0.0
  call mean(a,meanVal)

  n = real(size(a),8)

  b = 0.0
  do i = 1,int(n)
    call subtract(a(i),meanVal,temp1)
    temp1 = temp1**2
    call divide(temp1,n,temp2)
    b = b + temp2
  enddo

end subroutine variance
end module mod_variance
