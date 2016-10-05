# Non-blind image deconvolution with lexicographic notation
 This is a demo script for simple non-blind image deconvolution using lexicographi notation. Since images are 2D data, you need to convert the signal into a vector to express the system by linear expression (matrix-vector multiplication). Lexicographic notation is used for this. <br />
 Here, simple image deconvolutions are implemented by directly from the lexicographic expressions. Therefore, it looks more straightforward but it is very slow because the dimension of matrix become too large to handle with computers. In practice, you won't want to use this approach, but it's worth to see this. Please limit the size of image small (20x20 or so) for the test.

# Description of files/folders
- demo_deconv_lexico.m: test script
- /opt: includes functions for optimization methods
- /func: includes functions for objective function and corresponding gradient function, and hessian function.

# Image degradation and deconvolution
- Degradation model: y = Hx
- Deconvolution: <br />
   (1) Least Squares (LS) method: <br />
        min_x 0.5||y-Hx||2 <br />
   (2) Regularized Least Squares (RLS): <br />
        min_x 0.5||y-Hx||2 + 0.5*lambda*||Cx||2 <br />

* Both deconvolution methods are implemented in two ways - pseudo-inverse, and iterative method. 

# Optimization methods
For the iterative method, I implemented two numerical optimization methods <br />
  (1) Gradient descent <br />
  (2) Newton's method <br />

# Contact
Seunghwan Yoo (seunghwanyoo2013@u.northwestern.edu)
