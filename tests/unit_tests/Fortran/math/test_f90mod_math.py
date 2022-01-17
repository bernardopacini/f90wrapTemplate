import f90wrapTemplate_pyf90.mod_math as f90_math

import unittest
import numpy as np


class test_f90_math(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_divide(self):
        a = 10.0
        b = 3.0
        c = np.zeros(1)
        f90_math.divide(a, b, c)
        self.assertAlmostEqual(c[0], a / b, places=5)

    def test_add(self):
        a = 10.0
        b = 3.0
        c = np.zeros(1)
        f90_math.add(a, b, c)
        self.assertAlmostEqual(c[0], a + b, places=5)

    def test_subtract(self):
        a = 10.0
        b = 3.0
        c = np.zeros(1)
        f90_math.subtract(a, b, c)
        self.assertAlmostEqual(c[0], a - b, places=5)


if __name__ == "__main__":
    unittest.main()
