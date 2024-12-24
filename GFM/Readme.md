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
  
- **Underlined (`<u>`)**: Underlined text.
  ```html
  <u>Underlined Text</u>
  ```
     **Output**: <u>Underlined Text</u>
  
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
    <source src="audio.mp3" type="audio/mpeg">
    Your browser does not support the audio element.
  </audio>
  GitHub supports .mp3, .ogg, and .wav
  ```
  
     **Output**:
   <audio controls>
    <source src="audio.mp3" type="audio/mpeg">
    Your browser does not support the audio element.
  </audio>
  
- **Video (`<video>`)**: Embed video files.
  ```html
  <video controls>
    <source src="movie.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
    GitHub supports .mp4, .webm, and .ogg
  ```
     **Output**:
  <video controls>
    <source src="movie.mp4" type="video/mp4">
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
    <img src="image.jpg" alt="Image">
    <figcaption>Figure 1: This is an image.</figcaption>
  </figure>
  ```
     **Output**:
  <figure>
    <img src="image.jpg" alt="Image">
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
  
- **Unordered List (`<ul>`)**: An unordered (bulleted) list.
  ```html
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
  </ul>
  ```
     **Output**:
  
- **List Item (`<li>`)**: Defines each item in a list.
  ```html
  <li>This is a list item</li>
  ```
     **Output**:
  

### **Linking and Anchor Tags**
- **Anchor (`<a>`)**: Defines a hyperlink.
  ```html
  <a href="https://github.com">Visit GitHub</a>
  ```
     **Output**:
  
- **Anchor with Target (`<a target="_blank">`)**: Opens the link in a new window.
  ```html
  <a href="https://github.com" target="_blank">Visit GitHub</a>
  ```
     **Output**:
  

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
  
- **Table Row (`<tr>`)**: Defines a row in the table.
  ```html
  <tr>
    <td>Row 1, Cell 1</td>
    <td>Row 1, Cell 2</td>
  </tr>
  ```
     **Output**:
  
- **Table Header (`<th>`)**: Defines a header cell in the table.
  ```html
  <th>Header Content</th>
  ```
     **Output**:
  
- **Table Data (`<td>`)**: Defines a data cell in the table.
  ```html
  <td>Data Content</td>
  ```
     **Output**:
  

### **Image and Embed Tags**
- **Image (`<img>`)**: Embeds an image.
  ```html
  <img src="image.jpg" alt="Alt Text" />
  ```
     **Output**:
  
- **Embed (`<embed>`)**: Embeds external content like multimedia.
  ```html
  <embed src="file.pdf" width="500" height="375">
  ```
     **Output**:
  

### **Meta and Header Tags**
- **Meta (`<meta>`)**: Defines metadata for the document, like author or description.
  ```html
  <meta name="description" content="GitHub Flavored Markdown Example">
  ```
     **Output**:
  
- **Title (`<title>`)**: Defines the title of the page (appears in the browser tab).
  ```html
  <title>GitHub Flavored Markdown</title>
  ```
     **Output**:
  
- **Link (`<link>`)**: Specifies relationships between a document and external resources, typically used for CSS links.
  ```html
  <link rel="stylesheet" type="text/css" href="styles.css">
  ```
     **Output**:
  
  
### **Script Tags**
- **Script (`<script>`)**: Used to define JavaScript code.
  ```html
  <script>
    alert("Hello, World!");
  </script>
  ```
     **Output**:
  

### **Iframe and Object Tags**
- **Iframe (`<iframe>`)**: Embeds an external webpage.
  ```html
  <iframe src="https://example.com" width="600" height="400"></iframe>
  ```
     **Output**:
  
- **Object (`<object>`)**: Embeds an external resource like a multimedia file or another document.
  ```html
  <object data="movie.mp4" width="400" height="300"></object>
  ```
     **Output**:
  

### **Style Tags**
- **Style (`<style>`)**: Defines CSS styles.
  ```html
  <style>
    body { background-color: lightblue; }
  </style>
  ```
     **Output**:
  

### **HTML5 Tags (Additional)**
- **Section (`<section>`)**: Represents a section in a document.
  ```html
  <section>
    <h2>Introduction</h2>
    <p>This is the introduction section.</p>
  </section>
  ```
     **Output**:
  
- **Article (`<article>`)**: Represents an independent, self-contained piece of content.
  ```html
  <article>
    <h2>Article Title</h2>
    <p>This is the content of the article.</p>
  </article>
  ```
     **Output**:
  
- **Aside (`<aside>`)**: Represents content that is tangentially related to the content around it.
  ```html
  <aside>
    <h3>Related Information</h3>
    <p>Here is some related content.</p>
  </aside>
  ```
     **Output**:
  
- **Header (`<header>`)**: Defines the header of a document or section.
  ```html
  <header>
    <h1>Main Heading</h1>
    <nav>Navigation Links</nav>
  </header>
  ```
     **Output**:
  
- **Footer (`<footer>`)**: Defines the footer of a document or section.
  ```html
  <footer>
    <p>&copy; 2024 GitHub</p>
  </footer>
  ```
     **Output**:
  

### **Miscellaneous**
- **Comment (`<!-- -->`)**: Used for adding comments.
  ```html
  <!-- This is a comment -->
  ```
     **Output**:  Not visible <!-- This is a comment -->
  
- **Anchor with Name (`<a name="section1">`)**: Used to create named anchors for links.
  ```html
  <a name="section1">Section 1</a>
  ```
     **Output**:
  

## **Remaining HTML Tags Supported in GitHub Flavored Markdown**

### **Text-Level Semantics**
- **Definition (`<dfn>`)**: Represents a definition of a term.
  ```html
  <dfn>HTML</dfn> is a markup language.
  ```
     **Output**:
  

- **Span (`<span>`)**: Generic inline container for styling purposes.
  ```html
  <span style="color: red;">This is a red text.</span>
  ```
     **Output**:
  

- **Ruby (`<ruby>`)**: Represents ruby annotations for East Asian typography.
  ```html
  <ruby>漢<rt>kan</rt></ruby>
  ```
     **Output**:
  

- **Rt (`<rt>`)**: Represents the pronunciation of characters in a `<ruby>` element.
  ```html
  <ruby>漢<rt>kan</rt></ruby>
  ```
     **Output**:
  

- **Rb (`<rb>`)**: Represents the base text in a `<ruby>` element.
  ```html
  <ruby><rb>漢</rb><rt>kan</rt></ruby>
  ```
     **Output**:
  
  
### **Metadata Elements**
- **Base (`<base>`)**: Specifies a base URL for relative URLs.
  ```html
  <base href="https://www.example.com/" />
  ```
     **Output**:
  

- **Link (`<link>`)**: Defines the relationship between a document and an external resource, most commonly used for CSS.
  ```html
  <link rel="stylesheet" href="styles.css" />
  ```
     **Output**:
  

- **Meta (`<meta>`)**: Specifies metadata such as document encoding, keywords, etc.
  ```html
  <meta charset="UTF-8" />
  <meta name="description" content="GitHub Flavored Markdown" />
  ```
     **Output**:
  


### **Embedded Content**
- **Iframe (`<iframe>`)**: Embeds an external webpage.
  ```html
  <iframe src="https://example.com" width="600" height="400"></iframe>
  ```
     **Output**:
  

- **Object (`<object>`)**: Embeds an external resource like a multimedia file or another document.
  ```html
  <object data="movie.mp4" width="400" height="300"></object>
  ```
     **Output**:
  

- **Embed (`<embed>`)**: Embeds external content such as multimedia.
  ```html
  <embed src="file.pdf" width="500" height="375">
  ```
     **Output**:
  


### **Document Structure Elements**
- **Section (`<section>`)**: Represents a generic section of content.
  ```html
  <section>
    <h2>Introduction</h2>
    <p>This is the introduction section.</p>
  </section>
  ```
     **Output**:
  

- **Article (`<article>`)**: Represents an independent piece of content.
  ```html
  <article>
    <h2>Article Title</h2>
    <p>This is an article content.</p>
  </article>
  ```
     **Output**:
  

- **Aside (`<aside>`)**: Represents content that is tangentially related to the rest of the content.
  ```html
  <aside>
    <h3>Related Information</h3>
    <p>This is some related content.</p>
  </aside>
   ```
     **Output**:
  

- **Header (`<header>`)**: Represents introductory content.
  ```html
  <header>
    <h1>Main Heading</h1>
    <nav>Navigation Links</nav>
  </header>
  ```
     **Output**:
  

- **Footer (`<footer>`)**: Represents footer content for a document or section.
  ```html
  <footer>
    <p>&copy; 2024 GitHub</p>
  </footer>
  ```
     **Output**:
  


### **Form Elements**
- **Form (`<form>`)**: Defines an HTML form for user input.
  ```html
  <form action="/submit">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" />
    <input type="submit" value="Submit" />
  </form>
  ```
     **Output**:
  

- **Input (`<input>`)**: Defines an input field.
  ```html
  <input type="text" name="username" />
  ```
     **Output**:
  

- **Button (`<button>`)**: Represents a clickable button.
  ```html
  <button type="button">Click Me</button>
  ```
     **Output**:
  

- **Select (`<select>`)**: Creates a drop-down list.
  ```html
  <select name="cars">
    <option value="volvo">Volvo</option>
    <option value="saab">Saab</option>
    <option value="mercedes">Mercedes</option>
  </select>
  ```
     **Output**:
  

- **Textarea (`<textarea>`)**: Defines a multi-line text input control.
  ```html
  <textarea rows="4" cols="50">Enter your comments here.</textarea>
  ```
     **Output**:
  

  
### **Table Elements**
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
  

- **Table Row (`<tr>`)**: Defines a row in the table.
  ```html
  <tr>
    <td>Row 1, Cell 1</td>
    <td>Row 1, Cell 2</td>
  </tr>
  ```
     **Output**:
  

- **Table Header (`<th>`)**: Defines a header cell in the table.
  ```html
  <th>Header Content</th>
  ```
     **Output**:
  

- **Table Data (`<td>`)**: Defines a data cell in the table.
  ```html
  <td>Data Content</td>
  ```
     **Output**:
  


### **Text Grouping and Wrapping**
- **Div (`<div>`)**: Defines a division or section in the document.
  ```html
  <div class="container">This is a division.</div>
  ```
     **Output**:
  

- **Span (`<span>`)**: Defines an inline section for styling.
  ```html
  <span style="color:red;">This is a red text.</span>
  ```
     **Output**:
  


### **Meta and Miscellaneous**
- **Meta (`<meta>`)**: Provides metadata about the HTML document.
  ```html
  <meta charset="UTF-8">
  ```
- **Base (`<base>`)**: Specifies a base URL for all relative URLs in the document.
  ```html
  <base href="https://www.example.com/" />
  ```
     **Output**:
  


## **Other Potential HTML Tags Supported in GitHub Flavored Markdown**

### **Script, Style, and Miscellaneous Elements**
- **Script (`<script>`)**: Embeds JavaScript, but due to security reasons, this is generally not supported in GFM.
  ```html
  <script>alert('Hello World!');</script>
  ```
     **Output**:
  

- **Style (`<style>`)**: Defines custom CSS styles, but might be ignored.
  ```html
  <style>
    body { background-color: lightgray; }
  </style>
  ```
     **Output**:
  

  
### **Details and Summary for Interactive Content**
- **Details (`<details>`)**: Creates a collapsible section.
  ```html
  <details>
    <summary>Click to expand</summary>
    <p>This is hidden content.</p>
  </details>
  ```
     **Output**:
  

  
- **Summary (`<summary>`)**: Specifies a visible heading for a `<details>` element.
  ```html
  <details>
    <summary>Summary text</summary>
    <p>Details content</p>
  </details>
  ```
     **Output**:
  


### **Text Content and Special Cases**
- **Code (`<code>`)**: Represents inline code.
  ```html
  <code>var x = 10;</code>
  ```
     **Output**:
  

  
- **Preformatted Text (`<pre>`)**: Displays preformatted text with whitespace preserved.
  ```html
  <pre>
    This is preformatted
    text, preserving whitespace.
  </pre>
  ```
     **Output**:
  

  
### **Semantic Elements**
- **Main (`<main>`)**: Specifies the main content of a document, but might be ignored.
  ```html
  <main>
    <h1>Main Content</h1>
    <p>This is the main content of the page.</p>
  </main>
  ```
     **Output**:
  


- **Mark (`<mark>`)**: Highlights text.
  ```html
  <mark>This is highlighted text.</mark>
  ```
     **Output**:
  


### **Form Controls (Limited)**
- **Optgroup (`<optgroup>`)**: Groups options inside a `<select>` dropdown.
  ```html
  <select>
    <optgroup label="Group 1">
      <option value="option1">Option 1</option>
      <option value="option2">Option 2</option>
    </optgroup>
  </select>
  ```
     **Output**:
  

- **Label (`<label>`)**: Defines a label for an `<input>` element.
  ```html
  <label for="username">Username:</label>
  <input type="text" id="username">
  ```
     **Output**:
  


### **Iframe and Multimedia Elements**
- **Audio (`<audio>`)**: Embeds an audio file.
  ```html
  <audio controls>
    <source src="audio.mp3" type="audio/mp3">
    Your browser does not support the audio element.
  </audio>
  ```
     **Output**:
  

  
- **Video (`<video>`)**: Embeds a video file.
  ```html
  <video width="320" height="240" controls>
    <source src="movie.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
  ```
     **Output**:
  


### **Embedded External Content**
- **Picture (`<picture>`)**: Provides multiple image sources for responsive images (may not work well in GFM).
  ```html
  <picture>
    <source srcset="image.webp" type="image/webp">
    <img src="image.jpg" alt="Image" />
  </picture>
  ```
     **Output**:
  

  
### **Progress and Meter**
- **Progress (`<progress>`)**: Represents a progress bar.
  ```html
  <progress value="50" max="100"></progress>
  ```
     **Output**:
  


- **Meter (`<meter>`)**: Represents a scalar measurement within a known range.
  ```html
  <meter value="2" min="0" max="10">2 out of 10</meter>
  ```
     **Output**:
  



