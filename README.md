# Dynamic Typography · Pretext Obstacle Layout

Text doesn't overlay the video — it flows around the video's shapes. Dark and grey regions become obstacles; text automatically fills the bright areas, reforming every frame.

## Demo

Upload any video, type your text, and watch it reflow in real time around the video's silhouette.

## Quick Start

**Must be served via a local server** — opening the HTML file directly will block video pixel access due to browser security policy.

**Option 1 — Windows (double-click):**
```
启动服务器.bat
```
Then open: [http://localhost:8080](http://localhost:8080)

**Option 2 — Python:**
```bash
python -m http.server 8080
```

**Option 3 — Node.js:**
```bash
npx serve .
```

## How to Use

1. **① Select video** — click or drag in a video file (MP4 / WebM / MOV)
2. **② Enter text** — leave blank to use the built-in default; short text is automatically looped to fill the screen
3. **③ Grey detection threshold** — slider controls the luma cutoff (30–254); higher values treat more grey as obstacle
4. Click **开始演示** — text flows around the video shape in real time

Click **← 重新选择** (top-right) to swap assets at any time.

## How It Works

Each video frame is downsampled and scanned row by row. Perceptual luminance is calculated:

```
luma = 0.299R + 0.587G + 0.114B
```

Pixels below the threshold are merged into obstacle rectangles, which are passed to Pretext's `layoutNextLine` API. Text is broken into lines that fit within the remaining free slots.

## Files

| File | Description |
|------|-------------|
| `index.html` | Main page — fully self-contained |
| `pretext.bundle.js` | Pretext layout engine (bundled, no install needed) |
| `mask.mp4` | Sample video |
| `启动服务器.bat` | Windows one-click server launcher |

## Dependencies

- [Pretext](https://github.com/your-org/pretext) — bundled as `pretext.bundle.js`, no npm install required
- No other external dependencies

---

# 动态文字排版 · Pretext 障碍布局

文字不是叠加在视频上，而是被视频的明暗形状"排开"，自动流动填满亮色区域，每帧实时重排。

## 效果

上传任意视频，输入文字，文字随视频轮廓实时绕排。

## 快速开始

**必须通过本地服务器运行**，直接双击 HTML 会因浏览器安全策略导致视频像素无法读取。

**方法一 — Windows 双击：**
```
启动服务器.bat
```
然后在浏览器打开：[http://localhost:8080](http://localhost:8080)

**方法二 — Python：**
```bash
python -m http.server 8080
```

**方法三 — Node.js：**
```bash
npx serve .
```

## 使用方式

1. **① 选择视频** — 点击或拖入视频文件（MP4 / WebM / MOV）
2. **② 输入文字** — 留空则使用内置默认文字；字数较少时自动循环补足
3. **③ 灰度识别范围** — 滑块控制亮度阈值（30–254），数值越大识别越多灰色区域为障碍
4. 点击 **开始演示**，文字随视频形状实时流动

演示中可点击右上角 **← 重新选择** 随时更换素材。

## 技术原理

每帧视频降采样后逐行扫描像素，计算感知亮度：

```
luma = 0.299R + 0.587G + 0.114B
```

亮度低于阈值的连续像素段映射为障碍矩形，传入 Pretext 的 `layoutNextLine` API，文字在可用槽位中自动换行排布。

## 文件说明

| 文件 | 说明 |
|------|------|
| `index.html` | 主页面，全部逻辑自包含 |
| `pretext.bundle.js` | Pretext 排版引擎（打包版，无需安装） |
| `mask.mp4` | 示例视频素材 |
| `启动服务器.bat` | Windows 一键启动本地服务器 |

## 依赖

- [Pretext](https://github.com/your-org/pretext) — 已打包为 `pretext.bundle.js`，无需额外安装
- 无其他外部依赖，无需 npm install
