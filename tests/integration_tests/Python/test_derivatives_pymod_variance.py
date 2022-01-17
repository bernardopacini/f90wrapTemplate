import f90wrapTemplate.variance as py_variance
import f90wrapTemplate_cs.variance as py_cs_variance

import unittest
import numpy as np


class test_f90_derivatives_variance(unittest.TestCase):
    def setUp(self):
        self.h = 1e-8
        self.j = 1e-200

    def tearDown(self):
        pass

    def test_derivatives_variance(self):
        a_ref = np.random.rand(10)
        b_ref = py_variance.variance(a_ref)

        for i in range(0, len(a_ref)):
            # Finite Difference
            a = a_ref.astype(float)
            a[i] += self.h
            b = py_variance.variance(a)
            fd = (b - b_ref) / self.h

            # Complex Step
            a = a_ref.astype(complex)
            a[i] = complex(a[i], self.j)
            b = py_cs_variance.variance(a)
            cs = np.imag(b) / self.j

            # Forward-Mode AD
            a = a_ref.astype(float)
            ad = np.zeros(len(a_ref))
            ad[i] = 1
            fwd_seeds = np.copy(ad)
            b, bd = py_variance.variance_d(a, ad)
            fwd = bd

            # Reverse-Mode AD
            a = a_ref.astype(float)
            ad = np.zeros(len(a_ref))
            b = np.array([b_ref])
            bd = np.array([1])
            rev_seeds = bd[0]
            ad = py_variance.variance_b(a, b, bd)
            rev = np.copy(ad)

            # Checks
            self.assertAlmostEqual(fd, cs, places=5)
            self.assertAlmostEqual(cs, fwd, places=5)
            self.assertAlmostEqual(np.dot(fwd_seeds, rev), np.dot(fwd, rev_seeds), places=5)


if __name__ == "__main__":
    unittest.main()
