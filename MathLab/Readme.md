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

# Using MATLAB® and Python® Together

<table>
  <thead>
    <tr>
      <th>Functionality</th>
      <th>Description</th>
      <th>MATLAB Syntax</th>
      <th>Python Syntax</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Call Python in MATLAB</td>
      <td>
        Access Python interpreter settings, call Python modules, and pass keyword arguments.
      </td>
      <td>
        <code>> pe = pyenv</code> <br>
        <code>> py.math.sqrt(42)</code> <br>
        <code>> py.foo(5, pyargs('bar', 42))</code>
      </td>
      <td>
        <code>>> import math</code> <br>
        <code>>> math.sqrt(42)</code> <br>
        <code>>> foo(5, bar=42)</code>
      </td>
    </tr>
    <tr>
      <td>Call MATLAB in Python</td>
      <td>
        Install MATLAB Engine API for Python, start the engine, and call MATLAB functions.
      </td>
      <td>
        <code>> sqrt(42.0)</code> <br>
        <code>> [gcd, x, y] = gcd(42, 8)</code>
      </td>
      <td>
        <code>>> import matlab.engine</code> <br>
        <code>>> eng = matlab.engine.start_matlab()</code> <br>
        <code>>> x = eng.sqrt(42.0)</code> <br>
        <code>>> eng.exit()</code>
      </td>
    </tr>
    <tr>
      <td>Create Python Package</td>
      <td>
        Package MATLAB functions into Python-compatible libraries using the Library Compiler App.
      </td>
      <td>
        <code>> Library Compiler App</code>
      </td>
      <td>
        <code>>> import PackageName</code> <br>
        <code>>> pkg = PackageName.initialize()</code> <br>
        <code>>> result = pkg.foo()</code> <br>
        <code>>> pkg.terminate()</code>
      </td>
    </tr>
    <tr>
      <td>Data Type Conversions</td>
      <td>
        Convert data types seamlessly between MATLAB and Python.
      </td>
      <td>
        <ul>
          <li><code>NaN → float('nan')</code></li>
          <li><code>Inf → float('inf')</code></li>
          <li><code>string → str</code></li>
        </ul>
      </td>
      <td>
        <ul>
          <li><code>float('nan') → NaN</code></li>
          <li><code>float('inf') → Inf</code></li>
          <li><code>str → string</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Deep Learning</td>
      <td>
        Access TensorFlow and ONNX models in MATLAB or use Apache Parquet for data transfer.
      </td>
      <td>
        <code>> net = importKerasNetwork(model)</code> <br>
        <code>> parquetwrite(tbl, fname)</code>
      </td>
      <td>
        <code>>> pandas.read_parquet(fname)</code> <br>
        <code>>> df.to_parquet(fname)</code>
      </td>
    </tr>
  </tbody>
</table>

