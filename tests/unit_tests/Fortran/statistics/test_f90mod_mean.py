import f90wrapTemplate_pyf90.mod_mean as f90_mean

import unittest
import numpy as np


class test_f90_mean(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_mean(self):
        a = np.random.rand(10)
        b = np.zeros(1)
        f90_mean.mean(a, b)
        self.assertAlmostEqual(b[0], np.mean(a), places=5)


if __name__ == "__main__":
    unittest.main()
