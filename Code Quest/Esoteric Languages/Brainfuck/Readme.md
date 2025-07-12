### 🧠 What is Brainfuck?

**Brainfuck** is an **esoteric programming language** created by Urban Müller in 1993. It’s designed to be:

* **Minimalistic** (only 8 commands)
* **Turing-complete**
* And intentionally **hard to read/write**, purely for challenge or fun

---

### 🔧 Syntax (Only 8 Commands):

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `>`    | Move pointer to the right                |
| `<`    | Move pointer to the left                 |
| `+`    | Increment the byte at the pointer        |
| `-`    | Decrement the byte at the pointer        |
| `.`    | Output the byte at the pointer (as char) |
| `,`    | Input one byte and store it at pointer   |
| `[`    | Jump forward if byte at pointer is zero  |
| `]`    | Jump back if byte at pointer is non-zero |

It works on an **array of memory cells**, each initially zero, with a **single data pointer**.

---

## 🐍 Python Version

Run Brainf\*ck code directly in your terminal.

🔗 [View `runBF.py`](./Interpreters/runBF.py)

---

## 🧠 JavaScript Version

Use in any browser or embed into your own tools.

🔗 [View `runBF.js`](./Interpreters/runBF.js)

### 🧪 Example: Hello World

```brainfuck
++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
```

That monstrosity prints:
**`Hello World!`**

---

 <!-- 
🔗 [Launch Live Interpreter](https://your-username.github.io/your-repo/) - Sooner 
 --> 

<details>
<summary></summary>

*The below ASCII table was generated using the Python script `ascii_table_html_md.py` located in `/utilities/`.*

<table>
<tr><th>Code</th><th>Symbol</th><th>Code</th><th>Symbol</th><th>Code</th><th>Symbol</th><th>Code</th><th>Symbol</th></tr>
<tr><td>0</td><td>CTRL-0</td><td>1</td><td>CTRL-1</td><td>2</td><td>CTRL-2</td><td>3</td><td>CTRL-3</td></tr>
<tr><td>4</td><td>CTRL-4</td><td>5</td><td>CTRL-5</td><td>6</td><td>CTRL-6</td><td>7</td><td>CTRL-7</td></tr>
<tr><td>8</td><td>CTRL-8</td><td>9</td><td>CTRL-9</td><td>10</td><td>CTRL-10</td><td>11</td><td>CTRL-11</td></tr>
<tr><td>12</td><td>CTRL-12</td><td>13</td><td>CTRL-13</td><td>14</td><td>CTRL-14</td><td>15</td><td>CTRL-15</td></tr>
<tr><td>16</td><td>CTRL-16</td><td>17</td><td>CTRL-17</td><td>18</td><td>CTRL-18</td><td>19</td><td>CTRL-19</td></tr>
<tr><td>20</td><td>CTRL-20</td><td>21</td><td>CTRL-21</td><td>22</td><td>CTRL-22</td><td>23</td><td>CTRL-23</td></tr>
<tr><td>24</td><td>CTRL-24</td><td>25</td><td>CTRL-25</td><td>26</td><td>CTRL-26</td><td>27</td><td>CTRL-27</td></tr>
<tr><td>28</td><td>CTRL-28</td><td>29</td><td>CTRL-29</td><td>30</td><td>CTRL-30</td><td>31</td><td>CTRL-31</td></tr>
<tr><td>32</td><td>(space)</td><td>33</td><td>!</td><td>34</td><td>&quot;</td><td>35</td><td>#</td></tr>
<tr><td>36</td><td>$</td><td>37</td><td>%</td><td>38</td><td>&amp;</td><td>39</td><td>&#x27;</td></tr>
<tr><td>40</td><td>(</td><td>41</td><td>)</td><td>42</td><td>*</td><td>43</td><td>+</td></tr>
<tr><td>44</td><td>,</td><td>45</td><td>-</td><td>46</td><td>.</td><td>47</td><td>/</td></tr>
<tr><td>48</td><td>0</td><td>49</td><td>1</td><td>50</td><td>2</td><td>51</td><td>3</td></tr>
<tr><td>52</td><td>4</td><td>53</td><td>5</td><td>54</td><td>6</td><td>55</td><td>7</td></tr>
<tr><td>56</td><td>8</td><td>57</td><td>9</td><td>58</td><td>:</td><td>59</td><td>;</td></tr>
<tr><td>60</td><td>&lt;</td><td>61</td><td>=</td><td>62</td><td>&gt;</td><td>63</td><td>?</td></tr>
<tr><td>64</td><td>@</td><td>65</td><td>A</td><td>66</td><td>B</td><td>67</td><td>C</td></tr>
<tr><td>68</td><td>D</td><td>69</td><td>E</td><td>70</td><td>F</td><td>71</td><td>G</td></tr>
<tr><td>72</td><td>H</td><td>73</td><td>I</td><td>74</td><td>J</td><td>75</td><td>K</td></tr>
<tr><td>76</td><td>L</td><td>77</td><td>M</td><td>78</td><td>N</td><td>79</td><td>O</td></tr>
<tr><td>80</td><td>P</td><td>81</td><td>Q</td><td>82</td><td>R</td><td>83</td><td>S</td></tr>
<tr><td>84</td><td>T</td><td>85</td><td>U</td><td>86</td><td>V</td><td>87</td><td>W</td></tr>
<tr><td>88</td><td>X</td><td>89</td><td>Y</td><td>90</td><td>Z</td><td>91</td><td>[</td></tr>
<tr><td>92</td><td>\</td><td>93</td><td>]</td><td>94</td><td>^</td><td>95</td><td>_</td></tr>
<tr><td>96</td><td>`</td><td>97</td><td>a</td><td>98</td><td>b</td><td>99</td><td>c</td></tr>
<tr><td>100</td><td>d</td><td>101</td><td>e</td><td>102</td><td>f</td><td>103</td><td>g</td></tr>
<tr><td>104</td><td>h</td><td>105</td><td>i</td><td>106</td><td>j</td><td>107</td><td>k</td></tr>
<tr><td>108</td><td>l</td><td>109</td><td>m</td><td>110</td><td>n</td><td>111</td><td>o</td></tr>
<tr><td>112</td><td>p</td><td>113</td><td>q</td><td>114</td><td>r</td><td>115</td><td>s</td></tr>
<tr><td>116</td><td>t</td><td>117</td><td>u</td><td>118</td><td>v</td><td>119</td><td>w</td></tr>
<tr><td>120</td><td>x</td><td>121</td><td>y</td><td>122</td><td>z</td><td>123</td><td>{</td></tr>
<tr><td>124</td><td>|</td><td>125</td><td>}</td><td>126</td><td>~</td><td>127</td><td>DEL</td></tr>
<tr><td>128</td><td></td><td>129</td><td></td><td>130</td><td></td><td>131</td><td></td></tr>
<tr><td>132</td><td></td><td>133</td><td></td><td>134</td><td></td><td>135</td><td></td></tr>
<tr><td>136</td><td></td><td>137</td><td></td><td>138</td><td></td><td>139</td><td></td></tr>
<tr><td>140</td><td></td><td>141</td><td></td><td>142</td><td></td><td>143</td><td></td></tr>
<tr><td>144</td><td></td><td>145</td><td></td><td>146</td><td></td><td>147</td><td></td></tr>
<tr><td>148</td><td></td><td>149</td><td></td><td>150</td><td></td><td>151</td><td></td></tr>
<tr><td>152</td><td></td><td>153</td><td></td><td>154</td><td></td><td>155</td><td>/td></tr>
<tr><td>156</td><td></td><td>157</td><td></td><td>158</td><td></td><td>159</td><td></td></tr>
<tr><td>160</td><td> </td><td>161</td><td>¡</td><td>162</td><td>¢</td><td>163</td><td>£</td></tr>
<tr><td>164</td><td>¤</td><td>165</td><td>¥</td><td>166</td><td>¦</td><td>167</td><td>§</td></tr>
<tr><td>168</td><td>¨</td><td>169</td><td>©</td><td>170</td><td>ª</td><td>171</td><td>«</td></tr>
<tr><td>172</td><td>¬</td><td>173</td><td>­</td><td>174</td><td>®</td><td>175</td><td>¯</td></tr>
<tr><td>176</td><td>°</td><td>177</td><td>±</td><td>178</td><td>²</td><td>179</td><td>³</td></tr>
<tr><td>180</td><td>´</td><td>181</td><td>µ</td><td>182</td><td>¶</td><td>183</td><td>·</td></tr>
<tr><td>184</td><td>¸</td><td>185</td><td>¹</td><td>186</td><td>º</td><td>187</td><td>»</td></tr>
<tr><td>188</td><td>¼</td><td>189</td><td>½</td><td>190</td><td>¾</td><td>191</td><td>¿</td></tr>
<tr><td>192</td><td>À</td><td>193</td><td>Á</td><td>194</td><td>Â</td><td>195</td><td>Ã</td></tr>
<tr><td>196</td><td>Ä</td><td>197</td><td>Å</td><td>198</td><td>Æ</td><td>199</td><td>Ç</td></tr>
<tr><td>200</td><td>È</td><td>201</td><td>É</td><td>202</td><td>Ê</td><td>203</td><td>Ë</td></tr>
<tr><td>204</td><td>Ì</td><td>205</td><td>Í</td><td>206</td><td>Î</td><td>207</td><td>Ï</td></tr>
<tr><td>208</td><td>Ð</td><td>209</td><td>Ñ</td><td>210</td><td>Ò</td><td>211</td><td>Ó</td></tr>
<tr><td>212</td><td>Ô</td><td>213</td><td>Õ</td><td>214</td><td>Ö</td><td>215</td><td>×</td></tr>
<tr><td>216</td><td>Ø</td><td>217</td><td>Ù</td><td>218</td><td>Ú</td><td>219</td><td>Û</td></tr>
<tr><td>220</td><td>Ü</td><td>221</td><td>Ý</td><td>222</td><td>Þ</td><td>223</td><td>ß</td></tr>
<tr><td>224</td><td>à</td><td>225</td><td>á</td><td>226</td><td>â</td><td>227</td><td>ã</td></tr>
<tr><td>228</td><td>ä</td><td>229</td><td>å</td><td>230</td><td>æ</td><td>231</td><td>ç</td></tr>
<tr><td>232</td><td>è</td><td>233</td><td>é</td><td>234</td><td>ê</td><td>235</td><td>ë</td></tr>
<tr><td>236</td><td>ì</td><td>237</td><td>í</td><td>238</td><td>î</td><td>239</td><td>ï</td></tr>
<tr><td>240</td><td>ð</td><td>241</td><td>ñ</td><td>242</td><td>ò</td><td>243</td><td>ó</td></tr>
<tr><td>244</td><td>ô</td><td>245</td><td>õ</td><td>246</td><td>ö</td><td>247</td><td>÷</td></tr>
<tr><td>248</td><td>ø</td><td>249</td><td>ù</td><td>250</td><td>ú</td><td>251</td><td>û</td></tr>
<tr><td>252</td><td>ü</td><td>253</td><td>ý</td><td>254</td><td>þ</td><td>255</td><td>ÿ</td></tr>
</table>

</details>

### Why use it?

* Purely for **challenge, fun, or artistic code**
* It’s used in **code golf**, obfuscation contests, or to troll friends 😈
* Forces deep understanding of memory manipulation

> The site [Esolang Park Brainfuck IDE](https://esolangpark.vercel.app/ide/brainfuck) has visualization features and was the best for understanding Brainfuck code.
> 
> On the other hand, [TIO Brainfuck](https://tio.run/#brainfuck) doesn’t have visualization but can show output very fast.
