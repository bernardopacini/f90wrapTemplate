import f90wrapTemplate_pyf90.mod_variance as f90_variance

import unittest
import numpy as np


class test_f90_variance(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_variance(self):
        a = np.random.rand(10)
        b = np.zeros(1)
        f90_variance.variance(a, b)
        self.assertAlmostEqual(b[0], np.var(a))


if __name__ == "__main__":
    unittest.main()
