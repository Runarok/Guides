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
  <summary>Tasks (Live Editor)</summary>
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



</details>

---

