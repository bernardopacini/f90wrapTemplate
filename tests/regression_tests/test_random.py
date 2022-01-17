import f90wrapTemplate.mean as py_mean
import f90wrapTemplate.variance as py_variance

import unittest
import numpy as np
import json
import os


class test_f90_derivatives_mean(unittest.TestCase):
    def setUp(self):
        # Set Parameters
        self.n = 10

        # Import Data
        dirScript = os.path.dirname(__file__)
        with open(dirScript + "/test_random.json") as f:
            self.data = json.load(f)

    def tearDown(self):
        del self.data

    def test_random(self):
        # Initialize Empty Array
        means = np.zeros(self.n)
        for i in range(0, self.n):
            # Generate Random Data
            np.random.seed(i)
            randomValues = np.random.rand(20)

            # Compute Mean
            means[i] = py_mean.mean(randomValues)

        # Compute Variance
        variance = py_variance.variance(means)

        # Check Values
        self.assertAlmostEqual(self.data["refVariance"], variance, places=5)


if __name__ == "__main__":
    unittest.main()
