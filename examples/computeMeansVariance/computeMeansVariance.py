import f90wrapTemplate.mean as f90wrapTemplate_mean
import f90wrapTemplate.variance as f90wrapTemplate_variance

import numpy as np
import matplotlib.pyplot as plt


def main():
    # Set Number of Random Sets
    n_set = 20
    n_elem = 100

    # Initialize Empty Array
    means = np.zeros(n_set)
    for i in range(0, n_set):
        # Generate Random Data
        randomValues = np.random.rand(n_elem)

        # Compute Mean
        means[i] = f90wrapTemplate_mean.mean(randomValues)

    # Compute Variance
    variance = f90wrapTemplate_variance.variance(means)

    # Print Result
    print("==================================================================")
    print("The variance of the means of a random set of numbers is: {:0.7f}".format(variance))
    print("==================================================================")


if __name__ == "__main__":
    main()
