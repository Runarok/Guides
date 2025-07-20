<details>
  <summary>Which Machine Learning Algorithm Is Right for You?</summary><br>

<table>
  <thead>
    <tr>
      <th>Algorithm</th>
      <th>Dataset Size</th>
      <th>Training Speed</th>
      <th>Interpretability</th>
      <th>Tuning</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Linear Models</td>
      <td>Small</td>
      <td>Very Fast</td>
      <td>Easy</td>
      <td>Minimal</td>
      <td>Widely used basic algorithm. Linear SVM handles high-dimensional data well.</td>
    </tr>
    <tr>
      <td>Decision Trees</td>
      <td>Small</td>
      <td>Very Fast</td>
      <td>Easy</td>
      <td>Some</td>
      <td>Good generalist algorithm, but check for overfitting.</td>
    </tr>
    <tr>
      <td>(Nonlinear) Support Vector Machine</td>
      <td>Medium-sized</td>
      <td>Moderately Slow</td>
      <td>Difficult</td>
      <td>Some</td>
      <td>Good accuracy.</td>
    </tr>
    <tr>
      <td>Nearest Neighbor</td>
      <td>Medium-sized</td>
      <td>Moderately Fast</td>
      <td>Moderately Easy</td>
      <td>Minimal</td>
      <td>Lower accuracy, but easy to use and interpret.</td>
    </tr>
    <tr>
      <td>Naïve Bayes</td>
      <td>Medium-sized</td>
      <td>Very Fast</td>
      <td>Moderately Easy</td>
      <td>Some</td>
      <td>Widely used for text analytics (e.g., spam filtering); kernel Bayes will run slower.</td>
    </tr>
    <tr>
      <td>Ensembles</td>
      <td>Large</td>
      <td>Moderately Fast</td>
      <td>Difficult</td>
      <td>Some</td>
      <td>Higher accuracy with a tradeoff of lower interpretability.</td>
    </tr>
    <tr>
      <td>Neural Network (Shallow)</td>
      <td>Medium-sized</td>
      <td>Moderately Fast</td>
      <td>Moderately Easy</td>
      <td>Some</td>
      <td>Still used for signal classification, compression, and forecasting.</td>
    </tr>
    <tr>
      <td>Deep Nets</td>
      <td>Large</td>
      <td>Very Slow</td>
      <td>Difficult</td>
      <td>A Lot</td>
      <td>A standard algorithm for image, video, signals, and text.</td>
    </tr>
  </tbody>
</table>
</details>

---

<details>
    <summary>MATLAB® Basic Functions Reference</summary><br>
<details>
  <summary>MATLAB Environment</summary><br>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Command</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>clc</td>
        <td>Clear command window</td>
      </tr>
      <tr>
        <td>help fun</td>
        <td>Display in-line help for a function</td>
      </tr>
      <tr>
        <td>doc fun</td>
        <td>Open documentation for a function</td>
      </tr>
      <tr>
        <td>load("filename","vars")</td>
        <td>Load variables from a .mat file</td>
      </tr>
      <tr>
        <td>uiimport("filename")</td>
        <td>Open interactive import tool</td>
      </tr>
      <tr>
        <td>save("filename","vars")</td>
        <td>Save variables to file</td>
      </tr>
      <tr>
        <td>clear item</td>
        <td>Remove items from workspace</td>
      </tr>
      <tr>
        <td>examplescript</td>
        <td>Run the script file named "examplescript"</td>
      </tr>
      <tr>
        <td>format style</td>
        <td>Set output display format</td>
      </tr>
      <tr>
        <td>ver</td>
        <td>Get list of installed toolboxes</td>
      </tr>
      <tr>
        <td>tic, toc</td>
        <td>Start and stop timer</td>
      </tr>
      <tr>
        <td>Ctrl+C</td>
        <td>Abort the current calculation</td>
      </tr>
    </tbody>
  </table>
</details>

---

<details>
  <summary>Operators and Special Characters</summary><br>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Operator/Symbol</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>+, -, *, /</td>
        <td>Matrix math operations</td>
      </tr>
      <tr>
        <td>.*, ./</td>
        <td>Array multiplication and division (element-wise)</td>
      </tr>
      <tr>
        <td>^, .^</td>
        <td>Matrix and array power</td>
      </tr>
      <tr>
        <td>\</td>
        <td>Left division or linear optimization</td>
      </tr>
      <tr>
        <td>.' , '</td>
        <td>Normal and complex conjugate transpose</td>
      </tr>
      <tr>
        <td>==, ~=, &lt;, &gt;, &lt;=, &gt;=</td>
        <td>Relational operators</td>
      </tr>
      <tr>
        <td>&& , || , ~ , xor</td>
        <td>Logical operations (AND, OR, NOT, XOR)</td>
      </tr>
      <tr>
        <td>;</td>
        <td>Suppress output display</td>
      </tr>
      <tr>
        <td>...</td>
        <td>Connect lines (with break)</td>
      </tr>
      <tr>
        <td>%</td>
        <td>Description or comment</td>
      </tr>
      <tr>
        <td>'Hello'</td>
        <td>Definition of a character vector</td>
      </tr>
      <tr>
        <td>"This is a string"</td>
        <td>Definition of a string</td>
      </tr>
      <tr>
        <td>str1 + str2</td>
        <td>Append strings</td>
      </tr>
    </tbody>
  </table>
</details>

---

<details>
  <summary>Defining and Changing Array Variables</summary><br>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Command/Expression</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>a = 5</td>
        <td>Define variable a with value 5</td>
      </tr>
      <tr>
        <td>A = [1 2 3; 4 5 6]</td>
        <td>Define A as a 2x3 matrix (rows separated by ";")</td>
      </tr>
      <tr>
        <td>[A, B]</td>
        <td>Concatenate arrays horizontally</td>
      </tr>
      <tr>
        <td>[A; B]</td>
        <td>Concatenate arrays vertically</td>
      </tr>
      <tr>
        <td>x(4) = 7</td>
        <td>Change the 4th element of x to 7</td>
      </tr>
      <tr>
        <td>A(1,3) = 5</td>
        <td>Change A(1,3) to 5</td>
      </tr>
      <tr>
        <td>x(5:10)</td>
        <td>Get the 5th to 10th elements of x</td>
      </tr>
      <tr>
        <td>x(1:2:end)</td>
        <td>Get every 2nd element of x (from 1st to last)</td>
      </tr>
      <tr>
        <td>x(x &gt; 6)</td>
        <td>List elements greater than 6</td>
      </tr>
      <tr>
        <td>x(x == 10) = 1</td>
        <td>Change elements using a condition</td>
      </tr>
      <tr>
        <td>A(4,:)</td>
        <td>Get the 4th row of A</td>
      </tr>
      <tr>
        <td>A(:,3)</td>
        <td>Get the 3rd column of A</td>
      </tr>
    </tbody>
  </table>
</details>

---

<details>
  <summary>Special Variables and Constants</summary><br>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Variable/Constant</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>ans</td>
        <td>Most recent answer</td>
      </tr>
      <tr>
        <td>pi</td>
        <td>π = 3.141592654…</td>
      </tr>
      <tr>
        <td>i, j, 1i, 1j</td>
        <td>Imaginary unit</td>
      </tr>
      <tr>
        <td>NaN, nan</td>
        <td>Not a number (e.g., division by zero)</td>
      </tr>
      <tr>
        <td>Inf, inf</td>
        <td>Infinity</td>
      </tr>
      <tr>
        <td>eps</td>
        <td>Floating-point relative accuracy</td>
      </tr>
    </tbody>
  </table>
</details>

---

<details>
  <summary>Complex Numbers</summary><br>
  <table border="1" cellpadding="5" cellspacing="0">
    <thead>
      <tr>
        <th>Command</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>i, j, 1i, 1j</td>
        <td>Imaginary unit</td>
      </tr>
      <tr>
        <td>real(z)</td>
        <td>Real part of a complex number</td>
      </tr>
      <tr>
        <td>imag(z)</td>
        <td>Imaginary part of a complex number</td>
      </tr>
      <tr>
        <td>angle(z)</td>
        <td>Phase angle in radians</td>
      </tr>
      <tr>
        <td>conj(z)</td>
        <td>Element-wise complex conjugate</td>
      </tr>
      <tr>
        <td>isreal(z)</td>
        <td>Determine whether an array is real</td>
      </tr>
    </tbody>
  </table>
</details>

---

<details>
  <summary>Elementary Functions</summary><br>
  <table>
    <tr>
      <th>Function</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>sin(x), asin</code></td>
      <td>Sine and inverse (argument in radians)</td>
    </tr>
    <tr>
      <td><code>sind(x), asind</code></td>
      <td>Sine and inverse (argument in degrees)</td>
    </tr>
    <tr>
      <td><code>sinh(x), asinh</code></td>
      <td>Hyperbolic sine and inverse (argument in radians)</td>
    </tr>
    <tr>
      <td><code>cos, tan, csc, sec, cot</code></td>
      <td>Other trigonometric functions</td>
    </tr>
    <tr>
      <td><code>abs(x)</code></td>
      <td>Absolute value of x, complex magnitude</td>
    </tr>
    <tr>
      <td><code>exp(x)</code></td>
      <td>Exponential of x</td>
    </tr>
    <tr>
      <td><code>sqrt(x), nthroot(x, n)</code></td>
      <td>Square root, real nth root of real numbers</td>
    </tr>
    <tr>
      <td><code>log(x)</code></td>
      <td>Natural logarithm of x</td>
    </tr>
    <tr>
      <td><code>log2(x), log10</code></td>
      <td>Logarithm with base 2 and 10, respectively</td>
    </tr>
    <tr>
      <td><code>factorial(n)</code></td>
      <td>Factorial of n</td>
    </tr>
    <tr>
      <td><code>sign(x)</code></td>
      <td>Sign of x</td>
    </tr>
    <tr>
      <td><code>mod(x, d)</code></td>
      <td>Remainder after division (modulo)</td>
    </tr>
    <tr>
      <td><code>ceil(x), fix, floor</code></td>
      <td>Round toward +inf, 0, -inf</td>
    </tr>
    <tr>
      <td><code>round(x)</code></td>
      <td>Round to nearest decimal or integer</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Tables</summary><br>
  <table>
    <tr>
      <th>Function</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>table(var1, ..., varN)</code></td>
      <td>Create table from data in variables <code>var1, ..., varN</code></td>
    </tr>
    <tr>
      <td><code>readtable("file")</code></td>
      <td>Create table from file</td>
    </tr>
    <tr>
      <td><code>array2table(A)</code></td>
      <td>Convert numeric array to table</td>
    </tr>
    <tr>
      <td><code>T.var</code></td>
      <td>Extract data from variable <code>var</code></td>
    </tr>
    <tr>
      <td><code>T(rows, columns), T(rows, ["col1", "coln"])</code></td>
      <td>Create a new table with specified rows and columns from <code>T</code></td>
    </tr>
    <tr>
      <td><code>T.varname = data</code></td>
      <td>Assign data to (new) column in <code>T</code></td>
    </tr>
    <tr>
      <td><code>T.Properties</code></td>
      <td>Access properties of <code>T</code></td>
    </tr>
    <tr>
      <td><code>categorical(A)</code></td>
      <td>Create a categorical array</td>
    </tr>
    <tr>
      <td><code>summary(T), groupsummary</code></td>
      <td>Print summary of table</td>
    </tr>
    <tr>
      <td><code>join(T1, T2)</code></td>
      <td>Join tables with common variables</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Plotting</summary><br>
  <table>
    <tr>
      <th>Function</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>plot(x, y, LineSpec)</code></td>
      <td>Plot y vs. x (LineSpec is optional). LineSpec is a combination of linestyle, marker, and color as a string. Example: "-r" = red solid line without markers</td>
    </tr>
    <tr>
      <td><code>title("Title")</code></td>
      <td>Add plot title</td>
    </tr>
    <tr>
      <td><code>legend("1st", "2nd")</code></td>
      <td>Add legend to axes</td>
    </tr>
    <tr>
      <td><code>x/y/zlabel("label")</code></td>
      <td>Add x/y/z axis label</td>
    </tr>
    <tr>
      <td><code>x/y/zticks(ticksvec)</code></td>
      <td>Get or set x/y/z axis ticks</td>
    </tr>
    <tr>
      <td><code>x/y/zticklabels(labels)</code></td>
      <td>Get or set x/y/z axis tick labels</td>
    </tr>
    <tr>
      <td><code>x/y/ztickangle(angle)</code></td>
      <td>Rotate x/y/z axis tick labels</td>
    </tr>
    <tr>
      <td><code>x/y/zlim</code></td>
      <td>Get or set x/y/z axis range</td>
    </tr>
    <tr>
      <td><code>axis(lim), axis style</code></td>
      <td>Set axis limits and style</td>
    </tr>
    <tr>
      <td><code>text(x, y, "txt")</code></td>
      <td>Add text</td>
    </tr>
    <tr>
      <td><code>grid on/off</code></td>
      <td>Show axis grid</td>
    </tr>
    <tr>
      <td><code>hold on/off</code></td>
      <td>Retain the current plot when adding new plots</td>
    </tr>
    <tr>
      <td><code>subplot(m, n, p), tiledlayout(m, n)</code></td>
      <td>Create axes in tiled positions</td>
    </tr>
    <tr>
      <td><code>yyaxis left/right</code></td>
      <td>Create second y-axis</td>
    </tr>
    <tr>
      <td><code>figure</code></td>
      <td>Create figure window</td>
    </tr>
    <tr>
      <td><code>gcf, gca</code></td>
      <td>Get current figure, get current axis</td>
    </tr>
    <tr>
      <td><code>clf</code></td>
      <td>Clear current figure</td>
    </tr>
    <tr>
      <td><code>close all</code></td>
      <td>Close open figures</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Tasks (Live Editor)</summary><br>
  <table>
    <tr>
      <th>Task</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>Clean Missing Data</code></td>
      <td>Interactively clean missing data in your dataset</td>
    </tr>
    <tr>
      <td><code>Clean Outlier</code></td>
      <td>Interactively identify and clean outliers in your data</td>
    </tr>
    <tr>
      <td><code>Find Change Points</code></td>
      <td>Identify points in the data where a change occurs</td>
    </tr>
    <tr>
      <td><code>Find Local Extrema</code></td>
      <td>Find local minima and maxima in your data</td>
    </tr>
    <tr>
      <td><code>Remove Trends</code></td>
      <td>Interactively remove trends from the data</td>
    </tr>
    <tr>
      <td><code>Smooth Data</code></td>
      <td>Apply smoothing techniques to the data</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Programming Methods</summary><br>
  <table>
    <tr>
      <th>Topic</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>Functions</code></td>
      <td>
        <pre>
% Save your function in a function file or at the end
% of a script file. Function files must have the
% same name as the 1st function
function cavg = cumavg(x) %multiple args. possible
  cavg = cumsum(vec)./(1:length(vec));
end
        </pre>
      </td>
    </tr>
    <tr>
      <td><code>Anonymous Functions</code></td>
      <td>
        <pre>
% Defined via function handles
fun = @(x) cos(x.^2)./abs(3*x);
        </pre>
      </td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Control Structures</summary><br>
  <table>
    <tr>
      <th>Control Structure</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>if, elseif</code></td>
      <td>
        <pre>
if n < 10
  disp("n smaller than 10")
elseif n <= 20
  disp("n between 10 and 20")
else
  disp("n larger than 20")
end
        </pre>
      </td>
    </tr>
    <tr>
      <td><code>Switch Case</code></td>
      <td>
        <pre>
n = input("Enter an integer: ");
switch n
  case -1
    disp("negative one")
  case {0,1,2,3} % check four cases together
    disp("integer between 0 and 3")
  otherwise
    disp("integer value outside interval [-1,3]")
end
        </pre>
      </td>
    </tr>
    <tr>
      <td><code>For-Loop</code></td>
      <td>
        <pre>
% loop a specific number of times, and keep
% track of each iteration with an incrementing
% index variable
for i = 1:3
  disp("cool");
end
        </pre>
      </td>
    </tr>
    <tr>
      <td><code>While-Loop</code></td>
      <td>
        <pre>
% loops as long as a condition remains true
n = 1;
nFactorial = 1;
while nFactorial < 1e100
  n = n + 1;
  nFactorial = nFactorial * n;
end
        </pre>
      </td>
    </tr>
    <tr>
      <td><code>break</code></td>
      <td>Terminate execution of for- or while-loop</td>
    </tr>
    <tr>
      <td><code>continue</code></td>
      <td>Pass control to the next iteration of a loop</td>
    </tr>
    <tr>
      <td><code>try, catch</code></td>
      <td>Execute statements and catch errors</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Integration and Differentiation</summary><br>
  <table>
    <tr>
      <th>Function</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>integral(f, a, b)</code></td>
      <td>Numerical integration (analogous functions for 2D and 3D)</td>
    </tr>
    <tr>
      <td><code>trapz(x, y)</code></td>
      <td>Trapezoidal numerical integration</td>
    </tr>
    <tr>
      <td><code>diff(X)</code></td>
      <td>Differences and approximate derivatives</td>
    </tr>
    <tr>
      <td><code>gradient(X)</code></td>
      <td>Numerical gradient</td>
    </tr>
    <tr>
      <td><code>curl(X, Y, Z, U, V, W)</code></td>
      <td>Curl and angular velocity</td>
    </tr>
    <tr>
      <td><code>divergence(X, ..., W)</code></td>
      <td>Compute divergence of vector field</td>
    </tr>
    <tr>
      <td><code>ode45(ode, tspan, y0)</code></td>
      <td>Solve system of nonstiff ODEs</td>
    </tr>
    <tr>
      <td><code>ode15s(ode, tspan, y0)</code></td>
      <td>Solve system of stiff ODEs</td>
    </tr>
    <tr>
      <td><code>deval(sol, x)</code></td>
      <td>Evaluate solution of differential equation</td>
    </tr>
    <tr>
      <td><code>pdepe(m, pde, ic, ..., bc, xm, ts)</code></td>
      <td>Solve 1D partial differential equation</td>
    </tr>
    <tr>
      <td><code>pdeval(m, xmesh, ..., usol, xq)</code></td>
      <td>Interpolate numeric PDE solution</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Matrices and Arrays</summary><br>
  <table>
    <tr>
      <th>Function</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>length(A)</code></td>
      <td>Length of largest array dimension</td>
    </tr>
    <tr>
      <td><code>size(A)</code></td>
      <td>Array dimensions</td>
    </tr>
    <tr>
      <td><code>numel(A)</code></td>
      <td>Number of elements in array</td>
    </tr>
    <tr>
      <td><code>sort(A)</code></td>
      <td>Sort array elements</td>
    </tr>
    <tr>
      <td><code>sortrows(A)</code></td>
      <td>Sort rows of array or table</td>
    </tr>
    <tr>
      <td><code>flip(A)</code></td>
      <td>Flip order of elements in array</td>
    </tr>
    <tr>
      <td><code>squeeze(A)</code></td>
      <td>Remove dimensions of length 1</td>
    </tr>
    <tr>
      <td><code>reshape(A, sz)</code></td>
      <td>Reshape array</td>
    </tr>
    <tr>
      <td><code>repmat(A, n)</code></td>
      <td>Repeat copies of array</td>
    </tr>
    <tr>
      <td><code>any(A), all</code></td>
      <td>Check if any/all elements are nonzero</td>
    </tr>
    <tr>
      <td><code>nnz(A)</code></td>
      <td>Number of nonzero array elements</td>
    </tr>
    <tr>
      <td><code>find(A)</code></td>
      <td>Indices and values of nonzero elements</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Descriptive Statistics</summary><br>
  <table>
    <tr>
      <th>Function</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>sum(A), prod</code></td>
      <td>Sum or product (along columns)</td>
    </tr>
    <tr>
      <td><code>max(A), min, bounds</code></td>
      <td>Largest and smallest element</td>
    </tr>
    <tr>
      <td><code>mean(A), median, mode</code></td>
      <td>Statistical operations</td>
    </tr>
    <tr>
      <td><code>std(A), var</code></td>
      <td>Standard deviation and variance</td>
    </tr>
    <tr>
      <td><code>movsum(A, n), movprod, movmax, movmin, movmean, movmedian, movstd, movvar</code></td>
      <td>Moving statistical functions (n = length of moving window)</td>
    </tr>
    <tr>
      <td><code>cumsum(A), cumprod, cummax, cummin</code></td>
      <td>Cumulative statistical functions</td>
    </tr>
    <tr>
      <td><code>smoothdata(A)</code></td>
      <td>Smooth noisy data</td>
    </tr>
    <tr>
      <td><code>histcounts(X)</code></td>
      <td>Calculate histogram bin counts</td>
    </tr>
    <tr>
      <td><code>corrcoef(A), cov</code></td>
      <td>Correlation coefficients, covariance</td>
    </tr>
    <tr>
      <td><code>xcorr(x, y), xcov</code></td>
      <td>Cross-correlation, cross-covariance</td>
    </tr>
    <tr>
      <td><code>normalize(A)</code></td>
      <td>Normalize data</td>
    </tr>
    <tr>
      <td><code>detrend(x)</code></td>
      <td>Remove polynomial trend</td>
    </tr>
    <tr>
      <td><code>isoutlier(A)</code></td>
      <td>Find outliers in data</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Linear Algebra</summary><br>
  <table>
    <tr>
      <th>Function</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>rank(A)</code></td>
      <td>Rank of matrix</td>
    </tr>
    <tr>
      <td><code>trace(A)</code></td>
      <td>Sum of diagonal elements of matrix</td>
    </tr>
    <tr>
      <td><code>det(A)</code></td>
      <td>Determinant of matrix</td>
    </tr>
    <tr>
      <td><code>poly(A)</code></td>
      <td>Characteristic polynomial of matrix</td>
    </tr>
    <tr>
      <td><code>eig(A), eigs</code></td>
      <td>Eigenvalues and vectors of matrix (subset)</td>
    </tr>
    <tr>
      <td><code>inv(A), pinv</code></td>
      <td>Inverse and pseudo inverse of matrix</td>
    </tr>
    <tr>
      <td><code>norm(x)</code></td>
      <td>Norm of vector or matrix</td>
    </tr>
    <tr>
      <td><code>expm(A), logm</code></td>
      <td>Matrix exponential and logarithm</td>
    </tr>
    <tr>
      <td><code>cross(A, B)</code></td>
      <td>Cross product</td>
    </tr>
    <tr>
      <td><code>dot(A, B)</code></td>
      <td>Dot product</td>
    </tr>
    <tr>
      <td><code>kron(A, B)</code></td>
      <td>Kronecker tensor product</td>
    </tr>
    <tr>
      <td><code>null(A)</code></td>
      <td>Null space of matrix</td>
    </tr>
    <tr>
      <td><code>orth(A)</code></td>
      <td>Orthonormal basis for matrix range</td>
    </tr>
    <tr>
      <td><code>tril(A), triu</code></td>
      <td>Lower and upper triangular part of matrix</td>
    </tr>
    <tr>
      <td><code>linsolve(A, B)</code></td>
      <td>Solve linear system of the form AX = B</td>
    </tr>
    <tr>
      <td><code>lsqminnorm(A, B)</code></td>
      <td>Least-squares solution to linear equation</td>
    </tr>
    <tr>
      <td><code>qr(A), lu, chol</code></td>
      <td>Matrix decompositions</td>
    </tr>
    <tr>
      <td><code>svd(A)</code></td>
      <td>Singular value decomposition</td>
    </tr>
    <tr>
      <td><code>gsvd(A, B)</code></td>
      <td>Generalized SVD</td>
    </tr>
    <tr>
      <td><code>rref(A)</code></td>
      <td>Reduced row echelon form of matrix</td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Symbolic Math</summary><br>
  <table>
    <tr>
      <th>Function</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>sym x, syms x y z</code></td>
      <td>Declare symbolic variables</td>
    </tr>
    <tr>
      <td><code>eqn = y == 2*a + b</code></td>
      <td>Define a symbolic equation</td>
    </tr>
    <tr>
      <td><code>solve(eqns, vars)</code></td>
      <td>Solve symbolic expression for variable</td>
    </tr>
    <tr>
      <td><code>subs(expr, var, val)</code></td>
      <td>Substitute variable in expression</td>
    </tr>
    <tr>
      <td><code>expand(expr)</code></td>
      <td>Expand symbolic expression</td>
    </tr>
    <tr>
      <td><code>factor(expr)</code></td>
      <td>Factorize symbolic expression</td>
    </tr>
    <tr>
      <td><code>simplify(expr)</code></td>
      <td>Simplify symbolic expression</td>
    </tr>
    <tr>
      <td><code>assume(var, assumption)</code></td>
      <td>Make assumption for variable</td>
    </tr>
    <tr>
      <td><code>assumptions(z)</code></td>
      <td>Show assumptions for symbolic object</td>
    </tr>
    <tr>
      <td><code>fplot(expr), fcontour, fsurf, fmesh, fimplicit</code></td>
      <td>Plotting functions for symbolic expressions</td>
    </tr>
    <tr>
      <td><code>diff(expr, var, n)</code></td>
      <td>Differentiate symbolic expression</td>
    </tr>
    <tr>
      <td><code>dsolve(deqn, cond)</code></td>
      <td>Solve differential equation symbolically</td>
    </tr>
    <tr>
      <td><code>int(expr, var, [a, b])</code></td>
      <td>Integrate symbolic expression</td>
    </tr>
    <tr>
      <td><code>taylor(fun, var, z0)</code></td>
      <td>Taylor expansion of function</td>
    </tr>
  </table>
</details>

</details>

---

<details>
  <summary>MATLAB for Python Users</summary><br>
<details>
  <summary>General Behavior</summary><br>
  <table>
    <tr>
      <th>Python Syntax</th>
      <th>MATLAB Syntax</th>
      <th>Purpose</th>
    </tr>
    <tr>
      <td><code>#</code></td>
      <td><code>%</code></td>
      <td>Comment</td>
    </tr>
    <tr>
      <td><code>print</code></td>
      <td><code>disp</code></td>
      <td>Print output</td>
    </tr>
    <tr>
      <td><code>/ ...</code></td>
      <td><code>... </code></td>
      <td>Continue to next line</td>
    </tr>
    <tr>
      <td><code>x = 1+...2;</code></td>
      <td><code>x = 1+2;</code></td>
      <td>Mathematical operators</td>
    </tr>
    <tr>
      <td><code>os !</code></td>
      <td><code>!</code></td>
      <td>Operating system command</td>
    </tr>
    <tr>
      <td><code>+ - * /</code></td>
      <td><code>+ - * /</code></td>
      <td>Mathematical operators</td>
    </tr>
    <tr>
      <td><code>**</code></td>
      <td><code>^</code></td>
      <td>Exponent</td>
    </tr>
    <tr>
      <td><code>* / **</code></td>
      <td><code>.* ./ .^</code></td>
      <td>Element-wise operators</td>
    </tr>
    <tr>
      <td><code>not, and, or</code></td>
      <td><code>~ & |</code></td>
      <td>Logical operators</td>
    </tr>
    <tr>
      <td><code>del</code></td>
      <td><code>clear</code></td>
      <td>Clear variable from memory</td>
    </tr>
    <tr>
      <td><code>os.clear()</code></td>
      <td><code>clear x y</code></td>
      <td>Clear specific variables</td>
    </tr>
    <tr>
      <td><code>clear()</code></td>
      <td><code>clear clc</code></td>
      <td>Clear command window</td>
    </tr>
  </table>
</details>

  ---

<details>
  <summary>Referencing</summary><br>
  <table>
    <tr>
      <th>MATLAB Syntax</th>
      <th>Purpose</th>
      <th>Example</th>
    </tr>
    <tr>
      <td><code>( )</code></td>
      <td>Index (copy-on-write)</td>
      <td><code>x(1,1)</code></td>
    </tr>
    <tr>
      <td><code>[ ]</code></td>
      <td>Create array</td>
      <td><code>x = [1 2 3]</code></td>
    </tr>
    <tr>
      <td><code>[ ; ]</code></td>
      <td>Join arrays</td>
      <td><code>z = [x ; y]</code></td>
    </tr>
    <tr>
      <td><code>{ }</code></td>
      <td>Create cell arrays</td>
      <td><code>x = {42; "hello world"}</code></td>
    </tr>
    <tr>
      <td><code>x{1,1}</code></td>
      <td>Extract contents from a container</td>
      <td><code>x{1,1}</code></td>
    </tr>
    <tr>
      <td><code>.</code></td>
      <td>Access class property or method</td>
      <td><code>obj.Data</code></td>
    </tr>
    <tr>
      <td><code>t.FieldName</code></td>
      <td>Reference table or struct field</td>
      <td><code>t.FieldName</code></td>
    </tr>
  </table>
  <p><strong>Notes:</strong></p>
  <ul>
    <li>Beginning element has an index of 1.</li>
    <li>Indexing is left and right inclusive.</li>
    <li>Indexing options include N-D indexing (row, col), linear indexing (element number), and logical indexing (conditional statement).</li>
  </ul>
</details>

---

<details>
  <summary>Functions</summary><br>
  <table>
    <tr>
      <th>MATLAB Syntax</th>
      <th>Purpose</th>
      <th>Example</th>
    </tr>
    <tr>
      <td><code>function z = foo(x,y)</code></td>
      <td>Create function with input arguments</td>
      <td><code>function z = foo(x,y) ... end</code></td>
    </tr>
    <tr>
      <td><code>function [a,b] = foo(x,y)</code></td>
      <td>Create function with multiple outputs</td>
      <td><code>function [a,b] = foo(x,y) ... end</code></td>
    </tr>
    <tr>
      <td><code>y = foo(x,y,"Name",Value)</code></td>
      <td>Call function with input arguments and name-value pairs</td>
      <td><code>y = foo(x,y,"Name",Value)</code></td>
    </tr>
  </table>
</details>

  ---

  <details>
  <summary>Data Types</summary><br>
  <table>
    <tr>
      <th>Python</th>
      <th>MATLAB</th>
    </tr>
    <tr>
      <td><code>float</code></td>
      <td><code>double, single</code></td>
    </tr>
    <tr>
      <td><code>complex</code></td>
      <td><code>complex single, complex double</code></td>
    </tr>
    <tr>
      <td><code>int</code></td>
      <td><code>(u)int8, (u)int16, (u)int32, (u)int64</code></td>
    </tr>
    <tr>
      <td><code>float(nan)</code></td>
      <td><code>NaN</code></td>
    </tr>
    <tr>
      <td><code>float(inf)</code></td>
      <td><code>inf</code></td>
    </tr>
    <tr>
      <td><code>str</code></td>
      <td><code>str, char</code></td>
    </tr>
    <tr>
      <td><code>bool</code></td>
      <td><code>logical</code></td>
    </tr>
    <tr>
      <td><code>dict</code></td>
      <td><code>struct</code></td>
    </tr>
    <tr>
      <td><code>list, tuple</code></td>
      <td><code>cell</code></td>
    </tr>
    <tr>
      <td><code>pandas.dataframe</code></td>
      <td><code>table</code></td>
    </tr>
  </table>
  <p><strong>Notes:</strong></p>
  <ul>
    <li>MATLAB defaults to store all numeric values as double-precision floating-point numbers.</li>
    <li>Python stores some numbers as integers and others as floating-point numbers.</li>
    <li>In MATLAB, for <code>x=4</code> and <code>y=4.0</code>, <code>x</code> is always equal to <code>y</code>.</li>
  </ul>
</details>

---

<details>
  <summary>Control Flow</summary><br>
  <table>
    <tr>
      <th>Statement</th>
      <th>Example</th>
    </tr>
    <tr>
      <td><code>for</code></td>
      <td><code>for i = 1:10 ... end</code></td>
    </tr>
    <tr>
      <td><code>if</code></td>
      <td><code>if x<3 ... elseif x == 2 ... else ... end</code></td>
    </tr>
    <tr>
      <td><code>while</code></td>
      <td><code>while x<3 ... end</code></td>
    </tr>
    <tr>
      <td><code>switch-case</code></td>
      <td><code>switch _ arg ... case _ arg ... end</code></td>
    </tr>
    <tr>
      <td><code>try-catch</code></td>
      <td><code>try ... catch ... end</code></td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Objects</summary><br>
  <table>
    <tr>
      <th>Action</th>
      <th>MATLAB Code</th>
    </tr>
    <tr>
      <td>Define a class</td>
      <td><code>classdef MyClass<br>properties<br>MyProp<br>end<br>methods<br>function obj = MyClass(val)<br>end<br>function y = MyMethod(obj,x)<br>end<br>end<br>end</code></td>
    </tr>
    <tr>
      <td>Save the class definition</td>
      <td><code>MyClass.m</code></td>
    </tr>
    <tr>
      <td>Create an object of the class</td>
      <td><code>a = MyClass</code></td>
    </tr>
    <tr>
      <td>Access the properties</td>
      <td><code>a.MyProp</code></td>
    </tr>
    <tr>
      <td>Call methods to perform operations</td>
      <td><code>b = MyMethod(a,val)</code></td>
    </tr>
    <tr>
      <td>Create a handle class for pass-by-reference</td>
      <td><code>classdef myclass &lt; handle<br>...</code></td>
    </tr>
  </table>
</details>

</details>

---

<details>
  <summary>MATLAB Live Editor Quick Start Guide</summary><br>

<details>
  <summary>Introduction</summary><br> 
  <p>MATLAB Live Editor allows you to combine code, output, and formatted text in one interactive environment. Live Scripts provide an interactive way to write and test code while incorporating explanations, visualizations, and outputs.</p>
  
  <h4>Features:</h4>
  <ul>
    <li><strong>Code Execution:</strong> Execute sections or all code to see outputs.</li>
    <li><strong>Text Formatting:</strong> Insert rich text such as titles, lists, and LaTeX equations.</li>
    <li><strong>Interactive Visualizations:</strong> Plot graphs directly within the editor.</li>
    <li><strong>Exporting:</strong> Save or export the live script as HTML, PDF, or LaTeX for sharing.</li>
    <li><strong>Interactive Widgets:</strong> Include controls like sliders and buttons for dynamic input.</li>
  </ul>
  
  <h4>Basic Steps:</h4>
  <ol>
    <li>Create a Live Script by going to <em>File > New > Live Script</em>.</li>
    <li>Write code, insert text, and visualize data.</li>
    <li>Run sections or the whole script to see results immediately.</li>
    <li>Save or export the document as needed.</li>
  </ol>
</details>

<details>
  <summary>Markdown for Formatting</summary><br>
  <table>
    <tr>
      <th>Feature</th>
      <th>Markdown</th>
    </tr>
    <tr>
      <td><strong>Title</strong></td>
      <td><code>#</code></td>
    </tr>
    <tr>
      <td><strong>Heading</strong></td>
      <td><code>##</code></td>
    </tr>
    <tr>
      <td><strong>Section break</strong></td>
      <td><code>%%</code></td>
    </tr>
    <tr>
      <td><strong>Bulleted list</strong></td>
      <td><code>*</code></td>
    </tr>
    <tr>
      <td><strong>Numbered list</strong></td>
      <td><code>1.</code></td>
    </tr>
    <tr>
      <td><strong>Hyperlink</strong></td>
      <td><code>&lt; &gt;</code></td>
    </tr>
    <tr>
      <td><strong>Insert LaTeX equation</strong></td>
      <td><code>$$</code></td>
    </tr>
    <tr>
      <td><strong>Monospaced text</strong></td>
      <td><code>!!</code></td>
    </tr>
    <tr>
      <td><strong>Code example</strong></td>
      <td><code>```</code></td>
    </tr>
    <tr>
      <td><strong>Text formatting</strong></td>
      <td><code>*italic*</code>, <code>**bold**</code>, <code>_italic_</code>, <code>__bold__</code>, <code>_*italic bold*__</code>, <code>*__bold italic__*</code></td>
    </tr>
  </table>
</details>

<details>
  <summary>Shortcuts for Coding</summary><br>
  <table>
    <tr>
      <th>Feature</th>
      <th>Windows</th>
      <th>Mac</th>
    </tr>
    <tr>
      <td><strong>Toggle code and text</strong></td>
      <td><code>Alt+Enter</code></td>
      <td><code>~</code></td>
    </tr>
    <tr>
      <td><strong>Insert section break</strong></td>
      <td><code>Ctrl+Alt+Enter</code></td>
      <td><code>⌘</code></td>
    </tr>
    <tr>
      <td><strong>Run section</strong></td>
      <td><code>Ctrl+Enter</code></td>
      <td><code>⌘</code></td>
    </tr>
    <tr>
      <td><strong>Run and advance</strong></td>
      <td><code>Ctrl+Shift+Enter</code></td>
      <td><code>⇧⌘</code></td>
    </tr>
    <tr>
      <td><strong>Run all</strong></td>
      <td><code>F5</code></td>
      <td><code>⇧⌘R</code></td>
    </tr>
    <tr>
      <td><strong>Run next line</strong></td>
      <td><code>F10</code></td>
      <td><code>F10</code></td>
    </tr>
    <tr>
      <td><strong>Comment</strong></td>
      <td><code>Ctrl+R</code></td>
      <td><code>⌘/</code></td>
    </tr>
    <tr>
      <td><strong>Uncomment</strong></td>
      <td><code>Ctrl+T</code></td>
      <td><code>⌘T</code></td>
    </tr>
    <tr>
      <td><strong>Increase indent</strong></td>
      <td><code>Ctrl+]</code></td>
      <td><code>⌘]</code></td>
    </tr>
    <tr>
      <td><strong>Decrease indent</strong></td>
      <td><code>Ctrl+[</code></td>
      <td><code>⌘[</code></td>
    </tr>
    <tr>
      <td><strong>Smart indent</strong></td>
      <td><code>Ctrl+I</code></td>
      <td><code>⌘I</code></td>
    </tr>
    <tr>
      <td><strong>Quit execution</strong></td>
      <td><code>Ctrl+C</code></td>
      <td><code>⌃C</code></td>
    </tr>
    <tr>
      <td><strong>Quit execution</strong></td>
      <td><code>Shift+F5</code></td>
      <td><code>⌃C</code></td>
    </tr>
  </table>
</details>

---

<details>
  <summary>Writing Code</summary><br>
  <p>Writing code in MATLAB Live Editor allows you to combine text, code, and outputs in an interactive environment. The editor facilitates writing code, visualizing results, and adding explanations simultaneously.</p>
  
  <h4>Code Writing Tips:</h4>
  <ul>
    <li><strong>Write code in sections:</strong> Use section breaks (`%%`) to organize the script into different parts.</li>
    <li><strong>Insert comments:</strong> Use `%` for single-line comments to explain the code and improve readability.</li>
    <li><strong>Use interactive widgets:</strong> You can add sliders and buttons to make your code more interactive and visually informative.</li>
  </ul>

  <h4>Code Structure:</h4>
  <pre><code>
  %% Section 1: Define Variables
  x = 1:10;
  y = x.^2;
  
  %% Section 2: Plot the Data
  plot(x, y);
  title('Plot of x vs y');
  </code></pre>
</details>

<details>
  <summary>Debugging</summary><br>
  <p>MATLAB provides several tools to help debug your code and find errors efficiently. You can use breakpoints, the Debugging panel, and other features to step through the code and inspect variables.</p>

  <h4>Debugging Techniques:</h4>
  <ul>
    <li><strong>Set Breakpoints:</strong> Click on the left margin of the script to set breakpoints where you want the execution to pause. This helps you inspect variables.</li>
    <li><strong>Step Through Code:</strong> Use the 'Step' options to go through your code one line at a time to identify issues.</li>
    <li><strong>Use the Debugging Panel:</strong> View variable values and modify them in real-time during the execution of the script.</li>
  </ul>
  
  <h4>Common Debugging Commands:</h4>
  <table>
    <tr>
      <th>Command</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><code>dbstop</code></td>
      <td>Sets a breakpoint in the code (e.g., <code>dbstop in script_name at line_number</code>)</td>
    </tr>
    <tr>
      <td><code>dbcont</code></td>
      <td>Continues execution after hitting a breakpoint</td>
    </tr>
    <tr>
      <td><code>dbstep</code></td>
      <td>Steps through the code one line at a time</td>
    </tr>
    <tr>
      <td><code>dbquit</code></td>
      <td>Quits the debugging session</td>
    </tr>
  </table>
</details>

<details>
  <summary>Exploring Outputs</summary><br>
  <p>MATLAB allows you to explore outputs interactively within the Live Editor. You can view results in the output area, plot them graphically, and even modify them in real-time to test different scenarios.</p>

  <h4>Exploring Output:</h4>
  <ul>
    <li><strong>View Numeric Outputs:</strong> Numeric results from calculations are displayed immediately below the code block.</li>
    <li><strong>Visualize Data:</strong> MATLAB's plotting functions allow you to generate graphs to visualize data outputs easily.</li>
    <li><strong>Use the Variable Editor:</strong> You can inspect and edit variables directly in the Variable Editor to explore data values.</li>
  </ul>

  <h4>Examples of Output Exploration:</h4>
  <pre><code>
  %% Section: Compute and Display Results
  x = 1:10;
  y = x.^2;
  disp(y);
  
  %% Section: Plotting the Results
  plot(x, y);
  xlabel('x');
  ylabel('y');
  title('Square of x');
  </code></pre>
</details>

</details>

---

<details>
<summary>Importing and Exporting Data Using MATLAB</summary><br>

<details>
  <summary>Standard File Formats</summary><br>

  <table>
    <thead>
      <tr>
        <th>Type</th>
        <th>Single File</th>
        <th>Multiple Files</th>
        <th>Write</th>
        <th>Advanced</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Text</td>
        <td><code>readtable</code></td>
        <td><code>tabularTextDatastore</code></td>
        <td><code>writetable</code></td>
        <td><code>detectImportOptions</code>, <code>textscan</code></td>
      </tr>
      <tr>
        <td>Spreadsheet</td>
        <td><code>readtable</code></td>
        <td><code>spreadsheetDatastore</code></td>
        <td><code>writetable</code></td>
        <td><code>detectImportOptions</code></td>
      </tr>
      <tr>
        <td>.mat</td>
        <td><code>load</code></td>
        <td><code>matfile</code>, <code>fileDatastore</code></td>
        <td><code>save</code></td>
        <td>Custom datastore</td>
      </tr>
      <tr>
        <td>Image</td>
        <td><code>imread</code></td>
        <td><code>imageDatastore</code></td>
        <td><code>imwrite</code></td>
        <td>Custom datastore</td>
      </tr>
      <tr>
        <td>Video</td>
        <td><code>VideoReader</code></td>
        <td><code>fileDatastore</code></td>
        <td><code>VideoWriter</code></td>
        <td>Custom datastore</td>
      </tr>
      <tr>
        <td>Audio</td>
        <td><code>audioread</code></td>
        <td><code>fileDatastore</code></td>
        <td><code>audiowrite</code></td>
        <td>Custom datastore</td>
      </tr>
      <tr>
        <td>NetCDF</td>
        <td><code>ncread</code></td>
        <td><code>fileDatastore</code></td>
        <td><code>ncwrite</code></td>
        <td><code>netcdf</code></td>
      </tr>
      <tr>
        <td>CDF</td>
        <td><code>cdfread</code></td>
        <td><code>fileDatastore</code></td>
        <td><code>cdfwrite</code></td>
        <td><code>cdflib</code></td>
      </tr>
      <tr>
        <td>HDF5</td>
        <td><code>h5read</code></td>
        <td><code>fileDatastore</code></td>
        <td><code>h5write</code></td>
        <td><code>H5</code>, <code>H5F</code>, ...</td>
      </tr>
      <tr>
        <td>XML</td>
        <td><code>xmlread</code></td>
        <td><code>fileDatastore</code></td>
        <td><code>xmlwrite</code></td>
        <td>Custom datastore</td>
      </tr>
      <tr>
        <td>Binary</td>
        <td><code>fread</code></td>
        <td><code>fileDatastore</code></td>
        <td><code>fwrite</code></td>
        <td>Custom datastore</td>
      </tr>
    </tbody>
  </table>
</details>


<details>
<summary><b>Low-Level I/O</b></summary><br>

<p>Low-level functions such as <code>fgetl</code> and <code>fscanf</code> allow the most control over I/O.</p>

<table>
  <tr>
    <th>Type</th>
    <th>Specifier</th>
    <th>Output Class</th>
  </tr>
  <tr>
    <td>Signed int</td>
    <td>%d, %8d, ...</td>
    <td>int32, int8</td>
  </tr>
  <tr>
    <td>Unsigned int</td>
    <td>%u, %8u, ...</td>
    <td>uint32, uint8</td>
  </tr>
  <tr>
    <td>Floating point</td>
    <td>%f, %8.2f</td>
    <td>double, single</td>
  </tr>
  <tr>
    <td>Text array</td>
    <td>%s, %q, "TextType"</td>
    <td>string</td>
  </tr>
  <tr>
    <td>Datetime</td>
    <td>%D, %{fmt}D</td>
    <td>datetime</td>
  </tr>
  <tr>
    <td>Duration</td>
    <td>%t, %{fmt}t</td>
    <td>duration</td>
  </tr>
  <tr>
    <td>Category</td>
    <td>%C</td>
    <td>categorical</td>
  </tr>
  <tr>
    <td>Pattern</td>
    <td>%[-]</td>
    <td>string</td>
  </tr>
  <tr>
    <td>Skip field</td>
    <td>%*k</td>
    <td>—</td>
  </tr>
</table>

</details>

<details>
<summary>Web Data</summary><br>

<h4>RESTful Web Service</h4>
<table>
  <tr>
    <th>Function</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>webread</code></td>
    <td>Read data</td>
  </tr>
  <tr>
    <td><code>webwrite</code></td>
    <td>Write data</td>
  </tr>
  <tr>
    <td><code>websave</code></td>
    <td>Save data to file</td>
  </tr>
  <tr>
    <td><code>weboptions</code></td>
    <td>Specify options such as authentication and timeout</td>
  </tr>
</table>

<h4>JSON</h4>
<table>
  <tr>
    <th>Function</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>jsondecode</code></td>
    <td>Decode JSON data</td>
  </tr>
  <tr>
    <td><code>jsonencode</code></td>
    <td>Encode JSON data</td>
  </tr>
</table>

<h4>HTTP Messaging</h4>
<p>Use the HTTP interface for more complex web communication:</p>

<pre>
body = ...
    matlab.net.http.MessageBody(x);

request = ...
    matlab.net.http.RequestMessage(method, header, body);
</pre>

</details>

</details>

---

<details>
<summary>Organizing and Accessing Data Cheat Sheet</summary><br>

<p>Focuses on managing and accessing data, a natural progression after importing/exporting.</p>

</details>

---

<details>
<summary>Preprocessing Time-Series Data Tips and Tricks</summary><br>

<p>Deals with preparing time-series data for analysis, an intermediate-level topic.</p>

</details>

---

<details>
<summary>Machine Learning Quick Start Guide</summary><br>

<p>Introduces machine learning concepts and workflows.</p>

</details>

---

<details>
<summary>Deep Learning with MATLAB Quick Start Guide</summary><br>

<p>Builds on machine learning with deep learning techniques.</p>

</details>

---

<details>
<summary>AutoML Cheat Sheet</summary><br>

<p>Introduces automation in machine learning, streamlining workflows for advanced users.</p>

</details>

---

<details>
<summary>Sensor Fusion Cheat Sheet Quick Start Guide</summary><br>

<p>Focuses on combining data from multiple sensors, useful for specialized applications.</p>

</details>

---

<details>
<summary>Text Analytics Cheat Sheet</summary><br>

<p>Introduces working with textual data, an advanced and specialized field.</p>

</details>

---

<details>
<summary>Problem-Based Optimization with Optimization Toolbox Cheat Sheet</summary><br>

<p>Focuses on optimization using MATLAB's toolbox, suitable for advanced optimization tasks.</p>

</details>

---

<details>
<summary>Solver-Based Optimization in MATLAB Cheat Sheet</summary><br>

<p>Advanced optimization techniques using solvers, building on problem-based approaches.</p>

</details>

---

<details>
<summary>Quantum Computing Cheat Sheet</summary><br>

<p>Covers cutting-edge topics in quantum computing.</p>

</details>

