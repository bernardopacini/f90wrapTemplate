!> Module for complex overloading
module MOD_COMPLEXIFY
!!===========================================================================!!
implicit none
!!===========================================================================!!
public :: &
  operator (.ge.),&
  operator (.gt.),&
  operator (.le.),&
  operator (.lt.),&
  sign           ,&
  norm2          ,&
  atan2          ,&
  abs            ,&
  dot_product    ,&
  log10
!!===========================================================================!!
private
character(len=*), parameter :: this_mod_name = 'mod_complexify'
!!===========================================================================!!
!! Interfaces
!!===========================================================================!!
interface operator (.ge.)
  module procedure ge_rc
  module procedure ge_cr
  module procedure ge_cc
  module procedure ge_ci
  module procedure ge_ic
end interface
interface operator (.gt.)
  module procedure gt_rc
  module procedure gt_cr
  module procedure gt_cc
  module procedure gt_ci
  module procedure gt_ic
end interface
interface operator (.le.)
  module procedure le_rc
  module procedure le_cr
  module procedure le_cc
  module procedure le_ci
  module procedure le_ic
end interface
interface operator (.lt.)
  module procedure lt_rc
  module procedure lt_cr
  module procedure lt_cc
  module procedure lt_ci
  module procedure lt_ic
end interface

interface sign
  module procedure sign_rc
end interface

interface norm2
  module procedure norm2_c
end interface

interface atan2
  module procedure atan2_cc
end interface

interface abs
  module procedure abs_c
end interface

interface dot_product
  module procedure dot_product_c
end interface

interface log10
  module procedure log10_c
end interface
!!===========================================================================!!
contains
!!===========================================================================!!
logical function ge_rc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'ge_rc'

  real(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  if (val1 .ge. real(val2)) then
    ge_rc = .True.
  else
    ge_rc = .False.
  endif
end function ge_rc

logical function ge_cr(val1,val2)
  character(len=*),parameter :: this_sub_name = 'ge_cr'

  complex(8),intent(in) :: val1
  real(8),intent(in) :: val2

  if (real(val1) .ge. val2) then
    ge_cr = .True.
  else
    ge_cr = .False.
  endif
end function ge_cr

logical function ge_cc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'ge_cc'

  complex(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  if (real(val1) .ge. real(val2)) then
    ge_cc = .True.
  else
    ge_cc = .False.
  endif
end function ge_cc

logical function ge_ci(val1,val2)
  character(len=*),parameter :: this_sub_name = 'ge_ci'

  complex(8),intent(in) :: val1
  integer,intent(in) :: val2

  if (real(val1) .ge. val2) then
    ge_ci = .True.
  else
    ge_ci = .False.
  endif
end function ge_ci

logical function ge_ic(val1,val2)
  character(len=*),parameter :: this_sub_name = 'ge_ic'

  integer,intent(in) :: val1
  complex(8),intent(in) :: val2

  if (val1 .ge. real(val2)) then
    ge_ic = .True.
  else
    ge_ic = .False.
  endif
end function ge_ic

logical function gt_rc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'gt_rc'

  real(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  if (val1 .gt. real(val2)) then
    gt_rc = .True.
  else
    gt_rc = .False.
  endif
end function gt_rc

logical function gt_cr(val1,val2)
  character(len=*),parameter :: this_sub_name = 'gt_cr'

  complex(8),intent(in) :: val1
  real(8),intent(in) :: val2

  if (real(val1) .gt. val2) then
    gt_cr = .True.
  else
    gt_cr = .False.
  endif
end function gt_cr

logical function gt_cc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'gt_cc'

  complex(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  if (real(val1) .gt. real(val2)) then
    gt_cc = .True.
  else
    gt_cc = .False.
  endif
end function gt_cc

logical function gt_ci(val1,val2)
  character(len=*),parameter :: this_sub_name = 'gt_ci'

  complex(8),intent(in) :: val1
  integer,intent(in) :: val2

  if (real(val1) .gt. val2) then
    gt_ci = .True.
  else
    gt_ci = .False.
  endif
end function gt_ci

logical function gt_ic(val1,val2)
  character(len=*),parameter :: this_sub_name = 'gt_ic'

  integer,intent(in) :: val1
  complex(8),intent(in) :: val2

  if (val1 .gt. real(val2)) then
    gt_ic = .True.
  else
    gt_ic = .False.
  endif
end function gt_ic

logical function le_rc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'le_rc'

  real(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  if (val1 .le. real(val2)) then
    le_rc = .True.
  else
    le_rc = .False.
  endif
end function le_rc

logical function le_cr(val1,val2)
  character(len=*),parameter :: this_sub_name = 'le_cr'

  complex(8),intent(in) :: val1
  real(8),intent(in) :: val2

  if (real(val1) .le. val2) then
    le_cr = .True.
  else
    le_cr = .False.
  endif
end function le_cr

logical function le_cc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'le_cc'

  complex(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  if (real(val1) .le. real(val2)) then
    le_cc = .True.
  else
    le_cc = .False.
  endif
end function le_cc

logical function le_ci(val1,val2)
  character(len=*),parameter :: this_sub_name = 'le_ci'

  complex(8),intent(in) :: val1
  integer,intent(in) :: val2

  if (real(val1) .le. val2) then
    le_ci = .True.
  else
    le_ci = .False.
  endif
end function le_ci

logical function le_ic(val1,val2)
  character(len=*),parameter :: this_sub_name = 'le_ic'

  integer,intent(in) :: val1
  complex(8),intent(in) :: val2

  if (val1 .le. real(val2)) then
    le_ic = .True.
  else
    le_ic = .False.
  endif
end function le_ic

logical function lt_rc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'lt_rc'

  real(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  if (val1 .lt. real(val2)) then
    lt_rc = .True.
  else
    lt_rc = .False.
  endif
end function lt_rc

logical function lt_cr(val1,val2)
  character(len=*),parameter :: this_sub_name = 'lt_cr'

  complex(8),intent(in) :: val1
  real(8),intent(in) :: val2

  if (real(val1) .lt. val2) then
    lt_cr = .True.
  else
    lt_cr = .False.
  endif
end function lt_cr

logical function lt_cc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'lt_cc'

  complex(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  if (real(val1) .lt. real(val2)) then
    lt_cc = .True.
  else
    lt_cc = .False.
  endif
end function lt_cc

logical function lt_ci(val1,val2)
  character(len=*),parameter :: this_sub_name = 'lt_ci'

  complex(8),intent(in) :: val1
  integer,intent(in) :: val2

  if (real(val1) .lt. val2) then
    lt_ci = .True.
  else
    lt_ci = .False.
  endif
end function lt_ci

logical function lt_ic(val1,val2)
  character(len=*),parameter :: this_sub_name = 'lt_ic'

  integer,intent(in) :: val1
  complex(8),intent(in) :: val2

  if (val1 .lt. real(val2)) then
    lt_ic = .True.
  else
    lt_ic = .False.
  endif
end function lt_ic

function sign_rc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'sign_rc'

  real(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  real(8) :: sign_rc

  sign_rc = sign(val1,real(val2))
end function sign_rc

function norm2_c(val)
  character(len=*),parameter :: this_sub_name = 'norm2'

  complex(8),dimension(:),intent(in) :: val

  real(8) :: norm_real
  real(8) :: norm_complex

  real(8) :: norm2_c

  norm_real = norm2(real(val))
  norm_complex = norm2(aimag(val))

  norm2_c = (norm_real**2 + norm_complex**2)**(0.5)
end function norm2_c

function atan2_cc(val1,val2)
  character(len=*),parameter :: this_sub_name = 'atan2_cc'

  complex(8),intent(in) :: val1
  complex(8),intent(in) :: val2

  complex(8) :: atan2_cc

  real(8) :: r1
  real(8) :: c1
  real(8) :: r2
  real(8) :: c2

  r1 = real(val1)
  c1 = aimag(val1)
  r2 = real(val2)
  c2 = aimag(val2)

  if ((r1 .ne. 0) .or. (r2 .ne. 0)) then
    atan2_cc = cmplx(atan2(r1,r2),(r2*c1-r1*c2)/(r1**2+r2**2),8)
  else
    atan2_cc = cmplx(atan2(r1,r2),0.0,8)
  endif
end function atan2_cc

function abs_c(val)
  character(len=*),parameter :: this_sub_name = 'abs_c'

  complex(8),intent(in) :: val

  complex(8) :: abs_c

  if (real(val) .lt. 0) then
    abs_c = cmplx(-real(val),-aimag(val),8)
  else
    abs_c = val
  endif

end function abs_c

function dot_product_c(val1,val2)
  character(len=*),parameter :: this_sub_name = 'dot_product_c'

  complex(8),dimension(:),intent(in) :: val1
  complex(8),dimension(:),intent(in) :: val2

  complex(8) :: dot_product_c

  integer :: N_elem_1
  integer :: N_elem_2
  integer :: iElem

  N_elem_1 = size(val1)
  N_elem_2 = size(val2)

  dot_product_c = 0

  do iElem = 1,N_elem_1
    dot_product_c = dot_product_c + val1(iElem)*val2(iElem)
  enddo
end function dot_product_c

function log10_c(val)
  character(len=*),parameter :: this_sub_name = 'log10_c'

  complex(8),intent(in) :: val
  complex(8) :: log10_c

  log10_c = log(val)/log(10.0_8)

end function log10_c
end module MOD_COMPLEXIFY