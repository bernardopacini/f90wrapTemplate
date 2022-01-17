import f90wrapTemplate.mean as py_mean

import unittest
import numpy as np


class test_py_mean(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_mean(self):
        a = np.random.rand(10)
        c = py_mean.mean(a)
        self.assertAlmostEqual(c, np.mean(a), places=5)


if __name__ == "__main__":
    unittest.main()
