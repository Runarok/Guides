## **HTML Tags Supported in GitHub Flavored Markdown**

### **Basic Text Formatting Tags**
- **Bold (`<b>`)**: Bold text.
  ```html
  <b>Bold Text</b>
  ```
- **Italic (`<i>`)**: Italic text.
  ```html
  <i>Italic Text</i>
  ```
- **Underlined (`<u>`)**: Underlined text.
  ```html
  <u>Underlined Text</u>
  ```
- **Strikethrough (`<strike>`)**: Strikethrough text.
  ```html
  <strike>Strikethrough Text</strike>
  ```
- **Small Text (`<small>`)**: Smaller text.
  ```html
  <small>Smaller Text</small>
  ```
- **Subscript (`<sub>`)**: Subscript text.
  ```html
  H<sub>2</sub>O
  ```
- **Superscript (`<sup>`)**: Superscript text.
  ```html
  E=mc<sup>2</sup>
  ```

### **Block Elements**
- **Blockquote (`<blockquote>`)**: Used for quoting sections.
  ```html
  <blockquote>
    This is a blockquote.
  </blockquote>
  ```
- **Preformatted Text (`<pre>`)**: For code or preformatted text.
  ```html
  <pre>
    function greet() {
      return "Hello, World!";
    }
  </pre>
  ```
- **Horizontal Rule (`<hr>`)**: Creates a horizontal line.
  ```html
  <hr />
  ```
  
### **Inline Elements**
- **Inline Code (`<code>`)**: Represents inline code.
  ```html
  <code>print('Hello World')</code>
  ```
- **Keyboard Input (`<kbd>`)**: Represents keyboard input.
  ```html
  <kbd>Ctrl + C</kbd>
  ```
- **Inserted Text (`<ins>`)**: Indicates inserted content.
  ```html
  <ins>This text was inserted</ins>
  ```
- **Deleted Text (`<del>`)**: Indicates deleted content.
  ```html
  <del>This text was deleted</del>
  ```
  
### **Forms (Limited Support)**
- **Form (`<form>`)**: Although limited, some form elements work.
  ```html
  <form action="/submit">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name">
    <input type="submit" value="Submit">
  </form>
  ```
- **Input (`<input>`)**: Various types of input elements.
  ```html
  <input type="text" placeholder="Enter text here" />
  <input type="checkbox" /> Checkbox
  ```
- **Button (`<button>`)**: A clickable button element.
  ```html
  <button type="button">Click Me</button>
  ```

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
- **Header (`<header>`)**: Represents introductory content.
  ```html
  <header>
    <h1>Welcome to GitHub</h1>
    <p>Here is an introduction to our page.</p>
  </header>
  ```
- **Footer (`<footer>`)**: Represents footer content.
  ```html
  <footer>
    <p>&copy; 2024 GitHub, Inc. All rights reserved.</p>
  </footer>
  ```
- **Address (`<address>`)**: Contact information, typically for author info.
  ```html
  <address>
    GitHub, Inc.<br />
    88 Colin P. Kelly Jr. Street<br />
    San Francisco, CA 94107
  </address>
  ```
- **Aside (`<aside>`)**: For tangential content.
  ```html
  <aside>
    <h3>Did you know?</h3>
    <p>GitHub is a platform for developers to collaborate.</p>
  </aside>
  ```

### **Media Elements**
- **Audio (`<audio>`)**: Embed audio files.
  ```html
  <audio controls>
    <source src="audio.mp3" type="audio/mpeg">
    Your browser does not support the audio element.
  </audio>
  ```
- **Video (`<video>`)**: Embed video files.
  ```html
  <video controls>
    <source src="movie.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
  ```

### **Time, Citation, and Variables**
- **Time (`<time>`)**: Represents a specific time or date.
  ```html
  <time datetime="2024-12-24">December 24, 2024</time>
  ```
- **Citation (`<cite>`)**: Cites a reference or source.
  ```html
  <cite>Design Patterns: Elements of Reusable Object-Oriented Software</cite>
  ```
- **Variable (`<var>`)**: Represents a variable in a mathematical expression or code.
  ```html
  <var>x</var> + <var>y</var> = <var>z</var>
  ```
  
### **Other HTML Tags**
- **Details and Summary (`<details>` and `<summary>`)**: Creates collapsible content.
  ```html
  <details>
    <summary>Click to expand</summary>
    <p>This content is hidden until clicked.</p>
  </details>
  ```
- **Figure and Caption (`<figure>` and `<figcaption>`)**: Used for images with captions.
  ```html
  <figure>
    <img src="image.jpg" alt="Image">
    <figcaption>Figure 1: This is an image.</figcaption>
  </figure>
  ```
- **Mark (`<mark>`)**: Highlights text.
  ```html
  <mark>Highlighted Text</mark>
  ```
- **Progress (`<progress>`)**: Represents the progress of a task.
  ```html
  <progress value="70" max="100">70%</progress>
  ```
- **Meter (`<meter>`)**: Represents a scalar measurement within a known range.
  ```html
  <meter value="3" min="0" max="10">3/10</meter>
  ```
- **WBR (`<wbr>`)**: Suggests a word break opportunity.
  ```html
  Hello<wbr>World
  ```
- **Bidirectional Isolation (`<bdi>`)**: Isolates a section of text from surrounding text direction.
  ```html
  <bdi>Some text</bdi>
  ```
- **Bidirectional Override (`<bdo>`)**: Specifies the directionality of text.
  ```html
  <bdo dir="rtl">This text is right-to-left</bdo>
  ```
- **Definition (`<dfn>`)**: Represents the definition of a term.
  ```html
  <dfn>HTML</dfn> is the standard markup language for web pages.
  ```
- **Sample Output (`<samp>`)**: Represents sample output from a computer program.
  ```html
  <samp>404 Not Found</samp>
  ```

## **Remaining HTML Tags Supported in GitHub Flavored Markdown**

### **List Elements**
- **Ordered List (`<ol>`)**: An ordered (numbered) list.
  ```html
  <ol>
    <li>First item</li>
    <li>Second item</li>
  </ol>
  ```
- **Unordered List (`<ul>`)**: An unordered (bulleted) list.
  ```html
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
  </ul>
  ```
- **List Item (`<li>`)**: Defines each item in a list.
  ```html
  <li>This is a list item</li>
  ```

### **Linking and Anchor Tags**
- **Anchor (`<a>`)**: Defines a hyperlink.
  ```html
  <a href="https://github.com">Visit GitHub</a>
  ```
- **Anchor with Target (`<a target="_blank">`)**: Opens the link in a new window.
  ```html
  <a href="https://github.com" target="_blank">Visit GitHub</a>
  ```

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
- **Table Row (`<tr>`)**: Defines a row in the table.
  ```html
  <tr>
    <td>Row 1, Cell 1</td>
    <td>Row 1, Cell 2</td>
  </tr>
  ```
- **Table Header (`<th>`)**: Defines a header cell in the table.
  ```html
  <th>Header Content</th>
  ```
- **Table Data (`<td>`)**: Defines a data cell in the table.
  ```html
  <td>Data Content</td>
  ```

### **Image and Embed Tags**
- **Image (`<img>`)**: Embeds an image.
  ```html
  <img src="image.jpg" alt="Alt Text" />
  ```
- **Embed (`<embed>`)**: Embeds external content like multimedia.
  ```html
  <embed src="file.pdf" width="500" height="375">
  ```

### **Meta and Header Tags**
- **Meta (`<meta>`)**: Defines metadata for the document, like author or description.
  ```html
  <meta name="description" content="GitHub Flavored Markdown Example">
  ```
- **Title (`<title>`)**: Defines the title of the page (appears in the browser tab).
  ```html
  <title>GitHub Flavored Markdown</title>
  ```
- **Link (`<link>`)**: Specifies relationships between a document and external resources, typically used for CSS links.
  ```html
  <link rel="stylesheet" type="text/css" href="styles.css">
  ```
  
### **Script Tags**
- **Script (`<script>`)**: Used to define JavaScript code.
  ```html
  <script>
    alert("Hello, World!");
  </script>
  ```

### **Iframe and Object Tags**
- **Iframe (`<iframe>`)**: Embeds an external webpage.
  ```html
  <iframe src="https://example.com" width="600" height="400"></iframe>
  ```
- **Object (`<object>`)**: Embeds an external resource like a multimedia file or another document.
  ```html
  <object data="movie.mp4" width="400" height="300"></object>
  ```

### **Style Tags**
- **Style (`<style>`)**: Defines CSS styles.
  ```html
  <style>
    body { background-color: lightblue; }
  </style>
  ```

### **HTML5 Tags (Additional)**
- **Section (`<section>`)**: Represents a section in a document.
  ```html
  <section>
    <h2>Introduction</h2>
    <p>This is the introduction section.</p>
  </section>
  ```
- **Article (`<article>`)**: Represents an independent, self-contained piece of content.
  ```html
  <article>
    <h2>Article Title</h2>
    <p>This is the content of the article.</p>
  </article>
  ```
- **Aside (`<aside>`)**: Represents content that is tangentially related to the content around it.
  ```html
  <aside>
    <h3>Related Information</h3>
    <p>Here is some related content.</p>
  </aside>
  ```
- **Header (`<header>`)**: Defines the header of a document or section.
  ```html
  <header>
    <h1>Main Heading</h1>
    <nav>Navigation Links</nav>
  </header>
  ```
- **Footer (`<footer>`)**: Defines the footer of a document or section.
  ```html
  <footer>
    <p>&copy; 2024 GitHub</p>
  </footer>
  ```

### **Miscellaneous**
- **Comment (`<!-- -->`)**: Used for adding comments.
  ```html
  <!-- This is a comment -->
  ```
- **Anchor with Name (`<a name="section1">`)**: Used to create named anchors for links.
  ```html
  <a name="section1">Section 1</a>
  ```

## **Remaining HTML Tags Supported in GitHub Flavored Markdown**

### **Text-Level Semantics**
- **Definition (`<dfn>`)**: Represents a definition of a term.
  ```html
  <dfn>HTML</dfn> is a markup language.
  ```
- **Span (`<span>`)**: Generic inline container for styling purposes.
  ```html
  <span style="color: red;">This is a red text.</span>
  ```
- **Ruby (`<ruby>`)**: Represents ruby annotations for East Asian typography.
  ```html
  <ruby>漢<rt>kan</rt></ruby>
  ```
- **Rt (`<rt>`)**: Represents the pronunciation of characters in a `<ruby>` element.
  ```html
  <ruby>漢<rt>kan</rt></ruby>
  ```
- **Rb (`<rb>`)**: Represents the base text in a `<ruby>` element.
  ```html
  <ruby><rb>漢</rb><rt>kan</rt></ruby>
  ```
  
### **Metadata Elements**
- **Base (`<base>`)**: Specifies a base URL for relative URLs.
  ```html
  <base href="https://www.example.com/" />
  ```
- **Link (`<link>`)**: Defines the relationship between a document and an external resource, most commonly used for CSS.
  ```html
  <link rel="stylesheet" href="styles.css" />
  ```
- **Meta (`<meta>`)**: Specifies metadata such as document encoding, keywords, etc.
  ```html
  <meta charset="UTF-8" />
  <meta name="description" content="GitHub Flavored Markdown" />
  ```

### **Embedded Content**
- **Iframe (`<iframe>`)**: Embeds an external webpage.
  ```html
  <iframe src="https://example.com" width="600" height="400"></iframe>
  ```
- **Object (`<object>`)**: Embeds an external resource like a multimedia file or another document.
  ```html
  <object data="movie.mp4" width="400" height="300"></object>
  ```
- **Embed (`<embed>`)**: Embeds external content such as multimedia.
  ```html
  <embed src="file.pdf" width="500" height="375">
  ```

### **Document Structure Elements**
- **Section (`<section>`)**: Represents a generic section of content.
  ```html
  <section>
    <h2>Introduction</h2>
    <p>This is the introduction section.</p>
  </section>
  ```
- **Article (`<article>`)**: Represents an independent piece of content.
  ```html
  <article>
    <h2>Article Title</h2>
    <p>This is an article content.</p>
  </article>
  ```
- **Aside (`<aside>`)**: Represents content that is tangentially related to the rest of the content.
  ```html
  <aside>
    <h3>Related Information</h3>
    <p>This is some related content.</p>
  </aside>
  ```
- **Header (`<header>`)**: Represents introductory content.
  ```html
  <header>
    <h1>Main Heading</h1>
    <nav>Navigation Links</nav>
  </header>
  ```
- **Footer (`<footer>`)**: Represents footer content for a document or section.
  ```html
  <footer>
    <p>&copy; 2024 GitHub</p>
  </footer>
  ```

### **Form Elements**
- **Form (`<form>`)**: Defines an HTML form for user input.
  ```html
  <form action="/submit">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" />
    <input type="submit" value="Submit" />
  </form>
  ```
- **Input (`<input>`)**: Defines an input field.
  ```html
  <input type="text" name="username" />
  ```
- **Button (`<button>`)**: Represents a clickable button.
  ```html
  <button type="button">Click Me</button>
  ```
- **Select (`<select>`)**: Creates a drop-down list.
  ```html
  <select name="cars">
    <option value="volvo">Volvo</option>
    <option value="saab">Saab</option>
    <option value="mercedes">Mercedes</option>
  </select>
  ```
- **Textarea (`<textarea>`)**: Defines a multi-line text input control.
  ```html
  <textarea rows="4" cols="50">Enter your comments here.</textarea>
  ```
  
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
- **Table Row (`<tr>`)**: Defines a row in the table.
  ```html
  <tr>
    <td>Row 1, Cell 1</td>
    <td>Row 1, Cell 2</td>
  </tr>
  ```
- **Table Header (`<th>`)**: Defines a header cell in the table.
  ```html
  <th>Header Content</th>
  ```
- **Table Data (`<td>`)**: Defines a data cell in the table.
  ```html
  <td>Data Content</td>
  ```

### **Text Grouping and Wrapping**
- **Div (`<div>`)**: Defines a division or section in the document.
  ```html
  <div class="container">This is a division.</div>
  ```
- **Span (`<span>`)**: Defines an inline section for styling.
  ```html
  <span style="color:red;">This is a red text.</span>
  ```

### **Meta and Miscellaneous**
- **Meta (`<meta>`)**: Provides metadata about the HTML document.
  ```html
  <meta charset="UTF-8">
  ```
- **Base (`<base>`)**: Specifies a base URL for all relative URLs in the document.
  ```html
  <base href="https://www.example.com/" />
  ```

## **Other Potential HTML Tags Supported in GitHub Flavored Markdown**

### **Script, Style, and Miscellaneous Elements**
- **Script (`<script>`)**: Embeds JavaScript, but due to security reasons, this is generally not supported in GFM.
  ```html
  <script>alert('Hello World!');</script>
  ```
- **Style (`<style>`)**: Defines custom CSS styles, but might be ignored.
  ```html
  <style>
    body { background-color: lightgray; }
  </style>
  ```
  
### **Details and Summary for Interactive Content**
- **Details (`<details>`)**: Creates a collapsible section.
  ```html
  <details>
    <summary>Click to expand</summary>
    <p>This is hidden content.</p>
  </details>
  ```
  
- **Summary (`<summary>`)**: Specifies a visible heading for a `<details>` element.
  ```html
  <details>
    <summary>Summary text</summary>
    <p>Details content</p>
  </details>
  ```

### **Text Content and Special Cases**
- **Code (`<code>`)**: Represents inline code.
  ```html
  <code>var x = 10;</code>
  ```
  
- **Preformatted Text (`<pre>`)**: Displays preformatted text with whitespace preserved.
  ```html
  <pre>
    This is preformatted
    text, preserving whitespace.
  </pre>
  ```
  
### **Semantic Elements**
- **Main (`<main>`)**: Specifies the main content of a document, but might be ignored.
  ```html
  <main>
    <h1>Main Content</h1>
    <p>This is the main content of the page.</p>
  </main>
  ```

- **Mark (`<mark>`)**: Highlights text.
  ```html
  <mark>This is highlighted text.</mark>
  ```

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
- **Label (`<label>`)**: Defines a label for an `<input>` element.
  ```html
  <label for="username">Username:</label>
  <input type="text" id="username">
  ```

### **Iframe and Multimedia Elements**
- **Audio (`<audio>`)**: Embeds an audio file.
  ```html
  <audio controls>
    <source src="audio.mp3" type="audio/mp3">
    Your browser does not support the audio element.
  </audio>
  ```
  
- **Video (`<video>`)**: Embeds a video file.
  ```html
  <video width="320" height="240" controls>
    <source src="movie.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
  ```

### **Embedded External Content**
- **Picture (`<picture>`)**: Provides multiple image sources for responsive images (may not work well in GFM).
  ```html
  <picture>
    <source srcset="image.webp" type="image/webp">
    <img src="image.jpg" alt="Image" />
  </picture>
  ```
  
### **Progress and Meter**
- **Progress (`<progress>`)**: Represents a progress bar.
  ```html
  <progress value="50" max="100"></progress>
  ```

- **Meter (`<meter>`)**: Represents a scalar measurement within a known range.
  ```html
  <meter value="2" min="0" max="10">2 out of 10</meter>
  ```


