## **HTML Tags Supported in GitHub Flavored Markdown**

### **Basic Text Formatting Tags**
- **Bold (`<b>`)**: Bold text.
  ```html
  <b>Bold Text</b>
  ```
  **Output**:   <b>Bold Text</b>
  
- **Italic (`<i>`)**: Italic text.
  ```html
  <i>Italic Text</i>
  ```
   **Output**:  <i>Italic Text</i>
  
- **Strikethrough (`<strike>`)**: Strikethrough text.
  ```html
  <strike>Strikethrough Text</strike>
  ```
     **Output**:  <strike>Strikethrough Text</strike>
  
- **Small Text (`<small>`)**: Smaller text.
  ```html
  <small>Smaller Text</small>
  ```
     **Output**:  <small>Smaller Text</small>
  
- **Subscript (`<sub>`)**: Subscript text.
  ```html
  H<sub>2</sub>O
  ```
     **Output**:  H<sub>2</sub>O
  
- **Superscript (`<sup>`)**: Superscript text.
  ```html
  E=mc<sup>2</sup>
  ```
   **Output**:  E=mc<sup>2</sup>
  
### **Block Elements**
- **Blockquote (`<blockquote>`)**: Used for quoting sections.
  ```html
  <blockquote>
    This is a blockquote.
  </blockquote>
  ```
     **Output**:
  <blockquote>
    This is a blockquote.
  </blockquote>
  
- **Preformatted Text (`<pre>`)**: For code or preformatted text.
  ```html
  <pre>
    function greet() {
      return "Hello, World!";
    }
  </pre>
  ```
     **Output**:
  <pre>
    function greet() {
      return "Hello, World!";
    }
  </pre>
  
- **Horizontal Rule (`<hr>`)**: Creates a horizontal line.
  ```html
  <hr />
  ```
     **Output**:  <hr />
  
### **Inline Elements**
- **Inline Code (`<code>`)**: Represents inline code.
  ```html
  <code>print('Hello World')</code>
  ```
     **Output**:  <code>print('Hello World')</code>
  
- **Keyboard Input (`<kbd>`)**: Represents keyboard input.
  ```html
  <kbd>Ctrl + C</kbd>
  ```
     **Output**:  <kbd>Ctrl + C</kbd>
  
- **Inserted Text (`<ins>`)**: Indicates inserted content.
  ```html
  <ins>This text was inserted</ins>
  ```
     **Output**:  <ins>This text was inserted</ins>
  
- **Deleted Text (`<del>`)**: Indicates deleted content.
  ```html
  <del>This text was deleted</del>
  ```
     **Output**:  <del>This text was deleted</del>
  
### **Structural Elements**
- **Navigation (`<nav>`)**: For navigation links.
  ```html
  <nav>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </nav>
  ```
     **Output**:
  <nav>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </nav>
  
- **Header (`<header>`)**: Represents introductory content.
  ```html
  <header>
    <h1>Welcome to GitHub</h1>
    <p>Here is an introduction to our page.</p>
  </header>
  ```
     **Output**:
  <header>
    <h1>Welcome to GitHub</h1>
    <p>Here is an introduction to our page.</p>
  </header>
  
- **Footer (`<footer>`)**: Represents footer content.
  ```html
  <footer>
    <p>&copy; 2024 GitHub, Inc. All rights reserved.</p>
  </footer>
  ```
     **Output**:
  <footer>
    <p>&copy; 2024 GitHub, Inc. All rights reserved.</p>
  </footer>
  
- **Address (`<address>`)**: Contact information, typically for author info.
  ```html
  <address>
    GitHub, Inc.<br />
    88 Colin P. Kelly Jr. Street<br />
    San Francisco, CA 94107
  </address>
  ```
     **Output**:
  <address>
    GitHub, Inc.<br />
    88 Colin P. Kelly Jr. Street<br />
    San Francisco, CA 94107
  </address>
  

### **Media Elements**
- **Audio (`<audio>`)**: Embed audio files.
  ```html
  <audio controls>
    <source src="EXTRA/audio.mp3" type="audio/mpeg">
    Your browser does not support the audio element.
  </audio>
  GitHub supports .mp3, .ogg, and .wav
  ```
  
     **Output**:
   <audio controls>
    <source src="EXTRA/audio.mp3" type="audio/mpeg">
    Your browser does not support the audio element.
  </audio>
  
- **Video (`<video>`)**: Embed video files.
  ```html
  <video controls>
    <source src="EXTRA/movie.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
    GitHub supports .mp4, .webm, and .ogg
  ```
     **Output**:
  <video controls>
    <source src="EXTRA/movie.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
  

### **Time, Citation, and Variables**
- **Time (`<time>`)**: Represents a specific time or date.
  ```html
  <time datetime="2024-12-24">December 24, 2024</time>
  ```
     **Output**:   <time datetime="2024-12-24">December 24, 2024</time>
  
- **Citation (`<cite>`)**: Cites a reference or source.
  ```html
  <cite>Design Patterns: Elements of Reusable Object-Oriented Software</cite>
  ```
     **Output**:  <cite>Design Patterns: Elements of Reusable Object-Oriented Software</cite>
  
- **Variable (`<var>`)**: Represents a variable in a mathematical expression or code.
  ```html
  <var>x</var> + <var>y</var> = <var>z</var>
  ```
     **Output**:  <var>x</var> + <var>y</var> = <var>z</var>
  
  
### **Other HTML Tags**
- **Details and Summary (`<details>` and `<summary>`)**: Creates collapsible content.
  ```html
  <details>
    <summary>Click to expand</summary>
    <p>This content is hidden until clicked.</p>
  </details>
  ```
     **Output**:
  <details>
    <summary>Click to expand</summary>
    <p>This content is hidden until clicked.</p>
  </details>
  
- **Figure and Caption (`<figure>` and `<figcaption>`)**: Used for images with captions.
  ```html
  <figure>
    <img src="EXTRA/image.jpg" alt="Image">
    <figcaption>Figure 1: This is an image.</figcaption>
  </figure>
  ```
     **Output**:
  <figure>
    <img src="EXTRA/image.jpg" alt="Image">
    <figcaption>Figure 1: This is an image.</figcaption>
  </figure>
  
  
- **Mark (`<mark>`)**: Highlights text.
  ```html
  <mark>Highlighted Text</mark>
  ```
     **Output**:  <mark>Highlighted Text</mark>
  
  
- **Definition (`<dfn>`)**: Represents the definition of a term.
  ```html
  <dfn>HTML</dfn> is the standard markup language for web pages.
  ```
     **Output**:  <dfn>HTML</dfn> is the standard markup language for web pages.
  
- **Sample Output (`<samp>`)**: Represents sample output from a computer program.
  ```html
  <samp>404 Not Found</samp>
  ```
     **Output**:  <samp>404 Not Found</samp>
  

## **Remaining HTML Tags Supported in GitHub Flavored Markdown**

### **List Elements**
- **Ordered List (`<ol>`)**: An ordered (numbered) list.
  ```html
  <ol>
    <li>First item</li>
    <li>Second item</li>
  </ol>
  ```
     **Output**:
  <ol>
    <li>First item</li>
    <li>Second item</li>
  </ol>
  
- **Unordered List (`<ul>`)**: An unordered (bulleted) list.
  ```html
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
  </ul>
  ```
     **Output**:
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
  </ul>
  
- **List Item (`<li>`)**: Defines each item in a list.
  ```html
  <li>This is a list item</li>
  ```
     **Output**:  <li>This is a list item</li>
  

### **Linking and Anchor Tags**
- **Anchor (`<a>`)**: Defines a hyperlink.
  ```html
  <a href="https://github.com">Visit GitHub</a>
  ```
     **Output**:  <a href="https://github.com">Visit GitHub</a>

  
- **Anchor with Target (`<a target="_blank">`)**: Opens the link in a new window.
  ```html
  <a href="https://github.com" target="_blank">Visit GitHub</a>
  ```
     **Output**:  <a href="https://github.com" target="_blank">Visit GitHub</a>

### **Table Tags**
- **Table (`<table>`)**: Defines a table.
  ```html
  <table>
    <tr>
      <th>Header 1</th>
      <th>Header 2</th>
    </tr>
    <tr>
      <td>Data 1</td>
      <td>Data 2</td>
    </tr>
  </table>
  ```
     **Output**:
    <table>
    <tr>
      <th>Header 1</th>
      <th>Header 2</th>
    </tr>
    <tr>
      <td>Data 1</td>
      <td>Data 2</td>
    </tr>
  </table>
  
- **Table Row (`<tr>`)**: Defines a row in the table.
  ```html
  </table>
  <tr>
    <td>Row 1, Cell 1</td>
    <td>Row 1, Cell 2</td>
  </tr>
  </table>
  ```
     **Output**:
  <table>
  <tr>
    <td>Row 1, Cell 1</td>
    <td>Row 1, Cell 2</td>
  </tr>
  </table>
    
- **Table Header (`<th>`)**: Defines a header cell in the table.
  ```html
    <table>
    <th>Header Content</th>
    </table>
  ```
     **Output**:
    <table>
    <th>Header Content</th>
    </table>
      
- **Table Data (`<td>`)**: Defines a data cell in the table.
  ```html
  <table>
  <td>Data Content</td>
  </table>
  ```
**Output**:
  <table>
  <td>Data Content</td>
  </table>
    
- **Image (`<img>`)**: Embeds an image.
  ```html
  <img src="EXTRA/image.jpg" alt="Alt Text" />
  ```
     **Output**:  <img src="EXTRA/image.jpg" alt="Alt Text" />
  
- **Picture (`<picture>`)**: Provides multiple image sources for responsive images (may not work well in GFM).
  ```html
  <picture>
    <source srcset="EXTRA/image.webp" type="image/webp">
    <img src="image.jpg" alt="Image" />
  </picture>
  ```
  **Output**:
    <picture>
    <source srcset="EXTRA/image.webp" type="image/webp">
    <img src="image.jpg" alt="Image" />
  </picture>
