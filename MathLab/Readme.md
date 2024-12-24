<details>
  <summary>Which Machine Learning Algorithm Is Right for You?</summary>

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
  <summary>MATLAB Environment</summary>
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
  <summary>Operators and Special Characters</summary>
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
  <summary>Defining and Changing Array Variables</summary>
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
  <summary>Special Variables and Constants</summary>
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
  <summary>Complex Numbers</summary>
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
</details>

---

