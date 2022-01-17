import f90wrapTemplate_pyf90.mod_mean as f90_mean
import f90wrapTemplate_pyf90.mod_mean_d as f90_mean_d
import f90wrapTemplate_pyf90.mod_mean_b as f90_mean_b
import f90wrapTemplate_pyf90_cs.mod_mean as f90_cs_mean

import unittest
import numpy as np


class test_f90_derivatives_mean(unittest.TestCase):
    def setUp(self):
        self.h = 1e-8
        self.j = 1e-200

    def tearDown(self):
        pass

    def test_derivatives_mean(self):
        a_ref = np.random.rand(10)
        b_ref = np.zeros(1)
        f90_mean.mean(a_ref, b_ref)
        b_ref = b_ref[0]

        for i in range(0, len(a_ref)):
            # Finite Difference
            a = a_ref.astype(float)
            a[i] += self.h
            b = np.zeros(1)
            f90_mean.mean(a, b)
            fd = (b[0] - b_ref) / self.h

            # Complex Step
            a = a_ref.astype(complex)
            a[i] = complex(a[i], self.j)
            b = np.zeros(1, dtype=complex)
            f90_cs_mean.mean(a, b)
            cs = np.imag(b[0]) / self.j

            # Forward-Mode AD
            a = a_ref.astype(float)
            ad = np.zeros(len(a_ref))
            ad[i] = 1
            b = np.zeros(1)
            bd = np.zeros(1)
            f90_mean_d.mean_d(a, ad, b, bd)
            fwd_seeds = np.copy(ad)
            fwd = bd[0]

            # Reverse-Mode AD
            a = a_ref.astype(float)
            ad = np.zeros(len(a_ref))
            b = np.zeros(1)
            bd = np.ones(1)
            rev_seeds = bd[0]
            f90_mean_b.mean_b(a, ad, b, bd)
            rev = np.copy(ad)

            # Checks
            self.assertAlmostEqual(fd, cs, places=5)
            self.assertAlmostEqual(cs, fwd, places=5)
            self.assertAlmostEqual(np.dot(fwd_seeds, rev), np.dot(fwd, rev_seeds), places=5)


if __name__ == "__main__":
    unittest.main()
