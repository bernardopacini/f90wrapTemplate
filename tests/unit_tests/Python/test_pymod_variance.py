import f90wrapTemplate.variance as py_variance

import unittest
import numpy as np


class test_py_variance(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_variance(self):
        a = np.random.rand(10)
        b = py_variance.variance(a)
        self.assertAlmostEqual(b, np.var(a))


if __name__ == "__main__":
    unittest.main()
