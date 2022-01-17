import f90wrapTemplate.math as py_math

import unittest


class test_py_math(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_divide(self):
        a = 10.0
        b = 3.0
        c = py_math.divide(a, b)
        self.assertAlmostEqual(c, a / b, places=5)

    def test_add(self):
        a = 10.0
        b = 3.0
        c = py_math.add(a, b)
        self.assertAlmostEqual(c, a + b, places=5)

    def test_subtract(self):
        a = 10.0
        b = 3.0
        c = py_math.subtract(a, b)
        self.assertAlmostEqual(c, a - b, places=5)


if __name__ == "__main__":
    unittest.main()
